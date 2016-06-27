# Variablen und Datentypen

Um Daten in Programmen festzuhalten, verwendet man Variablen.
Eine Variable ist ein Speichercontainer, der über seinen Namen angesprochen werden kann, und in dem Daten abgelegt werden können.
Auf Variablen lässt sich sowohl lesend als auch schreibend zugreifen, der Wert ist also variabel.
Eine Variable hat immer einen zugeordneten Datentyp, folgende Typen sind für die Arduinoprogrammierung wichtig:

| Datentypen | Bedeutung     | Beschreibung  |
| -------------	|-------------	| ----- |
| boolean | wahr o. falsch		| Kann nur zwei Werte annehmen, 1 oder 0. |
| char	| Character				| Alphanumerische Zeichen (Buchstaben, Zahlen, Sonderzeichen) |
| byte	| ganze Zahlen     		| ganze Zahlen von 0 bis 255 	|
| int 	| ganze Zahlen			| ganze Zahlen von -32.758 bis 32.767 |
| long	| ganze Zahlen			| ganze Zahlen von - 2 Milliarden bis 2 Milliarden |
| float | Fließkommazahlen		| gebrochene Zahlen |
| String| Zeichenkette			| Zeichenkette bestehend aus ASCII Zeichen|
| array	| Variablenfeld			| mehrere Werte des selben Variablentyps können gespeichert werden |

 **Hinweis:** *Beim Programmieren gibt es einige Konventionen, das heißt einige Regeln, auf die man sich geeinigt hat, um die Lesbarkeit von Programmcode zu verbessern. Eine davon ist, dass Name von Variablen immer klein geschrieben werden.*

## So verwendet man die verschiedenen Datentypen

### boolean
Ein Boolean kann nur zwei Werte annehmen, wahr oder falsch (`true` or `false`).

```arduino
boolean testWert = false;
```
Die Zuweisung `= false` steht in diesem Fall für den Startwert der Variable.

### char
Um beispielsweise einen Buchstaben zu speichern benötigt man den Datentyp `char`. Der Wert wird in einfachen Anführungszeichen (`'`) übergeben.

```arduino
char testWert = 'a';
```

### byte
Ein Byte speichert eine 8-bit große, vorzeichenlose Zahl von 0 bis 255.

```arduino
byte testWert  = 18;
byte testWert2 = B10010;
```

Das `B` kennzeichnet, dass die Folgende Zahlenfolge im Binärcode geschrieben ist.
`B10010` entspricht 18 im Dezimalsystem, beide Variablen enthalten also den selben Wert mit unterschiedlicher schreibweise.

### int
Der Datentyp `int` speichert ganze Zahlen in einem Wertebereich von -32.768 bis 32.767.

```arduino
int testWert = 99;
```

### long
Der Datentyp `long` wird dann benötigt, wenn der Wertebereich eines Integer nicht mehr aussreicht. Es können ganze Zahlen von -2 Milliarden bis 2 Milliarden gespeichert werden.

```arduino
long testWert = 9999999;
```

### float
Um gebrochene Zahlen zu speichern benötigt man  den Datentyp `float`.

```arduino
float testWert = 2.4476;
```

### String
Ein String wird folgendermaßen definiert:

```arduino
String testWert = "Hallo Welt";
```

Im Gegensatz zu den Datentypen die ihr zuvor kennen gelernt habt, wird der Bezeichner `String` groß geschrieben.
Darauf müsst ihr achten, sonst erkennt das Programm den Datentyp nicht.
In den meisten Programmiersprachen gibt es primitive Datentypen und höhere Datentypen. Du erkennst sie daran ob ihre Bezeichner klein (primitiver Datentyp) oder groß (höherer Datentyp) geschrieben werden.
Für unsere Anwendungen in der senseBox:edu ist es nicht notwendig zwischen primitiven und höheren Datentypen zu unterscheiden; wenn du später komplexere Anwendungen programmierst, wirst du mehr darüber lernen.
Möchtest du jetzt schon mehr darüber erfahren, dann schaue doch [hier](https://de.wikipedia.org/wiki/Datentyp#Zusammengesetzte_Datentypen "Wikipedia") nach.

### array
Ein Array ist kein eigentlicher Datentyp, sondern viel mehr eine Sammlung mehrerer Varibalen des selben Typs.

```arduino
int testArray[5] = {5, 10, 15, 20, 15};
```

Im Beispiel wird ein Array vom Typ `int` angelegt, da ganze Zahlen gespeichert werden sollen.
Die 5 in eckigen Klammern hinter dem Namen der Variable legt die Anzahl an Speicherplätzen fest.
Arrays auf dem Arduino haben eine feste Größe, und können nicht nachträglich vergrößert werden.

Die Speicherplätze eines Arrays werden bei 0 beginnend durchnummeriert.
In einem Programm lässt sich auf die verschiedenen Speicherplätze des Arrays zugreifen, indem der Index des Speicherplatzes in eckigen Klammern hinter den Variablennamen gestellt wird:

```arduino
Serial.print(testarray[0]); // gibt 5 aus
Serial.print(testarray[4]); // gibt 15 aus
Serial.print(testarray[5]); // erzeugt einen Fehler!
```

# Lebensdauer von Variablen
Eine Variable ist immer in dem Block (innerhalb der geschweifeten Klammern) für das Programm sichtbar, in welchem die Variable definiert wurde.
Man unterscheidet zwischen globalen und lokalen Variablen.
Lokale Variablen sind all diejenigen, welche innerhalb geschweifeter Klammern (meist innerhalb einer Funktion) deklariert wurden.
Globale Variablen werden üblicherweise vor der `setup`-Funktion definiert und sind für das gesamte Programm sichtbar.

**Hinweis:** *Da globale Variablen immer sichtbar sind, verbrauchen sie auch für die gesamte Programmlaufzeit Speicherplatz. Willst Speicherplatz sparen, definiere Variablen nur dort wo du sie benötigst. Wenn du mehr über die Lebensdauer von Variablen erfahren willst, schaue [hier](https://de.wikipedia.org/wiki/Variable_%28Programmierung%29#Lebensdauer_von_Variablen "Wikipedia") nach.*
