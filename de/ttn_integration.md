# Upload über LoRaWAN

Es ist möglich Sensordaten per LoRaWAN™ durch das [TheThingsNetwork](https://thethingsnetwork.org)
(TTN) auf die openSenseMap zu laden.
LoRa ist ein zunehmend Verbreitung findender Funkstandard, welcher ähnlich wie
WiFi digitale Datenübertragung in einem IP-Netzwerk erlaubt, jedoch deutlich
andere Features bietet:

- Datendurchsatz: 300 - 3000 Bit/s
- Reichweite:     bis zu 15km 

TTN ist eins von mehreren Projekten, welches die zur Funk-Hardware zugehörige
Infrastruktur für das IP-Netzwerk implementiert, wodurch registrierte Geräte
mit dem Internet verbunden werden können.

Nutzer können *Gateways* sowie *Nodes* zu dem Netzwerk hinzufügen.
Mit dem LoRa Sender auf dem [Dragino Shield](http://wiki.dragino.com/index.php?title=Lora_Shield)
haben wir bisher gute Erfahrungen gemacht.

## TTN openSenseMap Integration
Die openSenseMap bietet eine direkte Integration in das TTN Netzwerk, was die
Konfiguration stark vereinfacht.

### Registrierung in TTN Console

Um ein Gerät in das TTN einzubinden, muss für dieses zunächst unter
[thethingsnetwork.org](https://console.thethingsnetwork.org/)
eine *Application* und ein *Device* registriert werden. Hierbei erhält man eine
`app_id` und eine `dev_id`.

Für die registrierte Application muss die HTTP Integration unter <https://console.thethingsnetwork.org/applications/DEINE_APPID/integrations/create/http-ttn>
aktiviert werden. Diese muss konfiguriert werden, dass sie die Nachrichten von
Devices per `POST` an `https://ttn.opensensemap.org/v1.1` weiterleitet. Das
Authorization-Feld kann leer bleiben!

<img src="https://raw.githubusercontent.com/sensebox/resources/master/images/osem_ttnconsole.png" center width="767" />

Für die Datenübertragung zur openSenseMap müssen die `app_id` und `dev_id` bei
der Registrierung auf der openSenseMap in der TTN-Konfiguration angegeben
werden. Darüber hinaus muss ein passendes Decoding-Profil konfiguriert werden,
welches bestimmt wie die - wegen der geringen Bandbreite als rohe Bytes 
übertragenen - Daten als Messungen interpretiert werden sollen.

<img src="https://raw.githubusercontent.com/sensebox/resources/master/images/osem_register_ttn.png" center width="819" />

Optional kann im Feld `port` noch der Port angegeben werden, auf welchem
der Sender seine Daten an das TTN schickt. So lassen sich die selbe `app_id`
und `dev_id` für mehrere Sensorstationen verwenden.

### Decoding Profile
Für eine Box muss passend zu den übertragenen Messdaten ein Decoding-Profil
ausgewählt oder definiert werden.
Die Auswahl des Decoding-Profils ist von dem Encoding der Nachrichten auf dem
Mikrocontroller, und ob im TTN eine Payload-Function eingestellt wurde abhängig.

- Für die senseBox:home (ohne Erweiterungen) kann das `senseBox:home` Profil
verwendet werden.
- Werden die Messungen auf der LoRa-Node mit der `lora-serialization`-Library
encodiert, sollte das `lora-serialization` Profil verwendet werden.
- Mit dem `json` Profil werden beliebige andere Encodings unterstuetzt, falls eine
Payload-Function in der TTN Console die Nachrichten passend decodiert.

Im Folgenden wird erklärt wie die unterstützten Profile konfiguriert werden:

#### `sensebox/home`
Dieses Profil ist zugeschnitten auf die mit der senseBox:home gelieferten Sensoren,
in Verwendung mit
[diesen Arduino Sketch](https://github.com/sensebox/random-sketches/tree/master/lora/dragino).
Neben der Angabe `sensebox/home` unter `profile` ist keine weitere Konfiguration
notwendig.

#### `lora-serialization`
Für Sensorstationen, welche eine spezielle Sensorkonfiguration haben, können
durch das `lora-serialization` Profil nahezu beliebige Daten annehmen.
Hierzu nutzen wir die [`lora-serialization`](https://github.com/thesolarnomad/lora-serialization)
Bibliothek, welche ein einheitliches Encoding auf dem Microcontroller, und
Decoding am anderen Ende der Leitung erlaubt.

Es werden die Encodings `temperature`, `humidity`, `unixtime`, `uint8` und
`uint16` unterstützt, welche pro Sensor unter **Dekodierungsoptionen** angegeben
werden müssen.  Die Zuordnung des Sensors kann über eine der Properties
`sensor_id`, `sensor_title`, `sensor_unit`, `sensor_type` erfolgen.

Ein Beispiel für zwei Sensoren sähe so aus:

```json
[
  { "decoder": "temperature", "sensor_title": "Temperatur" },
  { "decoder": "humidity", "sensor_unit": "%" }
]
```

> ***Hinweis:*** *Die Reihenfolge der Sensoren muss hier beim Arduino und der
> openSenseMap identisch sein!*

Wenn ein `unixtime` Decoder angegeben wird, wird dessen Zeitstempel für alle im
Folgenden angegebenen Messungen verwendet.
Andernfalls wird der Moment verwendet, in dem das erste Gateway die Nachricht
erhält. Beispiel: 

```json
[
  { "decoder": "unixtime" },
  { "decoder": "temperature", "sensor_title": "Temperatur" }
]
```

#### `json` - Decoding mit TTN Payload Function
Falls die `lora-serialization` Library nicht zur Wahl steht, können Messungen
schon auf Seite des TTN mittels einer *Payload Function* dekodiert werden,
sodass hier beliebige Datenformate unterstützt werden.

![In der TTN Console muss eine Payload Function definiert werden](https://raw.githubusercontent.com/sensebox/resources/master/images/lora_ttn_payloadfunc.png)

Das resultierende JSON muss kompatibel mit den von der [openSenseMap-API verstandenen
Measurement Formaten sein](https://docs.opensensemap.org/#api-Measurements-postNewMeasurements).
Ein einfaches Beispiel:

```json
{ "sensor_id1": "value1, "sensor_id2: "value2" }
```

Auf Seiten der openSenseMap ist keine Konfiguration notwendig.

