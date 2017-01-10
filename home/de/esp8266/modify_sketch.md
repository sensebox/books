# openSenseMap-Sketch für den ESP8266 anpassen

Damit der senseBox-Sketch auf dem ESP8266 läuft, sind ein paar Anpassungen nötig.
Zuallererst benötigt man seinen senseBox-Sketch.
Entweder man registriert eine neue senseBox ([Anleitung hier](../osem.md)), oder man verwendet seinen bestehenden Sketch.
Wichtig ist dass man seine senseBox-ID und Sensor-IDs kennt.

> *Damit das Barometer (BMP280) korrekt in mit dem ESP8266 funktioniert, wird eine andere Bibliothek ([BME280](https://github.com/finitespace/BME280)) zum ansteuern des Sensors benötigt.*
> *Diese kann [hier](https://github.com/finitespace/BME280/archive/master.zip) heruntergeladen werden.*
> *Die Installation erfolgt analog zu unseren Bibliotheken, wie [hier](../software_installation.md#arduino-bibliotheken-installieren) beschrieben ist.*

Weiter [unten](#kompletter-sketch) findet ihr einen komplett angepassten Sketch.
Dort müssen nur noch WiFi-Name und -Passwort, senseBox-ID und Sensor-IDs ersetzt werden.

#### Ethernet durch Wifi ersetzen

Da der ESP8266 über WiFi kommuniziert, brauchen wir die Ethernet Bibliothek nicht mehr.
Dafür muss die ESP Wifi Bibliothek eingeladen und konfiguriert werden.

```arduino
#include <Ethernet.h>
```
ersetzen durch
```arduino
#include <ESP8266WiFi.h>
```

Die Zeilen welche die Ethernet Verbindung konfigurieren folgendermaßen ersetzen:
```arduino
//Configure ethernet connection
IPAddress myIp(192, 168, 0, 42);
byte mac[] = { 0xDE, 0xAD, 0xBE, 0xEF, 0xFE, 0xED };
char server[] = "www.opensensemap.org";
EthernetClient client;
```
nach
```arduino
//Configure wifi connection
char server[] = "www.opensensemap.org";
WiFiClient client;
const char* ssid     = "dein-wifi-name";
const char* password = "dein-wifi-passwort";
```
ändern.

Dann muss das Verbinden mit dem Ethernet mit der Wifi-Verbindung ersetzt werden.

Alt:
```arduino
// start the Ethernet connection:
Serial.println("SenseBox Home software version 2.1");
Serial.println();
Serial.print("Starting ethernet connection...");
if (Ethernet.begin(mac) == 0) {
  Serial.println("Failed to configure Ethernet using DHCP");
  Ethernet.begin(mac, myIp);
}else Serial.println("done!");
```
Neu:
```arduino
// start the Wifi connection:
Serial.println("SenseBox Home software version 2.1");
Serial.println();
Serial.print("Starting wifi connection...");
WiFi.begin(ssid, password);

while (WiFi.status() != WL_CONNECTED) {
  delay(500);
  Serial.print(".");
}
Serial.println("done!");

```

### Kompletter Sketch
```arduino
/*
SenseBox Home - Citizen Sensingplatform
Version: 2.1
Date: 2016-07-23
Homepage: http://www.sensebox.de
Author: Jan Wirwahn & Gerald Pape, Institute for Geoinformatics, University of Muenster
Note: Sketch for senseBox Home Kit ESP8266
Email: support@sensebox.de
*/

#include <Wire.h>
#include "HDC100X.h"
#include "BMP280.h"
#include <Makerblog_TSL45315.h>
#include <SPI.h>
#include <ESP8266WiFi.h>

//SenseBox ID
#define SENSEBOX_ID "SENSEBOX_ID_AUS_DEM_ORIGINAL_SKETCH"

//Sensor IDs
#define TEMPSENSOR_ID "SENSOR_ID_AUS_DEM_ORIGINAL_SKETCH"
#define HUMISENSOR_ID "SENSOR_ID_AUS_DEM_ORIGINAL_SKETCH"
#define PRESSURESENSOR_ID "SENSOR_ID_AUS_DEM_ORIGINAL_SKETCH"
#define LUXSENSOR_ID "SENSOR_ID_AUS_DEM_ORIGINAL_SKETCH"
#define UVSENSOR_ID "SENSOR_ID_AUS_DEM_ORIGINAL_SKETCH"

//Configure wifi connection
char server[] = "www.opensensemap.org";
WiFiClient client;
const char* ssid     = "dein-wifi-name";
const char* password = "dein-wifi-passwort";

//Load sensors
Makerblog_TSL45315 TSL = Makerblog_TSL45315(TSL45315_TIME_M4);
HDC100X HDC(0x43);
BMP280 BMP;

//measurement variables
float temperature = 0;
float humidity = 0;
double tempBaro, pressure;
uint32_t lux;
uint16_t uv;
int messTyp;
#define UV_ADDR 0x38
#define IT_1   0x1

unsigned long oldTime = 0;
const unsigned long postingInterval = 60000;

void setup() {
  // Open serial communications and wait for port to open:
  Serial.begin(9600);
  // start the Wifi connection:
  Serial.println("SenseBox Home software version 2.1");
  Serial.println();
  Serial.print("Starting wifi connection...");
  WiFi.begin(ssid, password);

  while (WiFi.status() != WL_CONNECTED) {
    delay(500);
    Serial.print(".");
  }
  Serial.println("done!");
  delay(1000);
  //Initialize sensors
  Serial.print("Initializing sensors...");
  Wire.begin();
  Wire.beginTransmission(UV_ADDR);
  Wire.write((IT_1<<2) | 0x02);
  Wire.endTransmission();
  delay(500);
  HDC.begin(HDC100X_TEMP_HUMI,HDC100X_14BIT,HDC100X_14BIT,DISABLE);
  TSL.begin();
  BMP.begin();
  BMP.setOversampling(4);
  Serial.println("done!");
  Serial.println("Starting loop.");
  temperature = HDC.getTemp();
}

void loop()
{
  // if there are incoming bytes available
  // from the server, read them and print them:
  if (client.available()) {
    char c = client.read();
    Serial.print(c);
    //Serial.write(c);
  }

  if (millis() - oldTime > postingInterval) {
    oldTime = millis();
    //-----Pressure-----//
    Serial.println("Posting pressure");
    messTyp = 2;
    char result = BMP.startMeasurment();
    if(result!=0){
      delay(result);
      result = BMP.getTemperatureAndPressure(tempBaro,pressure);
      postObservation(pressure, PRESSURESENSOR_ID, SENSEBOX_ID);
      //Serial.print("Temp_baro = ");Serial.println(tempBaro,2);
      //Serial.print("Pressure  = ");Serial.println(pressure,2);
    }
    delay(2000);
    //-----Humidity-----//
    Serial.println("Posting humidity");
    messTyp = 2;
    humidity = HDC.getHumi();
    //Serial.print("Humidity = "); Serial.println(humidity);
    postObservation(humidity, HUMISENSOR_ID, SENSEBOX_ID);
    delay(2000);
    //-----Temperature-----//
    Serial.println("Posting temperature");
    messTyp = 2;
    temperature = HDC.getTemp();
    //Serial.println(temperature,2);
    //Serial.print("Temperature = ");Serial.println(temperature);
    postObservation(temperature, TEMPSENSOR_ID, SENSEBOX_ID);
    delay(2000);
    //-----Lux-----//
    Serial.println("Posting illuminance");
    messTyp = 1;
    lux = TSL.readLux();
    //Serial.print("Illumi = "); Serial.println(lux);
    postObservation(lux, LUXSENSOR_ID, SENSEBOX_ID);
    delay(2000);
    //UV intensity
    messTyp = 1;
    uv = getUV();
    postObservation(uv, UVSENSOR_ID, SENSEBOX_ID);
  }
}

void postObservation(float measurement, String sensorId, String boxId){
  char obs[10];
  if (messTyp == 1) dtostrf(measurement, 5, 0, obs);
  else if (messTyp == 2) dtostrf(measurement, 5, 2, obs);
  Serial.println(obs);
  //json must look like: {"value":"12.5"}
  //post observation to: http://opensensemap.org:8000/boxes/boxId/sensorId
  Serial.println("connecting...");
  String value = "{\"value\":";
  value += obs;
  value += "}";
  if (client.connect(server, 8000))
  {
    Serial.println("connected");
    // Make a HTTP Post request:
    client.print("POST /boxes/");
    client.print(boxId);
    client.print("/");
    client.print(sensorId);
    client.println(" HTTP/1.1");
    // Send the required header parameters
    client.println("Host:opensensemap.org");
    client.println("Content-Type: application/json");
    client.println("Connection: close");
    client.print("Content-Length: ");
    client.println(value.length());
    client.println();
    // Send the data
    client.print(value);
    client.println();
  }
  waitForResponse();
}

void waitForResponse()
{
  // if there are incoming bytes available
  // from the server, read them and print them:
  boolean repeat = true;
  do{
    if (client.available())
    {
      char c = client.read();
      Serial.print(c);
    }
    // if the servers disconnected, stop the client:
    if (!client.connected())
    {
      Serial.println();
      Serial.println("disconnecting.");
      client.stop();
      repeat = false;
    }
  }
  while (repeat);
}

uint16_t getUV(){
  byte msb=0, lsb=0;
  uint16_t uvValue;

  Wire.requestFrom(UV_ADDR+1, 1); //MSB
  delay(1);
  if(Wire.available()) msb = Wire.read();

  Wire.requestFrom(UV_ADDR+0, 1); //LSB
  delay(1);
  if(Wire.available()) lsb = Wire.read();

  uvValue = (msb<<8) | lsb;

  return uvValue*5;
}
```
