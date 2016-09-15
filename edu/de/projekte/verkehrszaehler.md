# Verkehrszähler

## Ziele der Station
Ziel ist es, einen Verkehrs- oder Personenzähler zu entwickeln.
Dazu verwenden wir einen Ultraschall-Distanzsensor.
Die so aufgenommenen Werte sollen im *Seriellen Monitor* ausgegeben werden.

## Materialien
* Ultraschall-Distanzsensor

## Zusätzliche Materialien
* Ihr benötigt keine zusätzlichen Materialien.

## Grundlagen
Der Ultraschall-Distanzsensor nutzt den Schall um die Entfernung von Objekten zu bestimmen. Der Sensor sendet einen Impuls aus und misst die Zeit, bis er das Echo des Impulses wieder empfängt. Aus dieser Zeit errechnet man mit Hilfe der Schallgeschwindigkeit die Entfernung.

## Aufbau
Der Ultraschallsensor wird mit vier verschiedenen Ports des Arduino verbunden.
Zur Stromversorgung wird der VCC-Pin des Sensors mit dem 5V-Port des Arduino
verbunden. Um den Stromkreis zu schließen wird der GND-Pin des Sensors mit
einem GND-Port des Arduino verbunden. Als Letztes werden der Echo- und der
Trig-Pin des Sensors jeweils mit digitalen Ports des Arduino verbunden.

<img src="https://raw.githubusercontent.com/sensebox/resources/master/images/edu/Verkehrszaehler.jpg" width="500"/>

***Hinweis:*** *Ihr könnt natürlich jeden digitalen Port verwenden, denkt aber daran den Code anzupassen.*

## Programmierung

Definiert die Pins an dem ihr den Sensor angeschlossen habt wie üblich.
Außerdem werden zwei Variablen angelegt in der die gemessene Zeit und die errechnete Distanz gespeichert werden.

```arduino
int trig = 12;  // Trig-Pin des Sensors ist an Pin 12 angeschlossen.
int echo = 11;  // Echo-Pin des Sensors ist an Pin 11 angeschlossen.
unsigned int time = 0;
unsigned int distance = 0;
```

Im `setup()` müsst ihr nun den *Seriellen Monitor* starten und die Pins an denen der Sensor angeschlossen ist als Ein- bzw. Ausgang definieren. Der Trigger-Pin des Sensors muss als Ausgang und der Echo-Pin als Eingang definiert werden.

```arduino
Serial.begin(9600);
pinMode(trig, OUTPUT);
pinMode(echo, INPUT);

```

Im `loop()` wird mit den Befehlen
```arduino
digitalWrite(trig, HIGH);
delayMicroseconds(10);
digitalWrite(trig, LOW);
```
ein 10 Mikrosekunden langer Ultraschallimpuls ausgesendet.
Der darauffolgende Befehl `time = pulseIn(echo, HIGH);` speichert die Zeit bis zum Empfang des Echos in der Variable `time`.
Zum Schluss muss noch die Distanz aus der Zeit errechnet werden, sowie die Werte auf dem Seriellen Monitor angezeigt werden.

```arduino
distance = time / 58;
Serial.println(distance);
```

## Aufgabe 1
Versucht mit Hilfe bekannter Befehle und dem oben angegebenen Sketch zum Ultraschallsensor einen Personen- bzw. Verkehrszähler zu entwickeln.

Beachtet dabei folgende Hinweise:
 - Versucht nur einen bestimmten Entfernungsbereich auszuwerten, damit es
nicht zu Störungen durch Bewegungen im Hintergrund kommt. Praktisch bedeutet solltet ihr also eure Fahrbahnen klar definieren.

- Um Mehrfachzählungen eines stehenden Fahrzeuges zu vermeiden solltet ihr eine Bedingung programmieren, der den Zählvorgang stoppt bis die Spur wieder frei ist, der Sensor also eine vorher festegelegte Maximaldistanz für die Spur misst.
