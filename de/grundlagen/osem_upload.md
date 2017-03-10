# openSenseMap - Mit der senseBox ins Internet

Mithilfe des Ethernet- oder WiFi-Shields der senseBox (je nach Variante) kannst du den Arduino in dein Netzwerk einbinden.
Dies ermöglicht unter anderem den Upload deiner Sensordaten zur [*openSenseMap*](https://opensensemap.org/) (OSeM).
[Hier](shields.md) findest du weitere Informationen zu den Shields.

## Aufbau
Stecke den Ethernet- bzw. WiFi-Shield auf den Arduino.
Falls der Ethernet-Shield genutzt wird, verbinde den Shield über ein Netzwerkkabel mit einem Router.

> ***Hinweis:*** *Der WiFi-Shield unterstützt nur WLAN-Netzwerke mit einfacher WEP/WPA/WPA2 Verschlüsselung. Netzwerke, die Zertifikate benötigen werden leider nicht unterstützt!*

## openSenseMap Registrierung
Bevor deine Messdaten auf der openSenseMap veröffentlicht werden können, muss eine Messstation dort registriert werden.
Besuche hierzu die [Registrierungsseite](https://opensensemap.org/register), und gebe deine Daten an.

Falls alle senseBox-Sensoren angeschlossen werden sollen, kann unter Sensorkonfiguration die Variante "senseBox:home" gewählt werden, da diese die gleichen Sensoren enthält.
Falls andere oder weniger Sensoren angeschlossen sind, können die einzelnen Sensoren unter "manuelle Konfiguration" eingestellt werden:

![manuelle Konfiguration](https://raw.githubusercontent.com/senseBox/resources/master/images/osem_sensorconfig.png).

Anschließend wird dir ein Arduino-Sketch angezeigt (und per Mail geschickt), welcher bereits Funktionen enthält um sich mit der OSeM zu verbinden.
**Wenn du in der Registrierung "manuelle Konfiguration" gewählt hast, muss noch der Code zum Auslesen deiner Sensoren in dem Sketch ergänzt werden.**

## Erweiterung des Sketches
Falls du eine senseBox mit WiFi-Shield hast, musst du oben im Sketch unter `ssid` und `pass` deine WLAN-Logindaten einsetzen.

Den Code zum auslesen der Sensoren kannst du in etwa aus den vorigen Stationen übernehmen.
Für jeden Sensor muss in der Regel...

1. eine Bibliothek eingefügt werden
2. der Sensor deklariert und initialisiert werden (`setup()`-Funktion)
3. der Sensor ausgelesen werden (`loop()`-Funktion)

Dies wird im folgenden am Beispiel des BMP280 Luftdrucksensors dargestellt.

### Beispiel: BMP280
Füge die `BMP280.h` Bibliothek ganz oben im Sketch hinzu, und erstelle eine Instanz `bmp` davon. Auf diesem Objekt werden alle Funktionen des BMP280 aufgerufen:

```arduino
#include <BMP280.h>
BMP280 bmp;
```

In der `setup()`-Funktion muss der Sensor initialisiert werden. Verwende dazu die folgenden Zeilen:

```arduino
if (!bmp.begin()) Serial.println("BMP init failed!");
bmp.setOversampling(4);
```

Nun muss der Sensor in der `loop()`-Funktion innerhalb der `if`-Abfrage ausgelesen werden. In den Variablen `temp` und `pressure` stehen dann jeweils die aktuellen Messwerte.
Über die bereits vorhandene Funktion `postFloatValue()` wird ein Messwert zur OSeM geschickt.

```arduino
double temp, pressure;
char bmpStatus = bmp.startMeasurment();

// if an error occured on the sensor: stop
if (bmpStatus == 0) {
  Serial.println(bmp.getError());
  return;
}

delay(bmpStatus); // wait for duration of the measurement
bmpStatus = bmp.getTemperatureAndPressure(temp, pressure);

postFloatValue((float)temp, 4, TEMPSENSOR_ID);
postFloatValue((float)pressure, 4, PRESSURESENSOR_ID);
```

## Netzwerkverbindung
Nachdem du den Arduino über ein Netwerkkabel mit dem Internet verbunden hast, kannst du den Sketch mit der IDE auf den Arduino hochladen.
Im [Seriellen Monitor](der_serielle_monitor.md), wird dir nun angezeigt ob die Verbindung zum Internet funktioniert.
Sofern die Verbindung mit dem Netzwerk klappt, solltest du bald deine Messwerte auf der openSenseMap finden!

### Verbindungsprobleme
Falls deine Messwerte nicht auf der openSenseMap erscheinen, gehe folgende Schritte durch:

- **Ethernet-Shield:** Überprüfe, ob die orange LED neben dem Netzwerkstecker aufblinkt. Falls nicht, überprüfe die Kabelverbindung.
- **WiFi-Shield:** Überprüfe deine WLAN-Logindaten nochmal genau!
- öffne den Seriellen Monitor, und überprüfe die Textausgabe.
- Manche Schul- und Firmennetzwerke blockieren den Port 8000. Für diesen Fall kannst du eine alternative Upload-Addresse auf Port 80 angeben: Ersetze in deinem Sketch `char server[] = "opensensemap.org";` durch `char server[] = "ingress.opensensemap.org";`, und weiter unten in der Funktion `postObservation()` die Zeile `if (client.connect(server, 8000))` durch `if (client.connect(server, 80))`.
