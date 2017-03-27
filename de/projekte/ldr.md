# LDR

## Ziel der Station
Du sollst in dieser Station einen einfachen Helligkeitssensor auslesen und dir die gemessenen Werte im seriellen Monitor anzeigen lassen.
Wir verwenden dazu einen Fotowiderstand (engl. *light dependent resistor - LDR*).

Wir wollen anschließend eine Lampe einschalten, sobald die Helligkeit unter einen Grenzwert fällt.

## Materialien
- Fotowiderstand (LDR)
- LED
- 10 kOhm Widerstand

## Grundlagen
Der Mikrokontroller soll über einen **Fotowiderstand** auslesen, wie hell es ist.
Dieser Sensortyp verwendet eine einfaches physikalisches Prinzip:
Wenn in einem Stromkreis zwei Verbraucher hintereinander angeschlossen sind (Reihenschaltung), dann „teilt“ sie sich auch die gemeinsam anliegende Spannung.
Ein Fotowiderstand ändert seinen Widerstand in Abhängigkeit der Lichtstärke.
Diesen Effekt nutzt man, um anhand der an ihr anliegenden Spannung einen Wert für Helligkeit bzw. Dunkelheit in Form von verschiedenen Spannungen abzulesen.

Das Mikrocontroller-Board ist in der Lage, [analoge Signale](../grundlagen/analoge_signale.md) (Spannung) zu messen und diese zu verarbeiten.
Dies geschieht mit den analogen Eingängen auf dem Board.
Diese wandeln den gemessenen Spannungswert in eine Zahl um, die dann im Code weiter verarbeitet werden kann.
0 Volt entspricht dabei der Zahl `0` und der höchste Messwert 5 Volt entspricht der Zahl `1023` (0 bis 1023 entspricht 1024 Werte = 10 Bit).
Beispiel: Es wird eine Spannung von 2,5 Volt gemessen, dann liefert der Mikrokontroller den Wert `512` (`0.5 * 1024`).

In diesem Sketch wird der [serielle Monitor](../grundlagen/der_serielle_monitor.md) verwendet, um die Werte anzeigen zu lassen, die das Board von dem Fotowiderstand einliest.
Wozu ist das sinnvoll? Mal angenommen, die LED soll erst bei beginnender Dunkelheit anfangen zu leuchten.
Dann muss es im Sketch einen Bereich geben, der die Funktion hat: *„Wenn der Wert des Fotowiderstandes den Wert x unterschreitet, dann soll die LED leuchten“*.
Dazu müsste man wissen wie groß der Wert x bei beginnender Dämmerung ist.
Lösung: Ich sende den ausgelesenen Wert „x“ der Spannung an dem Fotowiderstand bei entsprechender Helligkeit (bspw. Dämmerung) an den „serial monitor“ und lasse ihn mir dort anzeigen.
Mit diesem Wissen kann ich später das Programm in der folgenden Form abändern: *„Wenn der Spannungsausgabewert des Fotowiderstandes einen Wert von „x“ unterschreitet, dann schalte die LED an.“*

## Aufbau
![Aufbau](https://raw.githubusercontent.com/sensebox/resources/master/images/edu/aufbau_ldr.png)

Um die oben beschriebene Spannungsteilung zu erzeugen, schließt du den Fotowiderstand und einen Widerstand (10 K Ohm) in Reihe an und verbindest sie mit 5 Volt und der „Erdung“ (Ground / `GND`).

## Programmierung
Durch die folgenden drei Befehle wird der analoge Eingang 0 in `eingang`, und der digitale Port 10 in `LED` umbenannt.
Mit dem Befehl `int sensorWert = 0;` wird eine Variable für den Sensorwert mit 0 als Startwert erstellt.

```arduino
int eingang = A0;  
int LED = 10;
int sensorWert = 0;
```

In der `setup()`-Funktion initialisieren wir das Programm.
Der Befehl `Serial.begin(9600);` startet die Kommunikation mit dem seriellen Monitor.
Das benötigst du, um dir später die ausgelesenen Werte anzeigen zu lassen.
Der Befehl `pinMode (LED,OUTPUT);` legt den LED-Pin als Ausgang fest, genau wie bei der LED in der ersten Station:

```arduino
void setup() {
  Serial.begin(9600);
  pinMode(LED, OUTPUT);
}
```

Die wiederholt aufgerufene `loop()`-Funktion soll jeweils eine Messung durchführen und die LED aktiviert werden.
Mit dem Befehl `sensorWert = analogRead(eingang);` wird der Photowiderstand ausgelesen und die Werte in der Variable "sensorWert" abgespeichert.
Die nächsten beiden Befehle schreiben die gemessenen Daten in den seriellen Monitor.

```arduino
void loop() {
  sensorWert = analogRead(eingang);
  Serial.print("Sensorwert = " );
  Serial.println(sensorWert);
```

Im letzten Programmabschnitt wird mit einer [`if`-Bedingung](../grundlagen/ifelse-bedingung.md) eine Bedingung festgelegt, nach welcher die angeschlossene LED leuchten soll.
Das heißt im Klartext, dass die LED nur dann leuchten soll, wenn ein Schwellwert (in diesem Beispiel 512) erreicht wird.
Diesen Schwellwert solltest du vor jeder Verwendung des Programms neu anpassen.

```arduino
  if (sensorWert > 512) {    // Wenn der Sensorwert über 512 beträgt...
    digitalWrite(LED, HIGH); // ...soll die LED leuchten…
  }

  else {                     // andernfalls…
    digitalWrite(LED, LOW);  // ...soll sie nicht leuchten.
  }

  delay(50);                 // Eine kurze Pause, bevor wir die nächste Messung starten
}
```


## Übertragen und Testen
Mit der oben beschriebenen Programmierung solltest du jetzt die Helligkeit auslesen können.
Übertrage den Code auf den Arduino und schaue dir die Ausgabe auf dem seriellen Monitor an.

## Aufgaben
- Passe den Schwellwert entsprechend der aktuellen Helligkeit an.
