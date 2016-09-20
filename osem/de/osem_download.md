# Datendownload

Unter dem Reiter "Datendownload" sind Funktionen zum Herunterladen der Sensordaten zu finden.

Der Datendownload bezieht sich immer auf ein ausgewähltes **Phänomen** (z.B. Lufttemperatur), einen **Zeitraum** und eine **Boundingbox**.
Die Boundingbox bezeichnet die räumliche Auswahl der Stationen, und wird automatisch durch den aktuell sichtbaren Kartenausschnitt bestimmt.

> **Achtung**: Je nach Auswahl der Filterparameter kann der Download sehr groß werden (mehrere 100mb)!

## Erweitertes Filtern
Zusätzlich zu den zeitlichen und räumlichen Filtern unter "Datendownload" lässt sich die Stationsauswahl weiter unter dem Reiter "Filter" einschränken.
Wie das geht ist im Kapitel [Datenanalyse](osem_datenanalyse.md) beschrieben.

## Formate
Derzeit wird nur das Datenformat CSV unterstützt, welches problemlos mit Tabellenkalkulations-Tools wie Excel verarbeitet werden kann.

Jede Zeile enthält eine Messung einer senseBox mit dem ausgewählten Phänomen.
Der Messwert (`value`), Standort des Sensors (`lat`, `lng`, Referenzsystem WGS84) und ein Zeitstempel (`createdAt`) sind in je einer Spalte angegeben:

```csv
createdAt;value;lat;lng
2016-09-20T10:05:49.581Z;18.70;7.64568;51.962372
2016-09-20T10:00:52.689Z;18.62;7.64568;51.962372
2016-09-20T09:55:54.282Z;18.47;7.64568;51.962372
....
```
