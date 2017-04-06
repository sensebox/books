# Submitting data through MQTT

The openSenseMap is able to receive measurements through its internal MQTT client.
There is no openSenseMap MQTT broker, connections are made with a 13 character long client id with `osem_` as prefix.

Connection settings must be configured per senseBox.

The following settings can be made:

### URL
The address of the MQTT broker. Should look like this: `mqtt://username:password@hostname.of.mqtt.broker`

### Topic
The MQTT topic. Example: `home/temperatures/outside`

### Messageformat
Either `json` or `csv`. Formats are documented [here](https://docs.opensensemap.org/#api-Measurements-postNewMeasurements).

### Decode Options
A JSON object. Allows to specify a `jsonPath` expression to specify the position of the json encoded message. Example: `{"jsonPath":"$.payload_fields"}`

### Connection Options
A JSON object. Allows to configure the mqtt client. Keys `keepAlive`, `reschedulePings`, `clientId`, `username` and `password` of [https://github.com/mqttjs/MQTT.js#client](https://github.com/mqttjs/MQTT.js#client) are allowed.
