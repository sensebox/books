# Arbeiten mit der Zeit 

## Ziele der Station
In dieser Station lernt ihr, wie man die RTC (Real Time Clock oder Echt Zeit Uhr) die ein Teil des senseBox-Shield ist, benutzt.

## Materialien
* senseBox-Shield

## Aufbau
Steckt das senseBox-Shield vorsichtig auf den Arduino. Für alle weiteren Projekte könnt ihr es auf dem Arduino lassen. 

## Programmierung
Zunächst müssen wir eine Bibliothek für die Uhr importieren. Die Bibliothek wird uns einige Schritte erleichtern. Wir importieren sie mit dem Befehl `#include <RV8523.h>`. Nun muss ein Objekt dieser Bibliothekt erzeug werden. 
```
RV8523 rtc;
```
Bevor die Uhr gestartet wird, sollen einige Variablen erzeug werden, in denen später die Uhrzeit gespeichert wird.
```
//declare variables to store the time 
// in this case we use ´uint8_t´ wich is an integer the size of 1 bite (8bit)
// therefor it can store values from 0 to 255 (2^8 -1)
// the reason to use them is to safe storagespace. ´int`would also work fine
uint8_t sec, min, hour, day, month;

// the number of years is bigger than 255 therefore we can't use `uint8_t` 
// `uint16_t` has 2 bite (16 bit)
// it can store the values from 0 to 65535 (2^16 -1)
uint16_t year; 
```
***Hinweis:*** *Der Datentyp `uint8_t` steht für "_u_nsigned (- ohne Vorzeichen) _Int_eger(ganze Zahl) der größe _8_ Bit". Somit kann in einer Variable diesen Typs eine Zahl zwischen 0 und 255 gespeichert werden (2^8 -1). Da unsere heutigen Jahreszahlen größer sind als 255 sind, benötigen wir für die Variable `year` den Typ `uint8_t`*

















