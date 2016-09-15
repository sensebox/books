# Installation von `ESP8266 Arduino core`
Um den ESP8266 über die Arduino IDE programmierbar zu machen, wird eine passende Toolchain benötigt.
Eine solche wurde als `ESP8266 Arduino core` von der ESP-Community entwickelt.

Zuallererst sollten die Softwarebibliotheken für die Sensoren installiert werden, falls dies noch nicht getan wurde (siehe [Anleitung](../aufbau/aufbau02_software.md)).

Danach muss die `ESP8266 Arduino core` Toolchain installiert werden.
Diese Anleitung ist analog zur Anleitung aus dem [Github Repository](https://github.com/esp8266/Arduino#installing-with-boards-manager):

1. Arduino starten
2. Im Menü unter `Datei -> Voreinstellungen` unter 'Additional Board Manager URLs' die Adresse `http://arduino.esp8266.com/stable/package_esp8266com_index.json` einfügen
3. Im Menü `Werkzeuge -> Platine -> Boards Manager` kann man nun mit der Suche oben rechts im Fenster `ESP8266 by ESP8266 Community` installieren
4. Das entsprechende Board unter `Werkzeuge -> Platine` auswählen. Sollte nicht explizit das vorhandene Board zur Auswahl stehen, ist "Generic ESP8266" eine gute Wahl.
