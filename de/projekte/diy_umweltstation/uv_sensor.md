# DIY - UV-Licht Sensor

## Ziele der Station
In dieser Station verwenden wir einen UV-Lichtsensor, um die Intensität des UV-Lichts in Mikrowatt je Quadratzentimeter (μW / cm²) zu erfassen.
Anschließend wollen wir den Wert in den UV-Index umrechnen.

## Materialien
* UV-Licht Sensor `VEML6070`

## Grundlagen
Ultraviolettstrahlung (UV-Licht) ist für den Menschen unsichtbare elektromagnetische Strahlung mit einer Wellenlänge, die kürzer ist als die sichtbaren Lichtes, aber länger als die der Röntgenstrahlung.
UV-Licht umfasst die Wellenlängen von 100 nm bis 380 nm.
Wegen der Absorption in der Erdatmosphäre - insbesondere in der Ozonschicht - dringt nur wenig UV-B-Strahlung (100 - 300 nm) bis zur Erdoberfläche vor.
UV-A-Strahlung (300 - 380 nm), welche weniger gefährlich für die menschliche Haut ist, wird weniger durch die Atmosphäre absorbiert.

UV-Lichtintensität wird in Mikrowatt je Quadratzentimeter (μW / cm²) gemessen.
Unser Sensor misst im Bereich von ca. 300 - 400 nm, nimmt also nur UV-A Strahlung auf (für genauere Angaben beachte das [Datenblatt](https://github.com/sensebox/resources/raw/master/datasheets/datasheet_veml6070-UV-A-Light-Sensor.pdf)).

## Aufbau
<img src="https://raw.githubusercontent.com/sensebox/resources/master/images/edu//projekt_uv_ligth.png?raw=true" width="500"/>

Schließe den Sensor an den Arduino an, wie es in der Grafik dargestellt ist.

Um über den I²C Bus auf den Sensor zugreifen zu können, müssen wir die Bibliothek `Wire.h` importieren und die Adresse des Sensors als Konstante definieren.
Wir benötigen weitere Konstanten um das Auslesen des Sensors zu ermöglichen, sowie einen Referenzwert um die Messwerte in den UV-Index umrechnen zu können:

```arduino
#include <Wire.h>

#define I2C_ADDR_UV 0x38
// Integrationszeit
#define IT_1_2 0x0 //1/2T
#define IT_1   0x1 //1T
#define IT_2   0x2 //2T
#define IT_4   0x3 //4T

// Referenzwert: 0,01 W/m2 ist äquivalent zu 0.4 als UV-Index
float refVal = 0.4;
```

Jetzt können wir unser Programm in der `setup`-Funktion konfigurieren.

```arduino
void setup() {
  Serial.begin(9600);

  Wire.begin();
  Wire.beginTransmission(I2C_ADDR_UV);
  Wire.write((IT_1<<2) | 0x02);
  Wire.endTransmission();
  delay(500);
}
```

In der `loop`-Funktion schreiben wir unser Hauptprogramm:

```arduino
void loop() {
  byte msb=0, lsb=0;
  uint16_t uv;

  Wire.requestFrom(I2C_ADDR_UV+1, 1); // MSB (erstes byte am sensor lesen)
  delay(1);
  if(Wire.available())
    msb = Wire.read();

  Wire.requestFrom(I2C_ADDR_UV+0, 1); // LSB (zweites byte am sensor lesen)
  delay(1);
  if(Wire.available())
    lsb = Wire.read();

  uv = (msb<<8) | lsb;   // bytes durch Bitshift zu einer Zahl verbinden

  Serial.print("uW je cm²: ");
  Serial.println(uv, DEC);            // Ausgabe als 16bit integer
  Serial.print("UV-Index: ");
  Serial.println(getUVI(uv));

  delay(1000);
}
```

> ***Achtung:*** *Falls ihr das Programm kompiliert bevor ihr die Methode `getUVI()` programmiert (siehe unten), wird euch eine Fehlermeldung ausgegeben.*

Da im Alltag häufig mit dem [UV-Index](https://de.wikipedia.org/wiki/UV-Index) gearbeitet wird, wollen wir nun eine Methode schreiben, welche uns den Messwert in einen UV-Index umrechnet:

```arduino
/*
 * getUVI()
 * erwartet den Messert des UV-Sensors als Eingabeparameter
 * und gibt den entsprechenden Wert auf dem UV-Index zurück
 */
float getUVI(int uv){
  float uvi = refVal*(uv*5.625)/1000;
  return uvi;
}
```
