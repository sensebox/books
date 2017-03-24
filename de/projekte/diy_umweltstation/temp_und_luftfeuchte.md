# DIY - Temperatur und Luftfeuchtigkeit
Damit wir täglich den Wetterbericht im Internet, im Fernsehen, in der Zeitung oder in Apps sehen können, werden nicht nur Satellitendaten ausgewertet. Auch Daten von Wetterstationen am Boden spielen eine wichtige Rolle bei der Vorhersage. Aber wie funktioniert die Messung und Darstellung von Temperatur- und Luftfeuchtigkeitswerten?

## Voraussetzungen
- [Die Verwendung von Software-Bibliotheken](../../grundlagen/software_libraries.md)
- [Der serielle Datenbus I²C](../../grundlagen/der_serielle_datenbus.md)
- [Der serielle Monitor](../../grundlagen/der_serielle_monitor.md)

## Ziele der Station
In dieser Station beschäftigen wir uns mit dem Temperatur- und Luftfeuchtigkeitssensor der senseBox, dem HDC1008.

## Materialien
- kombinierter Temperatur und Luftfeuchtigkeitssensor `HDC1008`

## Grundlagen
Der `HDC1008`, aus der Serie HDX100X von Texas Instruments, ist ein kombinierter Temperatur- und Luftfeuchtigkeitssensor. Der Sensor kann die Luftfeuchtigkeit von 0% bis 100%, sowie die Temperatur von -40°C bis 125°C bei einer Genauigkeit von ±4% bzw. von ±0,2°C messen.

Die Kommunikation des Sensors mit dem Mikrokontroller läuft über den [seriellen Datenbus I²C](../../grundlagen/der_serielle_datenbus.md). Anders als bei einfachen digitalen oder analogen Eingängen, können an den Datenbus mehrere I²C-Geräte (wie z.B. Sensoren oder Displays) parallel geschaltet werden. Jedes Gerät hat dabei eine eindeutige Kennung, damit der Datenbus jedes Einzelne davon zuordnen und separat ansprechen kann.

## Aufbau
Steckt den Schaltkreis wie ihr ihn unten in der Grafik seht.
<img src="https://raw.githubusercontent.com/sensebox/resources/master/images/edu/aufbau_station_5.png" width="500"/>

## Programmierung
Bevor wir mit der Programmierung starten können, müssen wir die `HDC100X.h` Bibliothek installieren.
Dies solltest du eigentlich bereits mit den [ersten Schritten](../../getting_started/installation_der_software.md) getan haben, falls nicht kannst du im Kapitel zu [Softwarebibliotheken](../../grundlagen/software_libraries.md) nachlesen.

Um alle zusätzlichen Funktionen der Bibliothek nutzen zu können, muss sie an oberster Stelle in eurem Programm mit der Direktive `#include` eingebunden werden. In unserem Fall brauchen wir neben der HDC100X Bibliothek noch die Wire-Bibliothek (Standarderweiterung für I²C Geräte), also steht in den ersten beiden Zeilen:
```arduino
#include <Wire.h>
#include <HDC100X.h>
```
> ***Hinweis:*** *Anders als bei regulären Befehlen, steht am Ende der include Direktive **kein** Semikolon.*

In allen darauf folgenden Zeilen können nun die Funktionen der Bibliotheken genutzt werden.

Als erstes muss eine Verbindung zur Sensoradresse angegeben werden. Bei diesem Sensor lautet die Adresse `0x43` (vgl. [Datenblatt](https://github.com/sensebox/resources/raw/master/datasheets/datasheet_hdc1008.pdf)).
```arduino
HDC100X hdc(0x43);
```
Durch diesen Befehl hast du nun eine Instanz `hdc` des Sensors vom Typ `HDC100X` angelegt. Jetzt muss dieser Sensor in der `setup()`-Funktion wie folgt gestartet werden:
Die Argumente der `begin()`-Funktion geben dabei an, dass Temperatur und Luftfeuchte gemessen werden, jeweils in einer Auflösung von 14 Bit, und dass das Heizelement des Sensors deaktiviert werden soll.
```arduino
hdc.begin(HDC100X_TEMP_HUMI, HDC100X_14BIT, DISABLE);
```

Nachdem du den Sensor, wie oben beschrieben, initialisiert hast, kannst du zwei Befehle in der `loop()`-Funktion nutzen, um einen Temperatur- bzw. Feuchtigkeitswert ausgeben zu lassen:
```arduino
hdc.getHumi();
hdc.getTemp();
```
***Hinweis:*** *Beim Speichern der Messwerte sollten die Variablen den gleichen Datentypen haben wie die Rückgabewerte der Messfunktionen. In unserem Fall sind das beides `float` Werte.*

## Aufgabe 1
Baue die oben beschriebene Schaltung nach und versuche den HDC1008 auszulesen und Dir die gemessenen Daten im seriellen Monitor anzeigen zu lassen.

***Hinweis:*** *Orientiere dich an dem Beispiel aus der HDC100X-Bibliothek.*
