#Distanzmessung via Infrarot-Distanzsensor

##Materialien
* IR-Distanzsensor
* rote LED
* orange LED
* Widerstand

##Grundlagen
Die Entfernungsmessung mit Infrarotlicht erfolgt durch eine sog. Triangulation. Eine Triangulation ist eine geometrische Methode, Distanzen durch genaue Winkelmessung innerhalb eines Dreiecks zu ermitteln. Damit der Sensor Entfernungen messen kann, benötigt er zwei Bauteile: eine IR-Diode und eine sogenannte ortsauflösende Photodiode. Die IR-Diode sendet einen Infrarotstrahl aus und das von einem Objekt reflektierte Licht wird von der ortsauflösenden Photodiode empfangen. Ändert sich nun die Entfernung des Objektes vom Sensor, ändert sich auch der Winkel, in dem das Licht reflektiert und wieder empfangen wird. Mit dem gemessenen Winkel wird mit Hilfe der Winkelfunktionen die Entfernung des Objektes von der Lichtquelle errechnet. 

##Aufbau
<img src="https://raw.githubusercontent.com/sensebox/resources/master/images/edu/Aufbau_Station_4_IR.png" width="500"/>

Baue die oben abgebildete Schaltung nach.

***Tipp:*** *Der in der senseBox verwendete Infrarot Distanzmesser gibt ein analoges Signal aus und kann nur Distanzen zwischen 5 cmund 60cm messen. Der gemessene Wert kann mit einer Formel in die Distanz in Zentimetern umgerechnet werden:*
*Distanz = 4800/(Sensorwert - 20)*
*Informationen wie die Umrechnungsformeln der Sensoren gibt es immer in den Datenblättern der Hersteller.*

##Programmierung

Zunächst wollen wir wieder Variablen für die später benutzten Pins erstellen. Für dieses Projekt benötigen wir einen analogen Eingang `A0` für den IR-Sensor.
Außerdem benötigen wir eine Variable, in der wir den gemessenen Abstand speichern. 

```arduino
int irsensor = A0;
float distance = 0;
```
In der `setup`-Methode soll zunächst der serielle Monitor gestartet werden. Dann müssen wir den Pin `A0` noch als Eingang definieren. 
```
void setup() {
  Serial.begin(9600);
  pinMode(irsensor, INPUT);
}
```
In der `loop`-Methode lesen wir zunächst den Wert des Sensors aus. Anschließend müssen wir diesen noch in Zentimeter umrechnen und in der Variable speichern. 
```arduino
void loop() {
  int temp = analogRead(irsensor);
  distance = 4800/(temp -20);
  //Falls das Objekt zu weit weg ist, kann der Sensor es nicht erfassen.
  //Ein ähnliches Problem ergibt sich, falls das Objekt zu nah ist. 
  Serial.print("Ein Objekt befindet sich ");
  Serial.print(distance);
  Serial.println(" cm vor dem Sensor");
}
```
Nun kannst du die gemessenen Werte des Sensors im seriellen Monitor sehen. Du wirst sehen, das die Werte nur zwischen 5cm und 60cm zuverlässig gemessen werden. 

## Aufgabe

Erweitere das Projekt so, dass eine orange LED zu leuchten beginnt, falls der gemessene Abstand kleiner als 20cm wird. 
Sollte der gemessene Abstand kleiner als 10cm werden, soll eine rote LED aufleuchten. 