# senseBox:home mit allen anderen ESP8266

Wie Eingangs schon erwähnt, ist der ESP8266 Mikrokontroller weitestgehend mit dem Arduino kompatibel.
Die senseBox verwendet den I²C Bus um mit den Sensoren zu kommunizieren.
Dieser verwendet standardmäßig Pin 4 (`SDA`) und 5 (`SCL`).

## Variante ESP8266-01

Das Modell 01 des ESP8266 hat nur Pin 0 und 2 auf der Hardware verfügbar.
Hier muss zum initialisieren des I²C Bus `Wire.begin(0, 2)` verwendet werden.

`WIP`
