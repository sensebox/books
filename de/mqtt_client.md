# Datenübertragung über MQTT

Diese Anleitung beschreibt die Möglichkeit, Messwerte über MQTT an die openSenseMap zu senden. Die openSenseMap ist in der Lage, sich als MQTT Client mit einem öffentlichen MQTT Broker zu verbinden. Einen eigenen MQTT Broker bietet die openSenseMap nicht an. Der openSenseMap MQTT Client verbindet sich, wenn nicht anders in den Verbindungseinstellungen angegeben, mit einer 13 Stelligen Id mit prefix `osem_` gefolgt von 8 zufälligen Ziffern und Buchstaben von A bis F.

Je registrierter senseBox müssen separate MQTT Einstellungen vorgenommen werden. Für eine Verbindung mit einem Broker können die folgenden Parameter angegeben werden. Alle angegeben Einstellungen werden in der Datenbank der openSenseMap gespeichert. Es bietet sich also an, eigene Zugangsdaten einzurichten.

### URL
Die Adresse zum MQTT Broker. Sollte mit `mqtt://` oder `ws://` beginnen. Sollte der MQTT Broker Authentifizierung mittels Nutzername und Passwort benötigen, kann dieser in der URL kodiert werden. Die URL sollte dann wie folgt aussehen: `mqtt://username:password@hostname.of.mqtt.broker`

### Topic
Das MQTT Topic unter dem die openSenseMap Nachrichten empfangen soll. Zum Beispiel `home/temperatures/outside`

### Nachrichtenformat
Hier sollte zwischen `json` und `csv` ausgewählt werden. Die Formate entsprechen JSON-Array und csv dokumentiert in [docs.opensensemap.org](https://docs.opensensemap.org/#api-Measurements-postNewMeasurements).

### Dekodierungsoptionen
Erwartet ein JSON Objekt. Nur für Nachrichtenformat json: Erlaubt es, unter dem Schlüssel jsonPath einen JSONPath Ausdruck anzugeben, welches die Position der JSON kodierten Daten angibt. Beispiel: `{"jsonPath":"$.payload_fields"}`

### Verbindungsoptionen
Erwartet ein JSON Objekt. Erlaubt es, dem MQTT Client Verbindungsoptionen zu übergeben. Die Schlüssel `keepAlive`, `reschedulePings`, `clientId`, `username` und `password` von [https://github.com/mqttjs/MQTT.js#client](https://github.com/mqttjs/MQTT.js#client) sind erlaubt.
