# Lauschangriff

## Ziele der Station
In dieser Station wollen wir lernen, wie wir das Mikrofon mit dem Arduino nutzen können.

## Materialien
* Mic-Breakout

## Grundlagen
Das Mikrofon ist zusammen mit einem Verstärker (100x) auf dem Board verbaut.
Es benötigt eine Betriebspannung von 2.7V&nbsp;-&nbsp;5.5V und ist in der Lage Geräusche zwischen 58dB und 110dB wahrzunehmen.

## Aufbau

Steckt den Schaltkreis wie ihr ihn unten in der Grafik seht.

<img src="https://raw.githubusercontent.com/sensebox/resources/master/images/edu/aufbau_station_lauschangriff.png?raw=true" width="500"/>

***Hinweis:*** *Falls euer analoger Pin `A0` bereits belegt ist, könnt ihr natürlich auch einen anderen Pin verwenden. Vergesst nicht, dies auch im Code zu ändern.*

## Aufgabe 1
Definiert den Pin an dem der Ausgang von eurem Mikrofon anliegt wie üblich. Außerdem muss eine Variable angelegt werden, in der die Werte des Mikrofons gespeichert werden:

```arduino
int mic = A0;
long micVal = 0; //speichert den Wert des Mikrofons
```

Nun muss die serielle Ausgabe initialisieren werden und dem Pin `mic` der Modus `INPUT` zuordnen. Das machen wir im `setup`:

```arduino
void setup() {
  Serial.begin(9600);
  pinMode(mic,INPUT);
}
```
Wir schreiben uns eine Funktion, die den Mikrofonwert ausließt:

```arduino
long getMicVal() {
  micVal = analogRead(mic);
  return micVal;
}
```
Wenn ihr nun in eurem `loop()` den Wert auslest könnt ihr ihn euch über den seriellen Monitor ausgeben lassen.

```arduino
void loop() {
  Serial.print(getMicVal());
}
```

Ihr werdet sehen, dass die Ausgabe in einem leisen Raum um den Wert 510 schwankt. Bei lauten Geräuschen können auch negative Werte zurück gegeben werden.
Um die Lesbarkeit der erhaltenen Werte zu verbessern führen wir einige Berechnungen in der Methode `getMicVal()` durch:

```arduino
long getMicVal(){
  int period = 3; // mittelt drei Werte um 'Ausreißer' abzufangen
  int correction_value = 510;
  for(int i = 0; i < period; i++){
    // berechnet den Absolutbetrag des Wertes um negative Ausschläge abzufangen
    micVal = micVal + abs(analogRead(mic)-correction_value);
    delay(5);
  }
  micVal = constrain(abs(micVal/period),1,500);    
  return(micVal);
}
```
Jetzt könnt ihr ausprobieren Welche Geräusche welche Ausschläge verursachen:

- Wie stark ist der Ausschlag bei Gesprächen?
- Was passiert wenn du den Summer vor das Mikrofon hältst?
- Und was, wenn du hinein pustest?

## Aufgabe 2
Bau eine Geräuschampel mit drei LED's, welche in einem leisen Raum grün leuchtet, bei Zimmerlautstärke orange und bei Lärm rot.
