# Disco Stu
## Wie man eine mehrfarbige LED verwendet

## Materialien
* Genuino UNO
* RGB LED
* 1x 470Ω Wiederstand

## Aufbau
### Hardwarekonfiguration

![rgb-led-schaltplan](https://raw.githubusercontent.com/sensebox/resources/master/images/edu/RGB_LED.png)

### Programmierung
Zunächst muss unsere Ardunino Umgebung um die Neo-Pixel Bibliothek erweitert werden. Wie das funktioniert, kannst du [hier](http://sensebox.github.io/books/edu/de/getting_started/installation_der_software.html) nachschauen. Die Bibliothek findest du in diesem [Zip-Ordner](https://github.com/sensebox/resources/raw/master/libraries/senseBox_Libraries.zip). Nun kannst du mit dem Schreiben des Programms beginnen, in dem du die Neo-Pixel Bibliothek einbindest. Anschließend solltets du eine Variable erstellen, in der du speicherst, an welchem Pin deine LED angeschlossen wird. Dann erstellst du ein Objekt rgb_led über das du die LED später steuern kannst. 

**Hinweis** *Da die LED über sogenannte Pulsweitenmodulation (pwm) gestuert wird, muss sie an einen Pin mit dem Symbol `~` angeschlossen werden. Also Pin 3,5,6,9,10 oder 11. Wenn du mehr über pwm lernen willst, schaue [hier](http://www.mathias-wilhelm.de/arduino/beginner/pulsweitenmodulation-pwm/).*
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
Die Farbe der LED lässt sich über den Befehl `rgb_led.Color(x, y, z)` bestimmen. Jede der Variablen `x`,`y` und `z` kann man durch eine Zahl zwischen 0 und 255 ersetzen. Wobei `x` für den Rotanteil, `y` für den Grünanteil und `z` für den Blauanteil steht. Anschließend muss die definierte Farbe an die LED übergeben werden. Dies geschieht über den Befehl `rgb_led.setPixelColor(0,rgb_led.Color(x,y,z))`. Sichtbar wird die gewählte Farbe mit dem Befehl `rgb_led.show()`. Im folgenden siehst du ein Beispiel für die drei Grundfarben Rot, Grün und Blau.
```arduino
void loop() {
    //red
    rgb_led.setPixelColor(0,rgb_led.Color(255, 0, 0));
    rgb_led.show();
    delay(200);
    //green
    rgb_led.setPixelColor(0,rgb_led.Color(0, 255, 0));
    rgb_led.show();
    delay(200);
    //blue
    rgb_led.setPixelColor(0,rgb_led.Color(0, 0, 255));
    rgb_led.show();
    delay(200);
}
```
## Aufgabe
Schließe ein Potenziometer an und regle über dieses eine der drei Grundfarben. 
Wenn du mehrere Potenziometer hast, kannst du auch alle drei Farben regeln und damit jede Farbe erzeugen. 

