# Wasserdichter Temperatursensor

## Ziel der Station
In dieser Station sollst du den wasserdichten Temperatursensor (DS18B20) an die senseBox anschließen und die Temperatur auslesen. Danach kannst du den Sensor ins Wasser hängen und die Wassertemperatur bestimmen.

## Materialien
- 470 Ω Widerstand
- [wasserfester Temperatursensor DS18B20](https://www.adafruit.com/product/381) (nicht in der senseBox enthalten)

## Aufbau
Der Sensor kommuniziert über das proprietäre [OneWire Protokoll](https://en.wikipedia.org/wiki/Onewire) von Dallas.
Dieses Protokoll erfordert eine Spannung auf dem Datachannel, sodass wir einen Widerstand als *Pull Up* in die Schaltung einsetzen:

![Aufbau](https://raw.githubusercontent.com/sensebox/resources/master/images/edu/aufbau_wassertemp_DS18B20.png)


## Programmierung
Bevor wir mit der Programmierung beginnen, müssen wir zunächst die erforderlichen Bibliotheken herunterladen.
- [OneWire](https://github.com/PaulStoffregen/OneWire/archive/master.zip)
- [Arduino-Temperature-Control-Library](https://github.com/milesburton/Arduino-Temperature-Control-Library/archive/master.zip)

Nach dem Herunterladen müssen beide Bibliotheken entpackt werden und in das `libraries` Verzeichnis kopiert werden. Dieses findest Du hier: `Dokumente\Arduino\libraries`.

Daraufhin kannst du die *Arduino IDE* starten und einen neuen Sketch erstellen.
Über der `setup()`-Funktion fügst Du folgenden Programmcode ein um die Bibliotheken einzubinden:

```arduino
// First we include the libraries
#include <OneWire.h>
#include <DallasTemperature.h>

// Data wire is plugged into pin 2 on the Arduino
#define ONE_WIRE_BUS 2

// Setup a oneWire instance to communicate with any OneWire devices  
// (not just Maxim/Dallas temperature ICs)
OneWire oneWire(ONE_WIRE_BUS);

// Pass our oneWire reference to Dallas Temperature.
DallasTemperature sensors(&oneWire);
```

Dieser Programmcode fügt die von Dir heruntergeladenen Bibliotheken zum Programm hinzu. Außerdem gibst du mit `#define ONE_WIRE_BUS 2` an, an welchen Pin Du den Sensor mit der senseBox verbunden hast.

In der `setup()`-Funktion fügst Du nun folgenden Programmcode ein, damit wir Daten auf die Konsole schreiben können und der Temperatursensor angesprochen wird:

```arduino
// start serial port
Serial.begin(9600);

// Start up the library
sensors.begin();
```

Jetzt können wir damit beginnen die Temperatur vom Sensor abzufragen. Da wir mehrere Messungen machen wollen, fragen wir die Temperatur in der `loop()`-Funktion ab. Das geht mit folgendem Code:

```arduino
// call sensors.requestTemperatures() to issue a global temperature
// request to all devices on the bus
Serial.print("Requesting temperatures...");
sensors.requestTemperatures(); // Send the command to get temperature readings
Serial.println("DONE");

Serial.print("Temperature is: ");
Serial.print(sensors.getTempCByIndex(0)); // Why "byIndex"?  
// You can have more than one DS18B20 on the same bus.  
// 0 refers to the first IC on the wire
delay(1000);
```

## Übertragen und Testen
Mit dem oben beschriebenen Programm solltest Du jetzt die Temperatur auslesen können.
Übertrage den Code auf den Arduino und schaue dir die Ausgabe auf dem seriellen Monitor an.

## Aufgaben
- Entferne die Konsolenausgaben so, dass nur noch die gemessene Temperatur ausgegeben wird
- Versuche die Anzahl der Messungen pro Sekunde zu erhöhen.