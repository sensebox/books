# Treiber und Softwareinstallation
Bevor die senseBox aktiviert werden kann, musst du Treiber sowie eine Software auf deinem Computer installieren. Außerdem ist es vor Inbetriebnahme der senseBox ratsam einen Testlauf durchzuführen, um zu überprüfen ob die Sensoren korrekt funktionieren und die Kommunikation mit dem Internet reibungslos läuft.

Falls etwas bei dem Testlauf schief geht, melde dich am besten [per Mail](mailto:support@uni-muenster.de) bei unserem Support.

## Arduino Software herunterladen
> Für einen reibungslosen Ablauf bitte Arduino 1.6.5 oder höher nutzen.

Das Mainboard der senseBox ist eine modifizierte Version des Arduino Uno Mikrocontrollers. Um ein Programm auf das Board zu laden, brauchst du die integrierte Entwicklungsumgebung von Arduino, kurz *Arduino IDE*. Lade die neueste Version als zip-Datei von der [Arduino Homepage](https://www.arduino.cc/en/main/software) herunter:

<img src="https://raw.githubusercontent.com/sensebox/resources/master/images/home/03_arduino-dl.png" align="center" width="400"/>

Arduino ist ein Open-Source Projekt und wird durch Spenden finanziert. Daher wirst du vor dem Download nach einer Spende gefragt; das kannst du überspringen indem du auf „just download“ klickst.

<img src="https://raw.githubusercontent.com/sensebox/resources/master/images/home/04_donate.png" align="center" width="400"/>

Legt auf eurer Festplatte einen neuen Ordner an und entpackt darin die Zip-Datei.

## Arduino Bibliotheken installieren
Um die Sensoren und die Netzwerkkarte nutzen zu können, müssen noch ein paar Bibliotheken installiert werden. Ein zip-Archiv mit allen benötigten Bibliotheken findest du [hier](https://github.com/sensebox/resources/raw/master/libraries/senseBox_Libraries.zip).

Lade dieses zip-Archiv herunter und integriere nun die beiden Ordner `examples` und `libraries` aus dem Archiv in deinen Arduino Ordner.
Wenn ihr gefragt werdet ob bestehende Dateien ersetzt werden sollen, folge den Anweisungen unten auf der Seite.

<img src="https://raw.githubusercontent.com/sensebox/resources/master/images/home/06_copy.png" align="center" width="400"/>

Setze nun wie unten dargestellt im ersten Dialogfeld den Haken unten und bestätigt mit „Ja“. Daraufhin öffnet sich ein neues Fenster, in dem du wieder den Haken setzt, und „Kopieren und ersetzen“ auswählst.

<img src="https://raw.githubusercontent.com/sensebox/resources/master/images/home/07_replace.png" align="center" width="400"/>

Das folgende Video zeigt den Kopiervorgang noch einmal im Detail:

{%youtube%}j-hdRJp2o4k{%endyoutube%}

## Treiber installieren
Als letzten Schritt für die Softwareinstallation müssen Windows-User einen Treiber installieren.
Die senseBox:home gibt es mit verschiedenen Microkontroller Boards. Unten rechts im Bild ist der Kontroller der neuen Version abgebildet (Genuino Uno), links im Bild das Board der alten Version (Wattuino Uno).
Bei den neuen Versionen unserer Bausätze welche das *Genuino Uno* Board enthalten, ist eine Treiberinstallation **nicht** mehr notwendig. Besitzer der Bausätze mit *Wattuino Uno* Board müssen diesen Schritt jedoch ausführen!

<img src="https://raw.githubusercontent.com/sensebox/resources/master/images/home/controller_boards.jpg" align="center" width="400"/>

Die Treiberinstallation sollte bei vorhandener Internetverbindung automatisch funktionieren (getestet mit Win7/Win8/Win10).
Dazu einfach den Microkontroller mit dem USB Kabel mit dem Rechner verbinden und abwarten bis die Treiber installiert sind.
Dieser Vorgang kann dann bis zu 10 Minuten dauern.
Unten rechts in der Taskleiste wird dann entsprechende Meldung erscheinen, sobald die Installation beendet wurde:

<img src="https://raw.githubusercontent.com/sensebox/resources/master/images/home/10_tray.png" align="center" width="400"/>

## Sensoren testen
Die Sensoren der senseBox:home können nun auf funktionstüchtigkeit und getestet werden.
Hierzu gibt es einen Sketch, welcher mit den zuvor Arduino-Bibliotheken installiert wurde.
Vorraussetzung für den test ist natürlich, dass die Sensoren mit dem Arduino verbunden wurden ;)

1. Arduino Anwendung starten
    - Es kann sein, dass nach dem Start eine Meldung über neue Updates erscheint. Fall du die Version 1.6.5 oder höher installiert hast, kannst du dies überspringen.
2. unter `Werkzeuge` → `Board` das `Arduino Uno` auswählen
3. unter `Werkzeuge` → `COM-Port` den entsprechenden Anschluss wählen
    - Falls mehrere Auswahlmöglichkeiten angezeigt werden, musst du zuerst den richtigen COM-Port im Geräte Manager finden, oder alle Ports ausprobieren.

Ladet nun das Programm, um die Sensoren zu testen und übertragt es auf die Messstation:

1. in der Menüleiste `Datei` → `Beispiele` → `senseBox` → `_01_sensor_test` auswählen
2. das Programm über das **Pfeil** Icon auf den Mikrocontroller laden
3. warten bis das Programm übertragen wurde
4. den seriellen Monitor über das **Lupe** Icon öffnen

<img src="https://raw.githubusercontent.com/sensebox/resources/master/images/home/11_serial1.png" align="center" width="400"/>

Du kannst durch experimente prüfen, ob sich die gemessene Temperatur, Luftfeuchtigkeit oder Beleuchtungsstärke verändern.
Der Luftdruck lässt sich nicht ohne weiteres beeinflussen. Er sollte grob, je nach Höhenlage und Wetterverhältnissen, zwischen 600 hPa und 1000 hPa liegen.
Die Intensität des UV-Lichts kann nur mit speziellen Lampen oder durch direkte Sonneneinstrahlung getestet werden.
In einem geschlossen Raum sollte keine bzw. nur minimale UV-Strahlung gemessen werden können.

## Verbindung zur openSenseMap testen
Nach dem selben Schema kann noch die Internetverbindung der senseBox:home getestet werden:

1. den seriellen Monitor (Fenster mit den Messwerten) schließen
2. ein Netzwerkkabel von eurem Heimnetzwerk mit der senseBox verbinden
3. in Menüleiste `Datei` → `Beispiele` → `senseBox` → `_02_network_test` auswählen
4. das Programm über das **Pfeil** Icon auf den Mikrocontroller laden
5. den seriellen Monitor über das **Lupe** Icon starten

Wenn die Verbindung klappt, bekommst du eine entsprechende Meldung im seriellen Monitor angezeigt.

<img src="https://raw.githubusercontent.com/sensebox/resources/master/images/home/12_serial2.png" align="center" width="400"/>

> Damit die Datenübertragung funktioniert darf Port 8000 nicht von deinem Router geblockt werden. Im Normalfall ist dieser Port aber freigegeben.
