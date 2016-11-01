# Schleifen
> *Und täglich grüßt das Murmeltier...*

Wenn du eine LED 50 Mal blinken lassen willst, ist das ganz schön viel Schreibarbeit:

```arduino
digitalWrite(led, HIGH);
delay(100);
digitalWrite(led, LOW);
delay(100);
digitalWrite(led, HIGH);
delay(100);
digitalWrite(led, LOW);
//...
```

Da Informatiker schreibfaul sind, haben sie sich eine einfache Lösung einfallen lassen: Schleifen.
Eine Schleife führt eine Anweisungen mehrmals aus, bis eine bestimmte Bedingung erfüllt ist.

## Aufbau von Schleifen
Schleifen bestehen aus zwei Teilen, einem **Schleifen-Kopf** und einem **Schleifen-Körper**.
Anweisungen die wiederholt werden sollen, werden in Geschweiften Klammern in den Schleifen-Körper geschrieben.
Jetzt müssen wir aber noch fest legen, wie oft diese Anweisungen wiederholt werden sollen.
Dies geschieht im Schleifen-Kopf.

Es gibt verschiedene Arten von Schleifen, die je nach Bedarf verwendet werden kann. Hier sollen die zwei wichtigsten Schleifentypen vorgestellt werden.

## Die for-Schleife
`for`-Schleifen werden dann verwendet, wenn man genau weiß, wie oft Anweisungen wiederholt werden sollen.
In unserem Beispiel wissen wir, dass die LED 50 Mal blinken soll.
Der Kopf einer `for`-Schleife besteht aus drei Teilen, welche durch ein Semikolon (`;`) getrennt sind:

1. Es wird eine Zählvariable erzeugt, welche angibt wie oft die schleife bereits ausgeführt wurde
2. Eine Bedingung gibt an, bis wann gezählt werden soll. Wie so eine Bedingung aussieht hast du schon einmal bei [if-Anweisungen](ifelse-bedingung.md) gesehen!
3. Eine Definition, wie gezählt werden soll. Üblicherweise wird die Zählvariable um `1` erhöht.

```arduino
for (int zaehler = 1; zaehler < 50; zaehler = zaehler + 1) {
    // lasse die LED blinken
}
```

Im diesem Beispiel heißt unsere Zählvariable `zaehler`.
Die Bedingung lautet: "Solange `zaehler` kleiner als 50 ist".
Nach jedem Durchlauf der Schleife wird `zaehler` um eins erhöht.
Deshalb wird der Schleifen Körper 50 Mal ausgeführt.

> **Hinweis:**
> - *Für den Befehl `zaehler = zaehler + 1` wirst du häufig die Kurzschreibweise `zaehler++` finden. Diese macht das Gleiche.*
> - *Natürlich kannst du der Zählvariablen jeden Namen geben. Häufig wird der Name `i` für "index" genutzt.*

### Aufgabe 1
Schreibe nun eine Anweisung in den Schleifenkörper, die dir den Wert der Zählvariablen über den seriellen Monitor ausgibt.

> ***Tipp:*** *In [Der Serielle Monitor](der_serielle_monitor.md) wird erklärt wie das geht!*

- **a)** Untersuche was passiert, wenn du `zaehler = zaehler + 1` durch `zaehler = zaehler*2` oder `zaehler--` ersetzt.
- **b)** Untersuche was passiert, wenn du `int zaehler = 0` durch `int zaehler = 25` ersetzt.

---

## Die while-Schleife
In vielen Fällen weißt du zu Beginn noch nicht, wie oft eine Anweisung wiederholt werden soll.
Dann kannst du die `while`-Schleife verwenden.
Die `while`-Schleife hat einen weniger strikten Aufbau: Der Schleifenkopf besteht aus dem Bezeichner `while` gefolgt von runden Klammern.
In diese Klammern wird eine Bedienung geschrieben, die vor jedem Schleifendurchlauf überprüft wird.
Solange diese Bedingung `true` ergibt, wird der Schleifenkörper ausgeführt

```arduino
while (bedingung) {
    // lasse die LED blinken
}
```
Du kannst zum Beispiel einen Knopf an den Arduino anschließen und die Schleife nur dann durchlaufen, wenn der Knopf gedrückt wurde.

> **Achtung:** *Ein häufig gemachter Fehler ist, dass eine Bedingung immer wahr ist (Zum Beispiel, wenn ihr als Bedingung schreibt `1 > 0`). In diesem Fall wird eure Schleife immer wieder durchlaufen. Man spricht von einer Endlosschleife. In diesem Fall reagiert euer Arduino nicht mehr und es ist relativ schwer herauszufinden, woran das liegt.*

### Aufgabe 2
- **a)** Programmiere eine `while`-Schleife, die den Text "Die Aussage stimmt!" über den seriellen Monitor ausgibt, wenn eine Variable `a` größer als 0 ist.
- **b)** Programmiere eine `while`-Schleife, die eine LED blinken lässt, wenn ein Knopf gedrückt wurde.
- **c)** Jede `for`-Schleife lässt sich auch durch eine `while`-Schleife beschreiben. Schreibt die folgende `for`-Schleife in eine `while`-Schleife um:
    ```arduino
    for(int i = 10; i > 0; i--){
        Serial.print("Countdown: ");
        Serial.println(i);
    }
    ```
