# Variablen und Datentypen

Um Daten in Programmen festzuhalten, verwendet man Variablen. Eine Variable ist ein Speichercontainer, der über seinen Namen angesprochen werden kann und in dem Werte abgelegt werden können. Auf Variablen kannst du sowohl lesend als auch speichernd zugreifen, ihr Wert ist also variabel. Eine Variable hat immer einen zugeordneten Datentyp, folgende sind für die Arduinoprogrammierung wichtig:

| Datentypen | Bedeutung     | Beschreibung  |
| -------------	|-------------	| -----	|
| array	| Variablenfeld			| mehrere Werte des selben Variablentyps können gespeichert werden |
| boolean | wahr o. falsch		| Kann nur zwei Werte annehmen, 1 oder 0.		|
| char	| Character				| Alphanumerische Zeichen (Buchstaben, Zahlen, Sonderzeichen)		|
| byte	| ganze Zahlen     		| ganze Zahlen von 0 bis 255 	|
| int 	| ganze Zahlen			| ganze Zahlen von -32.758 bis 32.767 |
| long	| ganze Zahlen			| ganze Zahlen von - 2 Milliarden bis 2 Milliarden |
| float | Fließkommazahlen		| gebrochene Zahlen |
| String| Zeichenkette			| Zeichenkette bestehend aus ASCII Zeichen|

 **Hinweis:** *Beim Programmieren gibt es einige Konventionen, das heißt einige Regeln, auf die man sich geeinigt hat, um die Lesbarkeit von Programmcode zu verbessern. Eine davon ist, dass Name von Variablen immer kleine geschrieben werden.*

## So verwendet man die verschiedenen Datentypen

### array

Ein Array ist eigentlich kein wirklicher Datentyp, es ist viel mehr ein Sammlung mehrerer Varibalen eines Typs.

```
int testArray[5] = {5, 10, 15, 20, 15};
```
Im Beispiel wird ein Array vom Typ integer angelegt, da Zahlen gespeichert werden sollen. Die 5 in eckigen Klammern hinter dem Namen der Variable legt die Anzahl an Speicherplätzen fest.

In einem Programm lässt sich dann auf die verschiedenen Speicherplätze des Arrays zugreifen. Die erste Stelle im Array wird mit Stelle 0 `meinArray[0]`, in unserem Beispiel also die 5, angesprochen und so weiter.

```
analogWrite(Pin, testArray [0]);
```

### boolean

Ein Boolean kann nur zwei Werte annehmen, wahr oder falsch (true or false). Die 0 steht in diesem Fall für den Startwert der Variable.

```
boolean testWert = 0;
```

### char

Um beispielsweise einen Buchstaben zu speichern benötigt man den Datentyp char. Der Wert wird einfach in einfachen Anführungszeichen übergeben.

```
char testWert = 'a';
```

### byte

Ein Byte speichert eine 8-bit große, vorzeichenlose Zahl von 0 bis 255.

```
byte testWert = B10010;
```
Das "B" kennzeichnet, dass die Folgende Zahlenfolge im Binärcode geschrieben ist (B10010 = 18 dezimal)
### int

Der Datentyp int speichert ganze Zahlen in einem Wertebereich von -32.768 bis 32.767.

```
int testWert = 99;
```

### long

Der Datentyp long ist dann passend wenn der Wertebereich eines Integer nicht mehr aussreicht. Es können ganze Zahlen von -2 Milliarden bis 2 Milliarden gespeichert werden.

```
long testWert = 99999;
```

### float

Um gebrochene Zahlen zu speichern benötigt man  den Datentyp float.

```
float testWert = 2.4;
```
### String

Ein String wird folgendermaßen Definiert:
```
String testWert = "Hallo Welt";
```

Im Gegensatz zu den Datentypen die ihr zuvor kennen gelernt habt, wird der Bezeichner `String` groß geschrieben. Darauf müsst ihr achten, sonst erkennt das Programm den Datentyp nicht. In den meisten Programmiersprachen gibt es primitive Datentypen und höhere Datentypen. Du erkennst sie daran ob ihre Bezeichner klein (primitiver  Datentyp) oder groß (höherer Datentyp) geschrieben werden. Für unsere Anwendungen in der sensBox::edu ist es nicht notwendig zwischen primitiven und höheren Datentypen zu unterscheiden, wenn du später komplexere Anwendungen programmierst, wirst du mehr darüber lernen. Möchtest du jetzt schon mehr darüber erfahren, dann schaue doch [hier](https://de.wikipedia.org/wiki/Datentyp#Zusammengesetzte_Datentypen "Wikipedia")

## Lebensdauer von Variablen

Eine Variable ist immer in dem Block (innerhalb der geschweifeten Klammern) für das Programm sichtbar, in denen die Variabel definiert wurde. Man unterscheidet zwischen globalen udn lokalen Variablen. Globale Variablen sind all diejednigen die inerhalb geschweifeter Klammern deklariert wurden. Globale Variablen werden üblicherweise vor der Loop-Funktio definiert und sind für das gesammte Programm sichtbar. 

**Hinweis:** *Da Global Variablen immer sichtbar sind, verbrauchen sie auch für die gesamte Programmlaufzeit Speicherplatz. Willst Speicherplatz sparen definiere Variablen nur dort wo du sie benötigst. Wenn du mehr über die Lebensdauer von Variablen erfahren willst, schaue [hier](https://de.wikipedia.org/wiki/Variable_%28Programmierung%29#Lebensdauer_von_Variablen "Wikipedia")*