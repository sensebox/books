# Bearbeiten einer Station
Von bereits registrierten Stationen lassen sich sämtliche Angaben nachträglich ändern.

Hierzu wird der bei der Registrierung erhaltene **API-Key** benötigt!

1. Wähle deine Station auf der openSenseMap durch Klick auf den entsprechenden Marker auf der Karte aus.

    Alternativ kannst du auch in der folgenden URL `<senseBox-ID>` durch deine senseBox-ID (nicht der API-Key!) ersetzen:
    `https://opensensemap.org/explore/<senseBox-ID>`

2. Wähle in der rechten Sidebar den Tab "Information", und klicke unten den Button "Verwalten".

3. Gebe deinen API-Key im erscheinenden Dialog ein.
    <img src="https://raw.githubusercontent.com/sensebox/resources/master/images/osem_edit_api-key.jpg" center width="600px" />

4. Gebe deine Änderungen im sich öffnenden Formular ein.
    Neben Änderungen an Metadaten, Standort und Foto ist es auch möglich die Sensor-Konfiguration zu ändern.

    > ***Hinweis:*** *Falls du einen neuen Sensor hinzugefügt hast und den aktualisierten Arduino-Sketch herunterladen willst, ist dies erst möglich, wenn die Seite nach dem Speichern neu geladen, und der API-Key erneut eingegeben wurde.*

5. Klicke im oberen Teil des Dialogs auf "Speichern" um deine Änderungen zu speichern, oder "Abbrechen" um sie zu verwerfen.

## Löschen einer Station
Folge den Schritten unter ["Bearbeiten einer Station"](#bearbeiten-einer-station) und gebe unter "Sensebox löschen" `DELETE` in das Textfeld ein.

> ***Achtung:*** *Hierdurch werden neben deiner senseBox alle hinterlegten Sensordaten unwiderruflich entfernt!*
