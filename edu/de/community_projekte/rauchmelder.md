# Einen Rauchmelder mit dem Arduino verbinden

## Ziele der Station
In dieser Station lernen wir, wie wir einen Rauchmelder mit dem Arduino verbinden, sodass wir auslesen können, wann Alarm geschlagen wird.
Dies soll später auch über ein Netzwerk möglich sein.

> ***Achtung:*** *Wir können keine Garantie übernehmen, dass der Rauchmelder dabei funktionstüchtig bleibt. Aus diesem Grund dürft ihr auf keinen Fall an einen Rauchmelder herumbasteln, der in Benutzung ist. Der veränderte Rauchmelder darf immer nur ein Zweitgerät sein!*

## Materialien
* Ethernetshield

## Materialien die nicht in der senseBox enthalten sind
* handelsüblicher Rauchmelder (wir verwenden einen RM125, aber die meisten Modelle sind geeignet)
* Lötkolben

## Grundlagen
Wenn ihr das Gehäuse des Rauchmelders öffnet, könnt ihr euch die Platine und die einzelnen Bauteile genauer ansehen.
Wenn zusätzlich der Piezo entfernt wird, kommt auch der Controller des Rauchmelders zutage (s. zweite Abbildung).

<img src="https://raw.githubusercontent.com/sensebox/resources/master/images/edu/rauchmelder1.jpg?raw=true"width="500"/>

<img src="https://raw.githubusercontent.com/sensebox/resources/master/images/edu/rauchmelder2.jpg?raw=true"width="500"/>

1. Piezo, ähnlich dem im senseBox Set
2. Rauchsensor
3. Prüftaster
4. Potentiometer
5. Steuerchip (MC145012)

## Aufbau
<img src="https://raw.githubusercontent.com/sensebox/resources/master/images/edu/rauchmelder3.jpg?raw=true" width="500"/>


### Signalkabel verlöten
Wenn wir uns die Unterseite der Platine anschauen, sehen wir, dass der Pin 7 (6 im Foto) des Steuerchips nirgendwo angeschlossen ist.
Über diesen Pin wird eine Spannung ausgegeben, wenn der Rauchmelder Alarm schlägt.
Diesen Pin werden wir verwenden, um den Rauchmelder mit unserem Arduino zu verbinden.
Hierzu verlöten wir mit etwas Lötzinn ein Kabel an diesen Pin. Dabei müsst ihr aufpassen keinen Kurzschluss zu verursachen.

### Stromversorgung
Grundsätzlich gibt es zwei Möglichkeiten der Stromversorgung.

1. Arduino und Rauchmelder über unterschiedliche Stromquellen versorgen.
Hierbei kann der Rauchmelder weiter mit einem 9V Block versorgt werden. Der Arduino wird dann wie üblich durch ein Netzteil mit Spannung versorgt.
In diesem Fall muss der Rauchmelder mit dem Arduino geerdet werden. Dazu muss der Minuspol des Rauchmelders mit dem des Arduino verbunden werden. Schaut euch dazu an, wo der Minuspol der Batterie mit der Platine verbunden ist (7 im Foto), und lötet ein kabel an diese Stelle an.

2. Arduino und Rauchmelder über ein Netzteil versorgen.
Praktischerweise kann sowohl der Arduino, als auch der Rauchmelder mit einer Betriebsspannung von 9 V versorgt werden. Daher können wir das Netzteil der senseBox nutzen, um beide Komponenten zu betreiben. Ein Nachteil ist, dass das Kabel des Netzteils dabei zerschnitten wird.
Schneidet zunächst den Batterieanschluss des Rauchmelders ab und isoliert die beiden Kabel ab. Nun zerschneidet das Kabel des Netzteils ca. 10 cm unterhalb des DC-Steckers. Lötet nun die Stromanschlüsse des Rauchmelders  zwischen Netzteil und DC-Stecker. Achtet darauf das Plus und Minuspol nicht zu vertauschen.
Verwendet dazu ein Strommessgerät.

### Verbindung
Nun kann das an Pin 7 des Chips angelötete Kabel mit Pin 8 des Arduino verbunden werden.
Im Fall getrennter Stromversorgung muss der Minuspol mit einem GND-Pin verbunden werden.

Registriert der Rauchmelder Rauch, so wird neben dem Piezo auch Pin 7 von `LOW` auf `HIGH` gestellt.

## Aufgabe 1
Schreibt ein Programm, mit dem das Signal des Rauchmelders über den seriellen Monitor und eine rote LED ausgegeben wird.
Löse zum testen den Rauchmelder über den Prüftaster aus (einige Sekunden gedrückt halten).
Wenn der Lärm des Piezo stört, könnt ihr ihn auch einfach abnehmen.

## Aufgabe 2
Nun wollen wir aus dem Netzwerk auf Daten des Rauchmelders Zugreifen. Schau dir im Projekt [Kleiner Webserver](../projekte/webserver.md) an, wie man aus dem Arduino einen Server macht. Füge der HTML Tabelle eine Zeile für den Rauchmelder hinzu, in der man seinen Status abfragen kann.
