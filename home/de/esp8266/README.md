# senseBox:home mit ESP8266

Alternativ zum Arduino/Genuino lassen sich auch andere Plattformen als Microcontroller der Sensorstation nutzen.
Hier wird beispielhaft der ESP8266 verwendet, welcher ein schnellerer Mikrokontroller mit eingebautem WLAN ist.
Er lässt sich mit der Arduino IDE programmieren, was die Anpassungsarbeit der Software sehr einfach macht.
Es gibt relativ viele Varianten dieses Mikrokontrollers.

> **Achtung**
> * Leider funktioniert das Barometer (BMP280) nicht korrekt mit der `BMP280.h` Bibliothek, stattdessen kann die [`BME280.h` Bibliothek](https://github.com/finitespace/BME280) verwendet werden.
> * Diese Anleitung beschreibt die Möglichkeit den `ESP8266` mit der **Arduino IDE** zu programmieren. Es existieren jedoch viele weitere Möglichkeiten Software für den ESP8266 zu schreiben.
> * Der ESP8266 kann nur mit 3.3V betrieben werden. Der 3.3V Pin des Arduinos stellt jedoch nicht genügend Strom bereit, um den ESP zu betreiben, eine externe Stromversorgung ist nötig!

1. Alle ESP8266 Varianten: [Installation der Software](software_installation.md)
1. Alle ESP8266 Varianten: [Anpassen des senseBox:home Sketch](modify_sketch.md)
2. Am einfachsten: [Wemos D1 mit senseBox Shield](wemosd1.md)
3. [Alle anderen ESP8266 Varianten](other_models.md)

