# Web-Integration
Hier wird die Einbindung der senseBox in unser Sensornetzwerk durch die Registrierung auf der openSenseMap beschrieben.

## Registrierung auf der openSenseMap
Unter <https://opensensemap.org/register> kann eine neue Sensorstation für das openSenseMap Sensornetzwerk registriert werden.
<!--Eine detaillierte Anleitung dazu findet sich in der [openSenseMap Dokumentation](//books.sensebox.de/books/osem/de/osem_registrierung.html).-->
Bei Schritt 3 der Registrierung wirst du nach einem Hardware Setup gefragt. Wähle dort die „senseBox:home“ aus und setze danach je nach Ausgabe den Haken bei „senseBox:home (Ethernet)“ oder „senseBox:home (WLAN)“.

Ein Software-Programm für einen Arduino Mikrocontroller ist an der Dateiendung `.ino` zu erkennen. Eine solche Datei wird benötigt, um eure senseBox mit der openSenseMap im Internet zu verbinden. Den passenden Sketch bekommst du zusammen mit einer E-Mail zugeschickt, wenn die Station auf der openSenseMap registriert wurde.

## Programm auf die Station laden
Nachdem du den `.ino` Anhang der Email heruntergeladen hast, muss dieses Programm auf deine senseBox geladen werden. Wie man genau ein Programm auf den Mikrocontroller lädt, ist [hier](software_installation.md) ausführlich erklärt worden. Hier die Schritte in der Übersicht:

- Arduino Anwendung öffnen
- In der Menüleiste `Datei` → `Öffnen` auswählen und die `sensebox.ino` Datei auswählen
- Dialog mit "Ja" bestätigen
- Das Programm über das **Pfeil** Icon auf den Mikrocontroller laden
- Warten bis das Programm übertragen wurde

Wenn alles richtig gelaufen ist, kannst du nun auf der openSenseMap deine Station auswählen und verfolgen, wie Messungen kontinuierlich übertragen werden!

> **Hinweis:** *Standardmäßig werden Messungen zur openSenseMap auf Port 8000 hochgeladen. Falls dein Netzwerk diesen Port blockieren sollte, kannst du deinen Sketch wie folgt anpassen um einen alternativen Endpoint auf Port 80 zu nutzen:*
> - Ersetze die Zeile `char server[] = "opensensemap.org";` durch `char server[] = "ingress.opensensemap.org";`.
> - Ersetze in der Funktion `postObservation()` die Zeile `if (client.connect(server, 8000))` durch `if (client.connect(server, 80))`.
