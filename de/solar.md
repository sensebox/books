# Solarbetriebene senseBox:home

> *Diese Anleitung richtet sich an Fortgeschrittene.*

Die handelsübliche senseBox:home ist darauf ausgelegt, ständig durch ein Netzteil mit Strom versorgt zu werden. Durch Änderungen im Code und an der Hardware lassen sich die Messwerte jedoch auch vom Stromnetz getrennt und autark an die openSenseMap übertragen. Handelsübliche Solarladeregler für LiPo Akkus helfen dabei, eine Solarzelle und einen Akku mit einem Microcontroller zu verbinden. Hierbei ist darauf zu achten, dass die Ausgangsspannung des Ladereglers meist bei 5V liegt. Diese Spannung sollte in jedem Fall über den USB Port eingespeist werden.

Diese Anleitung befasst sich zuerst mit den benötigten zusätzlichen Bauteilen und wie diese zusammengebaut werden müssen und wird danach Beispielhaft für die senseBox:home und senseBox:home mit ESP8266 Codebeispiele behandeln.
Die besten Ergebnisse werden mit einer fertigen und funktionierenden senseBox:home mit ESP8266 oder Arduino Nano erzielt. Der Arduino Uno hat einen vergleichsweise hohen Stromverbrauch. Es funktioniert, führt aber dazu, dass der Akku schneller leer ist.

> ***Achtung:*** *Bitte die Anleitung vor dem Umsetzen einmal aufmerksam durchlesen, an mehreren Stellen muss man sich über Details der Umsetzung entscheiden und dementsprechend andere Schritte durchführen.*

Die hier beschreibenen Methoden und Schaltung dient nur als ersten Anhaltspunkt und ist an vielen Stellen beliebig optimierbar!

> ***Vorsicht:*** *LiPo Akkus können bei falscher Behandlung explodieren oder giftige Gase freisetzen! Bevor man den Akku mit dem Stromkreis verbindet, sollte man sich immer vorher vergewissert haben, dass kein Kurzschluss vorliegt. Auch sollten die Akkus niemals mit spitzen Gegenständen perforiert, geschnitten oder gesägt werden. Den Akku niemals ins Feuer werfen.*

## Benötigte Teile und Werkzeuge
- Solar Akkuladeregler (TP4056 TE420)
- Solarzelle 5V etwa 3-4 Watt (max 1000mA)
- LiPo Akku 3.7V etwa 2500mAh
  - entweder 18650 Bauweise mit Batteriehalter
  - oder mit JST Stecker
- LiPo Safe
- Lötkolben
- Drähte/Litzen
- Alte USB-Kabel passend zum Microcontroller

## Aufbau
Der hier verwendete Laderegler bietet einen Eingang für eine Stromquelle (in unserem Fall eine Solarzelle), einen Anschluss für den LiPo Akku und einen Ausgang für einen Verbraucher. Dieser ist in unserem Fall der Microcontroller. Der Eingang für die Stromquelle ist bei diesem Laderegler sowohl durch verlötbare Pins als auch durch einen Micro-USB Anschluss ausgeführt. Durch diesen Micro USB Anschluss kann man den Akku mit einem Steckernetzteil z.B. von einem Handy aufladen bevor man alles sich selbst bzw. der Sonne überlässt. Dabei sollte eine Höchststromstärke von 1000mA nicht überschritten werden. (Steht auf dem Netzteil)
Der Laderegler sorgt dafür, dass der Akku nicht über aber auch nicht zu stark entladen wird.

<img src="https://raw.githubusercontent.com/sensebox/resources/master/images/solar/laderegler_solar.JPG" align="center" width="800"/>

Im Ersten Schritt sollte man sich nun Gedanken über die Spannungsversorgung des Microcontrollers machen. Der Laderegler hat eine Ausgangsspannung von 5V. Dies erlaubt bei Arduino Nanos mit USB die direkte Versorgung über den USB Port, bei ESP8266 die Versorgung über entsprechende Vin Pins. Je nach verwendetem Microcontroller muss man sich nun eine Leitung für die Spannungsversorgung basteln. Man verwendet also entweder ein altes USB-Kabel (aufschneiden) oder zwei separate Drähte, die dann per Pins den Microcontroller versorgen.
Bei der Variante mit dem USB Kabel muss mit Hilfe eines Multimeters die passenden Vcc und GND Leitungen herausgefunden werden.

Die Stromversorgungsleitung kann nun mit einem Lötkolben an den Laderegler angelötet werden. Dabei auf die Polarität (Plus und Minus) achten.

Der Akku sollte nicht direkt untrennbar mit dem Laderegler verbunden werden. Um dies zu erreichen gibt es mehrere Möglichkeiten. Entweder man besorgt sich einen passenden Akkuhalter oder, falls man einen Akku mit JST Stecker hat, besorgt man sich ein Kabel mit JST Buchse. In jedem Fall hat man eine Vcc und eine GND Leitung welche passend mit dem Laderegler verlötet werden müssen.

An dieser Stelle kann man nun mit einem Micro-USB Handynetzteil den Akku laden. Dazu einfach nur den Akku an den Laderegler klemmen und auf der Stromeingangsseite das Handynetzteil anschließen. Dabei kann der Laderegler sehr heiß werden.

