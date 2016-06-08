# DIY-Umweltstation - Datenupload von zwei Sensoren zur OpenSenseMap
Wenn wir eine senseBox aufgebaut haben, wäre es doch schön die gewonnenen Daten von jedem Ort aus abrufen zu können.
Dazu gibt es die [OpenSenseMap](https://opensensemap.org/) (OSeM), welche diverse Sensordaten sammelt und auf einer Karte visualisiert. Über den Arduino Ethernet-Shield können wir unsere senseBox ans Internet anbinden und die Daten zur OSeM hochladen.

## Ziele der Station
In dieser Station wird beispielhaft die Integration eines Sensors in die OpenSenseMap gezeigt, sodass die gewonnenen Daten online verfügbar sind.

## Materialien
* Luftdruck- & Temperatursensor `BMP280`
* Ethernet Shield
* Ethernetkabel

## Grundlagen

### Ethernet-Shield
Ein Shield bezeichnet eine aufsteckbare Platine für den Arduino, welche den Microcomputer kompakt um Funktionalität erweitert.
Shields werden einfach in die Pins des Arduino aufgesteckt und stellen diese Pinbelegung wieder selbst bereit.

Im Kasten der senseBox:edu findest du einen *Ethernet-Shield* (rote Platine), welcher den Arduino mit einem Netzwerkanschluss austattet, sowie einen *senseBox-Shield* (grüne Platine), auf welchem eine Echtzeituhr (RTC) und weitere Anschlüsse verbaut sind.

### OpenSenseMap
Um Daten auf die OSeM hochzuladen, muss dort zuerst eine senseBox [registriert werden](https://opensensemap.org/#/register).
Achte bei der Registrierung darauf, die manuelle Konfiguration zu wählen, und dort 2 Sensoren hinzuzufügen (siehe Screenshot).

![osem-sensor-konfiguration](https://raw.githubusercontent.com/sensebox/resources/master/images/edu/station_8_osem_sensoren.jpg)

Nach der Registrierung erhältst du per Email einen Key, über den die Messungen deiner senseBox zugeordnet werden.
Zusätzlich erhältst du einen Arduino-Sketch, in welchem die Übermittelung der Messdaten schon implementiert ist, aber noch mit der Ansteuerung deines Sensors erweitert werden muss.

### Sensor
Der `BMP280` misst Luftdruck (hPa) und Temperatur (°C).
Da der Luftdruck von der Höhe über dem Meeresspiegel abhängt, kann darüber auch die Höhe der senseBox bestimmt werden. Dazu wird ein Referenzdruck `P0` benötigt, dessen Höhe bekannt ist. Üblicherweise wird dazu der aktuelle Luftdruck auf Meerespiegelniveau verwendet.
Da der Luftdruck in Abhängigkeit vom aktuellen Wetter stark schwanken kann, ist diese "Höhenmessung" aber nicht sehr akkurat, und muss immer wieder neu kalibriert werden.

Der Sensor wird über das I²C Protokoll angesteuert, und benötigt eine Betriebsspannung von 3 bis 5 Volt.
I²C-Geräte werden an den Arduino Uno über die Pins `A4` (SDA), und `A5` (SCL) angeschlossen, und so digital ausgelesen ([siehe auch Station 5](https://github.com/sensebox/oer/wiki/05_Der_serielle_Datenbus_und_die_Verwendung_von_Software_Bilbiotheken)).

## Aufbau
Auf den Arduino muss zunächst der Ethernet-Shield gesteckt werden, um es mit einem Netzwerkanschluss auszustatten.
Die Betriebsspannung des Sensors wird über die Verbindung des Arduino Pins `3.3V -> VCC` und `GND -> GND` realisiert.

![Aufbau_station_8](https://raw.githubusercontent.com/sensebox/resources/master/images/edu/Aufbau_station_8.jpg)

## Erweiterung des OSeM-Sketches
In dem Arduino-Sketch, den du nach der Registrierung erhalten hast, fehlt noch die Integration des Sensors.

Füge dazu die zugehörige Bibliothek zu dem Projekt hinzu, und erstelle eine Instanz `bmp` davon. Auf diesem Objekt werden alle Funktionen der Bibliothek aufgerufen:

```arduino
#include <BMP280.h>
BMP280 bmp;
```

In der `setup()`-Funktion muss der Sensor initialisiert werden. Verwende dazu die folgenden Zeilen:

```arduino
if (!bmp.begin()) Serial.println("BMP init failed!");
bmp.setOversampling(4);
```

Nun muss der Sensor in der `loop()`-Funktion innerhalb der `if`-Abfrage ausgelesen werden. In den Variablen `temp` und `pressure` stehen dann jeweils die aktuellen Messwerte.
Über die bereits vorhandene Funktion `postFloatValue()` wird ein Messwert zur OSeM geschickt.

```arduino
double temp, pressure;
char bmpStatus = bmp.startMeasurment();

// if an error occured on the sensor: stop
if (bmpStatus == 0) {
  Serial.println(bmp.getError());
  return;
}

delay(bmpStatus); // wait for duration of the measurement
bmpStatus = bmp.getTemperatureAndPressure(temp, pressure);

postFloatValue((float)temp, 4, TEMPSENSOR_ID);
postFloatValue((float)pressure, 4, PRESSURESENSOR_ID);
```

## Netzwerkverbindung
Nachdem du den Arduino über ein Netwerkkabel mit dem Internet verbunden hast, kannst du den Sketch mit der IDE auf den Arduino hochladen.
Im Seriellen Monitor (kann über `ctrl + shift + m` geöffnet werden), wird dir nun angezeigt ob die Verbindung zum Internet funktioniert.

---

## Aufgabe 1
Registriere deine senseBox auf der OSeM und konfiguriere dort den korrekten Sensor.

## Aufgabe 2
Erweitere deinen in Aufgabe 1 erhaltenen Arduino Sketch, sodass deine senseBox die Sensordaten zur OSeM überträgt.

***Hinweis: Falls du die `BMP280.h`-Bibliothek nicht in der Arduino IDE findest, kannst du sie [hier](https://raw.githubusercontent.com/sensebox/resources/master/libraries/senseBox_Libraries.zip) herunterladen und in den `Arduino/libraries` Ordner kopieren.***

## Aufgabe 3
Berechne aus der Luftdruck-Messung die Höhe über NN, und gebe diese über den seriellen Port aus.

***Tipp: sieh dir das bei der BMP280-Bibliothek beiliegende Beispiel an. Der Referenzdruck P0 muss an die derzeitige Wetterlage angepasst werden.***
