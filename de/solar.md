# Solarbetriebene senseBox:home

> ***Hinweis:*** *Diese Anleitung richtet sich an Fortgeschrittene und beschreibt das Thema keinesfalls allumfassend. Die hier beschriebenen Methoden und vorgestellte Schaltung dienen nur als erster Anhaltspunkt und sind an vielen Stellen beliebig optimierbar!*

Die handelsübliche senseBox:home ist darauf ausgelegt, ständig durch ein Netzteil mit Strom versorgt zu werden. Durch Änderungen im Code und an der Hardware lassen sich die Messwerte jedoch auch vom Stromnetz getrennt und autark an die openSenseMap übertragen. Handelsübliche Solarladeregler für LiPo Akkus helfen dabei, eine Solarzelle und einen Akku mit einem Microcontroller zu verbinden.

## Umfang dieser Anleitung

Die Anleitung befasst sich zuerst mit den benötigten zusätzlichen Bauteilen und wie diese zusammengebaut werden müssen. Dies wird wird danach Beispielhaft für die senseBox:home und senseBox:home mit ESP8266 Codebeispielen behandelt.
Die besten Ergebnisse werden mit einer fertigen und funktionierenden senseBox:home mit ESP8266 oder Arduino Nano erzielt. Der Arduino Uno hat einen vergleichsweise hohen Stromverbrauch. Es funktioniert, führt aber dazu, dass der Akku schneller leer ist.

> ***Achtung:*** *Bitte die Anleitung vor dem Umsetzen einmal aufmerksam durchlesen. An mehreren Stellen muss über bestimmte Details der Umsetzung entschieden und dementsprechend andere Schritte durchgeführt werden.*

## Benötigte Teile und Werkzeuge

Die hier verlinkten Shops sind als Beispiele zu sehen und können dort beschafft werden wo sie am günstigsten sind/am schnellsten da sind etc.

### Werkzeuge und Verbrauchsmaterialien
- Seitenschneider
- Lötkolben, Lötzinn
- Drähte/Litzen
- Alte USB-Kabel passend zum Microcontroller

