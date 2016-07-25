# Ampel
## Es soll eine Ampel simuliert werden. Mit einem Button kann man die Ampel umschalten.

## Materialien
#### Aus der senseBox:edu
* Genuino UNO
* rote LED
* gelbe LED
* grüne LED
* 3x 470Ω Wiederstand
* Button
* 10Ω Wiederstand


## Setup Beschreibung
#### Hardwarekonfiguration

![ampel-button-schaltplan](https://raw.githubusercontent.com/sensebox/resources/master/images/edu/ampel_button_schaltplan.png)

#### Softwaresketch

```arduino
int rot = 13;
int gelb = 12;
int gruen = 11;

int button = 8;

void setup() {
  pinMode(rot, OUTPUT);
  pinMode(gelb, OUTPUT);
  pinMode(gruen, OUTPUT);

  // Der Button soll Signale messen, also INPUT
  pinMode(button, INPUT);

  // Ampel zuerst auf ROT setzen
  digitalWrite(rot, HIGH);
  digitalWrite(gelb, LOW);
  digitalWrite(gruen, LOW);
}

void loop() {

  // Hier wird geprüft ob der Button gedrückt wird
  if(digitalRead(button) == HIGH) {

    delay(5000);

    // ROT zu GRUEN
    digitalWrite(rot, HIGH);
    digitalWrite(gelb, HIGH);
    digitalWrite(gruen, LOW);

    delay(1000);

    digitalWrite(rot, LOW);
    digitalWrite(gelb, LOW);
    digitalWrite(gruen, HIGH);

    delay(5000);


    // GRUEN zu ROT
    digitalWrite(rot, LOW);
    digitalWrite(gelb, HIGH);
    digitalWrite(gruen, LOW);

    delay(1000);


    digitalWrite(rot, HIGH);
    digitalWrite(gelb, LOW);
    digitalWrite(gruen, LOW);
  }
}

```

* Am Anfang der `loop()` Funktion wird jedesmal abgefragt ob der Button gedrückt wird.
* `digitalRead(button)` liest den aktuellen Zustand des Buttons aus. Wird er gedrückt, liefert die Funktion `HIGH` aus, ansonsten `LOW`.
* Um zu Prüfen ob der Button gedrückt wurde muss `digitalRead(button)` mit `HIGH` verglichen werden. Der Vergleich geschieht mit __zwei__ Gleichzeichen `==` (Vergleichsoperator). __Ein__ Gleichzeichen `=` ist eine Zuweisung, wie etwa `int rot = 13`.
