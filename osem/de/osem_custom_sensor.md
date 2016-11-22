## Manuelle Konfiguration eines Sensors auf der OSeM

In dieser Anleitung wird beispielhaft die Anbindung eines SHT15 Sensors in das OSeM Netzwerk beschrieben.
Für die Datenverarbeitung bzw. -übertragung nutzen wir einen Arduino Uno mit Arduino Ethernet Shield.
Die REST Schnittstelle bietet aber auch jeder anderen programmierbaren und mit dem Internet verbundenen Messstation die Möglichkeit, Messungen auf der OSeM zu veröffentlichen und zu teilen.

### Materialien
* Arduino Uno R3
* Arduino Ethernet Shield R3
* [Sparkfun SHT15 Breakout](https://www.sparkfun.com/products/8257)

### Aufbau

![Verkabelung](https://raw.githubusercontent.com/sensebox/resources/master/images/aufbau-sht15.png)

* VCC zu 5V
* DATA zu Pin 6
* SCK zu Pin 7
* GND zu Arduino GND

### SHT1x Bibliothek
Für Sensoren der SHT1x Serie von Sensirion gibt es bereits eine einfache Arduino-Schnittstelle. [Lade die Bibliothek von Github herunter](https://github.com/practicalarduino/SHT1x) und entpacke sie in deinen `Arduino/libraries` Ordner. Importiert die Bibliothek wie gehabt in deinen Arduino Sketch, und definiere zusätzlich den Daten- und Taktpin entsprechend der Verkabelung in obiger Abbildung. Danach kannst du eine Verbindung zum Sensor herstellen:

```arduino
#include<sht1x.h>
#define dataPin 6
#define clockPin 7
SHT1x sht1x(dataPin, clockPin);
```

Nun lassen sich über zwei Funktionen die Temperatur in Grad Celsius, sowie die relative Luftfeuchte in Prozent als Gleitkommazahl abspeichern:

```arduino
float temp = sht1x.readTemperatureC();
float humi = sht1x.readHumidity();
```

### Manuelle Registrierung
Um einen Sensor mit der OSeM zu verbinden, musst du ihn [zuerst dort registrieren](https://opensensemap.org/register).
Falls du dabei keinen der senseBox-Bausätze nutzt, muss in Schritt 4 der Registrierung die manuelle Konfiguration gewählt werden.
Wie unten in der Abbildung dargestellt, wird dort für jedes gemessene Phänomen ein neuer Sensor angelegt:

![sensor konfiguration](https://raw.githubusercontent.com/senseBox/resources/master/images/osem_sensorconfig.png)

### OpenSenseMap API
Eine REST Schnittstelle regelt den Zugang zur Datenbank auf dem OSeM Server.
Intern ist jede Messstation mit ihren Sensoren (bzw. Phänomenen) verknüpft, die bei der Registrierung angegeben wurden.
In unserem Falle haben wir eine senseBox ID für die Station, sowie jeweils eine Sensor ID für Temperatur- und Luftfeuchtigkeitsmessungen bei der Registrierung generiert.
Die IDs werden dir nach der Registrierung per Mail zugeschickt.
Jede Messung wird dann über das HTTP Protokoll mit der `POST` Operation an den Server gesendet.
Dazu muss eine eindeutige URI angegeben werden die wie folgt aufgebaut ist:

```
https://api.opensensemap.org/senseBoxID/SensorID
```

> ***Hinweis:*** *Sollte der verwendete Microcontroller nicht https-kompatibel sein, gibt es derzeit noch eine http Schnittstelle: `http://opensensemap.org:8000/senseBoxID/SensorID`*

Jede Messung wird einzelnd im JSON Format über das `value`-Attribut an den Server gesendet.
Angenommen, wir wollen von unserer Station (ID 1234) einen Messwert des Thermometers (ID abcd) von `22,5` an den OSeM Server schicken, dann sähe der vollständige HTTP POST Request folgendermaßen aus:

```
POST /boxes/1234/abcd HTTP/1.1
Host:opensensemap.org
Content-Type: application/json
Connection: close
Content-Length: 14

{“value“:22.5}
```
Achtung: Ab Zeile 7 werden die JSON-Daten gesendet. Der Zeilenumbruch (`\n`) in Zeile 6 ist notwendig um die Operation korrekt auszuführen.

### Arduino OSeM Client
Nach der Registrierung wird ein Arduino Sketch generiert, den du als Anhang in einer Bestätigungsmail zugeschickt bekommst.
Diesen Sketch musst du noch anpassen, indem die SHT1x Bibliothek eingefügt, sowie die benötigen Variablen und eine Sensorinstanz erstellt werden:

```arduino
#include <SPI.h>
#include <Ethernet.h>

#include<sht1x.h>
#define dataPin 6
#define clockPin 7
SHT1x sht1x(dataPin, clockPin);

//senseBox ID
#define senseBox_ID "1234"
//Sensor IDs
#define TEMPERATURESENSOR_ID "abcd"
#define HUMIDITYSENSOR_ID "efgh"
```

Innerhalb der if-Anweisung in der `loop`-Funktion, musst du nacheinander die Sensoren auslesen und mit der Hilfsfunktion `postFloatValue()` hochladen.

```arduino
void loop()
{
  //Upload der Daten mit konstanter Frequenz
  if (millis() - oldTime >= postInterval)
  {
    oldTime = millis();
    temperature = sht1x.readTemperatureC();
    postFloatValue(temperature, 1, temperatureSensorID);
    humidity = sht1x.readHumidity();
    postFloatValue(humidity, 0, humiditySensorID);
  }
}
```

Falls du ein Ethernet Modul nutzt, welches nicht mit der Ethernet Bibliothek kompatibel ist muss der Sketch entsprechend angepasst werden.
Solltest du weitere Fragen dazu haben, kannst du dich auch direkt [an unseren Support wenden](mailto:support@sensebox.de).