### Teile
- Akkuladeregler
- Solarzelle passend zum Laderegler (siehe Absatz [Auswahl des Ladereglers, Solarzelle und Akku](#auswahl-des-ladereglers-solarzelle-und-akku)
- LiPo Akku 3.7V mind 2000mAh, besser mehr
  - entweder 18650 Bauweise mit Batteriehalter
  - oder mit JST Stecker
- LiPo Safe


### Auswahl des Ladereglers, Solarzelle und Akku
> ***Achtung:*** *Es ist sehr wichtig darauf zu achten, passende Laderegler und Solarzellen zu verwenden. Unpassende Kombinationen führen zur Zerstörung vom Laderegler oder Solarzelle oder beidem.*

Bei der Auswahl des Ladereglers sollte gleichzeitig auch die Wahl der Solarzelle beachtet werden. Solarzellen gibt es in vielen verschiedenen Ausführungen. Für diese Anleitung sind Solarzellen mit etwa 5 Volt Ausgangsspannung interessant. Meist ist die Beschaffung der Solarzelle schwieriger, deswegen sollte zuerst eine Solarzelle ausgesucht werden und dann passend dazu ein Laderegler.

#### Solarzelle

Wie schon erwähnt, sollte die Solarzelle etwa 5 bis 6 Volt Ausgangsspannung liefern. Eine Ausgangsleistung von etwa 3-4 Watt ist ausreichend, kann aber je nach Exponiertheit zu viel oder zu wenig sein. Teilweise werden Solarzellen bereits mit Spannungsregulierung verkauft. Dies sind oft Zellen mit USB Ausgang. Diese können genauso verwendet werden, wie Solarzellen, die noch mit Kabeln versehen werden müssen. Im Abschnitt [Aufbau](#aufbau) wird eine Solarzelle von Ebay ohne Kabel verwendet.

#### Laderegler

Nachdem eine passende Solarzelle ausfindig gemacht wurde, kann sich der Auswahl eines Ladereglers gewidmet werden. In jedem Fall sollten sich Ausgangsleistung und Spannung der Solarzelle innerhalb der erlaubten Eingangsspannung und Leistung des Ladereglers befinden. Diese können den Datenblättern entnommen werden. Hierbei ist darauf zu achten, dass die Ausgangsspannung des Ladereglers meist bei 5V liegt. Diese Spannung sollte dem Microcontroller in jedem Fall über den USB Port zugeführt werden.

Die folgende Liste enthält Vorschläge zu Ladereglern. Im Abschnitt [Aufbau](#aufbau) wird ein Laderegler des Typs TP4056 verwendet.

- TP4056 TE420 ([1](http://www.watterott.com/de/TP4056-Micro-USB-5V-1A-Lithium-Battery-Charger-with-Protection), [2](http://www.ebay.de/itm/231820310558), [3](https://www.amazon.de/dp/B00QI6TR54))
- Adafruit USB / DC / Solar Lithium Ion/Polymer charger - v2 ([1](http://www.exp-tech.de/adafruit-usb-dc-solar-lithium-ion-polymer-charger-v2), [2](https://eckstein-shop.de/Adafruit-USB-DC-Solar-Lithium-Ion-Polymer-charger))
- SparkFun Sunny Buddy - MPPT Solar Charger ([1](http://www.exp-tech.de/sparkfun-sunny-buddy-mppt-solar-charger), [2](https://www.amazon.de/dp/B01BTV90UE), [3](https://eckstein-shop.de/SparkFun-Sunny-Buddy-MPPT-Solar-Charger-EN))

#### Akku

> ***Vorsicht:*** *Li-Ion/LiPo Akkus können bei falscher oder unsachgemäßer Behandlung explodieren oder giftige Gase freisetzen! Bevor der Akku mit dem Stromkreis verbunden wird, sollte man sich immer vorher vergewissert haben, dass kein Kurzschluss vorliegt. Auch sollten die Akkus niemals mit spitzen Gegenständen perforiert, geschnitten oder gesägt werden. Außerdem darf der Akku auf keinen Fall ins Feuer geworfen werden! Bitte dazu auch die Abschnitte [Hinweise zum Umgang mit Lithium-Ionen-Akkus](https://de.wikipedia.org/wiki/Lithium-Ionen-Akkumulator#Hinweise_zum_Umgang_mit_Lithium-Ionen-Akkus) und [Gefahren beim Umgang mit Lithium-Ionen-Akkus](https://de.wikipedia.org/wiki/Lithium-Ionen-Akkumulator#Gefahren_beim_Umgang_mit_Lithium-Ionen-Akkus) auf Wikipedia lesen!*

Der verwendete Akku sollte mindestens so viel Kapazität besitzen, wie der Laderegler an Ladestrom bereitstellt. Mit einer Zelle größer 2500mAh ist man meistens auf der sicheren Seite. Die Bauform des Akkus ist relativ egal. Es sollte gekauft werden was passt. Es gibt auch Akkus mit bereits eingebauten Schutzschaltungen. Auch diese können verwendet werden. Die Art wie der Akku mit dem Laderegler verbunden wird entscheidet sich auch nach Geschmack. Der Stromkreis zwischen Akku und Laderegler sollte aber trennbar sein. In jedem Fall sollte ein LiPo Safe verwendet werden. Dieser sorgt bei einem Kurzschluss für Sicherheit gegenüber Explosionen. Im Abschnitt [Aufbau](#aufbau) wird ein LiPo in 18650 Bauweise mit Batteriehalter verwendet.

## Aufbau
Der in diesem Beispielaufbau verwendete Laderegler bietet einen Eingang für eine Stromquelle (in unserem Fall eine Solarzelle), einen Anschluss für den LiPo Akku und einen Ausgang für einen Verbraucher. Dieser ist in unserem Fall der Microcontroller. Der Eingang für die Stromquelle ist bei diesem Laderegler sowohl durch verlötbare Pins, als auch durch einen Micro-USB Anschluss ausgeführt. Durch diesen Micro-USB Anschluss kann der Akku mit einem Steckernetzteil, z.B. von einem Handy, aufgeladen werden bevor alles sich selbst bzw. der Sonne überlassen wird. Dabei sollte eine Höchststromstärke nicht überschritten werden. (Steht auf dem Netzteil) Der Laderegler sorgt dafür, dass der Akku weder überladen noch zu stark entladen wird.

> ***Achtung:*** *Die maximale Stromstärke des Ladereglers sollte niemals überschritten werden. Diese ist dem Datenblatt zu entnehmen.*

> <img src="https://raw.githubusercontent.com/sensebox/resources/master/images/solar/laderegler_solar.JPG" align="center" width="770"/>
> Abbildung 1: Solarladeregler mit angelötetem JST Kabel

Im Ersten Schritt sollte man sich nun Gedanken über die Spannungsversorgung des Microcontrollers machen. Der Laderegler hat eine Ausgangsspannung von 5V. Dies erlaubt bei Arduino Nanos mit USB die direkte Versorgung über den USB Port, bei ESP8266 die Versorgung über entsprechende Vin Pins. Je nach verwendetem Microcontroller muss man sich nun eine Leitung für die Spannungsversorgung basteln. Dafür kann entweder ein altes USB-Kabel (aufschneiden) oder zwei separate Drähte, die dann per Pins den Microcontroller versorgen, verwendet werden.
Bei der Variante mit dem USB Kabel muss mit Hilfe eines Multimeters die passenden Vcc und GND Leitungen herausgefunden werden.

Die Stromversorgungsleitung kann nun mit einem Lötkolben an den Laderegler angelötet werden. Dabei muss auf die Polarität (Plus und Minus) geachtet werden.

Der Akku sollte nicht direkt untrennbar mit dem Laderegler verbunden werden. Um dies zu erreichen, gibt es mehrere Möglichkeiten: Entweder man besorgt sich einen passenden Akkuhalter oder, falls man einen Akku mit JST Stecker besitzt, besorgt man sich ein Kabel mit JST Buchse. In jedem Fall hat man eine Vcc und eine GND Leitung, welche passend mit dem Laderegler verlötet werden muss.

> ***Achtung:*** *Den Akku immer nur im LiPo Safe betreiben!*

An dieser Stelle kann man nun mit einem Micro-USB Handynetzteil den Akku laden. Dazu einfach nur den Akku an den Laderegler klemmen und auf der Stromeingangsseite das Handynetzteil anschließen. Dabei kann der Laderegler allerdings sehr heiß werden.

Solarzellen gibt es entweder ohne Drähte, mit Drähten, mit JST Stecker oder mit USB Stecker. Die Variante mit dem USB-Stecker ist am einfachsten, da man einfach nur die Solarzelle in den Laderegler stecken muss und damit schon fertig ist. In den anderen Fällen muss man jeweils am Ende dafür sorgen, dass Vcc und GND mit den korrekten Eingangspins des Ladereglers verbunden sind. Wichtig hier ist, dass die Solarzelle elektrisch zum Laderegler passt und wasserdicht ist!

Nun kann überlegt werden, wie der Microcontroller mit Spannung versorgt werden soll. Der hier verwendete Laderegler hat eine Ausgangsspannung von 5 Volt. Bei normalen Arduinos sollten diese 5 Volt am sichersten über den USB Port angelegt werden. Deswegen sollte man sich an dieser Stelle informieren, wie man seinen Microcontroller am besten mit den 5V versorgt.

> <img src="https://raw.githubusercontent.com/sensebox/resources/master/images/solar/solar_komponenten.jpg" align="center" width="500"/>
> Abbildung 2: Solarladeregler mit Solarzelle, Akku und Versorgungskabel für Microcontroller

Eine Möglichkeit ist es, ein passendes USB-Kabel aufzutrennen und die Spannungsversorgungsleitungen an den Laderegler zu löten. Als eine andere Möglicheit, sofern es der verwendete Microcontroller es erlaubt, kann man sich auch eine andersartige Steckverbindung basteln.

> ***Achtung:*** *Damit der Microcontroller korrekt mit Spannung versorgt wird, muss auf jeden Fall auf die richtige Polarität geachtet werden (Plus und Minus). Die alleinige Verantwortung liegt bei dir, nicht bei uns!*

> <a href="https://github.com/sensebox/resources/raw/master/images/solar/beispiel_esp_solar.png" target="_blank"><img src="https://github.com/sensebox/resources/raw/master/images/solar/beispiel_esp_solar.png" align="center" width="500"/></a>
> Abbildung 3: Beispielschaltung

Die Schaltung (siehe Abbildung 3) sollte nun soweit korrekt laufen und kann ausprobiert werden. Zuerst sollte der Akku, danach der Microcontroller und dann die Solarzelle verbunden werden und ins Licht gehalten werden. Leuchtet eine zusätzliche LED am Laderegler auf, ist alles korrekt und die Programmierung des Microcontroller kann angepasst werden.

Die gesamte Schaltung sollte wasserdicht und witterungsgeschützt aufgestellt werden. Dabei ist es auch wichtig, dass die Solarzelle idealerweise in Richtung Süden aufgestellt wird, damit immer genügend Strom zum Laden des Akkus vorhanden ist.

## Microcontroller programmieren

Damit der Akku niemals leer wird muss die Programmierung auf geringen Stromverbrauch getrimmt werden. Beim ESP8266 kann dies durch die Verwendung des DeepSleep und beim Arduino durch die Verwendung der Library Narcoleptic erreicht werden. Insgesamt ist es wichtig, dass der Microcontroller möglichst kurze Arbeitsphasen hat und dazwischen wieder schläft. Deswegen macht es Sinn, die Standard-Übertragungsrate von einer Minute durch 5 oder 10 minütige Intervalle zu ersetzen.

### ESP8266
Nicht alle ESP8266 sind gleich, so eignet sich z.B. der Wemos D1 Mini besser für diese Anleitung als der in Arduino Uno Bauform gebaute Wemos D1 R2. Dies ist begründet durch sparsamere und einer geringeren Anzahl an Bauteilen. Ein Nachteil des D1 Mini liegt darin, dass man die Stecker der senseBox:home Sensoren nicht wiederverwenden kann. Man muss also die Sensoren anderweitig mit dem Microcontroller verbinden, was jedoch nicht Inhalt dieser Anleitung sein soll. Damit der ESP8266 in den DeepSleep wechseln kann und danach auch wieder Zeitgesteuert aufwachen kann, muss eine elektrische Verbindung zwischen GPIO Pin 16 und Pin RST bestehen. Dies kann durch eine kleine Drahtbrücke erreicht werden. Deswegen eignen sich alle ESP8266 Ausführungen, die Pin 16 einfach zugänglich machen am besten.

Bevor man hier weitermacht, sollte mindestens einmal die [Anleitung ESP8266](https://home.books.sensebox.de/de/esp8266/) gelesen werden. Hier wird auch erklärt wie man Treiber installiert und die Arduino IDE vorbereitet.

Der angepasste Sketch basiert im Großen und Ganzen auf dem Standard senseBox:home sketch, der Unterschied liegt aber darin, dass durch den DeepSleep die `loop` Methode niemals erreicht wird. Der ESP8266 startet sich nach dem DeepSleep jedes Mal neu. Der Sketch muss also die Messungen und das Übertragen an die openSenseMap alles im `setup` abhandeln.

Einen Beispielsketch für eine senseBox:home mit ESP8266 und DeepSleep befindet sich [hier](https://github.com/ubergesundheit/senseBox-ESP8266/blob/master/senseBox-ESP8266-Solar.ino).

### Arduino

Der Arduino Uno oder Nano hat leider keinen Sleep Modus, kann aber durch die [Narcoleptic Libray](https://github.com/doc62/narcoleptic) zu einem geringeren Stromverbrauch überredet werden. Diese deaktiviert alle unnötigen Vorgänge des Arduino.

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

## Abschließende Worte

Die in dieser Anleitung gezeigten Schaltungen und Techniken umreißen den Aufbau einer energieautarken senseBox:home. Wie Eingangs erwähnt, bildet dieses Vorgehen nur einen Weg von vielen um das Ziel einer solarbetriebenen senseBox:home zu erreichen, ab. Die konkrete Durchführung hängt stark von den verwendeten Teilen ab.
