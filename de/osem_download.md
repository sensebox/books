# Datendownload
Es bestehen mehrere Möglichkeiten Sensordaten von der openSenseMap herunterzuladen.
Abhängig von der Fragestellung bietet sich je eine Option an.

## Daten zu einer Box
Unter <https://archive.opensensemap.org> wird ein Archiv für sämtliche Messungen in der openSenseMap Datenbank geführt.
Hier sind nach Tag und Box gegliederte Messwerte als CSV beziehungsweise ZIP-Archiv verfügbar.

## Daten zu einem Phänomen

Unter dem Reiter "Datendownload" sind Funktionen zum Herunterladen der Sensordaten zu finden.

Der Datendownload bezieht sich immer auf ein ausgewähltes **Phänomen** (z.B. Lufttemperatur), einen **Zeitraum** und eine **Boundingbox**.
Die Boundingbox bezeichnet die räumliche Auswahl der Stationen, und wird automatisch durch den aktuell sichtbaren Kartenausschnitt bestimmt.

> **Achtung**: Je nach Auswahl der Filterparameter kann der Download sehr groß werden (mehrere 100MB)!

### Erweitertes Filtern
Zusätzlich zu den zeitlichen und räumlichen Filtern unter "Datendownload" lässt sich die Stationsauswahl weiter unter dem Reiter "Filter" einschränken.
Wie das geht ist im Kapitel [Datenanalyse](osem_datenanalyse.md) beschrieben.

### Formate
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

## API-Download
Falls die beiden genannten Möglichkeiten nicht flexibel genug sind, können über die [REST API unter `/boxes/data`](osem_api.md#get-latest-measurements-for-a-phenomenon-as-csv-) auch komplexe Anfragen gestellt werden.

Für solche anfragen bietet sich das Kommandozeilenwerkzeug `curl` an.
Unter Linux ein Terminal öffnen und beispielsweise folgenden Befehl eingeben, um sämtliche Temperatur-Messungen im geographischen Bereich 51°N - 52°N, 7°E - 8°E in die Datei `measurements.csv` herunterzuladen:

```
curl "https://api.opensensemap.org/boxes/data?phenomenon=Temperatur&bbox=7,51,8,52" > measurements.csv
```

Andere geeignete Parameter (Zeitraum, Box-IDs, ...) lassen sich der verlinkten API-Dokumentation entnehmen.
