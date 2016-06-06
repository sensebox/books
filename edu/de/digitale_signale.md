# Digitale Signale

Digitale Signale können lediglich die Werte 1 oder 0 bzw. High oder Low annehmen. Sie verwenden also nur abzählbare Elemente wie zum Beispiel Finger. Daher auch der Begriff digital, der auf das lateinische digitus, der Finger zurück geht.

Ein Arduino Programm (auch Sketch genannt) hat einen sehr einfachen Aufbau, der aus zwei Hauptbestandteilen besteht. Diese zwei benötigten Funktionen enthalten Blöcke von Anweisungen:

```
void setup(){
    //Anweisungen
  }
  void loop(){
    //Anweisungen
  }
```

Die setup-Funktion wird nur einmal beim Start des Programmes ausgeführt. In der loop-Funktion werden hingegen alle Anweisungen fortlaufend in einer endlosen Schleife wiederholt. Beide Funktionen sind zwingend notwendig um das Programm erfolgreich kompilieren und ausführen zu können. Mit einem doppelten Schrägstrich (//) lassen sich Kommentare zum Programmcode hinzufügen. Es ist immer wichtig seinen Programmcode zu kommentieren, damit auch andere nachvollziehen können, was an einer bestimmten Stelle passiert.

## Digitale Aktoren ansteuern

Um nun einen digitalen Aktor, wie zum Beispiel eine LED, anzusteuern benötigt man zwei Befehle. Der Erste im `void setup()`, der Zweite im `void loop()`. Im void setup wird mit dem Befehl `pinMode(13, OUTPUT);` festgelegt, dass an Port Nummer 13 etwas angeschlossen ist, was als Ausgang (oder OUTPUT) benutzt werden soll. Die 13 kann hier natürlich durch jede andere Portnummer ersetzt werden, je nachdem an welchem Port man den Aktor angeschlossen hat. Die zweite Funktion, im `void loop()` lautet `digitalWrite (13, HIGH);`. Damit wird der an Port 13 angeschlossene Aktor mit Strom versorgt, also praktisch angeschaltet. Das Gegenstück zu diesen Befehl wäre `digital´Write(13, LOW);` um die Stromversorgung wieder zu beenden. Auch hier ist die 13 wieder durch jede andere Portnummer ersetzbar. Der Sketch sollte also wie folgt aussehen:


```
void setup() {
  pinMode(13, OUTPUT); // Deklariere den Port, an dem die LED            
                        // angeschlossen ist, als Ausgang
}

void loop() {
  digitalWrite(13, HIGH); // Schalte die LED an
}
```

## Digitale Sensoren auslesen
Dieselben Ports die wir zum Ansteuern von digitalen Aktoren genutzt haben lassen sich auch zur Registrierung von Eingangssignalen verwenden. Digitale Eingänge können dabei, genau wie digitale Ausgänge, zwei Zustände annehmen, high oder low.
Damit eingehende Signale verarbeiten werden können, müssen sie in [Variablen](./variablen.md) gespeichert werden. 

Um digitale Signale zu speichern, eignet sich besonders eine boolesche Variable (auch boolean genannt).
Um nun einen digitalen Sensor auszulesen werden ähnlich wie beim Ansteuern digitaler Sensoren, zwei Befehle benötigt. Im `void loop()` wird duch den Befehl `pinMode(13, INPUT);` Port 13 des Arduino als Eingang festgelegt. Im `void setup()` kann durch den Befehl `TestVariable=digitalRead (13);` ein an Port 13 angeschlossener Sensor ausgelesen und der Wert in der zuvor angelegten Testvariable gespeichert werden. Genau wie beim Ansteuern von digitalen Aktoren steht die 13 für den verwendeten Port und kann durch jeden anderen digitalen Port ersetzt werden.
Der Sketch sollte also wie folgt aussehen:
```
boolean TestVariable = 0;
void setup(){
	pinMode(13,INPUT);
}
void loop(){
	TestVariable = digitalRead (13);
}
```

Den Inhalt der angelegten Variable kannst du die im [seriellen Monitor](./der_serielle_monitor.md) anzeigen lassen.