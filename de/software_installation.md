# Treiber und Softwareinstallation
Bevor die senseBox aktiviert werden kann, musst du Treiber sowie eine Software auf deinem Computer installieren. Außerdem ist es vor Inbetriebnahme der senseBox ratsam einen Testlauf durchzuführen, um zu überprüfen ob die Sensoren korrekt funktionieren und die Kommunikation mit dem Internet reibungslos läuft.

Falls etwas bei dem Testlauf schief geht, melde dich am besten [per Mail](mailto:support@sensebox.de) bei unserem Support.

## Arduino Software herunterladen
> Für einen reibungslosen Ablauf bitte Arduino 1.8.3 oder höher nutzen.

Das Mainboard der senseBox ist eine modifizierte Version des Arduino Uno Mikrocontrollers. Um ein Programm auf das Board zu laden, brauchst du die integrierte Entwicklungsumgebung von Arduino, kurz *Arduino IDE*. Lade die neueste Version als zip-Datei von der [Arduino Homepage](https://www.arduino.cc/en/main/software) herunter:

<img src="https://raw.githubusercontent.com/sensebox/resources/master/images/home/03_arduino-dl.png" align="center" width="400"/>

Arduino ist ein Open-Source Projekt und wird durch Spenden finanziert. Daher wirst du vor dem Download nach einer Spende gefragt; das kannst du überspringen indem du auf „just download“ klickst.

<img src="https://raw.githubusercontent.com/sensebox/resources/master/images/home/04_donate.png" align="center" width="400"/>

Lege auf deiner Festplatte einen neuen Ordner an und entpacke darin die Zip-Datei.
Durch starten der Datei `arduino.exe` kann die IDE gestartet werden.

## Installation der IDE unter Linux
Linux-Nutzer können die Linuxvariante herunterladen und entpacken. Das enthaltene `install.sh`-Skript legt automatisch eine Desktopverknüpfung an.
Am schnellsten geht dies über die folgenden Terminal-Befehle:

```bash
tar -xvf arduino-1.8.3-linux64.tar.xz
cd arduino-1.8.3
./install.sh
```

Um den Arduino programmieren zu können, sind unter Ubuntu 14 & 16 zusätzliche Rechte notwendig.
Diese können für den aktuellen Nutzer mit den folgenden Befehlen eingerichtet werden (benötigt Admin-Rechte):
Führe `udevadm monitor --udev` aus und schließe den Arduino per USB an, um die Device-ID zu bestimmen.
Der angegebene Bezeichnung am Ende der Ausgabe (zB. `ttyUSB0`) ist die Device-ID.
Beende `udevadm` per `ctrl+C`, und führe noch die folgenden Befehle aus, wobei die herausgefundene Device-ID eingesetzt werden muss:

```bash
sudo usermod -a -G dialout $(whoami)
sudo chmod a+rw /dev/<device-id>
```

Nach einem Logout und erneutem Login sollte der Arduino aus der Arduino IDE programmierbar sein!

## Arduino Bibliotheken installieren
Um die Sensoren und die Netzwerkkarte nutzen zu können, müssen noch ein paar Bibliotheken installiert werden. Ein zip-Archiv mit allen benötigten Bibliotheken findest du [hier](https://github.com/sensebox/resources/raw/master/libraries/senseBox_Libraries.zip).

Lade dieses zip-Archiv herunter und integriere nun die beiden Ordner `examples` und `libraries` aus dem Archiv in deinen Arduino Ordner.
Wenn ihr gefragt werdet ob bestehende Dateien ersetzt werden sollen, folge den Anweisungen unten auf der Seite.

<img src="https://raw.githubusercontent.com/sensebox/resources/master/images/home/06_copy.png" align="center" width="400"/>

Setze nun wie unten dargestellt im ersten Dialogfeld den Haken unten und bestätigt mit „Ja“. Daraufhin öffnet sich ein neues Fenster, in dem du wieder den Haken setzt, und „Kopieren und ersetzen“ auswählst.

<img src="https://raw.githubusercontent.com/sensebox/resources/master/images/home/07_replace.png" align="center" width="400"/>

Das folgende Video zeigt den Kopiervorgang noch einmal im Detail:

{%youtube%}j-hdRJp2o4k{%endyoutube%}

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
