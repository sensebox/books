# Installation der Software

Zur Programmierung des Arduinos muss auf dem Computer eine spezielle Software und ein Treiber installiert werden. Je nach Betriebssystem müssen unterschiedliche Schritte zur Installation durchgeführt werden.

Die jeweils aktuellen Installationsdateien finden sich [hier](http://arduino.cc/en/Main/Software) zum Download.

## Anleitung zur Installation der Software/Treiber unter **Windows**

Nach dem Download müssen die Dateien nur ausgeführt und den Anweisungen gefolgt werden:

### Installation der Treiber und Windows XP/Vista/7

Durch die Installation der Arduino-Software wurden bereits der Treiber auf dem Computer installiert. Allerdings kann Windows die Treiber oftmals nicht automatisch dem Arduino zuordnen, sodass wir diesen Schritt manuell durchführen müssen.
Dazu sind folgende Schritte nötig:

1. Schließt den Arduino Uno über ein USB Kabel an den Computer an.

2. Der Computer wird ein neues Gerät erkennen und versuchen automatisch einen Treiber zu installieren. Diese automatische Installation ist meistens nicht erfolgreich. Wir wollen den Treiber manuell installieren.

3. Öffnet dazu die Systemsteuerung (Start --> Systemsteuerung)

4. Anschließend über System und Sicherheit --> System --> in den Geräte-Manager

5. Im Geräte-Manager sucht nach dem Arduino Uno oder unbekanntes Gerät. Mit der rechten Maustaste auf das Gerät und Treibersoftware aktualisieren auswählen.

6. Anschließend die Option Auf dem Computer nach einer Treibersoftware suchen und den Computer nach dem Ordner der Arduino-Software durchsuchen. In dem Arduino-Software Ordner liegt ein weitere Ordner mit dem Namen Driver. Wählt diesen Ordner aus und bestätigt die Auswahl.

7. Windows wird die Treiberinstallation vervollständigen und der Arduino-Uno sollte funktionieren.

## Installation der Software/Treiber unter **Mac OS X**

Nach dem Download (s.o.) muss Datenabbild eingebunden werden und die Arduino IDE kann in den Programmordner kopiert werden. Eine Treiberinstallation unter Mac OS X ist nicht nötig.

## Installation der Software unter Linux

Nach dem Download (s.o.) muss das heruntergeladene `.tar.xz`-Archiv entpackt werden.
Darin liegt ein Installationskript `install.sh`, welches am einfachsten in einem Terminal über den Befehl

```
cd <pfad zum entpackten ordner>
./install.sh
```

ausgeführt wird. Alternativ ist es unter einzelnen Desktopumgebungen möglich, das Skript über einen Doppelklick im Dateimanager zu starten.

Anschließend sollte eine Verknüpfung in der jeweiligen Desktopumgebung angelegt worden sein, über welche die IDE zu starten ist.

## Arduino Bibliotheken installieren
Um die Sensoren und die Netzwerkkarte nutzen zu können, müssen noch ein paar Bibliotheken installiert werden. Ein zip-Archiv mit allen benötigten Bibliotheken findet ihr [hier](https://github.com/sensebox/resources/raw/master/libraries/senseBox_Libraries.zip).

Ladet das zip-Archiv herunter und integriert nun die beiden Ordner „examples“ und „libraries“ aus dem Archiv in euren Arduino Ordner.
Wenn ihr gefragt werdet ob bestehende Dateien ersetzt werden sollen, folgt den Anweisungen unten auf der Seite.

<img src="https://raw.githubusercontent.com/sensebox/resources/master/images/home/06_copy.png" align="center" width="400"/>

Setzt nun, wie unten dargestellt, im ersten Dialogfeld den Haken unten und bestätigt mit „Ja“. Daraufhin öffnet sich ein neues Fenster, in dem ihr wieder den Haken setzt, und „Kopieren und ersetzen“ auswählt.

<img src="https://raw.githubusercontent.com/sensebox/resources/master/images/home/07_replace.png" align="center" width="400"/>

Das folgende Video zeigt den Kopiervorgang noch einmal im Detail:

{%youtube%}j-hdRJp2o4k{%endyoutube%}
