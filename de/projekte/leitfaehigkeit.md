# Leitfähigkeit-Sensor

## Ziel der Station
In dieser Station bauen wir mit Hilfe eines Widerstandes und einfachen Elektroden ein Messgerät für die elektrische Leitfähigkeit von Materialien.

## Materialien
- Wiederstand
- Elektroden (die Kabel der senseBox funktionieren hierfür auch!)

## Aufbau
![Aufbau](https://raw.githubusercontent.com/sensebox/resources/master/images/edu/aufbau_leitfaehigkeit.jpg)

Mit dieser Schaltung kann die Leitfähigkeit zwischen den beiden Elektroden gemessen werden.
Du kannst sie entsprechend auf dem Breadboard nachbauen.

In der Programmierung gehen wir davon aus, dass der analoge Eingang 8 verwendet wird.

## Programmierung
Die Programmierung ist analog zur [Fotodiode (LDR)](ldr.md).
Wir verwenden den Befehl `analogRead()` um im ersten Schritt die Spannung am analogen Eingang zu bestimmen.

Diese Spannung wird anschließend in den Widerstand zwischen den Elektroden in Ohm umgewandelt.
Um die Leitfähigkeit in Siemens zu erhalten, muss der Widerstand noch umgewandelt werden.

```arduino
float quellspannung = 5.0;
int analogPin = 8;
int R1 = 150;      // Wert des bekannten Widerstands (150 Ohm)
long messwert;
float spannungR2;  // Spannung über dem zu messenden Widerstand
float widerstand;
float leitfaehigkeit;

void setup() {
  Serial.begin(9600);
}

void loop() {
  messwert = 0;
  for (int i = 0; i < 5; i++) {
    messwert += analogRead(analogPin);
  }

  messwert = trunc(messwert / 5); // Mittelwert von fünf Messungen

  spannungR2 = (quellspannung / 1023.0) * messwert;              // Spannung berechnen
  widerstand = R1 * (spannungR2 / (quellspannung - spannungR2)); // Berechnung: (R2 = R1 * (U2/U1))
  leitfaehigkeit = 1 / (widerstand * 4);
  Serial.println(leitfaehigkeit);
}
```

## Übertragen und Testen
Mit der oben beschriebenen Programmierung solltest du jetzt die Leitfähigkeit in Siemens auslesen können.
Übertrage den Code auf den Arduino und schaue dir die Ausgabe auf dem seriellen Monitor an.
Du kannst nun die Elektroden an verschiedene Materialien halten, und deren elektrische Leitfähigkeit prüfen!
