# DIY - Experimente mit Licht
Wenn du fern siehst, das Radio anschaltest, mit deinem Smartphone eine Nachricht schreibst oder Essen in der Mikrowelle warm machst, nutzt du dabei elektromagnetische Energie.
Heutzutage sind alle Menschen ständig auf diese Energie angewiesen.
Ohne sie würde das Leben in modernen Städten völlig anders sein, als du es kennst.

## Vorraussetzungen
- [Die Verwendung von Software-Bibliotheken](../../grundlagen/software_libraries.md)
- [Der serielle Datenbus I²C](../../grundlagen/der_serielle_datenbus.md)
- [Der serielle Monitor](../../grundlagen/der_serielle_monitor.md)

## Ziele der Station
In dieser Station verwendest du einen Lichtsensor, um die Beleuchtungsstärke des sichtbaren Lichts in Lux zu erfassen.

##Materialien
- Lichtsensor `TSL 45315`

##Grundlagen
<!--sec data-title="Lichtintensität" data-id="grundlagenlicht" data-collapse=true ces-->
Elektromagnetische Energie bewegt sich in Wellen durch den Raum. Ihr Spektrum reicht von sehr langen Radiowellen bis hin zur sehr kurzwelligen Gammastrahlung. Das menschliche Auge kann dabei nur einen sehr kleinen Teil dieses Spektrums wahrnehmen: das sichtbare Licht. Unsere Sonne ist dabei die Quelle der Energie über das gesamte Spektrum hinweg. Die Atmosphäre der Erde schützt uns davor, einem zu hohen Maß an Strahlung ausgesetzt zu werden, die für uns lebensgefährlich werden könnte.

Für uns ist die Intensität des sichtbaren Lichts besonders interessant. Um die sog. Beleuchtungsstärke des einfallenden Lichts im sichtbaren Teil des Spektrums zu messen, wird die Einheit Lux verwendet. Sie gibt das Verhältnis der Helligkeit in Lumen pro Quadratmeter an. Bei einem hellen Sonnentag beträgt sie über 100.000 Lux, in einer Vollmondnacht hingegen nur etwa 1 Lux.
<!-- endsec -->

<!--sec data-title="TSL45315 Sensor" data-id="grundlagensensor" data-collapse=true ces-->
Für diese Messung benutzen wir im Folgenden den Sensor TSL45315 von AMS-TAOS.
Im Datenblatt des Sensors sieht man, dass seine Empfindlichkeit auf den sichtbaren Teil des Lichtspektrums angeglichen ist, der ungefähr zwischen 400 und 700 nm liegt.
Laut dem Datenblatt hat dieser Sensor eine Reichweite von 2 bis 200.000 Lux, bei einer Auflösung von 3 Lux. Des Weiteren muss der Sensor mit 3,3V betrieben werden.

Der Sensor wird über das I²C Protokoll angesprochen. Wir sprechen ihn direkt mit den folgenden aus dem Datenblatt entnommenen Befehlen an:

<img src="https://raw.githubusercontent.com/sensebox/resources/master/images/edu//Grundlagen_Station_6.png"/>
<!-- endsec -->

##Aufbau

<img src="https://raw.githubusercontent.com/sensebox/resources/master/images/edu/Aufbau_station_6.png" width="500"/>

## Programmierung
Zur manuellen Programmierung benutzen wir dieses Mal nur die Wire-Bibliothek.
Am Anfang brauchen wir ein paar Konstanten, die mit der Direktive `#define` definiert werden.
Anders als bei Variablen belegen sie einen festen Platz im Speicher, der sich nur auslesen, aber nicht beschreiben lässt.
In unserem Fall soll die Busadresse sowie die oben genannten Registeradressen zur Steuerung des Sensors gespeichert werden.

Diese Register werden zur Konfiguration und Kommunikation benötigt:
```arduino
#include <Wire.h>
#define I2C_ADDR     (0x29)
#define REG_CONTROL   0x00
#define REG_CONFIG    0x01
#define REG_DATALOW   0x04
#define REG_DATAHIGH  0x05
#define REG_ID        0x0A
```

<!--sec data-title="setup() Funktion" data-id="programmierungsetup" data-collapse=true ces-->
In der `setup()`-Funktion soll nun eine Verbindung zu dem Sensor hergestellt werden und dem Kontrollregister der Befehl zum Hochfahren gegeben werden:

```arduino
Wire.begin();
Wire.beginTransmission(I2C_ADDR);
Wire.write(0x80 | REG_CONTROL);
Wire.write(0x03); //Power on
Wire.endTransmission();
```

Als nächstes legen wir eine Belichtungszeit von 400 ms fest:

```arduino
Wire.beginTransmisson(I2C_ADDR);
Wire.write(0x80 | REG_CONFIG);
Wire.write(0x00); //400 ms
Wire.endTransmission();
```

Um die Belichtungszeit zu verändern, kann man den entsprechenden Wert von `0x00` in `0x01` oder `0x02` ändern, um die Belichtungszeit auf 200 bzw. 100 ms im Konfigurationsregister des Sensors zu reduzieren.
<!-- endsec -->

<!--sec data-title="loop() Funktion" data-id="programmierungloop" data-collapse=true ces-->
In der `loop()`-Funktion geben wir nun den Befehl zum Start der Messroutine und lassen uns vom Sensor die Daten senden, die für die Berechnung der Beleuchtungsstärke benötigt werden:

```arduino
Wire.beginTransmission(I2C_ADDR);
Wire.write(0x80 | REG_DATALOW);
Wire.endTransmission();
Wire.requestFrom(I2C_ADDR, 2); // 2 Bytes anfordern
uint16_t low = Wire.read();
uint16_t high = Wire.read();
```

Falls der Sensor noch Daten sendet, sollten diese danach abgefangen werden, um Fehler im nächsten Durchgang zu vermeiden.

```arduino
while(Wire.available()) {
	Wire.read();
}
```

***Hinweis:*** *Ähnlich wie bei unserer loop-Funktion führt eine while-Schleife die Anweisungen in den geschweiften Klammern immer wieder aufs Neue aus. Abgebrochen wird sie erst dann, wenn die Bedingung nicht mehr erfüllt wird.*

Zu guter Letzt nutzt du die ausgelesenen Datenbytes, um Beleuchtungsstärke in Lux auszurechnen. Im Datenblatt findet sich die dazu passende Formel:

```arduino
uint32_t lux;
lux = (high << 8) | (low << 0);
lux = lux * 1; // Multiplikator für 400ms
```

Um diese Formel auf eine Belichtungszeit von 200 oder 100ms anzupassen, musst du nur den Multiplikator auf 2 bzw. 4 erhöhen.
<!-- endsec -->

## Aufgaben

<!--sec data-title="Aufgabe 1" data-id="aufg1" data-collapse=true ces-->
Füge den Code aus dieser Lektion zusammen und ergänze eine Funktion um die Daten im Seriellen Monitor ausgeben zu lassen.
<!-- endsec -->

<!--sec data-title="Aufgabe 2" data-id="aufg2" data-collapse=true ces-->
Ändere die Belichtungszeit des Sensors und vergleiche danach die Ergebnisse der Messungen.

> ***Tipp:*** *Vergiss nicht, neben der Belichtungszeit im Konfigurationsregister auch die Berechnung des Lux-Wertes entsprechend anzupassen.*
<!-- endsec -->
