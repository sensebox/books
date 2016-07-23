>***Hinweis:***
Ein Gehäuse speziell für die senseBox:home befindet sich noch in der Entwicklung. Der hier gezeigte Aufbau ist daher nur ein Beispiel dafür, wie sich die Komponenten anbringen lassen. Beim Aufbau ist auch immer etwas Kreativität gefragt um die Station individuell an den Aufstellungsort anzupassen!

# Beispielaufbau
Dieser Beispielaufbau setzt voraus, dass die senseBox vorher auf der openSenseMap registriert und programmiert wurde ([siehe Schritt 3](aufbau03_osem.md)).

Um die senseBox draußen aufzubauen, braucht ihr noch ein ausreichend langes Netzwerkkabel, sowie ein wasserfestes Gehäuse. Bei dem Gehäuse müsst ihr darauf achten, dass es einen transparenten Deckel ohne Lichtfilterwirkung hat, damit sinnvolle Lichtmessungen gemacht werden können. Zusätzliche Kosten für ein Gehäuse belaufen sich auf ca. 20€.

Zudem braucht ihr noch eine Heißklebepistole, Bohrmaschine ,Schraubendreher sowie ein paar Kabelbinder zur Befestigung.

Im folgenden Video wird der Zusammenbau gezeigt, weiter unten folgt eine Schritt-für-Schritt Anleitung:

{%youtube%}TgEQvMPjrMA{%endyoutube%}

