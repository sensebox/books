# openSenseMap-Sketch für den ESP8266 anpassen

Damit der senseBox-Sketch auf dem ESP8266 läuft, sind ein paar Anpassungen nötig.
Zuallererst benötigt man seinen senseBox-Sketch.
Entweder man registriert eine neue senseBox ([Anleitung hier](../osem.md)), oder man verwendet seinen bestehenden Sketch.
Wichtig ist dass man seine senseBox-ID und Sensor-IDs kennt.

> *Damit das Barometer (BMP280) korrekt in mit dem ESP8266 funktioniert, wird eine andere Bibliothek ([BME280 Version 1.0.02](https://github.com/finitespace/BME280/tree/fa4a6d4412dfb46f135cb68c15680a57ff68dfda)) zum ansteuern des Sensors benötigt.*
> *Diese kann [hier](https://github.com/finitespace/BME280/archive/Release_Version_1.0.02.zip) heruntergeladen werden.*
> *Die Installation erfolgt analog zu unseren Bibliotheken, wie [hier](../software_installation.md#arduino-bibliotheken-installieren) beschrieben ist.*

Hier findet ihr einen komplett angepassten Sketch, um Messwerte des BME280 Sensors mit Hilfe eines ESP8266 auf die ([openSenseMap](https://opensensemap.org)) hochzuladen.
Dort müssen nur noch WiFi-Name und -Passwort, senseBox-ID und Sensor-IDs ersetzt werden.

### Kompletter Sketch
```arduino
/*
  senseBox Home - Citizen Sensingplatform
  Version: 2.5
  Date: 2019-Apr-04
  Homepage: https://www.sensebox.de https://www.opensensemap.org
  Author: Institute for Geoinformatics, University of Muenster
  Note: Sketch for ESP8266
  Email: support@sensebox.de
*/

#include <Wire.h>
#include <BME280.h>
#include <SPI.h>
#include <ESP8266WiFi.h>

// Wifi Configuration
WiFiClient client;
const char* server = "ingress.opensensemap.org";
const char* ssid = "dein-wifi-name";
const char* password = "dein-wifi-passwort";

typedef struct sensor {
    const uint8_t ID[12];
} sensor;

uint8_t sensorsIndex = 0;

// Number of sensors
static const uint8_t NUM_SENSORS = 3;

// senseBox ID and sensor IDs
const uint8_t SENSEBOX_ID[12] = { 0x58, 0xd9, 0x1a, 0x6f, 0x68, 0x91, 0xfd, 0x00, 0x0f, 0x8a, 0xf7, 0xed };

// Do not change order of sensor IDs
const sensor sensors[NUM_SENSORS] = {
  // Temperatur
  { 0x58, 0xd9, 0x1a, 0x6f, 0x68, 0x91, 0xfd, 0x00, 0x0f, 0x8a, 0xf7, 0xee },
  // rel. Luftfeuchte
  { 0x58, 0xd9, 0x1a, 0x6f, 0x68, 0x91, 0xfd, 0x00, 0x0f, 0x8a, 0xf7, 0xef },
  // Luftdruck
  { 0x58, 0xd9, 0x1a, 0x6f, 0x68, 0x91, 0xfd, 0x00, 0x0f, 0x8a, 0xf7, 0xf0 },
};

uint8_t contentLength = 0;
float values[NUM_SENSORS];

// Load sensor
BME280 bme;
uint8_t pressureUnit(1);  // hPa

const unsigned int postingInterval = 60000;

void setup() {
  sleep(2000);
  Serial.begin(9600);
  Serial.println("SenseBox Home software version 2.5");
  // Wifi connection:
  Serial.print("Starting wifi connection...");
  WiFi.begin(ssid, password);
  while (WiFi.status() != WL_CONNECTED) {
    delay(500);
    Serial.print(".");
  }
  Serial.println("done!");
  delay(500);

  // sensors
  Serial.print("Initializing sensors...");
  while(!bme.begin())
  {
    Serial.println("Could not find BME280 sensor!");
    sleep(1000);
  }
  sleep(500);
  Serial.println("done!");
  Serial.println("Starting loop.\n");
}

void loop() {
  float temp(NAN), hum(NAN), pres(NAN);
  bme.ReadData(pres, temp, hum, true, pressureUnit);
  addValue(temp);
  addValue(hum);
  addValue(pres);

  submitValues();
  delay(postingInterval);
}

void addValue(const float& value) {
  values[sensorsIndex] = value;
  sensorsIndex = sensorsIndex + 1;
}

int printHexToStream(const uint8_t* data, uint8_t length, Print& stream)  // prints 8-bit data in hex
{
  byte first;
  int j = 0;
  for (uint8_t i = 0; i < length; i++) {
    first = (data[i] >> 4) | 48;
    if (first > 57) {
      stream.write(first + (byte)39);
    } else {
      stream.write(first);
    }
    j++;

    first = (data[i] & 0x0F) | 48;
    if (first > 57) {
      stream.write(first + (byte)39);
    } else {
      stream.write(first);
    }
    j++;
  }
  return j;
}

int printCsvToStream(Print& stream)
{
  int len = 0;
  for (uint8_t i = 0; i < sensorsIndex; i++) {
    if (!isnan(values[i])) {
      len = len + printHexToStream(sensors[i].ID, 12, stream);
      len = len + stream.print(",");
      // do not print digits for illuminance und uv-intensity
      if (i < 3)
        len = len + stream.println(values[i]);
      else
        len = len + stream.println(values[i], 0);
    }
  }
  return len;
}

// millis() rollover fix - http://arduino.stackexchange.com/questions/12587/how-can-i-handle-the-millis-rollover
// Be careful with the use of sleep function!
// In conjunction with long times, the esp watchdog will step in and perform a soft WDT reset.
void sleep(unsigned long ms) {     // ms: duration
  unsigned long start = millis();  // start: timestamp
  for (;;) {
    unsigned long now = millis();         // now: timestamp
    unsigned long elapsed = now - start;  // elapsed: duration
    if (elapsed >= ms)                    // comparing durations: OK
      return;
  }
}

void waitForResponse() {
  // if there are incoming bytes from the server, read and print them
  delay(100);
  String response = "";
  char c;
  boolean repeat = true;
  do {
    if (client.available())
      c = client.read();
    else
      repeat = false;
    response += c;
    
    if (response == "HTTP/1.1 ")
      response = "";
    if (c == '\n')
      repeat = false;
    yield();
  } while (repeat);

  Serial.print("Server Response: ");
  Serial.println(response);
  
  client.flush();
  client.stop();
}

void submitValues() {
  // close any connection before send a new request.
  // This will free the socket on the WiFi shield
  Serial.println("__________________________\n");
  if (client.connected())
  {
    client.stop();
    delay(500);
  }
  // if there's a successful connection:
  if (client.connect(server, 80)) {
    Serial.println("connecting...");
    // send the HTTP POST request:

    client.print(F("POST /boxes/"));
    printHexToStream(SENSEBOX_ID, 12, client);
    client.println(F("/data HTTP/1.1"));

    // !!!!! DO NOT REMOVE !!!!!
    // !!!!! NICHT LÖSCHEN !!!!!
    // print once to Serial to get the content-length
    int contentLen = printCsvToStream(Serial);
    // !!!!! NICHT LÖSCHEN !!!!!
    // !!!!! DO NOT REMOVE !!!!!

    // Send the required header parameters
    client.print(F("Host: "));
    client.println(server);
    client.print(F("Content-Type: text/csv\nConnection: close\nContent-Length: "));
    client.println(contentLen);
    client.println();
    printCsvToStream(client);
    client.println();
    Serial.println("done!");

    waitForResponse();
    sensorsIndex = 0;
  } else {
    // if you couldn't make a connection:
    Serial.println("connection failed. Restarting System.");
    delay(1000);
    ESP.restart();
  }
}
```
