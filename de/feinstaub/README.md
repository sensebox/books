# Feinstaub-Erweiterung für die senseBox:home

In dieser Anleitung wird das Anschließen, Aufbauen und Registrieren der Feinstaub-Erweiterung für die senseBox:home beschrieben. Die Feinstaub-Erweiterung ergänzt die senseBox:home um die Möglichkeit, Feinstaubmessungen durchzuführen. Dazu wird ein SDS011 Sensor von Inovafit genutzt, welcher die Feinstaubkonzentration in den Messgrößen PM10 (Partikel kleiner 10 Mikrometer) und PM2.5 (Partikel kleiner 2,5 Mikrometer) ermöglicht. Dieser Sensor ist mit einem kleinen Ventilator ausgestattet, um Luft anzusaugen. In seinem Inneren befindet sich ein Laser, der zusammen mit einer Photodiode die Anzahl der Partikel misst. Die Ergebnisse der Messungen werden in µg/m³ (Mikrogramm pro Kubikmeter) angegeben. Weitere Informationen findet ihr auf [dieser Seite](http://aqicn.org/sensor/sds011/de/).

### Benötigte Bauteile:
- SDS011 Feinstaub Sensor
- Verbindungskabel
- Stück Teflonschlauch Ø = 6mm innen und Ø = 8mm außen
- Gehäuse
- Kabelverschraubung 16mm

[![Bild benötigte Teile](https://raw.githubusercontent.com/sensebox/resources/master/images/feinstaub-erweiterung/01overview_small.jpg)](https://raw.githubusercontent.com/sensebox/resources/master/images/feinstaub-erweiterung/01overview.jpg)

### Registrierung auf der openSenseMap

- **Option a: Bestehende senseBox:home** Falls ihr eure senseBox:home mit einem Feinstaubsensor erweitern wollt, müsst ihr auf der [openSenseMap](https://opensensemap.org/) die Einstellungen eurer Station bearbeiten. Dies ist nach dem Login im Dashboard unter *senseBox verwalten* möglich.
Nun könnt ihr unter dem Reiter *Erweiterungen* die Feinstaub-Erweiterung aktivieren.
Nachdem die Einstellungen gespeichert wurden (oben rechts), erhaltet ihr einen aktualisierten Sketch per Email. Dieser muss anschliessend auf die senseBox hochgeladen werden!

- **Option b: Neue senseBox:home mit Feinstaub-Erweiterung** Falls ihr eine neue senseBox:home inklusive Feinstaub-Erweiterung registrieren wollt, aktiviert bei der Registrierung auf der [openSenseMap](https://opensensemap.org/account/register) unter *senseBox:Erweiterungen* die Feinstaub-Erweiterung. Ihr bekommt darauf hin eine Mail mit einem angepassten Sketch zugeschickt.

### Aktualisierung der Arduino Software

Um den Sensor korrekt auszulesen muss der erhaltene Arduino-Sketch auf die senseBox geladen werden.

> **Hinweis:** *Zur Kommunikation zwischen dem SDS011 und dem Arduino/Genuino Mikrokontroller wird eine einfache serielle Datenverbindung aufgebaut. Diese serielle Schnittstelle wird auch genutzt, um über die USB Verbindung mit dem Computer zu kommunizieren. Daher dürfen die digitalen Pins 0 (RX) und 1 (TX), bzw. der UART Steckplatz auf dem senseBox Shield **nicht verbunden** sein, wenn ein Sketch über die Arduino IDE auf das Arduino/Genuino Board geladen wird!*

1. Installiert zunächst die Bibliothek für den Feinstaubsensor. Ladet dazu [dieses zip-Archiv](https://github.com/sensebox/SDS011-select-serial/archive/master.zip) herunter und kopiert den Inhalt in euer arduino/libraries Verzeichnis.
2. Startet nun die Ardunio IDE neu und öffnet den soeben erhaltenen Sketch.
3. Passt den Sketch für eure Netzwerkverbindung an. Dazu gehört das Eintragen von Wifi Name und Passwort oder statische IP.
4. Trennt die Kabelverbindung zwischen dem Feinstaubsensor und dem Arduino/Genuino Board und übertragt den Sketch auf das Board. Als letztes schließt ihr das Kabel des Sensors wieder an.


### Anschluss Feinstaubsensor

Dieser Abschnitt kann übersprungen werden, falls das passende Kabel Feinstaubsensor ↔ senseBox Shield vorliegt.

[![Bild Anschluss passendes Kabel](https://raw.githubusercontent.com/sensebox/resources/master/images/feinstaub-erweiterung/02verkabelung1_small.jpg)](https://raw.githubusercontent.com/sensebox/resources/master/images/feinstaub-erweiterung/02verkabelung1.jpg)

Der Feinstaubsensor muss mit vier Kabeln mit dem Arduino verbunden werden. Dafür können ganz normale Dupont Kabel mit jeweils einem Stecker und einer Buchse verwendet werden.

[![Bild Anschluss passendes Kabel](https://raw.githubusercontent.com/sensebox/resources/master/images/feinstaub-erweiterung/03verkabelung2_small.jpg)](https://raw.githubusercontent.com/sensebox/resources/master/images/feinstaub-erweiterung/03verkabelung2.jpg)

Die 5 Volt (5V) und GND Pins des SDS011 werden mit den gleichen Pins am Arduino verbunden. Danach werden die Pins TXD und RXD gekreuzt (RX ↔ TX) an die Pins 0 (RX) und 1 (TX) am Arduino angeschlossen.
![Bild Kabel](https://raw.githubusercontent.com/sensebox/resources/master/images/feinstaub-erweiterung/035verkabelung.png)

### Gehäuse
Als Gehäuse wird hier eine einfache Verteilerdose verwendet. Es müssen jeweils Löcher für den Ansaugschlauch (8mm), Luftauslass (16mm) und Kabelverschraubung (16mm) gebohrt werden.

[![Bild Gehäuse](https://raw.githubusercontent.com/sensebox/resources/master/images/feinstaub-erweiterung/04bohrung_small.jpg)](https://raw.githubusercontent.com/sensebox/resources/master/images/feinstaub-erweiterung/04bohrung.jpg)

Jetzt legt ihr den Sensor in das Gehäuse und schließt den Teflonschlauch und das Kabel an. Am Ende sollte alles so aussehen wie in dem unteren Bild:

[![Bild Final](https://raw.githubusercontent.com/sensebox/resources/master/images/feinstaub-erweiterung/05ready_small.jpg)](https://raw.githubusercontent.com/sensebox/resources/master/images/feinstaub-erweiterung/05ready.jpg)

Viel Spaß beim Messen und Forschen!

