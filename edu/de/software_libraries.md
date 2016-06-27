# Die Verwendung von Software-Bibliotheken

Ähnlich wie mit einem Shield die Hardware des Arduino erweitert werden kann, lassen sich auch deine Sketches mit Hilfe von Software-Bibliotheken um nützliche Funktionen erweitern.
Eine solche Bibliothek (engl. Library) kann prinzipiell von jedem erstellt werden.
Im Normalfall stellen die Entwickler der Hardwarekomponenten Bibliotheken für ihre Produkte bereit, sodass der Nutzer sich diese Arbeit sparen kann.

In der Arduino-IDE sind bereits einige Software-Bibliotheken enthalten. Um diese in deinen Sketch einzubinden musst du auf *Sketch* -> *Library importieren* klicken, woraufhin sich eine Liste aller verfügbarer Bibliotheken öffnet. Wenn du in einem unserer Projekte eine Bibliothek benötigst, wird dir genau erklärt werden, welche du einbinden musst.

## Fremde Bibliotheken importieren
Wenn du eigene Sensoren benutzen möchtest, kann es sein dass du die dazugehörigen Bibliotheken selbst herunterladen und importieren musst.

Als erstes muss die gewünschte Bibliothek heruntergeladen werden.
Die Arduino-IDE bietet eine Funktion um externe Bibliotheken zu importieren. Dazu musst du auf *Sketch* -> *Library importieren* -> *Add Library...* klicken. Es öffnet sich ein Fenstern in welchem du zum Speicherort der heruntergeladen .zip-Datei navigieren und diese dann auswählen kannst.

## Einfügen von Softwarebibliotheken in deinen Sketch
Nachdem du die Softwarebibliotheken der Arduino IDE hinzugefügt hast musst du diese noch in deinen Sketch einbinden.
Das Einbinden erfolgt als erstes im Programmablauf, noch bevor die `setup`-Funktion aufgerufen wird.
Mithilfe der `#include` Direktive wird eine Bibliothek geladen. Für das Ethernet-Shield wird zum Beispiel eine Library benötigt, die über `#include <Ethernet.h>` eingebunden wird.

Zum besseren Verständis kannst du dir einmal folgenden Beispielcode anschauen:

```arduino
#include <Ethernet.h> // Einbinden der Bibliothek

int Sensor;           // Deklaration von Variablen


void setup() {
  Ethernet.begin();   // diese Funktion ist nur durch das Laden der
                      // Ethernet.h Bibliothek verfügbar!
}

void loop() {
  //Anweisungen, die fortlaufend ausgeführt werden
}
```
