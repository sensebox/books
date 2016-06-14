# Die Verwendung von Software-Bibliotheken

Genau wie mit einem Shield die Hardware des Arduino erweitert werden kann, kannst du auch deine Sketche mit Hilfe von Software-Bibliotheken um nützliche Funktionen erweitern. Eine solche Bibliothek (engl. Library) kann prinzipiell von jedem erstellt werden. Im Normalfall stellen die Entwickler der Hardwarekomponenten Bibliotheken für ihre Produkte bereit, sodass der Verbraucher sich diese Arbeit sparen kann.

In der Arduino-IDE sind bereits einige Software-Bibliotheken enthalten. Um diese in deinen Sketch einzubinden musst du auf *Sketch* -> *Library importieren* klicken, woraufhin sich eine Liste aller verfügbarer Bibliotheken öffnet. Wenn du in einem unserer Projekte eine Bibliothek benötigst, wird dir genau erklärt werden welche du einbinden musst.

### Fremde Bibliotheken hinzufügen

Wenn du eigene Sensoren benutzen möchtest, kann es sein dass du die dazugehörigen Bibliotheken selbst herunterladen und importieren musst. Das hinzufügen neuer Bibliotheken ist ganz einfach, als erstes muss die gewünschte Bibliothek heruntergeladen werden.
Die Arduino-IDE bietet dann eine Funktion um Bibliotheken zu importieren. Dazu musst du auf *Sketch* -> *Library importieren* -> *Add Library...* klicken. Es öffnet sich ein Fenstern in welchem du zum Speicherort der heruntergeladen .zip-Datei navigieren und diese dann auswählen kannst.

### Einfügen von Softwarebibliotheken in deinen Sketch

Nachdem du die Softwarebibliotheken der Arduino IDE hinzugefügt hast musst du diese noch in deinen Sketch einbinden. Das Einbinden in den Sketch erfolgt am Anfang noch bevor die Setup Funktion aufgerufen wird. Mithilfe des `#include` Befehls lassen sich diese hinzufügen. Für das Ethernet-Shield wird zum Beispiel eine Library verwendet, die über 
`#include <Ethernet.h>` eingebunden wird. Zum besseren Verständis kannst du dir einmal folgenden Beispielcode anschauen:
```
#include <Ethernet.h> //Einbinden von Libraries

int Sensor; //definieren von Variablen


void setup() {

//Anweisungen, die einmal zu Beginn ausgeführt werden.

}

void loop() {

//Anweisungen, die fortlaufend ausgeführt werden.

  }
  ```
