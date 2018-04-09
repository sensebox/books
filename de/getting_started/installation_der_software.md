# Installation der Software

Zur Programmierung des Arduinos muss auf dem Computer eine spezielle Software und ein Treiber installiert werden. Je nach Betriebssystem müssen unterschiedliche Schritte zur Installation durchgeführt werden.

Die jeweils aktuellen Installationsdateien finden sich unter [http://arduino.cc/en/Main/Software](http://arduino.cc/en/Main/Software) zum Download.

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

## Arduino Bibliotheken installieren
Um die Sensoren und die Netzwerkkarte nutzen zu können, müssen noch ein paar Bibliotheken installiert werden. Ein zip-Archiv mit allen benötigten Bibliotheken findet ihr [hier](https://github.com/sensebox/senseBox_library/archive/master.zip).

Ladet das zip-Archiv herunter und öffnet die Arduino-Software. In der Arduino-Software muss dann über die Menüfolge Sketch --> Bibliothek einbinden --> .ZIP-Bibliothek einbinden… die gerade heruntergeladene Bibliothek in die Arduino-Bibliothekensammlung aufgenommen werden.
