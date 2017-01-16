# Kaminfeuer
## Es soll ein Kaminfeuer simuliert werden. Dazu wird eine rote LED zum flackern gebracht.

## Materialien
#### Aus der senseBox:edu
* Genuino UNO
* LED
* 470Ω Wiederstand

## Setup Beschreibung
#### Hardwarekonfiguration
Es wird nur die LED angeschlossen. Diese wird am langen Beinchen mit einem 470Ω Wiederstand mit dem digitalen Port 13 verbunden. Das kurze Beinchen wird mit GND verbunden.

![led-schaltplan](https://raw.githubusercontent.com/sensebox/resources/master/images/edu/led_schaltplan.png)

#### Softwaresketch

```arduino
// die LED ist an den digitalen Port 13 angeschlossen
int led = 13;

void setup() {
  // der digitale Port 13 wird als OUTPUT definiert
  // d.h.: es werden Signale herausgeschickt
  pinMode(led, OUTPUT);
}

void loop() {
  // generiert Zufallswert zwischen 0 und 1000 und speichert ihn in randomDelayAn
  int randomDelayAn = random(1000);
  digitalWrite(led, HIGH);

  // Zufallswert wird eingesetzt, LED bleibt entsprechend lange an (in Millisekunden)
  delay(randomDelayAn);

  // generiert Zufallswert zwischen 0 und 500 und speichert ihn in randomDelayAus
  int randomDelayAus = random(500);
  digitalWrite(led, LOW);

  // Zufallswert wird eingesetzt, LED bleibt entsprechend lange aus (in Millisekunden)
  delay(randomDelayAus);
}

```

* Wir speichern den digitalen Port 13 in einer Variable, damit wir uns nur noch den aussagekräftigen Variablennamen merken müssen und nicht die Portnummer. Das ist vorallem bei mehreren angeschlossenen LEDs hilfreich.
* Die Funktion `random(max)` generiert Zufallszahlen von 0 bis `max`. Falls man ebenfalls ein Minimum angeben will kann man die Funktion `random(min, max)` benutzen.
