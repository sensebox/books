# Die RTC - Arbeiten mit Zeit

Auf dem senseBox-Shield ist eine RTC (**R**eal **T**ime **C**lock oder Echt Zeit Uhr) installiert.
Sie kann dazu benutzt werden, dauerhaft die aktuelle Uhrzeit zu speichern - auch wenn der Arduino für eine Weile keinen Strom hatte.

## Materialien
* senseBox-Shield
* Knopfzellen-Batterie

## Aufbau
Steckt das senseBox-Shield vorsichtig auf den Arduino. Für alle weiteren Projekte könnt ihr es auf dem Arduino lassen.
Falls die Knopfzelle noch nicht in den Shield eingelegt ist, holt dies nach (flache Seite nach oben).

## Programmierung
Um die Uhr nutzen zu können, müssen wir eine Bibliothek für die Uhr importieren.
Die Bibliothek wird uns einige Schritte erleichtern.
Wir importieren sie mit dem Befehl: `#include <RV8523.h>`.
Nun muss ein Objekt dieser Bibliothek erzeugt werden:
```arduino
RV8523 rtc;
```

Bevor die Uhr gestartet wird, sollen einige Variablen erzeugt werden, in denen später die Uhrzeit gespeichert wird.

```arduino
uint8_t sec, min, hour, day, month;
uint16_t year;
```

**Hinweis:** *Der Datentyp `uint8_t` steht für "**u**nsigned (nur positive Zahlen) **Int**eger(ganze Zahl) der größe **8** Bit".
Somit kann in einer Variable diesen Typs eine Zahl zwischen 0 und 255 gespeichert werden ($$2^8 - 1$$).
Da Jahreszahlen größer als 255 sind, benötigen wir für die Variable `year` den Typ `uint16_t`*

In der `setup`-Methode muss der Uhr beim ersten Start die aktuelle Uhrzeit übergeben werden. Das können wir mit dem Befehl `set()` machen. Außerdem soll noch die serielle Datenübertragung gestartet werden, um später die Uhrzeit auszugeben.

```arduino
rtc.set(10, 24, 8, 20, 4, 2016); // 08:24:10 20.04.2016
rtc.start();
Serial.begin(9600);
```

**Hinweis:** *Die Methode `rtc.set()` muss nur bei der ersten Nutzung der Uhr aufgerufen werden. Dann kann sie aus dem Code gelöscht werden. Die Uhr läuft dank der Batterie auch ohne Strom weiter.*

Nun können wir mit `rtc.get()` die aktuelle Uhrzeit erhalten, und sie beispielsweise auf dem seriellen Monitor ausgeben. Das machen wir in der `loop`-Methode:

```arduino
void loop() {
  // save the current time and date in the variables defined before
  rtc.get(&sec, &min, &hour, &day, &month, &year);

  Serial.print("Zeitstempel: ");
  Serial.print(hour);
  Serial.print(":");
  Serial.print(min);
  Serial.print(":");
  Serial.print(sec);
  Serial.print("  ");
  Serial.print(day);
  Serial.print(".");
  Serial.print(month);
  Serial.print(".");
  Serial.println(year);
  delay(1000);
}
```
