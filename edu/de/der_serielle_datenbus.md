# Der serielle Datenbus

Der Arduino kann über einen Datenbus mit anderen Geräten kommunizieren. Ein Datenbus beschreibt ein System, über das zwei oder mehr Geräte Daten auf eine geordnete Art und Weise austauschen können. Bei unserem Arduino wäre das zweite Geräte fast immer ein Sensor, bzw ein Aktor.

## Der I²C-Bus

Der I²C-Bus ist ein einfach zu verwendender Datenbus um Daten zu übermitteln. Hierbei werden die Daten zwischen dem Arduino und dem anderen Gerät druch zwei Kabel übertragen, die als SDA und SCL bezeichnet werden. Die als SDA (= serial data) bezeichnete Leitung ist die Datenleitung, die welcher die eigentlichen Daten übermittelt werden. Die SCL (= seiral clock) Leitung wird auch Taktleitung genannt und gibt die Taktfrequent vor.
Am Arduino findest du die beiden Anschlüsse nach den digitalen Anschlüssen.

Benutzt man den I²C-Bus auf dem Arduino, gilt der Arduino immer als Master-Gerät und alle anderen Geräte am Bus als Slave. Jeder Slave hat seine eigene Adresse in Form einer Hexadezimalzahl, mit welcher er eindeutig angesprochen werden kann. Für Gewöhnlich bringt jedes Gerät einen Bereich von Busadressen mit, welche man verwenden kann. Die jeweiligen Adressen können im Datenblatt des Herstellers nachgeschaut werden.

Um den I²C-Bus verwenden zu können muss die Wire-Bibliothek (welche in der Arduino IDE enthalten ist) verwendet werden.
Die Bibliothek wird durch den Befehl `#include <Wire.h>` noch vor dem `void setup()` eingebunden und im `void setup()` mit dem Befehl `Wire.begin();` gestartet.

Die Daten werden über den I²C-Bus Byte für Byte übertragen. Um ein Byte zu senden sind drei Befehle erforderlich:

1. `Wire.beginTransmission(Adresse);`

    Mit diesem Befehl wird die Kommunikation eingeleitet. Adresse steht hier für die jeweilige hexadezimale Bus-Adresse des Slave-Gerätes.

2. `Wire.write(Daten);`

    Dieser Befehl sendet ein Byte Daten vom Arduino an der zuvor angesprochene Gerät.

3. `Wire.endTransmission();`

    Mit diesem Befehl wird die Übertragung beendet.

Um nun Daten von einem I²C-Gerät anzufordern benötigt man vier Befehle:

1. `Wire.beginTransmission(Adresse);`

2. `Wire.requestFrom(Adresse,X);`
    
    Bei diesem Befehl steht das X für die Anzahl an Bytes, die angefordert werden.

3. `incoming = Wire.read();`
    
    Mit diesem Befehl speichert man die ankommenden Daten in einer Variable.

4. `Wire.endTransmission();`
   
    Mit diesem Befehl wird die Kommunikation beendet.