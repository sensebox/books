# Die Verwendung von Software-Bibliotheken

Ähnlich wie mit einem Shield die Hardware des Arduino erweitert werden kann, lassen sich auch deine Sketches mit Hilfe von Software-Bibliotheken um nützliche Funktionen erweitern.
Eine solche Bibliothek (engl. Library) kann prinzipiell von jedem erstellt werden.
Im Normalfall stellen die Entwickler der Hardwarekomponenten Bibliotheken für ihre Produkte bereit, sodass der Nutzer sich diese Arbeit sparen kann.

In der Arduino-IDE sind bereits einige Software-Bibliotheken enthalten, aber Bibliotheken für die senseBox Sensoren müssen manuell hinzugefügt werden.
Dies solltest du bereits im Kapitel [Installation der Software](../getting_started/installation_der_software.md).

## Zusätzliche Bibliotheken installieren
Als erstes muss die gewünschte Bibliothek heruntergeladen werden, welche in der Regel ein `zip`-Archiv ist.

Die Arduino-IDE bietet eine Funktion um externe Bibliotheken zu importieren. Dazu musst du auf *Sketch* -> *Library importieren* -> *Add Library...* klicken. Es öffnet sich ein Fenster in welchem du zum Speicherort der heruntergeladenen `.zip`-Datei navigieren und diese dann auswählen kannst.

## Bibliotheken in deinen Sketch einfügen
Nachdem du die Softwarebibliotheken der Arduino IDE hinzugefügt hast musst du diese noch in deinen Sketch einbinden. Dazu hast du prinzipiell zwei Möglichkeiten:

### Über das Arduino IDE Menü
Um eine Bibliothek in deinen Sketch einzubinden musst du auf *Sketch* -> *Library importieren* klicken, woraufhin sich eine Liste aller verfügbarer Bibliotheken öffnet. Wenn du in einem unserer Projekte eine Bibliothek benötigst, wird dir genau erklärt werden, welche du einbinden musst.

### Über Code
Wenn du diesen Vorgang öfter machst, ist es in der Regel schneller das gleiche Ziel durch eine Zeile Programmcode zu erreichen.

Diese Yeile muss als erstes im Programmablauf stehen, noch bevor die `setup()`-Funktion definiert wird.
Mithilfe der `#include` Direktive wird eine Bibliothek geladen.
Für das Ethernet-Shield wird zum Beispiel eine Library benötigt, die über `#include <Ethernet.h>` eingebunden wird.

Zum besseren Verständis kannst du dir einmal folgenden Beispielcode anschauen:

```arduino
#include <Ethernet.h> // Einbinden der Bibliothek

int Sensor;           // Deklaration von Variablen


void setup() {
  Ethernet.begin();   // diese Funktion ist nur durch das Laden der
                      // Ethernet.h Bibliothek verfügbar!
}

void loop() {
  // Anweisungen, die fortlaufend ausgeführt werden
}
```
