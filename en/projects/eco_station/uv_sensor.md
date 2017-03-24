# DIY - UV-Light Sensor
Solar Radiation in the ultraviolet (UV) spectrum can get hazardous to the skin very quickly.
Because official weather stations rarely measure the UV-intensity, we want to measure the UV-light ourselves!

## Aim of this lesson
In this station we are using an UV-light sensor to detect the amount of solar radiation in the UV-spectrum as power per area (μW / cm²).

Additionally, we convert the measured value to the standardized UV-Index which is easier to comprehend.

## Materials
* UV-Light Sensor `VEML6070`

## Basics
Ultraviolet "light" is a kind of radiation that is invisible to the human eye.
It has a shorter wavelength than visible light, but longer than that of X-rays:
The spectrum is defined from 100 nm to 380 nm.

Through absorption of the earth's athmosphere in the ozone layer, the solar radiation in the UV-B spectrum (100 - 300 nm) does barely reach the earth's surface.
The less dangerous UV-A radiation (300 - 380 nm) is far less absorbed by the athmosphere.

UV-light intensity is measured in microwatts per square-centimeter (μW / cm²).
Our `VEML6070` sensor measures radiation from round about 300 - 400 nm, so it can only detect UV-A radiation (for more precise information, consider the [datasheet](https://github.com/sensebox/resources/raw/master/datasheets/datasheet_veml6070-UV-A-Light-Sensor.pdf)).

## Construction
<img src="https://raw.githubusercontent.com/sensebox/resources/master/images/edu//projekt_uv_ligth.png?raw=true" width="500"/>

Connect the VEML6070 sensor to the Arduino as shown in the graphic above.

## Program
To communicate with the sensor via the I²C bus, we need to import the `Wire.h` library.
We also need some constants that define the sensor's I²C address and some configuration of the sensor.
Additionally we define a reference value for the conversion of the measurement to a UV-index.

```arduino
#include <Wire.h>

#define I2C_ADDR_UV 0x38
// integration times
#define IT_0_5 0x0 // 0.5 T
#define IT_1   0x1 // 1 T
#define IT_2   0x2 // 2 T
#define IT_4   0x3 // 4 T

// reference value: 0.01 W/m^2 corresponds to the UV-index 0.4
float refVal = 0.4;
```

Now we configure our sensor in the `setup()` function.

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

In the `loop()` function we define the behaviour of our main program to read out the sensor at an interval:

```arduino
void loop() {
  byte msb=0, lsb=0; // first and second byte that will be read from the sensor
  uint16_t uv;

  Wire.requestFrom(I2C_ADDR_UV+1, 1); // MSB (read first byte from sensor)
  delay(1);
  if(Wire.available()) {
    msb = Wire.read();
  }

  Wire.requestFrom(I2C_ADDR_UV+0, 1); // LSB (read second byte from sensor)
  delay(1);
  if(Wire.available()) {
    lsb = Wire.read();
  }

  uv = (msb<<8) | lsb; // combine bytes to an integer through a bitshift op

  Serial.print("μW per cm²: ");
  Serial.println(uv, DEC);     // log value as 16bit integer
  Serial.print("UV-Index: ");
  Serial.println(getUVI(uv));

  delay(1000);
}
```

> ***Attention:*** *If you compile the program before defining the function `getUVI()` (see below), you will recieve a error message.*

Because we can hardly relate power-per-area measurements in everyday life, we want to convert our measurements to the more widely used [UV-index](https://en.wikipedia.org/wiki/Ultraviolet_index).
To do this, we implement a function `getUVI()`:

```arduino
/*
 * getUVI()
 * expects the measurement value from the UV-sensor as input
 * and returns the corresponding value on the UV-index
 */
float getUVI(int uv) {
  float uvi = refVal * (uv * 5.625) / 1000;
  return uvi;
}
```
