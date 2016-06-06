# Inventarliste
Bevor es los geht solltet ihr überprüfen ob alle Bauteile vorhanden sind.

## Inhalt der senseBox

#### Basisstation bestehend aus drei Platinen

<img src="https://raw.githubusercontent.com/sensebox/resources/master/images/home/sensebox_home_platinen.jpg" align="center" width="400"/>

|Platine|Beschreibung|
|---|---|
|Genuino Uno (unten)|Liest die angeschlossenen Sensoren aus und überträgt die Messungen ins Internet|
|W5500 Ethernet Shield (mitte)|Ist für die Internetverbindung zuständig|
|senseBox Shield (oben)|Hier werden die Sensoren angeschlossen|

#### Grundausstattung mit vier Sensoren

<img src="https://raw.githubusercontent.com/sensebox/resources/master/images/home/sensebox_home_sensoren.jpg" align="center" width="400"/>

|Sensor|Beschreibung|
|---|---|
|HDC1008|Temperatur in Grad Celsius (°C) und relative Luftfeuchte in Prozent (%)|
|BMP280|Luftdruck in Pascal (pa)|
|TSL45315|Beleuchtungsstärke des sichtbaren Lichts in Lux (lx)|
|VEML6070|Intensität der ultravioletten Strahlung in Mikrowatt pro Quadratcentimeter (μW/cm2)

#### Anschlusskabel für Sensoren und USB-Verbindung

- 1x USB-Kabel für den Anschluss des Mikrocontrollers an den Computer
- 1x langes Verbindungskabel für kombiniertes Thermo- bzw. Hygrometer
- 3x kurzes Verbindungskabel für Barometer, Luxmeter und UV-Lichtsensor

#### Netzteil

- 9V Netzteil (670mA)

#### Gesamtüberblick:

<img src="https://raw.githubusercontent.com/sensebox/resources/master/images/home/sensebox_home_alles.jpg" align="center" width="400"/>

## Zusätzliche Materialien (NICHT im Lieferumfang enthalten)

- LAN-Kabel für den Anschluss der senseBox an euren Router
- Gehäuse für eine wetterfeste Installation der Elektronik
- Werkzeuge für den Aufbau wie z.B. Heißklebepistole

---

# Aufbau der senseBox
Hier wird in nur wenigen Schritten eure Messstation zusammengebaut.

> Die senseBox wird entweder über das USB-Kabel oder über das Netzteil mit Strom versorgt. Das Netzteil braucht ihr erst später, um die Station draußen aufzubauen.

Im Bausatz der senseBox:home befinden sich vier kleinen Platinen mit den Sensoren. Die eigentlichen Sensoren sind nur wenige Millimeter groß und befinden sich auf der Oberseite der Platinen. Um einer Beschädigung vorzubeugen, solltet ihr die kleinen Sensoren nicht berühren, sondern die Platinen nur am Rand anfassen. Der Anschluss der Sensoren ist denkbar einfach: Benutzt die Verbindungskabel, um die Sensoren mit den mittleren Steckplätzen auf der Basisstation zu verbinden. Welchen Anschluss ihr dabei nutzt spielt keine Rolle.

<img src="https://raw.githubusercontent.com/sensebox/resources/master/images/home/02_connection.png" align="center" width="400"/>

> Das lange Verbindungskabel ist für den HDC1008 gedacht!
