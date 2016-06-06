# Analoge Signale

Im Gegensatz zu digitalen Signalen können analoge unendlich viele Werte zwischen hohem und niedrigen Pegel annehmen. Beim Arduino liegt der hohe Pegel näher an 5 V und der niedrige bei 0 V bzw. GND. Diese individuellen Spannungswerte können mit den sechs analogen Ports des Arduino gemessen werden.

## Aktoren analog ansteuern

Der Befehl `analogWrite()` gibt eine Spannung auf einen definieten Pin. Er kann benutzt werden um beispielsweise einen Motor in verschiedenen Geschwindigkeiten laufen zu lassen. Um an einem eigentlich digitalen Port eine analoges Signal zu erhalten generiert der Arduino eine stetige Rechteckwelle mit der gewünschten Einschaltdauer und simuliert so ein analoges Signal (Pulsweitenmodulation). Am Arduino UNO können die Ports 3, 5, 6, 9, 10 und 11 diese Funktion übernehmen. Diese sind jeweils mit einer Tilde gekennzeichnet.
Der Syntax für den Befehl lautet genau wie beim digitalen Gegenstück `analogWrite(pin, Wert)`. Der Wert kann zwischen 0 (immer aus) und 255 (immer an) liegen.
Auch hier ist darauf zu achten, den Port zuvor als OUTPUT zu deklarieren.

Ein Beispielhaftes Programm könnte so aussehen:
```
int ledPin = 9;     		 // LED an Pin 9

void setup(){
  pinMode(ledPin, OUTPUT);   // deklariert den Pin als Ausgang
}

void loop(){
  analogWrite(ledPin, 60);  // Ansteuern der LED
}
```

## Analoge Sensoren auslesen

Der Befehl `analogRead()` liest den Wert von einem analogen Pin. Die so gemessenen analogen Werte zwischen 0 V und 5 V werden vom eingebauten 10-bit analog zu digital Konverter in integer Werte zwischen 0 und 1023 umgewandelt, d.h. das Signal verfügt über eine Auflösung von 0.0049 Volt pro Wert.

Das auslesen eines digitalen Inputs dauert etwa 0,0001 Sekunden, es können also etwa 10.000 Messungen pro Minute aufgenommen werden.
Der Syntax für den Befehl lautet `analogRead(Pin)`. Gemessene Daten können, genau wie bei digitalen Messungen, im [seriellen Monitor](./der_serielle_monitor.md) angezeigt werden.

Ein neispielhaftes Programm könnte so aussehen:
```
int analogPin = 3;     // Potentiometer an Pin 3
int val = 0;           // Variable um die Messwerte zu speichern



void setup()

{

  Serial.begin(9600);          //  Start des seriellen Monitors

}



void loop()

{

  val = analogRead(analogPin);    // Auslesen des Sensors

  Serial.println(val);             // Anzeigen der Messerwerte

}
```