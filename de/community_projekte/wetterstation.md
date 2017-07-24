<!-- hier sind alle Bilder dieser Dokumentation -->
[Zusammen]: ./wetterstation/Boxzusammen.jpg "zusammengesetzt"
[senseBox]: ./wetterstation/senseBox.jpg "senseBox"
[Komponenten]: ./wetterstation/Komponenten.jpg "Ethernet-Shield"
[senseBox_Innen]: ./wetterstation/BOXInnen.jpg "Box von innen"
[BOX_Aufstellung]: ./wetterstation/Aufstellung.jpg "Box im Außenbetrieb"
[Schritt1]: ./wetterstation/Schritt1.jpg "User anlegen"
[Schritt2]: ./wetterstation/Schritt2.jpg "Meine Box"
[Schritt3]: ./wetterstation/Schritt3.jpg "Standort"
[Schritt4]: ./wetterstation/Schritt4.jpg "Hardware Setup"
[Schritt5]: ./wetterstation/Schritt5.jpg "Standort"
[Sensoren_Registrierung]: ./wetterstation/Sensoren_Registrierung.jpg "Registrierung der Sensoren auf OpenSenseMap"

# senseBox Wetterstation

> Autoren: Phillip & Lucas in einem Studienprojekt am [ifgi](http://ifgi.de), April 2016

Die senseBox die wir hier beschreiben soll als Wetterstation dienen und ist für den Außeneinsatz vorgesehen, aus diesem Grund wird diese in ein dafür vorgesehenes Gehäuse gebaut. Zum Schluss sollen die erfassten Daten über ein LAN-Kabel aus der Box an einen Router Transportiert und dann auf der [openSenseMap](http://opensensemap.org/) veröffentlicht.

![senseBox] 

## Ziel
Diese senseBox soll folgende Wetterdaten erheben:

1. Luftdruck 
2. Temperatur
3. Luftfeuchtigkeit 
4. UV-Strahlung 
5. Helligkeit (in Lux)
6. Höhe (die allerdings in diesem Projekt nicht ausgelesen wird)

## Materialien
#### Aus der senseBox:edu
* Genuino UNO
* W5500 Ethernet Shield
* UV-Sensor (VEML 6070)
* Temperatur- und Luftfeuchtigkeitssensor (HDC 1008)
* Lichtsensor (TSL 45315)
* Luftdrucksensor (BMP 280)

## Setup Beschreibung
#### Hardwarekonfiguration
Die Komponenten werden wie folgt verbunden:
- Die roten Kabel verbinden den Sensor von VCC mit dem Board bzw. dem Strom mit 3,3 Volt.
- Die schwarzen Kabel stellen die Verbindung zwischen dem Sensor und dort GND und dem Board und dort ebenfalls GND her.
- Die grünen Kabel werden am Sensor an SCL und am Board an A5 angeschlossen.
- Die gelben Kabel verbinden SDA am Sensor mit A4 am Board.

Da die Anschlüsse auf dem Ethernet-Shield begrenzt sind, bündeln wir alle von den Sensoren ausgehenden Kabel auf einem Steckbrett, jede Farbe bekommt eine Reihe.  
Von dem Steckbrett geht dann ein Kabel mit der jeweiligen Farbe zum Ethernet-Shield und stellt die Verbindung wieder her.

| Kabel Farbe |  Anschluss Ethernet-Shield | Anschluss Sensor  |
| :-------------:|:-------------:| :-----:|
|Schwarz| GND	  | GND	|
| Rot   | 3,3 Volt| VCC |
| Grün 	| A5      | SCL	|
| Gelb	| A4      | SDA	|

Diese Verbindungen sind auch aus den folgenden Bildern ersichtlich.

![Komponenten]

Bei der Verbindung der Komponenten sollten normalerweise keine Schwierigkeiten auftreten.

**Die Beispiel senseBox sieht nun so aus:**

![senseBox_Innen]

**Zusammengesetzt und im Außenbetrieb:**

![Zusammen]

#### Softwaresketch
Die Implementierung wurde mit Hilfe verschiedener Beispiele durchgeführt und aus diesen ergänzt. Zur Übersichtlichkeit wurden Kommentare eingefügt, die das auseinanderhalten der verschiedenen Sensoren erleichtern.
Unser Code wurde dann in den Sketch, der für das Hochladen auf die [OpenSenseMap](http://opensensemap.org/) verantwortlich ist, eingefügt. Diesen Sketch zum Hochladen, bekommt man nach der Registrierung seiner senseBox per Mail zugesendet (siehe unten: Registrierung).
Folgende Bibliotheken wurden zusätzlich für die Sensoren verwendet:

* BMP280			  https://github.com/adafruit/Adafruit_BMP280_Library
* HDC100X			   https://github.com/RFgermany/HDC100X_Arduino_Library
* Adafruit_Sensor-master	  https://github.com/adafruit/Adafruit_Sensor


```arduino
//Bibliothek
#include <SPI.h>
#include <Ethernet.h>
#include <Wire.h>
// - Temperatur und Luftfeuchtigkeit
#include <HDC100X.h>
// - Barometer
#include <Adafruit_Sensor.h>
#include <Adafruit_BMP280.h>
  
//------------------------------------------------

//UV-Sensor
#define I3C_ADDR 0x38
#define IT_1_2 0x0 //1/2T
#define IT_1   0x1 //1T
#define IT_2   0x2 //2T
#define IT_4   0x3 //4T

//Temperatur und Luftfeuchtigkeit
HDC100X HDC1(0x43);
#define LED 13
bool state = false;

//Lichtsensor
#define I2C_ADDR     0x29
#define REG_CONTROL  0x00
#define REG_CONFIG   0x01
#define REG_DATALOW  0x04
#define REG_DATAHIGH 0x05
#define REG_ID       0x0A

//Barometer
#define BMP_SCK 13
#define BMP_MISO 12
#define BMP_MOSI 11 
#define BMP_CS 10
Adafruit_BMP280 bme; // I2C
  
//------------------------------------------------

 
//senseBox ID
#define senseBox_ID "5706242045fd40c8197459e5"

//Sensor IDs
#define TEMPSENSOR_ID "5706242045fd40c8197459eb"
#define SENSOR1_ID "5706242045fd40c8197459ea" // Luftfeuchtigkeit 
#define PRESSURESENSOR_ID "5706242045fd40c8197459e9"
#define SENSOR2_ID "5706242045fd40c8197459e8" // Licht 
#define UVSENSOR_ID "5706242045fd40c8197459e7"

//Ethernet-Parameter
char server[] = "www.opensensemap.org";
byte mac[] = { 0xDE, 0xAD, 0xBE, 0xEF, 0xFE, 0xED };
// Diese IP Adresse nutzen falls DHCP nicht möglich
IPAddress myIP(192, 168, 0, 42);
EthernetClient client;

//Messparameter
int postInterval = 10000; //Uploadintervall in Millisekunden
long oldTime = 0;


void setup()
{
  Serial.begin(9600); 
  Serial.print("Starting network...");
  //Ethernet Verbindung mit DHCP ausführen..
  if (Ethernet.begin(mac) == 0) 
  {
    Serial.println("DHCP failed!");
    //Falls DHCP fehltschlägt, mit manueller IP versuchen
    Ethernet.begin(mac, myIP);
  }
  Serial.println("done!");
  delay(1000);
  Serial.println("Starting loop.");

  // Sensor für Tenperatur und Luftfeuchtigkeit
    HDC1.begin(HDC100X_TEMP_HUMI,HDC100X_14BIT,HDC100X_14BIT,DISABLE);
    while(!Serial); //wait for serial port to connect (needed for Leonardo only)



//UV-Sensor
    Wire.begin();
    Wire.beginTransmission(I3C_ADDR);
    Wire.write((IT_1<<2) | 0x02);
    Wire.endTransmission();
    
//Lichtsensor
  Wire.beginTransmission(I2C_ADDR);
  Wire.write(0x80|REG_ID);
  Wire.endTransmission();
  Wire.requestFrom(I2C_ADDR, 1); //request 1 byte
  while(Wire.available())
  {
    unsigned char c = Wire.read();
  }

  Wire.beginTransmission(I2C_ADDR);
  Wire.write(0x80|REG_CONTROL);
  Wire.write(0x03); //power on
  Wire.endTransmission();

  Wire.beginTransmission(I2C_ADDR);
  Wire.write(0x80|REG_CONFIG);
  Wire.write(0x00); //M=1 T=400ms
  Wire.endTransmission();



//Barometer
 
    if (!bme.begin()) {
    while (1);
  }

  Serial.println("START Messung...");
}

void loop()
{
  //Upload der Daten mit konstanter Frequenz
  if (millis() - oldTime >= postInterval)
  {
    oldTime = millis();
    
    
    
     //UV-Sensor
    
  byte msb=0, lsb=0;
  uint16_t uv;

  Wire.requestFrom(I3C_ADDR+1, 1); //MSB
  delay(1);
  if(Wire.available())
    msb = Wire.read();

  Wire.requestFrom(I3C_ADDR+0, 1); //LSB
  delay(1);
  if(Wire.available())
    lsb = Wire.read();

  uv = (msb<<8) | lsb;
    uv=uv*5.625;
    
// Sensor für Tenperatur und Luftfeuchtigkeit

//HUMI=HDC1.getHumi();
//TEMP=HDC1.getTemp();


//Lichtsensor
  uint16_t l, h;
  uint32_t lux;

  Wire.beginTransmission(I2C_ADDR);
  Wire.write(0x80|REG_DATALOW);
  Wire.endTransmission();
  Wire.requestFrom(I2C_ADDR, 2); //request 2 bytes
  l = Wire.read();
  h = Wire.read();
  while(Wire.available()){ Wire.read(); } //received more bytes?
  lux  = (h<<8) | (l<<0);
  lux *= 1; //M=1
  
//Barometer
    int hpa = bme.readPressure()/100;

// Sensor-Daten werden hier hochgeladen, bzw mit ihren ID´s verknüpft.
float TEMP = HDC1.getTemp();
postFloatValue(TEMP, 2, TEMPSENSOR_ID);

float HUMI = HDC1.getHumi();
postFloatValue(HUMI, 2, SENSOR1_ID);

float UVS = uv;
postFloatValue(UVS, 1, UVSENSOR_ID);

float PRESS = hpa;
postFloatValue(PRESS, 1, PRESSURESENSOR_ID);

float LICHT = lux;
postFloatValue(LICHT, 1, SENSOR2_ID);

}
}

void postFloatValue(float measurement, int digits, String sensorId)
{ 
  //Float zu String konvertieren
  char obs[10]; 
  dtostrf(measurement, 5, digits, obs);
  //Json erstellen
  String jsonValue = "{\"value\":"; 
  jsonValue += obs; 
  jsonValue += "}";  
  //Mit OSeM Server verbinden und POST Operation durchführen
  Serial.println("-------------------------------------"); 
  
  Serial.print("Connectingto OSeM Server..."); 
  if (client.connect(server, 8000)) 
  {
    Serial.println("connected!");
    Serial.println("-------------------------------------");     
    //HTTP Header aufbauen
    client.print("POST /boxes/");client.print(senseBox_ID);client.print("/");client.print(sensorId);client.println(" HTTP/1.1");
    client.println("Host: www.opensensemap.org"); 
    client.println("Content-Type: application/json"); 
    client.println("Connection: close");  
    client.print("Content-Length: ");client.println(jsonValue.length()); 
    client.println(); 
    
    //Daten senden
    client.println(jsonValue);
  }else 
  {
    Serial.println("failed!");
    Serial.println("-------------------------------------"); 
  }
  //Antwort von Server im seriellen Monitor anzeigen
  waitForServerResponse();
}

void waitForServerResponse()
{ 
  //Ankommende Bytes ausgeben
  boolean repeat = true; 
  do{ 
    if (client.available()) 
    { 
      char c = client.read();
      Serial.print(c); 
    } 
    //Verbindung beenden 
    if (!client.connected()) 
    {
      Serial.println();
      Serial.println("--------------"); 
      Serial.println("Disconnecting.");
      Serial.println("--------------"); 
      client.stop(); 
      repeat = false; 
    } 
  }while (repeat);
}

```

## OpenSenseMap Registrierung

![Schritt1]  Die Registrierung der senseBox startet mit dem Anlegen eines Users, hierzu gibt man seinen Name, Vornamen und die dazugehörige E-Mail Adresse an.

---

![Schritt2] In dem Schritt "Meine Box" legt man den Namen dieser Station und den Geplanten Aufstellungsort fest. Optional kann man noch einen Gruppennamen bestimmen, hier rüber lassen sich später genau die Messdaten dieser Gruppe herausfiltern, dies ist daher für Gruppenprojekte sinnvoll.

---

![Schritt3]  Der Schritt 3 "Standort" bildet eine Karte ab, in der ein Standort der senseBox frei gewählt werden kann. 

---

![Schritt4]  In diesem Schritt "Hardware Setup" legt man genau die Sensoren fest, welche später auf der [OpenSenseMap](http://opensensemap.org/) veröffetnlicht werden sollen. Das nächste Bild zeigt ein Beispiel solcher Sensoren. 

---

![Sensoren_Registrierung]  Dies sind die registrierten Sensoren

---

![Schritt5]  Das Ende der Registrierung, ist der "Download", hier werden noch mal alle Nutzer und senseBox Daten angezeigt. Nachdem die Registrierung mit -> Abschgließen <- beendet wurde, wird eine Mail an die angegebene Mail-Adresse gesendet, in der sich ein Teil-Code für die senseBox befindet. Dieser Code muss danach noch ggf. erweitert werden.

## Stationsaufbau
Die Station wurde auf einem Balkon, in süd-westlicher Lage in der Nähe des Aasee´s aufgestellt. Es ist eine direkte Sonneneinstrahlung und eine Luftzirkulation gesichert, wie auf den Bildern zu erkennen.

![BOX_Aufstellung]

## Kontakt
Philipp Pfeiffer - p_pfei03@uni-muenster.de

Lukas Jahnich - lukas.jah96@gmx.de

10.04.2016
