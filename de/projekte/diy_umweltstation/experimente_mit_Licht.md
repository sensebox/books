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
Zur manuellen Programmierung benutzen wir die senseBox Bibliothek, außerdem müsst ihr ein Objekt vom Typ TSL45315 erstellen.

```arduino
#include <SenseBox.h>
TSL45315 lux_sensor;
```

<!--sec data-title="setup() Funktion" data-id="programmierungsetup" data-collapse=true ces-->
In der `setup()`-Funktion soll der Sensor nun gestartet werden: 

```arduino
lux_sensor.begin();
```

Um die Belichtungszeit zu verändern, kann man den entsprechenden Wert von `0x00` in `0x01` oder `0x02` ändern, um die Belichtungszeit auf 200 bzw. 100 ms im Konfigurationsregister des Sensors zu reduzieren.
<!-- endsec -->

<!--sec data-title="loop() Funktion" data-id="programmierungloop" data-collapse=true ces-->
In der `loop()`-Funktion können wir mit dem Befehl 'getLux()' die aktuelle gemessene Lichtintensität abrufen:

```arduino
lux_sensor.getLux();
```
<!-- endsec -->

## Aufgaben

<!--sec data-title="Aufgabe 1" data-id="aufg1" data-collapse=true ces-->
Füge den Code aus dieser Lektion zusammen und ergänze eine Funktion um die Daten im Seriellen Monitor ausgeben zu lassen.
<!-- endsec -->

