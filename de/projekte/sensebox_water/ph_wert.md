# pH-Wert Sensor

## Ziel der Station
In dieser Station sollst eine pH-Elektrode anschließen um den pH-Wert verschiedener Lösungen automatisch bestimmen zu können.

## Materialien
- [pH-Meter Shield](https://www.dfrobot.com/product-1025.html) von Gravity

## Aufbau
Das pH-Meter Board hat neben den Anschlüssen für die Stromversorgung (+ GND) und (- 5V) einen Analogen Ausgang.
Diesen schließen wir am Arduino an den analogen Eingang `A0` an.

## Programmierung
Die Programmierung des pH-Sensors ist sehr änlich zum Auslesen des LDR's. Wir verwenden den Befehl `analogRead()` um das Signal abzufragen.

```arduino
#define SensorPin 0          // pH meter Analog output an Arduino Analog Input A0
unsigned long int avgValue;  // Speichern der Durchschnittsvwerte des Sensors
float b;
int buf[10], temp;

void setup() {
  pinMode(13, OUTPUT);  
  Serial.begin(9600);  
}

void loop() {
  for(int i = 0; i < 10; i++) {     // mache 10 Messungen um einen Mittelwert zu bilden
    buf[i] = analogRead(SensorPin);
    delay(10);
  }

  for(int i = 0; i < 9; i++) {      // sortiere die Messwerte nach Höhe
    for(int j = i+1; j < 10; j++) {
      if(buf[i] > buf[j]) {
        temp = buf[i];
        buf[i] = buf[j];
        buf[j] = temp;
      }
    }
  }

  // Nehme die mittleren 6 Messwerte und berechne den Mittelwert
  avgValue = 0;
  for(int i = 2; i < 8; i++) {                     
    avgValue += buf[i];
  }

  // Umrechnung des Eingangswert in Millivolt
  float phValue = (float)avgValue * 5.0 / 1024 / 6;
  // Umrechnung des Wertes von Millivolt in die pH-Skala
  phValue = 3.5 * phValue;

  Serial.print("    pH:");  
  Serial.print(phValue, 2);
  Serial.println(" ");
  digitalWrite(13, HIGH);       
  delay(800);
  digitalWrite(13, LOW);
}
```

## Übertragen und Testen
Mit der oben beschriebenen Programmierung solltest du jetzt den pH-Wert auslesen können.
Übertrage den Code auf den Arduino und schaue dir die Konsolenausgabe an.

## Aufgaben
- Kalibriere den Sensor mithilfe eines zweiten Messgerätes und einer Maßlösung. Verwende dazu das Potentiometer auf dem pH-Meter Shield.
