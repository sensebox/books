# senseBox mit LoRa über TheThingsNetwork

Achtung: Alle Angaben beziehen sich auf in Europa verwendete Frequenzen und Normen.
Eine Erklärung des Begriffs LoRaWan findest du hier: https://www.thethingsnetwork.org/wiki/LoRaWAN/Home (in Englisch)

Die Begriffe LoRa (Long Range) oder LoRaWAN (Long Range Wide Area Network) beschreiben eine Funktechnik, welches erlaubt, mit sehr wenig Energie Daten über lange Strecken funken zu können. Um Daten übertragen zu können, benötigt man drei Komponenten: Knoten (Nodes), Gateways und ein Netzwerk. Die senseBox:home wird ein so genannter Knoten, als Netzwerk verwenden wir TheThingsNetwork (TTN). Das Netzwerk von TheThingsNetwork erlaubt es (unter anderem), Daten der Knoten an die openSenseMap weiterzuleiten. Gateways sind die Empfangsstationen für die LoRa-Datenpakete die die Knoten absenden. Ohne ein Gateway in der Nähe, werden die Datenpakte der Knoten nicht empfangen. Ob sich in deiner Nähe ein LoRa Gateway, welches an TTN angeschlossen ist befindet, kannst du entweder auf der Seite von TheThingsNetwork oder ttnmapper.org nachsehen.

Wie so oft gibt es auch hier mehrere Möglichkeiten Daten über LoRa und TTN zu senden. Einerseits gibt es Add-On Lösungen wie Arduino Shields oder aber auch Mikrocontroller mit eingebautem LoRa-Chip. Generell gibt es etwa drei unterschiedliche LoRa Modems: RN2483, SX1272 und RFM95. RN2483 basierte Lösungen sind am leichtgewichtigsten in Sachen Code, benötigen aber einen seriellen Port und kosten vergleichsweise viel. Die anderen beiden Chips brauchen größere Libraries, benötigen mehrere digitale Pins, sind dafür aber günstiger.

Die aktuell (Frühjahr 2017) einfachste Möglichkeit eine senseBox:home zu einem Knoten zu machen, ist es, ein LoRa fähiges Arduino Shield zu verwenden. Diese Anleitung besteht aus den folgenden Teilen:
1. senseBox:home mit Dragino LoRa Shield
2. senseBox:home mit RN2483
3. Konfiguration TheThingsNetwork
4. Konfiguration openSenseMap.org
