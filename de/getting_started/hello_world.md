# Hello World

## Ziel der Station
In dieser Station lernst du den Arduino Uno Mikrokontroller kennen und startest mit der Programmierung eines ersten simplen Programmes. Hierzu lernst du den generellen Aufbau des Arduino-Programmcodes, das Arduino Programm (IDE) und die ersten Kontrollstrukturen kennen.

## Grundlagen
Bevor du loslegen kannst dein erstes eigenes Programm zu schreiben, musst du dir das Ardublockly Programm - die sogenannte Entwicklungsumgebung (engl. IDE) - anschauen.
Wenn du Ardublockly öffnest siehst du direkt zwei große weiße Felder. In dem linken Feld wirst du dein Programm zusammenstellen, während dir im rechten Feld dein zusammengestellter Code in Textform angezeig wird.
Am rechten Rand siehst du, grau hinterlegt, die verschiedenen Blöcke aus denen du dein Programm zusammensetzt. Diese kannst du ganz einfach in dein "Programmierfeld" ziehen.


![Oberflaeche_komm](https://raw.githubusercontent.com/sensebox/resources/master/images/blockly/Oberflaeche_komm.PNG)


## Aufbau
Achte beim Aufbau darauf, dass das längere Beinchen der LED immer mit dem Pluspol verbunden werden muss, also nicht mit dem GND-Port des Arduino.

![Aufbau](https://raw.githubusercontent.com/sensebox/resources/master/images/edu/aufbau_led.png)

## Programmierung
Jetzt endlich kannst du mit deinem ersten Arduino Programm (auch Sketch genannt) starten. Um die angeschlossene LED zum leuchten zu bringen, brauchen wir nur einen einzigen Block. Ziehe also den Block für die LED aus der Kategorie "senseBox Grundlagen" in dein Programmierfeld. Wie du bestimmt siehst kannst du in dem Block zwei Werte ändern: Zum einen den Pin an dem die LED angeschlossen ist und zum anderen ob die LED ein oder ausgeschaltet werden soll.
Wähle also den richtigen Pin aus und stelle den Status der LED auf Ein.

Dein Sketch sollte nun wie folgt aussehen:
![LED](https://raw.githubusercontent.com/sensebox/resources/master/images/blockly/LED.PNG)

## Übertragen und Testen
Dein Sketch sollte nun fertig sein. Stecke deinen Arduino mit dem USB-Kabel an deinen Computer und lade mit dem orangen "Lade Sketch auf den Arduino-Knopf" oben rechts an deinem Programmierfeld auf den Arduino.
![LED](https://raw.githubusercontent.com/sensebox/resources/master/images/blockly/Upload.png)

## Aufgaben
1. Programmiere den Arduino so, dass die LED blinkt. Dazu kannst du zusammengesetztes Programm weiterentwickeln. Am Aufbau musst du dazu nichts verändern.

    `TIPP`: Mit dem Block "Warte XX Millisekunden" kannst du deinem Programm eine Pause verordnen. Die Zahl, welche du einsetzt, gibt dabei die Länge der Pause in Millisekunden an. 1000 entspricht also 1 Sekunde.
