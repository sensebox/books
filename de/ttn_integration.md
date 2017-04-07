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

Um ein Gerät in das TTN einzubinden, muss für dieses zunächst unter
[thethingsnetwork.org](https://console.thethingsnetwork.org/)
eine *Application* und ein *Device* registriert werden. Hierbei erhält man eine
`app_id` und eine `dev_id`.

Nachdem eine Application & ein Device bei TTN registriert wurde, kann für diese
eine Integration ausgewählt werden. Wähle hier die openSensemap-Integration.

![screenshot osem integration](TODO)

Für die Datenübertragung zur openSenseMap müssen die `app_id` und `dev_id` bei
der Registrierung auf der openSenseMap in der TTN-Konfiguration angegeben
werden. Darüber hinaus muss ein passendes Decoding-Profil konfiguriert werden,
welches bestimmt, wie die - wegen der geringen Bandbreite als rohe Bytes 
übertragenen - Daten als Messungen interpretiert werden sollen.

<!-- TODO: add guide for configuration via frontend + screenshot -->

> ***Hinweis***: Derzeit ist es noch nicht möglich, die TTN-Konfiguration in
> der Nutzeroberfläche der openSenseMap Funktionalität noch nicht in der
> Oberfläche der openSenseMap integriert. Die Konfiguration kann aber über den
> folgenden `curl`-Befehl aus dem Terminal vorgenommen werden:
> ```bash
> curl -XPUT -H 'content-type: application/json' -H 'Authorization: Bearer <TOKEN>' -d \
>   <JSON> \
>   https://api.opensensemap.org/boxes/<BOXID>
> ```
> wobei `<TOKEN>`, `<JSON>` und `<BOXID>` durch die eigenen Werte ersetzt werden
> müssen. Das zu sendende JSON hat im einfachsten Fall die folgende Struktur:
> `{"ttn":{"app_id":"<APPID>", "dev_id":"<DEVID>", "profile":"sensebox/home"}}`

Als Messzeitpunkt wird der Moment verwendet in dem das erste Gateway die
Nachricht erhält.

Optional kann im Feld `port` noch der Port angegeben werden, auf welchem
der Sender seine Daten an das TTN schickt. So lassen sich die selbe `app_id`
und `dev_id` für mehrere Sensorstationen verwenden.

### Decoding Profile
Für eine Box muss passend zu den übertragenen Messdaten ein Decoding-Profil
ausgewählt oder definiert werden. Im Folgenden wird erklärt wie die beiden
derzeit unterstützten Profile konfiguriert werden:

#### `sensebox/home`
Dieses Profil ist zugeschnitten auf die mit der senseBox:home gelieferten Sensoren,
in Verwendung mit
[diesen Arduino Sketch](https://github.com/sensebox/random-sketches/tree/master/lora/dragino).
Neben der Angabe `sensebox/home` unter `profile` ist keine weitere Konfiguration
notwendig.

#### `lora-serialization`
Für Sensorstationen, welche keine von fertigen Profilen abgedeckten Sensoren
haben, können durch das `lora-serialization` Profil nahezu beliebige Daten
annehmen. Hierzu nutzen wir die
[`lora-serialization`](https://github.com/thesolarnomad/lora-serialization)
Bibliothek, welche ein einheitliches Encoding auf dem Microcontroller, und
Decoding am anderen Ende der Leitung erlaubt.

Wir unterstützen derzeit die Encodings `temperature`, `humidity`, `uint8` und
`uint16`, welche für jeden Sensor angegeben werden können, dessen Messungen
übertragen werden:

```json
{
  "profile": "lora-serialization",
  "decodeOptions": [
    { "sensor_id": "<SENSORID1>", "decoder": "temperature" },
    { "sensor_id": "<SENSORID2>", "decoder": "humidity" },
  ]
}
```

> ***Hinweis***: Die Reihenfolge der Sensoren sollte hier beim Arduino und der
> openSenseMap identisch sein!

### Decoding als JSON mit TTN Payload Function
Alternativ können Messungen schon auf Seite des TTN mittels einer *Payload Function*
dekodiert werden, sodass hier beliebige Datenformate unterstützt werden.

![In der TTN Console muss eine Payload Function definiert werden](https://raw.githubusercontent.com/sensebox/resources/master/images/lora_ttn_payloadfunc.png)

Das resultierende JSON muss kompatibel mit den von der [openSenseMap-API verstandenen
Measurement Formaten sein](https://docs.opensensemap.org/#api-Measurements-postNewMeasurements).

Auf Seiten der openSenseMap ist keine Konfiguration notwendig.

---

## Weiterführendes
- [Introduction to TTN](https://ktorz.github.io/2016/03/24/so_you_want_to_build_a_distributed_network_for_iot/)
- [Tutorial zur Registrierung eines Geräts im TTN](http://zenseio.com/tutorials/setting-device-ttn)
