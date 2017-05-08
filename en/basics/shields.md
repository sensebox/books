# Arduino Shields

A shield is a board that can be plugged into the top of an Arduino to extend its functionalities. You can easily plug a shield into the pins of an Arduino to get a compact and modular upgrade.

You can find a shield inside the box of the senseBox:edu created for internet connection. Depending on your version, you will see a red ethernet shield or a blue WiFi shield to connect your senseBox to the internet via ethernet or WLAN.


Additionally you will find a green senseBox shield on which a [real-time clock](rtc.md), a microSD card reader and further connections are mounted.

## Features of the ethernet shield
Our ethernet shield is a modified version of the official arduino shield. Therefore, the official `Ethernet.h` library will not work. Please use our versions of this library (see [Downloads](../downloads.md)).

> ***Please note:*** *After installing our library, the Arduino IDE will most likely ask you to update the ethernet library. Please refuse this.*

## Related topics
- [real-time clock](rtc.md) (coming soon!)
- [SD card logger](sd-datalogger.md) (coming soon!)
- [openSenseMap upload](osem_upload.md)
