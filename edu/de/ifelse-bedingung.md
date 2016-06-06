# if/else-Bedingung

Mit `if` ist es möglich in einem Sketch Entscheidungen zu fällen und den Arduino, je nachdem, wie die Entscheidung ausfällt, unterschiedlichen Code ausführen zu lassen. 
Wenn du beispielsweise eine LED in Abhängigkeit von einem Taster leuchten lassen möchtest würde der Code wie folgt aussehen:

```
if (digitalRead(Button) == HIGH)
{
    digitalWrite(LED,HIGH);    
}
```

Die erste Codezeile beginnt mit einem `if`. In den darauffolgenden Klammern wird die zu prüfende Bedingung angegeben, also in diesem Fall ob der Taster gedrückt ist. Ist diese Bedingung wahr wird der in den geschweiften Klammern eingetragene Code ausgeführt.
Wie dir bestimmt aufgefallen ist, wird in der Bedingung ein Vergleichsoperator verwendet, nämlich ein doppeltes Gleichzeichen (==). Ein häufiger Fehler besteht darin, dass nur ein einzelnes Gleichzeichen (=) verwendet wird. Für den Arduino steht ein einzelnes Gleichzeichen jedoch nicht "prüfe, ob gleich" sondern für "mache gleich".

### Verwendung von else

Mit else kannst du deiner if-Anweisung noch eine zusätzliche Aktion hinzufügen. 
Wenn du also den obenstehenden Code um ein `else` ergänzt würde der komplette Sketch so aussehen:
```
#define LED 13          
#define Button 7

void setup(){
    pinMode(LED, OUTPUT);
    pinmode(Button, INPUT);
}
void loop(){
    if(digitalRead(Button)==HIGH){
        digitalWrite(LED, HIGH);
    }
    else{
        digitalWrite(LED, LOW);
    }
}
```

Die Verwendung von `else` zwingt den Arduino dazu, einen zweiten Codeausschnitt auszuführen wenn die obige Bedingung nicht erfüllt wird.