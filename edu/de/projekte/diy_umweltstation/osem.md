# DIY - Datenupload  zur openSenseMap
Wenn wir unsere Wetterstation aufgebaut haben, wäre es doch schön die gewonnenen Daten immer von jedem Ort aus abrufen zu können.
Dazu gibt es die [openSenseMap](https://openSenseMap.org/) (OSeM), welche diverse Sensordaten online sammelt und auf einer Karte darstellt.
Über den Ethernet- oder WiFi-Shield oder können wir unsere senseBox ans Internet anbinden und die Daten zur OSeM hochladen.

## Ziele der Station
In dieser Station wird beispielhaft die Integration eines Sensors in die openSenseMap gezeigt, sodass die gewonnenen Daten online verfügbar sind.

## Materialien
* Ethernet-Shield bzw WiFi-Shield (je nach Variante)
* evtl. Netzwerk-Kabel
* Mindestens einen (beliebigen) Sensor

## Grundlagen
- [**Shields**](../../grundlagen/shields.md):
    Lese dieses Kapitel um zu erfahren, wie der Arduino mit Shields um eine Netzwerkverbindung erweitert werden kann.
- [**openSenseMap Upload**](../../grundlagen/osem_upload.md):
    In diesem Kapitel erfährst du, wie du deine senseBox in die openSenseMap einbinden kannst.

## Aufgabe 1
Mache dich mit der openSenseMap vertraut (siehe Grundlagen), und registriere dort deine senseBox mit den Sensoren, welche du bisher angeschlossen hast.

## Aufgabe 2
In dem Arduino-Sketch, den du bei der Registrierung in Aufgabe 1 erhalten hast, fehlt noch das Auslesen von Sensoren.
Erweitere den Sketch von der OSeM-Registrierung sodass deine angeschlossenen Sensoren ausgelesen werden.

> ***Tipp:*** *Folge der Anleitung im [Grundlagenkapitel](../../grundlagen/osem_upload.md#erweiterung-des-sketches). Du kannst deinen bisherigen Code überwiegend wiederverwenden!*

## Aufgabe 3
Erweitere den Sketch aus Aufgabe 2, sodass die Daten zur openSenseMap hochgeladen werden.

> ***Hinweis: Falls du die `BMP280.h`-Bibliothek nicht in der Arduino IDE findest, kannst du sie unter [Downloads](../../downloads.md) herunterladen und in den `Arduino/libraries` Ordner kopieren.***
