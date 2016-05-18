# Das Genuino Board

Der Genuino UNO ist ein Mikrocontroller-Board welches speziell für das Prototyping, also das schnelle Entwickeln von ersten funktionsfähigen Schaltungen, gedacht ist. Neben dem Genuino UNO gibt es noch eine Menge anderer Genuino Mikrocontroller-Boards, mit denen wir uns hier aber nicht weiter beschäftigen möchten. 
![alt text](https://raw.githubusercontent.com/wiki/sensebox/OER/Grundlagen/Genuino_Bauteile.png
 "Genuino Bauteile")
Oben siehst du die für den Anfang wichtigsten Bauteile des Genuino UNO auf die wir nun auch kurz eigehen werden. Alle anderen Bauteile sind natürlich ebenso wichtig, aber für uns erst einmal uninteressant.

##USB-Anschluss
Die selbst geschriebenen Programme müssen natürlich irgendwie auf den Genuino übertragen werden, dies funktioniert über den USB-Anschluss. Neben der Datenübertragung übernimmt der USB-Anschluss auch die Stromversorgung des Arduino, wenn keine andere Stromquelle angeschlossen ist.

##Stromanschluss
Wie der Name schon sagt, lässt sich der Genuino über diesen Anschluss mit Strom versorgen. Der Genuino hat eine Betriebsspannung von 5V, er sollte allerdings eine bei externer Stromversorgung eine Spannung von mindestens 6 bis höchstens 20V erhalten.

##Reset-Knopf
Durch das Drücken des Reset-Knopfes startet der Genuino neu. In der Praxis bedeutet dies, dass der zur Zeit gespeicherte Sketch neu gestartet wird. Der Reset-Knopf kann dann Abhilfe schaffen, wenn du dir nicht mehr sicher bist, ob dein Genuino noch ordnungsgemäß arbeitet.

##Digitale Ein- und Ausgänge
Die Ports des Genuino sind quasi seine Verbindung zur Außenwelt. Die digitalen lassen sich als Ein- und Ausgänge verwenden, d.h. man kann sie zum Anschließen von digitalen Sensoren und Aktoren verwenden. Zusätzlich bieten die digitalen Ports die Möglichkeit analoge Aktoren anzuschließen. Was die Unterschiede zwischen digitalen und analogen Signalen sind, wirst du im nächsten Kapitel erfahren.

##Analoge Eingänge
Genau wie die digitalen Ports dienen auch die analogen zur Kommunikation mit der Außenwelt. Sie können verwendet werden um analoge Sensoren anzuschließen und den Genuino sozusagen mit Daten zu "füttern". Der Genuino verfügt nicht über analoge Ausgänge, da diese Funktion von den digitalen Ein- und Ausgängen übernommen wird.

##Versorgungs-Ports
Die Versogungs-Ports sind weder digitale noch analoge Ein- bzw. Ausgänge. Sie dienen zur Versorgung von angeschlossenen Sensoren oder Aktoren mit Strom. Weiterhin lässt sich der Gernuino auch durch spezielle Ports mit Strom versorgen.

##Controller
Der Controller ist der Gehirn des Arduino, hier werden die einzelnen Prozesse ausgeführt.