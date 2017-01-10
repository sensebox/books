# RGB LED
## Wie man eine mehrfarbige LED verwendet

## Materialien
* Genuino UNO
* RGB LED
* 1x 470Ω Wiederstand

## Aufbau

<img src="https://raw.githubusercontent.com/sensebox/resources/master/images/edu/RGB_LED.png" align="center" width="450"/>

### Programmierung
Zunächst muss unsere Arduino IDE um die NeoPixel Bibliothek erweitert werden. Wie das funktioniert kannst du [hier](http://sensebox.github.io/books/edu/de/getting_started/installation_der_software.html) nachlesen.
Die Bibliothek kannst du unter [Downloads](../downloads.md#libraries) herunterladen und installieren.

Nun kannst du mit dem Schreiben des Programms beginnen, indem du die NeoPixel Bibliothek einbindest. Anschließend solltest du eine Variable erstellen, in der du speicherst, an welchem Pin deine LED angeschlossen wird. Dann erstellst du ein Objekt `rgb_led` über das du die LED später steuern kannst.

**Hinweis** *Da die LED über Pulsweitenmodulation (PWM, siehe auch [Analoge Signale](../grundlagen/analoge_signale.md)) gestuert wird, muss sie an einen Pin mit dem Symbol `~` angeschlossen werden (Pins 3,5,6,9,10 oder 11). Wenn du mehr über PWM lernen willst, schaue [hier](http://www.mathias-wilhelm.de/arduino/beginner/pulsweitenmodulation-pwm) nach.*

```arduino
#include <Adafruit_NeoPixel.h>
int pin = 9;

Adafruit_NeoPixel rgb_led = Adafruit_NeoPixel(1, pin, NEO_GRB + NEO_KHZ800);
```
Nun muss die LED in der `setup()`-Methode gestartet werden.
```arduino
void setup() {
  rgb_led.begin();
}
```

Die Farbe der LED lässt sich über den Befehl `rgb_led.Color(x, y, z)` bestimmen.
Jede der Variablen `x`,`y` und `z` kann man durch eine Zahl zwischen 0 und 255 ersetzen, wobei `x` für den Rotanteil, `y` für den Grünanteil und `z` für den Blauanteil steht.
Anschließend muss die definierte Farbe an die LED übergeben werden.
Dies geschieht über den Befehl `rgb_led.setPixelColor(0, rgb_led.Color(x,y,z))`. Sichtbar wird die gewählte Farbe mit dem Befehl `rgb_led.show()`.
Im folgenden siehst du ein Beispiel, das die drei Grundfarben Rot, Grün und Blau der Reihe nach leuchten lässt.

```arduino
void loop() {
  // rot
  rgb_led.setPixelColor(0,rgb_led.Color(255, 0, 0));
  rgb_led.show();
  delay(200);
  // gruen
  rgb_led.setPixelColor(0,rgb_led.Color(0, 255, 0));
  rgb_led.show();
  delay(200);
  // blue
  rgb_led.setPixelColor(0,rgb_led.Color(0, 0, 255));
  rgb_led.show();
  delay(200);
}
```

## Aufgabe
Schließe ein Potentiometer an und regle über dieses eine der drei Grundfarben.
Falls du mehrere Potentiometer hast, kannst du auch alle drei Farben regeln und damit jede Farbe erzeugen!