## Gehäuseaufbau
Für unseren Testaufbau benutzen wir [dieses Gehäuse](https://raw.githubusercontent.com/sensebox/resources/master/datasheets/datasheet_case_FIBOX_piccolo_pc-d-85-t.pdf) der Firma FIBOX ([hier](http://de.farnell.com/fibox/pc-d-85-t/box-polycarbonat-ip67-deckel-klar/dp/1004124) bestellbar):

<img src="https://raw.githubusercontent.com/sensebox/resources/master/images/home/Fibox.jpg" align="center" width="400"/>

#### Kabelführung bohren
Durch eine ca. 15mm breite Bohrung im Boden des Gehäuses werden Strom- und Netzwerkkabel gelegt, sowie das lange Verbindungskabel für den HDC1008 Temperatur-/Luftfeuchtesensor:

|||
|---|---|
|<img src="https://raw.githubusercontent.com/sensebox/resources/master/images/home/bohrung_1.jpg" align="center" width="400"/>|<img src="https://raw.githubusercontent.com/sensebox/resources/master/images/home/bohrung_2.jpg" align="center" width="400"/>|

> Im Video an der Stelle {%m id="TgEQvMPjrMA", m=0, s=0%}{%endm%}

#### Hauptplatinen festkleben
Dazu setzen wir im Gehäuse einige Klebepunkte mit dem Heißkleber und drücken die Hauptplatine an, bis der Kleber getrocknet ist:

<img src="https://raw.githubusercontent.com/sensebox/resources/master/images/home/angeklebt.jpg" align="center" width="400"/>

> Im Video an der Stelle {%m id="TgEQvMPjrMA", m=0, s=50%}{%endm%}

#### Sensoren befestigen
Es sollte darauf geachtet werden, dass ***keine Kleberreste*** auf die Oberseite der Sensorplatinen kommt! Beim festkleben der Sensoren reicht schon ein wenig Heißkleber aus.

Die beiden Lichtsensoren oben auf das senseBox-Shield kleben. Die beiden Lichtsensoren sollten "freie Sicht" zum transparenten Deckel haben und nicht von den Kabeln bedeckt werden!

|||
|---|---|
|<img src="https://raw.githubusercontent.com/sensebox/resources/master/images/home/sensor_ankleben_1.jpg" align="center" width="400"/>|<img src="https://raw.githubusercontent.com/sensebox/resources/master/images/home/sensor_ankleben_2.jpg" align="center" width="400"/>|

Den Luftdrucksensor ebenfalls im Gehäuse mit etwas Heißkleber weiter vorne befestigen:

|||
|---|---|
|<img src="https://raw.githubusercontent.com/sensebox/resources/master/images/home/luftdruck_ankleben_1.jpg" align="center" width="400"/>|<img src="https://raw.githubusercontent.com/sensebox/resources/master/images/home/luftdruck_ankleben_2.jpg" align="center" width="400"/>|

> Im Video an der Stelle {%m id="TgEQvMPjrMA", m=2, s=2%}{%endm%}

#### Temperatursensor anbringen
Im Gehäuse werden Temperatur und Luftfeuchte durch die Eigenwärme des Mikrocontrollers beeinflusst. Daher muss der HDC1008 außerhalb in einem zweiten Gehäuse angebracht werden, in dem er vor Regen oder Spritzwasser geschützt ist. Dazu führen wir das lange Sensor-Verbindungskabel durch die Bohrung nach außen und verbinden es mit dem Sensor.

<img src="https://raw.githubusercontent.com/sensebox/resources/master/images/home/temp_aussen.jpg" align="center" width="400"/>

> Im Video an der Stelle {%m id="TgEQvMPjrMA", m=4, s=20%}{%endm%}

#### Strom- und Netzwerkanschluss
Um die senseBox mit Strom zu versorgen, kann ein Power-over-Ethernet-Adapter (POE) verwendet werden. Dieser wird an den Netzwerk- und Stromanschluss der Hauptplatinen angeschlossen. Danach kann das Ethernetkabel durch das Bohrloch geführt und in den Adapter gesteckt werden.

|||
|---|---|
|<img src="https://raw.githubusercontent.com/sensebox/resources/master/images/home/POE_1.jpg" align="center" width="400"/>|<img src="https://raw.githubusercontent.com/sensebox/resources/master/images/home/POE_2.jpg" align="center" width="400"/> |

> Im Video an der Stelle {%m id="TgEQvMPjrMA", m=5, s=0%}{%endm%}

Nun kann das Gehäuse verschlossen werden.

#### Temperatursensorgehäuse
Damit der Temperatur- und Luftfeuchtesensor durch Regen und Schmutz geschützt ist, wird er in einem eigenen Gehäuse untergebracht. Dazu den Sensor einfach in das 3D-gedruckte Gehäuse schieben und danach die Klappe aufschieben.

<img src="https://raw.githubusercontent.com/sensebox/resources/master/images/home/temp_gehaeuse.jpg" align="center" width="400"/>

Das Gehäuse kann danach etwa mit Heißkleber an das Haupt-Gehäuse geklebt werden.

> Im Video an der Stelle {%m id="TgEQvMPjrMA", m=7, s=12%}{%endm%}

#### Kabelzugang abdichten
Damit kein Wasser durch die Kabelführung ins Innere des Gehäuses eindringt, muss diese Öffnung abgedichtet werden. Dazu eignet sich beispielsweise Dichtungsmasse oder auch Heißkleber:

<img src="https://raw.githubusercontent.com/sensebox/resources/master/images/home/abdichten.jpg" align="center" width="400"/>

> Im Video an der Stelle {%m id="TgEQvMPjrMA", m=8, s=8%}{%endm%}

#### Endergebnis
Zuletzt noch den zweiten POE-Adapter mit dem Ende des Ethernetkabels, und diesen mit Router und Netzteil verbinden.

fertig!

|||
|---|---|
|<img src="https://raw.githubusercontent.com/sensebox/resources/master/images/home/endergebnis.jpg" align="center" width="400"/>|<img src="https://raw.githubusercontent.com/sensebox/resources/master/images/home/mario_sensebox.jpg" align="center" width="400"/>|

Sucht euch einen Standort für die Station, an dem ihr eure Daten aufnehmen wollt.
Im besten Falle sollte dieser Standort exponiert unter freiem Himmel sein.
Da die Lage der Station allerdings durch Länge der Kabel begrenzt ist, werden die privaten Stationen in der Regel auf einem Balkon oder an einer Häuserwand befestigt.


>***Achtung:***
Falls der Stromstecker nach draußen verlängert werden muss, ist unbeding darauf zu achten, dass eine wetterfeste Verteilerdose verwendet wird! Diese sollte mindestens die [Schutzart IP65](http://www.ncps.de/NetCare_Trier/Lexikon/IP_Schutzarten/) erfüllen.
