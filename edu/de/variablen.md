# Variablen

Um Daten in Programmen festzuhalten, verwendet man Variablen. Eine Variable ist ein Speichercontainer, der über seinen Namen angesprochen werden kann und in dem Werte abgelegt werden können. Auf Variablen kannst du sowohl lesend als auch speichernd zugreifen, ihr Wert ist also variabel. Eine Variable hat immer einen zugeordneten Datentyp, folgende sind für die Arduinoprogrammierung wichtig:

| Variablentyp | Bedeutung     | Beschreibung  |
| -------------	|-------------	| -----	|
| array	| Variablenfeld			| mehrere Werte eines Variablentyps können gespeichert werden |
| boolean | wahr o. falsch		| Kann nur zwei Werte annehmen, 1 oder 0.		|
| char	| Character				| Alphanumerische Zeichen (Buchstaben, Zahlen, Sonderzeichen)		|
| byte	| ganze Zahlen     		| ganze Zahlen von 0 bis 255 	|
| int 	| ganze Zahlen			| ganze Zahlen von -32.758 bis 32.767 |
| long	| ganze Zahlen			| ganze Zahlen von - 2 Milliarden bis 2 Milliarden |
| float | Fließkommazahlen		| gebrochene Zahlen |

Variablen werden in einem Arduino Sketch noch vor dem `voidloop()` den jeweiligen Befehl (siehe unten) einfügt.

### array

Ein Array ist eigentlich kein wirklicher Datentyp, es ist viel mehr ein Sammlung mehrerer Varibalen eines Typs.

``` 
int TestArray[5] = {5, 10, 15, 20, 15};
```
Im Beispiel wird ein Array vom Typ integer angelegt, da Zahlen gespeichert werden sollen. Die 5 in eckigen Klammern hinter dem Namen der Variable legt die Anzahl an Speicherplätzen fest.

In einem Programm lässt sich dann auf die verschiedenen Speicherplätze des Arrays zugreifen. Die erste Stelle im Array wird mit Stelle 0 `meinArray[0]`, in unserem Beispiel also die 5, angesprochen und so weiter.

```
analogWrite(Pin, TestArray [0]);
```

### boolean

Ein Boolean kann nur zwei Werte annehmen, wahr oder falsch (true or false). Die 0 steht in diesem Fall für den Startwert der Variable. 

```
boolean Test = 0;
```

### char

Um beispielsweise einen Buchstaben zu speichern benötigt man den Datentyp char. Der Wert wird einfach in Anführungszeichen übergeben.

```
char Test = 'a';
```

### byte

Ein Byte speichert eine 8-bit große, vorzeichenlose Zahl von 0 bis 255.

```
byte Test = B10010; 
```
Das "B" kennzeichnet, dass die Folgende Zahlenfolge im Binärcode geschrieben ist (B10010 = 18 dezimal)
### int

Der Datentyp int speichert ganze Zahlen in einem Wertebereich von -32.768 bis 32.767.

```
int Test = 99;
```

### long

Der Datentyp long ist dann passend wenn der Wertebereich eines Integer nicht mehr aussreicht. Es können ganze Zahlen von -2 Milliarden bis 2 Milliarden gespeichert werden.

```
long TestWert = 99999;
```

### float

Um gebrochene Zahlen zu speichern benötigt man  den Datentyp float.

```
float TestWert = 2.4;
```
