# Datenlogger

In der folgenden kurzen Anleitung wird beschrieben, wie du Messwerte verschiedener Sensoren auslesen und auf SD-Karte speichern kannst.

## Materialien
- Arduino Uno
- senseBox-Shield
- microSD-Karte
- Sensor(en) (nach Wunsch)

## Grundlagen
Um Daten auf SD-Karte zu speichern stellt das senseBox-Shield einen microSD-Karten Slot bereit. Die Sensordaten werden ausgelesen und anschließend als .csv (comma-seperated-value) Datei gespeichert.

## Vorlage
Die Folgende Code Vorlage beinhaltet alle Bestandteile um Daten auf SD-Karte zu speichern. Nun muss nur das Auslesen des Sensors in die Code-Vorlage integriert werden und schon können die Messwerte gespeichert und ausgelesen werden.

```
/*
  senseBox Datenlogger Vorlage
  Das Auslesen der jeweiligen Sensoren muss in der void loop() stattfinden und individuell angepasst werden
*/

#include <SPI.h> //wichtige Libraries für das Speichern von Daten auf SD-Karte
#include <SD.h>

const int chipSelect = 4; //

void setup() {
  Serial.begin(9600);
  while (!Serial) {
    ;
  }


  Serial.print("Initialisiere SD-Karte");

  // Überprüfe ob eine SD-Karte eingelegt ist.
  if (!SD.begin(chipSelect)) {
    Serial.println("Karte nicht gefunden");
    return;
  }
  Serial.println("Karte erfolgreich initialisiert");

}

void loop() {

  //Auslesen der Sensoren und schreiben der Daten auf SD-Karte
  File dataFile = SD.open("datalog.txt", FILE_WRITE);

    float Messwert = // auslesen des Sensors
    dataFile.print(Messwert); //Speichern der Messwerte in der geöffneten Datei
    dataFile.println(";"); //Trennzeichen für die .csv Datei

  // Wenn die Datei geöffnet ist
  if (dataFile) {
    dataFile.close();
  }
  // Falls die Datei nicht geöffnet werden kann, soll eine Fehlermeldung ausgegeben werden
  else {
    Serial.println("Fehler beim Öffnen!");
  }
  delay(1000);
}
```

Das Auslesen des Sensors sollte in der void loop () nach dem öffnen der Datei stattfinden. Die Informationen zum Auslesen der Sensoren finden sich in den Datenblättern und Beispielcodes der Hersteller und müssen individuell angepasst werden. Die jeweiligen Messwerte werden mit dem Befehl ```dataFile.print(Messwert); ``` in eine Zeile der CSV-Datei geschrieben. Der Zusatz ```ln``` erzeugt einen Zeilenumbruch. Über den Befehl ```delay(Mikrosekunden)``` kann das Mess- und Speicherintervall angepasst werden.

Zur Veranschaulichung findest du unten einen Sketch, der den HDC100x ausliest und die Messwerte auf SD-Karte speichert.
```
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
  while (!Serial) {
    ;
  }

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

    float Temp = mySensor.getTemp(); //Auslesen der Temperatur
    dataFile.print(Temp); //Speichern der Temperatur
    dataFile.print(";");
    Serial.println(mySensor.getTemp()); //Anzeige der Temperatur im seriellen Monitor
    float Humi = mySensor.getHumi();
    dataFile.print(Humi);
    dataFile.println(";");
    Serial.println(mySensor.getHumi());


  // Wenn die Datei geöffnet ist
  if (dataFile) {
    dataFile.close();
  }
  // Falls die Datei nicht geöffnet werden kann, soll eine Fehlermeldung ausgegeben werden
  else {
    Serial.println("Fehler beim Öffnen!");
  }
  delay(1000); //Intervall des Speichern und Auslesen
}
```

## Messgerät zur Erfassung der Temperatur, Luftfeuchtigkeit und Luftdruck

Bei diesem Messgerät werden die Temperatur, Luftfeuchtigkeit und der Luftdruck als CSV-Datei auf SD-Karte gespeichert. Die Sensoren werden über I2C mit dem Arduino verbunden. Der Code befindet sich zum Download [Hier](https://github.com/sensebox/OER/blob/master/senseBox_edu/Beispiele/senseBox_Datenlogger_T_H_P.ino?raw=true)
