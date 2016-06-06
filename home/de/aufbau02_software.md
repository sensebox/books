# Treiber und Softwareinstallation

Die senseBox:home gibt es mit verschiedenen Microkontroller Boards. Unterhalb rechts im Bild ist der Kontroller der neuen Version abgebildet (Genuino Uno), links im Bild das Board der alten Version (Wattuino Uno).

<img src="https://raw.githubusercontent.com/sensebox/resources/master/images/home/controller_boards.jpg" align="center" width="400"/>

> Bei den neuen Versionen unserer Bausätze welche das *Genuino Uno* Board enthalten, ist eine Treiberinstallation nicht mehr notwendig. Besitzer der Bausätze mit *Wattuino Uno* Board müssen diesen Schritt jedoch ausführen!

Bevor die senseBox aktiviert werden kann, müsst ihr Treiber sowie eine Software auf eurem Computer installieren. Außerdem ist es vor Inbetriebnahme der senseBox ratsam einen Testlauf durchzuführen, um zu überprüfen ob die Sensoren korrekt funktionieren und die Kommunikation mit dem Internet reibungslos läuft.

Falls etwas bei dem Testlauf schief geht, meldet euch am besten bei unserem Support unter [support@uni-muenster.de](mailto:support@uni-muenster.de).

## Arduino Software herunterladen
>Für einen reibungslosen Ablauf bitte Arduino 1.6.5 oder höher nutzen.

Das Mainboard der senseBox ist eine modifizierte Version des Arduino Uno Mikrocontrollers. Um ein Programm auf das Board zu laden, braucht ihr die integrierte Entwicklungsumgebung von Arduino, kurz Arduino IDE. Ladet die neueste Version als zip-Datei von der [Arduino Homepage](https://www.arduino.cc/en/main/software) herunter:

<img src="https://raw.githubusercontent.com/sensebox/resources/master/images/home/03_arduino-dl.png" align="center" width="400"/>

Arduino ist ein Open-Source Projekt und wird durch Spenden mit finanziert. Daher werdet ihr vor dem Download nach einer Spende gefragt, das könnt ihr überspringen indem ihr auf „just download“ klickt.

<img src="https://raw.githubusercontent.com/sensebox/resources/master/images/home/04_donate.png" align="center" width="400"/>

Legt auf eurer Festplatte einen neuen Ordner an und entpackt darin die Zip-Datei.

## Arduino Bibliotheken installieren
Um die Sensoren und die Netzwerkkarte nutzen zu können, müssen noch ein paar Bibliotheken installiert werden. Ein zip-Archiv mit allen benötigten Bibliotheken findet ihr [hier](https://github.com/sensebox/resources/raw/master/libraries/senseBox_Libraries.zip).

Ladet das zip-Archiv herunter und integriert nun die beiden Ordner „examples“ und „libraries“ aus dem Archiv in euren Arduino Ordner.
Wenn ihr gefragt werdet ob bestehende Dateien ersetzt werden sollen, folgt den Anweisungen unten auf der Seite.

<img src="https://raw.githubusercontent.com/sensebox/resources/master/images/home/06_copy.png" align="center" width="400"/>

Setzt nun, wie unten dargestellt, im ersten Dialogfeld den Haken unten und bestätigt mit „Ja“. Daraufhin öffnet sich ein neues Fenster, in dem ihr wieder den Haken setzt, und „Kopieren und ersetzen“ auswählt.

<img src="https://raw.githubusercontent.com/sensebox/resources/master/images/home/07_replace.png" align="center" width="400"/>

Die folgende Animation zeigt den Kopiervorgang noch einmal im Detail:

<img src="https://raw.githubusercontent.com/sensebox/resources/master/images/home/lib_install.gif" align="center" width="400"/>

## Treiber Installieren
>Die Installation der FTDI Teiber ist unter Unix-basierten Betriebssystemen sowie für den *Genuino Uno* nicht notwendig.

Als letzten Schritt für die Softwareinstallation müssen Windows-User einen Treiber installieren.
Dies sollte bei vorhandener Internetverbindung automatisch funktionieren (getestet mit Win7/Win8/Win10).
Dazu einfach den Microkontroller mit dem USB Kabel mit dem Rechner verbinden und abwarten bis die Treiber installiert sind.
Der Installationsvorgang kann dann bis zu 10 Minuten dauern.

Unten rechts in der Taskleiste wird dann entsprechende Meldung erscheinen, sobald die Installation beendet wurde:

<img src="https://raw.githubusercontent.com/sensebox/resources/master/images/home/10_tray.png" align="center" width="400"/>

## Sensoren testen
Weiter geht’s mit den folgenden Schritten:

1. Arduino Anwendung starten
    - Es kann sein, dass nach dem Start eine Meldung über neue Updates erscheint. Fall ihr die Version 1.6.5 oder höher installiert habt, könnt das einfach überspringen.
2. unter `Werkzeuge` → `Board` das `Arduino Uno` auswählen
3. unter `Werkzeuge` → `COM-Port` den entsprechenden Anschluss wählen
    - Falls mehrere Auswahlmöglichkeiten angezeigt werden, müsst ihr zuerst den richtigen COM-Port im Geräte Manager finden, oder alle Ports ausprobieren.

Ladet nun das Programm, um die Sensoren zu testen und übertragt es auf die Messstation:

1. in der Menüleiste `Datei` → `Beispiele` → `senseBox` → `_01_sensor_test` auswählen
2. das Programm über das **Pfeil** Icon auf den Mikrocontroller laden
3. warten bis das Programm übertragen wurde
4. den seriellen Monitor über das **Lupe** Icon öffnen

Ihr könnt durch experimentieren überprüfen, ob Temperatur, Luftfeuchtigkeit oder Beleuchtungsstärke sich verändern.
Der Luftdruck lässt sich nicht ohne weiteres beeinflussen. Er sollte grob, je nach Höhenlage und Wetterverhältnissen, zwischen 600 hPa und 1000 hPa liegen.
Die Intensität des UV-Lichts kann nur mit speziellen Lampen oder durch direkte Sonneneinstrahlung getestet werden.
In einem geschlossen Raum sollte keine bzw. nur minimale UV-Strahlung gemessen werden können.

<img src="https://raw.githubusercontent.com/sensebox/resources/master/images/home/11_serial1.png" align="center" width="400"/>

## Verbindung zur openSenseMap testen
Nun wird noch die Internetverbindung getestet:

1. den seriellen Monitor (Fenster mit den Messwerten) schließen
2. ein Netzwerkkabel von eurem Heimnetzwerk mit der senseBox verbinden
3. in Menüleiste `Datei` → `Beispiele` → `senseBox` → `_02_network_test` auswählen
4. das Programm über das **Pfeil** Icon auf den Mikrocontroller laden
5. den seriellen Monitor über das **Lupe** Icon starten

Wenn die Verbindung klappt, bekommt ihr eine entsprechende Meldung im seriellen Monitor angezeigt.

<img src="https://raw.githubusercontent.com/sensebox/resources/master/images/home/12_serial2.png" align="center" width="400"/>

> Damit die Datenübertragung funktioniert darf Port 8000 und 9000 nicht von eurem Router geblockt werden. Im Normalfall ist dieser Port aber freigegeben
