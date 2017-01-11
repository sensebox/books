# Einen Rauchmelder mit dem Arduino verbinden

## Ziele der Station
In dieser Station wollen wir lernen, wie wir einen Rauchmelder mit dem Arduino verbinden.

***Achtung*** *Wir können keine Garantie übernehmen, dass der Rauchmelder dabei funktionstüchtig bleibt. Aus diesem Grund dürft ihr auf keinen Fall an einen Rauchmelder herumbasteln, der in Benutzung ist. Der veränderte Rauchmelder darf immer nur ein Zweitgerät sein!*

## Materialien
* Ethernetshield 
## Materialien die nicht in der senseBox enthalten sind
* Handelsüblich Rauchmelder (Wir verwendeten einen RM125)

Für dieses Projekt benötigt einige Werkzeuge. Unter anderem ist ein Lötkolben sehr hilfreich. 

## Grundlagen
Wenn ihr das Gehäuse des Rauchmelders öffnet, könnt ihr euch die Platine und die einzelnen Bauteile genauer ansehen. 
<img src="https://raw.githubusercontent.com/sensebox/resources/master/images/edu/rauchmelder1.jpg?raw=true" width="500"/>&nbsp; 
1. Das ist ein Piezo, ähnlich dem im SenseBox-Set
2. Rauchsensor.
3. Prüftaster
4. Potenziometer

<img src="https://raw.githubusercontent.com/sensebox/resources/master/images/edu/rauchmelder2.jpg?raw=true" width="500"/>&nbsp; 

Wenn wir den Piezo entfernen, wird der Steuerchip sichtbar. 
5. Steuerchip (MC145012)

## Aufbau
<img src="https://raw.githubusercontent.com/sensebox/resources/master/images/edu/rauchmelder3.jpg?raw=true" width="500"/>

Wenn ihr euch die Unterseite der Platine anschaut, könnt ihr sehen, das der Pin 7 (6) des Steuerchips nirgendwo angeschlossen ist. Diesen Pin werden wir verwenden, um den Rauchmelder mit unserem Arduino zu verbinden. 

Praktischer weise funktioniert sowohl unser Arduino, als auch der Rauchmelder mit einer Betriebsspannung von 9 V. Also können wir unser Netzwerkkabel aus dem Arduino-Set nutzen um beide Geräte zu betreiben. 

**Schritt 1** Zunächst müssen wir ein Kabel wie in der dritten Grafik zu sehen an Pin 7 des Steuerchips anlöten. Dabei müsst ihr aufpassen keinen Kurzschluss zu verursachen. &nbsp; 

**Schritt 2** Nun muss der Minuspol mit dem des Arduino verbunden werden. Dazu schaut euch an, wo der Minuspol der Batterie mit der Platine verbunden ist (7). 
(Dieser Schritt ist überflüssig, falls ihr beide Geräte über die selbe Stromquelle versorgt.)&nbsp; 

Nun kann das an Pin 7 des Chips angelötete Kabel mit Pin 8 des Arduino verbunden werden. Im Fall getrennter Stromversorgung muss der Minuspol mit einem GND-Pin verbunden werden. 

Registriert der Rauchmelder Rauch, so wird neben dem Piezo auch Pin 7 von `LOW` auf `HIGH` gestellt. 

## Aufgabe 1
Schreibe ein Programm, mit dem du das Signal des Rauchmelders über den seriellen Monitor ausgibst. Löse den Rauchmelder über Prüftaster aus (einige Sekunden gedrückt halten). Wenn dich der Piezo stört, kannst du ihn auch einfach abnehmen. 
