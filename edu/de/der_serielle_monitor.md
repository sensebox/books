# Der Serielle Monitor

Der serielle Monitor ist ein Werkzeug um Daten über die Kabelverbindung des Arduino direkt in der IDE anzeigen zu lassen und Daten von der Computertastatur an den Arduino zu übertragen.
Um den seriellen Monitor zu starten musst du zuerst die IDE öffnen und dann in der Symbolleiste auf das Symbol mit der kleinen Lupe klicken.

ABBILDUNG LUPE

 Das nun geöffnete Fenster hat oben eine Eingabezeile mit Senden-Schaltfläche und darunter ein Ausgabefenster. Im Ausgabefenster werden fortlaufend die neusten Ausgaben angezeigt. Wenn das Häkchen bei Autoscroll gesetzt ist, werden nur die aktuellsten Ausgaben angezeigt. Das heißt, wenn das Ausgabefenster voll ist, werden ältere Daten nach oben aus dem sichtbaren Bereich des Bildschirms geschoben um Platz für die aktuellen Ausgaben zu schaffen. Deaktiviert man die Autscroll Funktion, muss manuell über den Rollbalken am rechten Rand gescrollt werden.

ABBILDUNG SERIELLER MONITOR

 ## Den seriellen Monitor starten

 Um sich Daten im seriellen Monitor anzeigen lassen zu können muss dieser zuerst aktiviert werden. Dies passiert über die Funktion `Serial.beginn(9600)` in void loop (). Der Wert 9600 ist die Baud-Rate und gibt die Geschwindigkeit an, mit der deine Daten zwischen Computer und Arduino übertragen werden. Der eingetragene Wert muss immer der im seriellen Monitor unten rechts ausgewählten Geschwindigkeit entsprechen.

 ## Daten an den seriellen Monitor senden

Um Daten an den seriellen Monitor zu senden verwendet man die Funktionen `Serial.print()`. Als ersten Versuch sollst du jetzt Text im Ausgabefenster anzeigen lassen. Um Text anzeigen zu lassen musst du deinen Text in Anführungszeichen in die Klammern der Funktion schreiben.

```Serial.print("senseBox rocks")```

Wie dir bestimmt aufgefallen ist, 