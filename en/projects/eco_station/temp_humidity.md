# DIY - Airtemperature & Humidity
To provide the daily weather forecast in TV, web and newspapers, not only satellite imagery is analyzed, but also data from measuring stations on the ground provide important data points.
But how does the measurement and visualization of temperature and humidity values work exactly?

## Required Reading
- [Usage of Software-Libraries](../../basics/software_libraries.md)
- [serial data bus I²C](../../basics/i2c.md)
- [Serial Monitor](../../basics/serial_monitor.md)

## Aim of this lesson
In this lesson we measure and display air-temperature and -humidity using the HDC1008 sensor.

## Materials
- combined temperature and humidity sensor `HDC1008`

## Basics
The `HDC1008` from *Texas Instruments* series *HDX100X* combines two sensors on one breakout board:
It can measure relative air-humidity from 0% - 100% and temperature from -40°C to 125°C with an accuracy of ±4% and ±0.2°C respectively.

Communication between Arduino and HDC1008 is handled on the serial bus I²C.
Unlike simple analog or digital signals, with I²C multiple devices (like sensors or displays) may communicate on the same cables through a parallel circuitry.
Each device has therefore a unique identifier that is used to separately address it in communications.

## Construction
Connect the devices as shown in the graphic below.
<img src="https://raw.githubusercontent.com/sensebox/resources/master/images/edu/aufbau_station_5.png" width="500"/>

## Program
Before starting to write code, we need to install the `HDC100X.h` library. If you have not done this in one of the previous chapters, you should follow the chapter [Software Installation](../../getting_started/software_installation.md).

This library allows us to conveniently speak to the sensor, without manually defining all the configuration registers.
To be able to use this library, it has to be included at the top of the program with an `#include` directive.
In this case we additionally require the `Wire.h` library to use the I²C bus:

```arduino
#include <Wire.h>
#include <HDC100X.h>
```

> ***Hint:*** *Unlike expressions, a directive (beginning with `#`) does **not** end with a semicolon.*

The rest of the program may now use the included functions from these libraries.

In order to connect to the sensor, the HDC100X library needs to know the I²C address of the sensor. The HDC1008 listens to the address `0x43` (see [datasheet](https://github.com/sensebox/resources/raw/master/datasheets/datasheet_hdc1008.pdf)).
```arduino
HDC100X hdc(0x43);
```

With this command we created an instance `hdc` of the sensor, on which we can call functions to talk to the sensor.

In the `setup()` function we initialize the sensor, telling it to measure both temperature and humidity, each with a resolution of 14 bit, and to disable the sensors integrated heater:
```arduino
hdc.begin(HDC100X_TEMP_HUMI, HDC100X_14BIT, DISABLE);
```

Now we may request measurements of the sensor in the `loop()` function using the following two commands:
```arduino
hdc.getHumi();
hdc.getTemp();
```

> ***Hint:*** *These functions return the measured value as `float`. Be sure that the variables you want to store the measurements in has the correct data type!*

## Exercise 1
Build the circuit thats depicted above and try to read measurements from the HDC1008 sensor.
Print the measured values to the serial monitor.

***Hint:*** *If you're stuck, have a look at the example thats included in the folder of the `HDC100X.h` library.*
