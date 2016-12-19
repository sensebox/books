# Analoge Signale

Im Gegensatz zu digitalen Signalen können analoge Signale sehr viele Werte zwischen hohem und niedrigen Pegel annehmen.
Die genaue Anzahl der Werte - die Auflösung des digitalen Eingangs - liegt beim Arduino UNO bei 1024 Werten (10 bit).
Beim Arduino UNO entspricht der maximale Pegel 5 V und der niedrige 0 V.
Diese individuellen Spannungswerte können mit den sechs analogen Pins (`A0` - `A5`) des Arduino gemessen werden.

## Aktoren analog ansteuern

Der Befehl `analogWrite()` gibt eine Spannung auf einen angegeben Pin aus.
Er kann benutzt werden um beispielsweise einen Motor in verschiedenen Geschwindigkeiten laufen zu lassen.

Es ist auch möglich an auf digitalen Pins mehrere Spannungswerte auszugeben.
Hierzu generiert der Arduino eine stetige Rechteckwelle mit der gewünschten Einschaltdauer und simuliert so ein analoges Signal (Pulsweitenmodulation oder PWM).
Am Arduino UNO können die Pins 3, 5, 6, 9, 10 und 11 diese Funktion übernehmen. Diese sind jeweils mit einer Tilde gekennzeichnet.
Die Syntax für den Befehl lautet ähnlich wie beim digitalen Gegenstück `analogWrite(pin, <Wert>)`. Der Wert kann zwischen `0` (immer aus) und `255` (immer an) liegen.

Auch hier ist darauf zu achten, den Pin zuvor als `OUTPUT` zu deklarieren.

Ein Beispielhaftes Programm könnte so aussehen:

```arduino
int ledPin = 9; // LED an Pin 9

void setup() {
  pinMode(ledPin, OUTPUT); // deklariere den Pin als Ausgang
}

void loop() {
  analogWrite(ledPin, 60); // Ansteuern der LED
}
```

## Analoge Sensoren auslesen

Der Befehl `analogRead()` liest den Wert von einem analogen Pin.
Die so gemessenen Werte zwischen 0 V und 5 V werden vom eingebauten 10-bit analog zu digital Konverter (ADC) in `integer` Werte zwischen 0 und 1023 umgewandelt, d.h. das Signal verfügt über eine Auflösung von 0.0049 Volt pro Wert.

Das auslesen eines Eingangs dauert etwa 0,0001 Sekunden, es können also etwa 10.000 Messungen pro Sekunde aufgenommen werden.
Es bietet sich an die gemessenen Daten im [seriellen Monitor](der_serielle_monitor.md) anzuzeigen.

Ein beispielhaftes Programm könnte so aussehen:

```arduino
int analogPin = 3;     // Potentiometer an Pin 3
int val = 0;           // Variable um die Messwerte zu speichern

void setup() {
  pinMode(analogPin, INPUT);
  Serial.begin(9600);  //  Start des seriellen Monitors
}

void loop() {
  val = analogRead(analogPin);  // Auslesen des Sensors
  Serial.println(val);          // Ausgeben der Messerwerte
}
```
