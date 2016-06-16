# Glossar

## Arduino
Der Arduino ist ein quelloffenes Mikrocontroller-Board, auf welchem ein Microcomputer sowie mehrere digitale und analoge Eingänge integriert sind.

## Wattuino
Der Wattuino UNO wurde in älteren Versionen der senseBox verwendet und entspricht weitgehend dem Arduino UNO, wird aber in Deutschland von <a href="http://www.watterott.com/">Watterott electronic</a> hergestellt.

## Genuino
Genuino ist der aufgrund von Lizenzverfahren in Europa verwendete Vertriebsname von Arduino.

## BMP280
Der BMP280 ist ein Luftdruck- und Temperatursensor, welcher in der senseBox auf einem Breakoutboard installiert ist.
Er wird über I²C angesteuert und hat die dort die Adresse 0x77.
Betriebsspannung 3 - 5.5V.
<a href="https://github.com/sensebox/resources/raw/master/datasheets/datasheet_BMP280-pressure-sensor.pdf">Datenblatt</a>

## VEML6070
Der VEML6070 ist ein UV-Intensitäts-Sensor, welcher in der senseBox auf einem Breakoutboard installiert ist.
Er wird über I²C angesteuert und hat die dort die Adressen 0x38 und 0x39.
Betriebsspannung 2.7 - 5V.
<a href="https://github.com/sensebox/resources/raw/master/datasheets/datasheet_veml6070-UV-A-Light-Sensor.pdf">Datenblatt</a>

## HDC1008
Der HDC1008 ist ein Luftfeuchte- und Temperatursensor, welcher in der senseBox auf einem Breakoutboard installiert ist.
Er wird über I²C angesteuert und hat die dort die Adresse 0x43.
Betriebsspannung 3.3 - 5V.
<a href="https://github.com/sensebox/resources/raw/master/datasheets/datasheet_hdc1008.pdf">Datenblatt</a>

## RV8523
Die RV8523 ist eine Realtimeclock (RTC), welche durch eine separate Stromversorgung (Knopfbatterie) dem Arduino immer die aktuelle Zeit angibt.
Die RTC ist auf dem senseBox-Shield integriert und wird über I²C unter der Adresse 0x68 angesteuert.

## I²C
I²C (Inter-Integrated Circuit) ist ein Protokoll zur digitalen Kommunikation von Geräten auf einem Bus.
Das Protokoll wurde 1982 entwickelt und darauf optimiert, mehrere Geräte mit möglichst wenigen Kanälen ansteuern zu können.
Geräte haben dabei eine bestimmte Adresse, über die sie auf zwei Kanälen SDA (serial data) und SDC (serial clock) angesteuert werden.
Mehrere Geräte können so in Reihe hintereinander an ein Masterdevice (in unserem Fall den Arduino) angeschlossen werden.

## Ethernet-Shield
Das Ethernet-Shield basiert auf dem Wiznet W5500 Ethernet Chip und ermöglicht es den Geduino über ein LAN-Kabel an ein Netzwerk anzuschließen.
Mit dem Reset-Knopf wird sowohl das Shield als auch der Arduino neugestartet.
<a href="https://github.com/sensebox/resources/raw/master/datasheets/datasheet_ethernetchip_w5500.pdf">Datenblatt</a>

## senseBox-Shield
Das senseBox-Shield ist eine Steckplatine, die vom senseBox-Team zusammen mit <a href="http://www.watterott.com/">Watterott electronic</a> entwickelt wurde.
Auf dem Shield ist ein SD-Kartenslot (über Pin 4) und eine Realtimeclock RV8523 mit Batterie verbaut.
Außerdem sind I2C-Steckplätze für die senseBox:home-Sensoren verlötet, welche für die senseBox:edu nicht benötigt werden.
Da der SD-Kartenslot Pin 4 und 10 belegt, sind diese standardmäßig nicht mehr verwendbar.
Benötigt man den SD-Kartenslot nicht, so kann man die Pins mit den Befehlen
pinMode(4, INPUT); digitalWrite(4, HIGH);
freigeben.
<a href="https://github.com/sensebox/resources/raw/master/datasheets/schematics_senseBox-Shield.pdf">Schemazeichnung</a>
