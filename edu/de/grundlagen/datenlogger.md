# Datenlogger - Speichern auf SD-Karte

In der folgenden kurzen Anleitung wird beschrieben, wie du Messwerte verschiedener Sensoren auslesen und auf SD-Karte speichern kannst.

## Materialien
- Arduino Uno
- senseBox-Shield
- microSD-Karte
- Sensor(en) (nach Wunsch)

## Grundlagen
Um Daten auf SD-Karte zu speichern stellt das [senseBox-Shield](shields.md) einen microSD-Karten Slot bereit.
Die Sensordaten werden ausgelesen und anschließend als `.csv` (comma-seperated-value) Datei gespeichert.

## Vorlage
Die Folgende Code-Vorlage beinhaltet alle Bestandteile um Daten auf SD-Karte zu speichern.
Nun muss nur das Auslesen des Sensors in die Code-Vorlage integriert werden und schon können die Messwerte gespeichert werden.

```arduino
/*
  senseBox Datenlogger Vorlage
  Das Auslesen der jeweiligen Sensoren muss in der loop() stattfinden und individuell angepasst werden
*/

#include <SPI.h> // wichtige Libraries für das Speichern von Daten auf SD-Karte
#include <SD.h>

const int chipSelect = 4;

void setup() {
  Serial.begin(9600);
  while (!Serial) { ; }

  Serial.print("Initialisiere SD-Karte");

  // Überprüfe ob eine SD-Karte eingelegt ist.
  if (!SD.begin(chipSelect)) {
    Serial.println("Karte nicht gefunden");
    return;
  }
  Serial.println("Karte erfolgreich initialisiert");
}

void loop() {
  // Auslesen des Sensors. entsprechend anpassen!
  float messwert = //......;


  // öffne die datei datalog.txt auf der SD-Karte mit schreibrechten
  File dataFile = SD.open("datalog.txt", FILE_WRITE);


  if (dataFile) {
    // Wenn die Datei geöffnet ist, schreibe den messwert auf die SD Karte,
    // und schließe die Datei wieder.
    dataFile.print(messwert); //Speichern der Messwerte in der geöffneten Datei
    dataFile.println(";"); //Trennzeichen für die .csv Datei
    dataFile.close();
  } else {
    // Falls die Datei nicht geöffnet werden kann, soll eine Fehlermeldung ausgegeben werden
    Serial.println("Fehler beim Öffnen!");
  }
  delay(1000);
}
```

## Beispiel: HDC100X

Das Auslesen des Sensors sollte in der `loop()`-Funktion nach dem Öffnen der Datei stattfinden.
Die Informationen zum Auslesen der Sensoren finden sich in den [Datenblättern](../downloads.md) und Beispielcodes der Hersteller und müssen individuell angepasst werden.
Die jeweiligen Messwerte werden mit dem Befehl `dataFile.print(Messwert);` in eine Zeile der CSV-Datei geschrieben.
Der Zusatz `ln` erzeugt einen Zeilenumbruch.
Über den Befehl `delay(Mikrosekunden)` kann das Mess- und Speicherintervall angepasst werden.

Zur Veranschaulichung findest du unten einen Sketch, der den HDC100x ausliest und die Messwerte auf SD-Karte speichert.

```arduino
/*
  senseBox HDC100x Datenlogger
  Anschluss des HDC100x über I2C an den Arduino
  SDA - A4, SCL - A5, VCC - 5V, GND - GND
*/

#include <SPI.h> //wichtige Libraries für das Speichern von Daten auf SD-Karte
#include <SD.h>
#include <Wire.h> //I2C Library
#include <HDC1000.h> //Library für den HDC100x

HDC1000 mySensor(0x43); //IC2 Adresse des HDC1000

const int chipSelect = 4; //

void setup() {
  Serial.begin(9600);
  while (!Serial) { ; }

  Serial.print("Initialisiere SD-Karte");

  // Überprüfe ob eine SD-Karte eingelegt ist.
  if (!SD.begin(chipSelect)) {
    Serial.println("Karte nicht gefunden");
    return;
  }
  Serial.println("Karte erfolgreich initialisiert");

  mySensor.begin();
}

void loop() {

  //Auslesen der Sensoren und schreiben der Daten auf SD-Karte
  File dataFile = SD.open("datalog.txt", FILE_WRITE);

  float temp = mySensor.getTemp(); //Auslesen der Temperatur
  float humi = mySensor.getHumi();
  Serial.println(temp); //Anzeige der Temperatur im seriellen Monitor
  Serial.println(humi);

  if (dataFile) {
    // Wenn die Datei geöffnet ist, speichere die Messwerte
    dataFile.print(temp);
    dataFile.print(";");
    dataFile.print(humi);
    dataFile.println(";");
    dataFile.close();
  } else {
    // Falls die Datei nicht geöffnet werden kann, soll eine Fehlermeldung ausgegeben werden
    Serial.println("Fehler beim Öffnen!");
  }

  delay(1000); //Intervall des Speichern und Auslesen
}
```

## Messgerät zur Erfassung der Temperatur, Luftfeuchtigkeit und Luftdruck
Bei diesem Messgerät werden die Temperatur, Luftfeuchtigkeit und der Luftdruck als CSV-Datei auf SD-Karte gespeichert. Die Sensoren werden über I²C mit dem Arduino verbunden. Der Code befindet sich [hier](https://raw.githubusercontent.com/sensebox/resources/master/code/senseBox_Datenlogger_T_H_P.ino) zum Download.
