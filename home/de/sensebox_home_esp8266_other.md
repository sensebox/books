# senseBox:home mit allen anderen ESP8266

Wie Eingangs schon erwähnt, ist der ESP8266 Mikrokontroller weitestgehend mit dem Arduino kompatibel. Die senseBox verwendet den I<sup>2</sup>C Bus um mit den Sensoren zu kommunizieren. Dieser verwendet standardmäßig Pin 4(SDA) und 5(SCL).

# ESP Modell 01

Das Modell 01 des ESP8266 hat nur Pin 0 und 2 herausgeführt. Hier muss zum initialisieren des I<sup>2</sup>C Bus `Wire.begin(0, 2)` verwendet werden.

