# Und täglich grüßt das Murmeltier... 
### Die Verwendung von Schleifen

```arduino 
digiutalWrite(led,HIGH);
digiutalWrite(led,LOW);
digiutalWrite(led,HIGH);
digiutalWrite(led,LOW);
//...
```
Wenn ihr eine LED 50 Mal blinken lassen wollt, dann ist das ganz schön viel Schreibarbeit. Da Informatiker immer nach Wegen suchen Arbeitsabläufe zu vereinfachen haben sie sich dafür etwas überlegt, Schleifen. Schleifen bestehen aus zwei Teilen, einem Schleifen-Kopf und einem Schleifen-Körper. Die Anweisungen die wiederholt werden sollen, werden in Geschweiften Klammern in den Schleifen-Körper geschrieben. Jetzt müssen wir aber noch fest legen, wie oft diese Anweisungen wiederholt werden sollen. Dies geschieht im Schleifen-Kopf.

Es gibt verschiedene Arten von Schleifen, die ihr je nach eurem Programm verwenden könnt. Hier sollen zwei Schleifentypen vorgestellt werden. 

## Die for-Schleife
for-Schleifen werden dann verwendet, wenn man genau weiß, wie oft Anweisungen wiederholt werden sollen. In unserem Beispiel, wissen wir, dass die LED 50 Mal blinken soll. 
Im Kopf einer Vorschleife wird eine Zählvariable erzeugt, dann eine Bedingung angegeben (Wie das aussieht habt ihr schon einmal bei IF-Anweisungen gesehen) und schließlich definiert wie gezählt werden soll.

```arduino
for(int counter = 1; counter < 50; counter = counter+1){
    //lasse die LED blinken
}
```
Im Beispiel heißt unsere Zählvariable `counter` (Natürlich könnt ihr der Zählvariablen jeden Namen geben. Häufig wird `i` benutzt). Die Bedingung lautet: "Solange `counter` kleiner als 50 ist" und nach jedem Durchlauf der Schleife wird `counter` um eins erhöht.
In diesen Fall wird der Schleifen Körper 50 Mal durchlaufen.

**Hinweis:** *Für den Befehl `counter = counter +1` werdet ihr häufig die Kurzschreibweise `counter++` finden. Diese macht das Gleiche.*

### Aufgabe 1 
Schreibt nun eine Anweisung in den Schleifenkörper, die euch den Wert der Zählvariablen über den seriellen Monitor ausgibt. (Wie das geht könnt ihr in der Anleitung "Der serielle Monitor" nachschauen).
### a) 
Untersucht was passiert, wenn ihr `counter = counter + 1` durch `counter = counter*2` oder `counter--` ersetzt.

### b) 
Untersucht was passiert, wenn ihr `int counter = 0` durch `int counter = 25` ersetzt.

## Die while-Schleife
In vielen Fällen wisst ihr zu Beginn noch nicht, wie oft eine Bedingung wiederholt werden soll. Dann könnt ihr die while-Schleife verwenden.

# Und täglich grüßt das Murmeltier... 
### Die Verwendung von Schleifen

```arduino 
digiutalWrite(led,HIGH);
digiutalWrite(led,LOW);
digiutalWrite(led,HIGH);
digiutalWrite(led,LOW);
//...
```
Wenn ihr eine LED 50 Mal blinken lassen wollt, dann ist das ganz schön viel Schreibarbeit. Da Informatiker immer nach Wegen suchen Arbeitsabläufe zu vereinfachen haben sie sich dafür etwas überlegt, Schleifen. Schleifen bestehen aus zwei Teilen, einem Schleifen-Kopf und einem Schleifen-Körper. Die Anweisungen die wiederholt werden sollen, werden in Geschweiften Klammern in den Schleifen-Körper geschrieben. Jetzt müssen wir aber noch fest legen, wie oft diese Anweisungen wiederholt werden sollen. Dies geschieht im Schleifen-Kopf.

Es gibt verschiedene Arten von Schleifen, die ihr je nach eurem Programm verwenden könnt. Hier sollen zwei Schleifentypen vorgestellt werden. 

## Die for-Schleife
for-Schleifen werden dann verwendet, wenn man genau weiß, wie oft Anweisungen wiederholt werden sollen. In unserem Beispiel, wissen wir, dass die LED 50 Mal blinken soll. 
Im Kopf einer Vorschleife wird eine Zählvariable erzeugt, dann eine Bedingung angegeben (Wie das aussieht habt ihr schon einmal bei IF-Anweisungen gesehen) und schließlich definiert wie gezählt werden soll.

```arduino
for(int counter = 1; counter < 50; counter = counter+1){
    //lasse die LED blinken
}
```
Im Beispiel heißt unsere Zählvariable `counter` (Natürlich könnt ihr der Zählvariablen jeden Namen geben. Häufig wird `i` benutzt). Die Bedingung lautet: "Solange `counter` kleiner als 50 ist" und nach jedem Durchlauf der Schleife wird `counter` um eins erhöht.
In diesen Fall wird der Schleifen Körper 50 Mal durchlaufen.

**Hinweis:** *Für den Befehl `counter = counter +1` werdet ihr häufig die Kurzschreibweise `counter++` finden. Diese macht das Gleiche.*

### Aufgabe 1 
Schreibt nun eine Anweisung in den Schleifenkörper, die euch den Wert der Zählvariablen über den seriellen Monitor ausgibt. (Wie das geht könnt ihr in der Anleitung "Der serielle Monitor" nachschauen).
### a) 
Untersucht was passiert, wenn ihr `counter = counter + 1` durch `counter = counter*2` oder `counter--` ersetzt.

### b) 
Untersucht was passiert, wenn ihr `int counter = 0` durch `int counter = 25` ersetzt.

## Die while-Schleife
In vielen Fällen wisst ihr zu Beginn noch nicht, wie oft eine Bedingung wiederholt werden soll. Dann könnt ihr die while-Schleife verwenden.

