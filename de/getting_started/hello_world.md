# Hello World

## Ziel der Station
In dieser Station lernst du den Arduino Uno Mikrokontroller kennen und startest mit der Programmierung eines ersten simplen Programmes. Hierzu lernst du den generellen Aufbau des Arduino-Programmcodes, das Arduino Programm (IDE) und die ersten Kontrollstrukturen kennen.

## Grundlagen
Bevor du loslegen kannst dein erstes eigenes Programm zu schreiben, musst du dir das Arduino Programm - die sogenannte Entwicklungsumgebung (engl. IDE) - anschauen.
Wenn du die IDE öffnest siehst du direkt einen großen weißen Bereich, in welchem du dein Programm schreiben wirst.
Im schwarzen Bereich darunter werden dir Status- und Fehlermeldungen angezeigt, es lohnt sich also immer einen Blick auf die Meldungen zu werfen.

Zuletzt solltest du dir noch die kleinen Schaltflächen über dem weißen Bereich anschauen.

![Schaltflächen 1](https://raw.githubusercontent.com/sensebox/resources/master/images/arduino-ide_schaltflaechen1.png)
Das Häkchen und der Pfeil sind die beiden wichtigsten Symbole für dich:
Mit dem Häkchen kannst du dein Programm auf Schreibfehler überprüfen lassen, und mit den Pfeil überträgst du dein Programm an den Arduino.

![Schaltflächen 2](https://raw.githubusercontent.com/sensebox/resources/master/images/arduino-ide_schaltflaechen2.png)
Die anderen drei Symbole - angefangen mit dem kleinen Blatt ganz links - stehen dafür ein neues Programm zu erstellen, ein gespeichertes zu öffnen und dein geschriebenes Programm zu speichern

## Aufbau
Achte beim Aufbau darauf, dass das längere Beinchen der LED immer mit dem Pluspol verbunden werden muss, also nicht mit dem GND-Port.

![Aufbau](https://raw.githubusercontent.com/sensebox/resources/master/images/edu/aufbau_led.png)

## Programmierung
Jetzt endlich kannst du mit deinem ersten Arduino Programm (auch Sketch genannt) starten. Es hat einen sehr einfachen Aufbau, der aus zwei Hauptbestandteilen besteht. Diese zwei benötigten Teile enthalten Blöcke von Anweisungen:

```arduino
void setup() {
  // Anweisungen
}

void loop() {
  // Anweisungen
}
```

Die `setup()`-Funktion wird nur einmal beim Start des Programmes ausgeführt.
In der `loop()`-Funktion werden hingegen alle Anweisungen fortlaufend in einer endlosen Schleife wiederholt.
Beide Funktionen sind zwingend notwendig um das Programm erfolgreich ausführen zu können.

Mit einem doppelten Schrägstrich `//` lassen sich Kommentare zum Programmcode hinzufügen.
Es ist immer eine gute Idee seinen Programmcode zu kommentieren, damit auch andere nachvollziehen können, was an einer bestimmten Stelle passiert.

Beginnen wir nun mit einem Sketch, um eine LED zum Leuchten zu bringen:

```arduino
void setup() {
  pinMode(13, OUTPUT);    // Deklariere den Port, an dem die LED            
                          // angeschlossen ist, als Ausgang
}

void loop() {
  digitalWrite(13, HIGH); // Schalte die LED an
}
```

In der `setup()`-Funktion wird mit dem Befehl `pinMode(13, OUTPUT);` der Port 13 des Arduinos, als Ausgang definiert.
Die Nummer, die du im Code angibst muss natürlich immer mit dem Port, an dem die LED angeschlossen ist, übereinstimmen.
Ohne diesen Befehl leuchtet die LED nicht, da kein Strom an den Port geschickt wird.

Im letzten Schritt der Programmierung wird in der `loop()`-Funktion die LED schließlich angeschaltet.
Dazu benutzt man den Befehl `digitalWrite(13, HIGH);`. Auch hier steht die 13 wieder für den jeweiligen benutzten Port.
Das Gegenstück hierzu wäre der Befehl `digitalWrite(13, LOW);` um die LED wieder auszuschalten.

## Übertragen und Testen
Mit der oben beschriebenen Programmierung solltest du jetzt die LED zum leuchten bringen können.
Schreibe das Programm ab und lade es auf den Arduino.

## Aufgaben
1. Programmiere den Arduino so, dass die LED blinkt. Dazu kannst du dein geschriebenes Programm weiterentwickeln. Am Aufbau musst du dazu nichts verändern.

    `TIPP`: Mit dem Befehl `delay(1000);` kannst du deinem Programm eine Pause verordnen. Die Zahl in der Klammer gibt dabei die Länge der Pause in Millisekunden an. 1000 entspricht also 1 Sekunde. Schreibst du also den Befehl `delay(1000);` hinter den Befehl der die LED anschaltet, bleibt sie 1 Sekunde an. Denke immer daran die LED auch wieder auszuschalten!

2. Verwende jetzt anstatt der LED den kleinen schwarzen Piepser, denn du in deiner senseBox findest. Diesen kannst du genau wie eine LED anschließen und programmieren.
