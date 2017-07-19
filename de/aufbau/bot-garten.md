# senseBox Botanischer Garten

Die senseBox im Botanischen Garten in Münster besteht aus einer erweiterten senseBox:home. Sie misst die üblichen Phänomene wie Temperatur, Luftfeuchtigkeit, Luftdruck, Helligkeit und UV-Index. Zusätzlich werden die Windrichtung, Windgeschwindigkeit, Niederschlagsmenge sowie die Wolkenbedeckung gemessen.

<iframe
  src="https://sensebox.github.io/opensensemap-widget/iframe.html?senseboxId=5819ed81c5f60d0011b7f94f"
  width="400"
  height="600"
  marginwidth="8" marginheight="8"
  hspace="0" vspace="0"
  frameborder="0"
  scrolling="no"
></iframe>

## Komponenten

Die senseBox besteht aus folgenden Komponenten:
- senseBox:home
- [Wetter-Messeinheit](http://www.watterott.com/de/Wetter-Messeinheit)
- [senseBox:cloud](https://github.com/felixerdy/senseBox-cloud)
- SHT15 Temperatur-/Luftfeuchtesensor

## Aufbau

Alle Komponenten sind an der Wetter-Messeinheit befestigt. Die senseBox:cloud und senseBox:home wurden an einem Arm befestigt, damit die Kamera einen uneingeschränkten Blick auf den Himmel hat.

![Foto](https://github.com/sensebox/resources/raw/0e66831132400659b518729a37133a3f6f13f815/images/Botanischer_Garten/sensebox-botanischer-garten.jpg)

### Gehäuse
Als Gehäuse wird ein Installationsgehäuse mit transparentem Deckel genutzt (in diesem Fall: https://www.conrad.de/de/installations-gehaeuse-202-x-152-x-90-abs-licht-grau-ral-7035-spelsberg-tg-abs-2015-9-to-1-st-533295.html). Im Gehäuse sind die senseBox:cloud und die senseBox:home untergebracht.
![Foto](https://github.com/sensebox/resources/raw/0e66831132400659b518729a37133a3f6f13f815/images/Botanischer_Garten/gehaeuse-innen.jpg)

### Stromversorgung
Zur Stromversorgung wird von diesem Netzteil bereitgestellt: https://www.distrelec.de/de/netzgeraete-mean-well-gs25b05-p1j/p/16997623?q=366457&page=1&origPos=1&origPageSize=25&simi=97.0&no-cache=true. Dazu wird etwa dieser Adapter benötigt um den Raspberry Pi mit Strom zu versorgen (https://www.adafruit.com/product/2789). In diesem Fall wurde ein Adapter jedoch selbst zusammen gelötet.


### Wetter Messeinheit

Neben den üblichen Wetterphänomenen misst die senseBox:home auch die Daten der Wetter-Messeinheit. Dazu wurden die Sensoren folgendermaßen verbunden:

![Aufbau](https://github.com/sensebox/resources/raw/0e66831132400659b518729a37133a3f6f13f815/images/Botanischer_Garten/Wetterstation_Steckplatine.png)
![Foto](https://github.com/sensebox/resources/raw/0e66831132400659b518729a37133a3f6f13f815/images/Botanischer_Garten/wettereinheit-platine.jpg)


## Software

Auf dem Raspberry Pi der senseBox:cloud läuft neben dem Code zur Aufnahme der Bilder ebenfalls ein Python Script um die Daten der senseBox:home zu empfangen und zur OpenSenseMap zu senden.

Das Python Script befindet sich [hier](https://github.com/sensebox/resources/blob/master/code/Botanischer_Garten/readArduinoPostOSeM.py)

Der Code zur Wolkenbedeckung sowie das Python Script werden beim Boot des Raspberry Pi gestartet.

Die senseBox:home sendet somit die Daten nicht selbst zum OpenSenseMap, sondern zum Raspberry Pi über die serielle Schnittstelle USB.

Der Arduino Sketch befindet sich [hier](https://github.com/sensebox/resources/blob/master/code/Botanischer_Garten/Weatherstation.ino)

## Standort

Die komplette Wetterstation wurde im Botanischen Garten in Münster in etwa 3m Höhe aufgestellt. Sie hängt an einem Masten, an welchem vorher eine Webcam installiert war. Der Masten ist umgeben von Bambusstangen.
