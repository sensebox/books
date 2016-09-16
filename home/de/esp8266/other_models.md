# senseBox:home mit anderen ESP8266 Varianten

Wie Eingangs schon erwähnt, ist der ESP8266 Mikrokontroller weitestgehend mit dem Arduino kompatibel.
Die senseBox verwendet den I²C Bus um mit den Sensoren zu kommunizieren.
Dieser verwendet standardmäßig Pin 4 (`SDA`) und 5 (`SCL`).

## ESP8266-01

Das Modell 01 des ESP8266 hat nur Pin 0 und 2 auf der Hardware verfügbar.
Hier muss zum initialisieren des I²C Bus `Wire.begin(0, 2)` verwendet werden.

### Hinweise zum Debuggen

- Leuchtet die Blaue LED auf, kommen Daten auf dem RX Pin an
- Beim Booten gibt der Bootloader des ESP Debuginformationen mit 74880 Baud aus, anschließend läuft NodeMCU (sofern installiert) mit 115200 Baud.

Der ESP hat verschiedene **Bootmodi**, welche über die Spannung an GPIO `0` und `2` gewählt werden.
Um den ESP normal zu booten, sodass dieser sein Programm ausführt, benötigen beide Pins einen Pullup auf 3.3V.
Um ein Programm auf den ESP zu schreiben muss der UART-Modus verwendet werden, welcher mit einem Pulldown auf `GPIO 0` und einem Pullup auf `GPIO 2` aktiviert wird.

> - *Siehe [hier](https://learn.sparkfun.com/tutorials/pull-up-resistors) für Informationen zu Pullup-Widerständen.*
> - *Siehe [hier](https://github.com/esp8266/Arduino/blob/master/doc/boards.md#boot-messages-and-modes) für Informationen zu den Bootmodi des ESP8266.*

## TTL-bridge über Arduino

Die kompakteren ESP Modelle haben meist keinen USB Anschluss über welchen der serielle Port des Mikrokontrollers angesprochen werden könnte.
Um solche Boards zu programmieren ist eine separater USB-TTL-converter notwendig.
Falls gerade keine dedizierte Hardware vorliegt, kann ein Arduino dazu zweckentremdet werden!

Legt man den `RST` Pin des Arduinos auf `GND`, wird effektiv der Prozessor des Arduinos deaktiviert.
Dadurch geben die Pins `0` und `1` die Signale des seriellen Busses unverändert weiter.

Da Arduinos meist mit 5V und ESPs mit 3,3V arbeiten, muss die Spannung der Signale auf ein einheitliches Level gebracht werden:
Am einfachsten wird dazu der `RX`-Output des Arduinos durch einen Voltage-Divider auf 3,3V gebracht.
Die `TX` Leitung kann direkt verbunden werden, da der Arduino auch 3,3V-Spannungen als `HIGH` versteht.
Die vollständige Schaltung sieht also wie folgt aus:

![arduino-ttl-bridge schematic](https://raw.githubusercontent.com/sensebox/resources/master/images/esp8266/arduino-ttl-bridge_schematic.png)

> **Hinweis:**  Der `3.3V`-Pin des Arduinos stellt nicht genügend Strom bereit, um den ESP8266 zu betreiben. Hierzu sollte eine separate Stromversorgung (3,3V!) verwendet werden!

Nun kann der Rechner mit dem ESP direkt kommunizieren. Zum Testen einfach den seriellen Monitor der Arduino IDE öffnen, und Kommandos an den ESP schicken!
