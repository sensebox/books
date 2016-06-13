# UV-Licht Sensor 

## Ziele der Station
In dieser Station verwenden wir einen UV-Lichtsensor, um die intensität des UV-Lichts in Mikrowatt je Quadratzentimeter zu erfassen. Anschließend wollen wir den Wert in den UV-Index umrechnen. 

## Materialien
* UV-Licht Sensor `VEML6070-Breakout`

## Grundlagen
 Ultraviolettstrahlung (UV-Licht) ist für den Menschen unsichtbare elektromagnetische Strahlung mit einer Wellenlänge, die kürzer ist als die des für den Menschen sichtbaren Lichtes, aber länger als die der Röntgenstrahlung. UV-Licht umfasst die Wellenlängen von 100 nm bis 380 nm. Wegen der Absorption in der Erdatmosphäre insbesonders in der Ozonschicht dringt UV-A- und wenig UV-B-Strahlung mit einer Wellenlänge unterhalb 300 nm bis zur Erdoberfläche vor. UV-Licht wird in Mikrowatt je Quadratzentimeter (uW/cm²) gemessen. Unser Sensor misst im Bereich von ca. 300nm bis 400 nm (Für genauere Angaben beachte das Datenblatt).

## Aufbau
<img src="https://raw.githubusercontent.com/sensebox/resources/master/images/edu//projekt_uv_ligth.png?raw=true" width="500"/>


Schließe den Sensor an wie es in der Grafik zu sehen ist. Um über den I2C Bus auf den Sensor zugreifen zu können müssen wir die Bibliothek `Wire.h` impotieren und die Adresse des Sensors als Konstante definieren. Wir benötigen weitere Konstanten um das Auslesen des Sensors zu ermöglichen. Wir benötigen noch einen Reverenzwert um die Messwerte in den UV-Index umrechnen zu können.

```
#include <Wire.h>

#define I2C_ADDR_UV 0x38
//Integration Time
#define IT_1_2 0x0 //1/2T
#define IT_1   0x1 //1T
#define IT_2   0x2 //2T
#define IT_4   0x3 //4T

// Reference Value: 0,01 W/m2 is equivalent to 0.4 at UV-Index
float refVal = 0.4;
```
Jetzt können wir unser Programm in der  `setup` Methode konfigurueren.

```
void setup()
{
  Serial.begin(9600);
 
  Wire.begin();
  Wire.beginTransmission(I2C_ADDR_UV);
  Wire.write((IT_1<<2) | 0x02);
  Wire.endTransmission();
  delay(500);
}
```

In der `loop` Methode schreiben wir unser Hauptprogramm:

```
void loop()
{
  byte msb=0, lsb=0;
  uint16_t uv;

  Wire.requestFrom(I2C_ADDR_UV+1, 1); //MSB
  delay(1);
  if(Wire.available())
    msb = Wire.read();

  Wire.requestFrom(I2C_ADDR_UV+0, 1); //LSB
  delay(1);
  if(Wire.available())
    lsb = Wire.read();

  uv = (msb<<8) | lsb;
  
  
 
  Serial.print("uW je cm²: ");
  Serial.println(uv, DEC); //output in steps (16bit)
  Serial.print("UV-Index: ");
  Serial.println(getUVI(uv));

  delay(1000);
}
```
**Achtung:** Falls ihr das Programm kompiliert bevor ihr die Methode `getUVI()` programmiert, wird euch eine Fehlermeldung aus gegeben. 

Da im Alltag häufig mit dem UV-Index gearbeitet wird wollen wir nun eine Methode schreiben, welche uns denn Messwert umrechnet.

```
/* 
 * getUVI() 
 * erwartet den Messert des UV-Sensor als Eingabeparameter 
 * und gibt den entsprechenden Wert auf dem UV-Index zurück
 */
float getUVI(int uv){
	float uvi = refVal*(uv*5.625)/1000;
	return uvi;
}
```
## Aufgabe
