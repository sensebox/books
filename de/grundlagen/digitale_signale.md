# Digitale Signale

Digitale Signale können lediglich die Werte 1 oder 0 bzw. High oder Low annehmen. Sie verwenden also nur abzählbare Elemente wie zum Beispiel Finger. Daher auch der Begriff digital, der auf das lateinische digitus, der Finger zurück geht.

Ein Arduino Programm (auch "Sketch" genannt) hat einen sehr einfachen Aufbau, der aus zwei Hauptbestandteilen besteht.
Diese zwei benötigten Funktionen enthalten Blöcke von Anweisungen, welche den Programmablauf beschreiben:

```arduino
void setup(){
  // Anweisungen
}
void loop(){
  // Anweisungen
}
```

Die `setup`-Funktion wird nur einmal beim Start des Programmes ausgeführt.
In der `loop`-Funktion werden hingegen alle Anweisungen fortlaufend in einer endlosen Schleife wiederholt. Beide Funktionen sind zwingend notwendig um das Programm erfolgreich kompilieren und ausführen zu können.
"Kompilieren" bezeichnet die Übersetzung des Programms in Maschinencode, welcher vom Arduino-Prozessor verstanden werden kann; dies Übernimmt die Arduino-IDE für uns.

Mit einem doppelten Schrägstrich (`//`) lassen sich Kommentare zum Programmcode hinzufügen.
Es ist immer wichtig seinen Programmcode zu kommentieren, damit auch andere nachvollziehen können, was an einer bestimmten Stelle passiert.

## Digitale Aktoren ansteuern

Um nun einen digitalen Aktor - beispielsweise eine LED - anzusteuern, benötigt man zwei Befehle:
Der Erste steht im `setup()`, der Zweite im `loop()`.
In der `setup`-Funktion wird mit dem Befehl `pinMode(13, OUTPUT);` festgelegt, dass an Pin Nummer 13 etwas angeschlossen ist, was als Ausgang (oder OUTPUT) benutzt werden soll.
Die 13 kann hier durch jede andere Pin-Nummer ersetzt werden, je nachdem an welchen Arduino-Pin man den Aktor angeschlossen hat.
Die zweite Funktion im ` loop()` lautet `digitalWrite (13, HIGH);`. Damit wird der an Pin 13 angeschlossene Aktor mit Strom versorgt, also angeschaltet.
Das Gegenstück zu diesen Befehl wäre `digital´Write(13, LOW);` um die Stromversorgung wieder zu beenden. Auch hier ist die 13 wieder durch jede andere Pinnummer ersetzbar. Der Sketch sollte also wie folgt aussehen:

```arduino
void setup() {
  pinMode(13, OUTPUT); // Deklariere den Pin, an dem die LED
                       // angeschlossen ist, als Ausgang
}

void loop() {
  digitalWrite(13, HIGH); // Schalte die LED an
}
```

## Digitale Sensoren auslesen
Dieselben Pins die wir zum Ansteuern von digitalen Aktoren genutzt haben, lassen sich auch zur Registrierung von Eingangssignalen verwenden.
Digitale Eingänge können dabei genau wie digitale Ausgänge zwei Zustände annehmen; `HIGH` oder `LOW`.
Damit eingehende Signale verarbeitet werden können, müssen diese in [Variablen](variablen.md) gespeichert werden.

Um digitale Signale zu speichern, eignet sich besonders eine boolesche Variable (auch `boolean` genannt), welche nur zwei Werte annehmen kann.
Um nun einen digitalen Sensor auszulesen, werden ähnlich wie beim Ansteuern digitaler Sensoren zwei Befehle benötigt.
Im `loop()` wird durch den Befehl `pinMode(13, INPUT);` Pin 13 des Arduino als Eingang festgelegt.
Im `setup()` kann durch den Befehl `TestVariable = digitalRead(13);` ein an Pin 13 angeschlossener Sensor ausgelesen und der Wert in der zuvor angelegten Testvariable gespeichert werden.
Genau wie beim Ansteuern von digitalen Aktoren steht die 13 für den verwendeten Pin und kann durch jeden anderen digitalen Pin ersetzt werden.
Der Sketch sollte also wie folgt aussehen:

```arduino
boolean TestVariable = 0;          // deklariere eine neue boolean Variable

void setup() {
  pinMode(13,INPUT);
}
void loop() {
  TestVariable = digitalRead (13); // schreibe den gelesenen Wert in die Variable
}
```

Den Inhalt der angelegten Variable kannst du dir im [seriellen Monitor](der_serielle_monitor.md) anzeigen lassen.
