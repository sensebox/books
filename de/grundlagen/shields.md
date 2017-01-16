# Arduino Shields

Ein Shield bezeichnet eine aufsteckbare Platine für den Arduino, welche den Microcomputer kompakt um Funktionalität erweitert.
Shields werden einfach in die Pins des Arduino aufgesteckt und stellen diese Pinbelegung wieder selbst bereit.

Im Kasten der senseBox:edu findest du einen Shield für Internetverbindungen.
Je nach Variante ist dies ein roter *Ethernet-Shield* oder blauer *WiFi-Shield*, welcher die senseBox per Netzwerkkabel oder WLAN mit dem Netzwerk verbindet.

Zusätzlich findest du einen grünen *senseBox-Shield*, auf welchem eine [Echtzeituhr (RTC)](uhr.md), ein microSD-Kartenleser und weitere Anschlüsse verbaut sind.

## Besonderheiten des Ethernet-Shields
Da unser Ethernet-Shield eine modifizierte Variante des offiziellen Arduino-Shields ist, funktioniert die mit der Arduino-IDE mitgelieferte `Ethernet.h` Bibliothek nicht.
Daher solltest du unsere Versionen der Bibliotheken verwenden (siehe [Downloads](../downloads.md)).

> ***Hinweis:*** *Nachdem du diese Bibliothek installiert hast, wird die Arduino-IDE möglicherweise die Ethernet-Bibliothek updaten wollen, dies solltest du ablehnen.*

## Verwandte Themen
- [Echtzeituhr](uhr.md)
- [SD-Karten Datenlogger](datenlogger.md)
- [openSenseMap Upload](osem_upload.md)