Solarzellen gibt es entweder ohne Drähte, mit Drähten, mit JST Stecker oder mit USB Stecker. Die Variante mit dem USB-Stecker ist am einfachsten, man Steckt einfach nur die Solarzelle in den Laderegler und ist fertig. In den anderen Fällen muss man jeweils am Ende dafür sorgen, dass Vcc und GND mit den korrekten Eingangspins des Ladereglers verbunden ist. Wichtig hier ist, dass die Solarzelle 5V und unter 1000mA liefert und wasserdicht ist!

Nun kann sich überlegt werden, wie der Microcontroller mit Spannung versorgt werden soll. Wie Eingangs schon erwähnt, ist die Ausgangsspannung sowohl der Solarzelle als auch des Ladereglers 5 Volt. Bei normalen Arduinos sollten diese 5 Volt am sichersten über den USB Port angelegt werden. Deswegen sollte man sich an dieser Stelle informieren, wie man seinen Microcontroller am besten mit den 5V versorgt.

Eine Möglichkeit ist es, ein passendes USB-Kabel aufzutrennen und die Spannungsversorgungsleitungen an den Laderegler zu löten. Eine andere Möglicheit, sofern der verwendete Microcontroller es erlaubt, kann man sich auch eine andersartige Steckverbindung basteln.

> ***Achtung:*** *Damit der Microcontroller korrekt mit Spannung versorgt wird, muss auf jeden Fall auf die richtige Polarität geachtet werden (Plus und Minus). Die alleinige Verantwortung liegt bei dir, nicht bei uns!*

<a href="https://github.com/sensebox/resources/raw/master/images/solar/beispiel_esp_solar.png" target="_blank"><img src="https://github.com/sensebox/resources/raw/master/images/solar/beispiel_esp_solar.png" align="center" width="800"/></a>

Die Schaltung sollte nun soweit korrekt laufen und kann ausprobiert werden, Zuerst sollte Akku, danach Microcontroller dann Solarzelle verbunden werden und ins Licht gehalten werden, leuchtet eine zusätzliche LED am Laderegler auf, ist alles korrekt und die Programmierung des Microcontroller kann angepasst werden.

Die gesamte Schaltung sollte wasserdicht und witterungsgeschützt aufgestellt werden. Die Solarzelle sollte idealerweise in Richtung Süden aufgestellt werden, damit immer genügend Strom zum Laden des Akkus vorhanden ist.

## Microcontroller programmieren

Damit der Akku niemals leer wird, muss die Programmierung auf geringen Stromverbrauch getrimmt werden. Beim ESP8266 erreichen wir dies durch die Verwendung des DeepSleep und beim Arduino durch die Verwendung der Library Narcoleptic. Insgesamt ist es wichtig, dass der Microcontroller möglichst kurze Arbeitsphasen hat und dazwischen wieder schläft. Deswegen macht es Sinn, die Standard-Übertragungsrate von einer Minute durch 5 oder 10 Minütige Intervalle zu ersetzen.

### ESP8266
Nicht alle ESP8266 sind gleich, so eignet sich z.B. der Wemos D1 Mini besser für diese Anleitung als der in Arduino Uno Bauform gebaute Wemos D1 R2. Dies ist begründet durch wenigere und sparsamere Bauteile. Ein Nachteil des D1 Mini ist, dass man die Stecker der senseBox:home Sensoren nicht wiederverwenden kann. Man muss also die Sensoren anderweitig mit dem Microcontroller verbinden. Dies soll jedoch nicht Inhalt dieser Anleitung sein. Damit der ESP8266 in den DeepSleep wechseln kann und danach auch wieder Zeitgesteuert aufwachen kann, muss eine elektrische Verbindung zwischen GPIO Pin 16 und Pin RST bestehen. Dies kann durch eine kleine Drahtbrücke erreicht werden. Deswegen eignen sich alle ESP8266 Ausführungen, die Pin 16 einfach zugänglich machen am besten.

Bevor man hier weitermacht, sollte mindestens einmal die [Anleitung ESP8266](https://home.books.sensebox.de/de/esp8266/) gelesen werden. Hier wird auch erklärt wie man Treiber installiert und die Arduino IDE vorbereitet.

Der angepasste Sketch basiert im Großen und Ganzen auf dem Standard senseBox:home sketch, der Unterschied ist, dass durch den DeepSleep die `loop` Methode niemals erreicht wird. Der ESP8266 startet sich nach dem DeepSleep jedes mal neu. Der Sketch muss also die Messungen und das Übertragen an die openSenseMap alles im `setup` abhandeln.

Einen Beispielsketch für eine senseBox:home mit ESP8266 und DeepSleep findet ihr [hier](https://github.com/ubergesundheit/senseBox-ESP8266/blob/master/senseBox-ESP8266-Solar.ino).

### Arduino

Der Arduino Uno oder Nano hat leider keinen Sleep Modus, kann aber durch die [Narcoleptic Libray](https://github.com/doc62/narcoleptic) zu einem geringeren Stromverbrauch überredet werden. Diese deaktiviert alles unnötige auf dem Arduino.

Der originale senseBox:home Sketch kann fast 1:1 weiterbenutzt werden. Es muss nur die Narcoleptic Library eingebunden und aktiviert werden.

```arduino
#include <Narcoleptic.h>
```

Am Ende der `setup` Methode:

```arduino
Narcoleptic.disableTimer1();
Narcoleptic.disableTimer2();
Narcoleptic.disableSerial();
Narcoleptic.disableADC();
Narcoleptic.disableSPI();
```

In der Methode `loop` muss noch der Aufruf `sleep(postingInterval);` durch `Narcoleptic.delay(postingInterval);` ersetzt werden.

