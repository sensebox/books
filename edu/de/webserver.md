# Kleiner Webserver

## Ziele der Station
In dieser Station wollen wir lernen, wie wir eine Webseite aufrufen die auf der SD Karte des Arduinos gespeichert ist. Über diese Seite sollen dann einzelne Pins des Arduinos geschaltet werden.

Das Projekt ist aufwändiger als die Einstiegsprojekte; du solltest also schon ein bisschen Erfahrung aus anderen Projekten gesammelt haben bevor du mit dem Webserver beginnst.
Die Themen Netzwerkzugriff und HTML sind so umfangreich, dass wir sie im Rahmen dieses Projekts nur anschneiden können. Weiterführende Informationen sind im Internet aber leicht zu finden!

## Materialien
* Ethernet-Shield

#### Materialien die nicht in der senseBox enthalten sind
* LAN Kabel

## Grundlagen
### Ethernet-Shield
In der senseBox ist ein Ethernetshield enthalten. Über dieses kann man den Arduino mit Hilfe des LAN-Kabels mit dem Netzwerk verbinden.

Da es meist sehr schwer ist, über das Internet auf ein Schulnetzwerk zu zugreifen, werden wir nur über das lokale Netzwerk auf den Arduino zugreifen.

Falls ihr dennoch den Arduino über das Internet erreichbar machen wollt und Zugang zu eurem Router habt, gibt es die Möglichkeit dies über *Portforwarding* umzusetzen.
[Hier](http://www.pcwelt.de/ratgeber/Crashkurs__Fernzugriff_und_Portfreigaben-Via_Internet_ins_Heimnetz-8324897.html) findet ihr weitere Informationen dazu.

### Webserver
Als Webserver (englisch server ‚Diener‘) bezeichnet man einen Computer mit Webserver-Software (in unserem Fall den Arduino), der Dokumente an Clients wie z.B. Webbrowser überträgt. Das Dokument ist bei uns der Inhalt von index.htm.

## Aufbau
`TODO: picture of server`

## Aufgabe 1
Für den Server werden drei Bibliotheken benötigt:
```arduino
#include <Ethernet.h>
#include <TextFinder.h>
#include <SD.h>
```
**Achtung** *Es ist wichtig, dass ihr die Ethernet-Bibliothek von unserer [Website](https://github.com/sensebox/resources/blob/master/libraries/senseBox_Libraries.zip?raw=true) benutzt. Mit der Standartbibliothek vom Arduino funktioniert unser Ethernet-Shield nicht. Die Arduinoumgebung wird die Ethernet-Bibliothek immer 'aktualisieren' wollen; das dürft ihr nicht machen.*

Anschließend müssen in zwei Variablen die MAC-Adresse und die IP-Adresse des Arduino-Servers fest legen. Zusätzlich muss der Pin 4 als SD-Karten Pin festgelegt werden. Außerdem definieren wir uns ein`File`-Objekt `webFile` in dem die HTML Seite abgelegt wird.

```arduino
// MAC-Adresse des Ethernet-Shield
byte mac[] = { 0xDE, 0xAD, 0xBE, 0xEF, 0xFE, 0xED };
// Lokale IP zum aufrufen des Webservers
IPAddress ip(192, 168, 0, 42);
// Pin der SD-Karte
byte sdPin = 4;
File webFile;
```

Dem Server müssen wir jetzt noch ein Port zuweisen. Außerdem führen wir eine Variable ein, über die definiert wird ob wir uns im Testmodus befinden. In diesem Fall werden über den seriellen Port zusätzliche Statusinformationen ausgegeben, die das System allerdings verlangsamen.
```arduino
// Server port
EthernetServer server(80);
boolean testmode = false;// Auf true setzen falls etwas nicht funktioniert.
Dann werden Informationen über die serielle Schnittstelle ausgegeben.
```

In der setup-Methode wird im ersten Schritt die mac-Adresse und die IP-Adresse an den Server übergeben. Anschließend wird überprüft ob ein Zugriff auf die SD Karte besteht und ob auf der Karte ein Datei mit dem Namen `index.htm` existiert. Falls die Variable `testmode` auf `true` gesetzt wurde, werden über die serielle Schnittstelle Statusinformationen ausgegeben. Das kann dir bei der Suche von Fehlern helfen.

```arduino
void setup() {
  if(testmode) Serial.begin(9600);
  Ethernet.begin(mac, ip); // Client starten
  server.begin();          // Server starten

  if(testmode) Serial.println("Initialisiere SD-Karte...");
  if(!SD.begin(sdPin)) {
    if(testmode)Serial.println("Initialisierung der SD-Karte fehlgeschlagen!");
    return;
  }
  if(testmode) Serial.println("SD-Karte erfolgreich initialisiert.");

  if(!SD.exists("index.htm")) {
    if(testmode) Serial.println("Datei (index.htm) wurde nicht gefunden!");
    return;
  }
  if(testmode) {
    Serial.println("Datei (index.htm) wurde gefunden.");
    Serial.println("Verbraucher schalten");
  }  
}
```
Die `loop`-Methode ist in zwei Bereiche unterteilt. Im ersten Teil werden Aktionen auf der Website ausgewertet, im zweiten Teil wird die Website von der SD-Karte ausgelesen und an den Browser gesendet.

### Auswertung von Anfragen
Wenn der client verfügbar ist, wartet der `finder` auf eine Anfrage vom client. Bekommt er diese, sucht er das Schlüsselwort "pin" speichert er die nächsten beiden Zeichen in den Variablen `typ`, `pin` und `val`. Je nach Typ wird dann eine Aktion ausgeführt.
Standartmäßig sind die Typen D, A und a definiert.
D = digitalen Pin schalten
A = analogen Pin schalten
a = analogen Pin auslesen
```arduino
void loop() {
  /**********************
   * Anfragen auswerten *
   **********************/
  EthernetClient client = server.available(); // Auf Anfrage warten
  if(client) {
    TextFinder finder(client);

    if(finder.find("GET")) { //erkennt Aktion auf der Website
      while(finder.findUntil("pin", "\n\r")) {// Bis das Schlüsselwort "pin" erkannt wird
        char typ = char(client.read());
        int  pin = int(finder.getValue());
        int  val = int(finder.getValue());

        if(typ == 'D') {
          pinMode(pin, OUTPUT);
          digitalWrite(pin, val);
          if(testmode)Serial.print(" - D"+String(pin));
        }
        else if(typ == 'A') {
          analogWrite(pin, val);
          if(testmode)Serial.print(" - A"+String(pin));
        }
        else if(typ == 'a') { // a -> Sensorwert auslesen und ausgeben
          val = analogRead(pin);
          if(testmode)Serial.print(" - a"+String(pin));
        }
        else {
          if(testmode) Serial.print(" - Falscher Typ");
        }
        //Hier können neue Befehle definiert werden die aus dem Browser gestartet werden.
        if(testmode) {
          if(val==1) Serial.println(" ein");
          else if(val==0) Serial.println(" aus");
          else Serial.println(" "+ val);
        }
      }
    }
```

### Webformular anzeigen
Jede Zeile des HTML Dokuments wird eingelesen und an den Browser geschickt. Da der Speicherplatz für Variablen sehr begrenzt ist, wird die Zeichenkette (String) bei jedem Leerzeichen oder Zeilenumbruch geteilt. Anschließend wird der String nach bestimmten Schlüsselwörtern durchsucht. Diese kann man nach bedarf in der Methode `filter` nach bedarf definieren. Diese Schlüsselwörter können dann durch Sensorwerte ersetzt werden.

```arduino
    /************************
    * Webformular anzeigen  *
    ************************/
    boolean current_line_is_blank = true;         // eine HTTP-Anfrage endet mit einer Leerzeile und einer neuen Zeile
    String htmlline = "";
    while (client.connected()) {
      if (client.available()) {                   // Wenn Daten vom Server empfangen werden

        char c = client.read();                   // empfangene Zeichen einlesen
        if (c == '\n' && current_line_is_blank) { // wenn neue Zeile und Leerzeile empfangen
          // Standard HTTP Header senden
          client.println("HTTP/1.1 200 OK");
          client.println("Content-Type: text/html");
          client.println("Connection: close");
          client.println();

          // Website von SD-Karte laden
          webFile = SD.open("index.htm");  // Website laden
          if (webFile) {
            while(webFile.available()) {
              char temp = char(webFile.read());
              //Bei jedem Leerzeichen wird ein neuer String generiert
              if((int(temp) != 10)&&(int(temp) != 32)&&(int(temp) != 13)){
                htmlline = htmlline + char(temp);
              }
              else {
                htmlline = filter(htmlline); //Ersetzt Schlüsselwörter zum Beispiel durch Sensorwerte
                client.println(htmlline);
                if(testmode) Serial.println(htmlline);
                htmlline = "";
              }
            }
            webFile.close();
          }
          break;
        }
        if (c == '\n') {
          current_line_is_blank = true;
        }
        else if (c != '\r') {
          current_line_is_blank = false;
        }
      }
    }
    delay(1);
    client.stop();
  }
}

//Ersetzt Schlüsselwörter zum Beispiel durch Sensorwerte
// Es können nach belieben neue Schlüsselwörter definerit und durch andern Text ersätzt werden
String filter(String htmlline){
  htmlline.replace("sa0en",String(analogRead(A0)));
  htmlline.replace("sa1en","No sensor");
  htmlline.replace("sa2en","No sensor");
  htmlline.replace("sa3en","No sensor");
  htmlline.replace("sa4en","No sensor");
  htmlline.replace("sa5en","No sensor");
  return htmlline;
}
```

###HTML Dokument
Unsere erste kleine Webseite sieht so aus:
<img src="https://raw.githubusercontent.com/sensebox/resources/master/images/edu/webserver_htm.png" width="600"/>

Diesen Code musst du kopieren und in einer Textdatei abspeichern. Den Namen der Textdatei musst du anschließend in index.htm ändern. Das HTML Dokument muss anschließend auf der SD Karte gespeichert und diese in das Ethernetshield gesteckt werden.
```arduino
<!DOCTYPE html>
<html>
<head>
  <title>Arduino Server senseBox</title>
  <style type="text/css">
    h2 { margin-bottom:5px; }
    table {width: 40%;} th { background-color: #666; color: #fff; } tr { background-color: #fffbf0; color: #000; } tr:nth-child(odd) { background-color: #e4ebf2 ; } </style>
    </style>
</head>
<body>
  <img src="sensebox_logo_neu.png" alt="sensebox" width="700" height="150"/>
  <h1>Arduino Server senseBox</h1>
  <!-- D for digitalWrite, A for analogWrite, d for digitalRead, a for analogRead -->
  <table>
    <tr> <td>Digitale Ausg&auml;nge</td> <td> Aktion </td><td>Analoge Ausg&auml;nge</td><td>Aktion</td></td></tr>
    <tr> <td>Pin0:</td> <td> <a href="/?pinD0=1" target="ifr">Ein</a> <a href="/?pinD0=0" target="ifr">Aus</a> </td> <td> Pin A0:</td> <td><a href="/?pinA0=1" target="ifr">Ein</a> <a href="/?pinA0=0" target="ifr">Aus </a> <a href="/?pina0=2" target="ifr"> getValue </a></td></tr>
    <tr> <td>Pin1:</td> <td> <a href="/?pinD1=1" target="ifr">Ein</a> <a href="/?pinD1=0" target="ifr">Aus</a> </td> <td> Pin A1:</td> <td> <a href="/?pinA1=1" target="ifr">Ein</a> <a href="/?pinA1=0" target="ifr">Aus</a> <a href="/?pina1=2" target="ifr"> getValue </a></td></tr>
    <tr> <td>Pin2:</td> <td> <a href="/?pinD2=1" target="ifr">Ein</a> <a href="/?pinD2=0" target="ifr">Aus</a> </td> <td> Pin A2:</td> <td> <a href="/?pinA2=1" target="ifr">Ein</a> <a href="/?pinA2=0" target="ifr">Aus</a> <a href="/?pina2=2" target="ifr"> getValue </a></td></tr>
    <tr> <td>Pin3:</td> <td> <a href="/?pinD3=1" target="ifr">Ein</a> <a href="/?pinD3=0" target="ifr">Aus</a> </td> <td> Pin A3:</td> <td> <a href="/?pinA3=1" target="ifr">Ein</a> <a href="/?pinA3=0" target="ifr">Aus</a> <a href="/?pina3=2" target="ifr"> getValue </a></td></tr>
    <tr> <td>Pin4:</td> <td> <a href="/?pinD4=1" target="ifr">Ein</a> <a href="/?pinD4=0" target="ifr">Aus</a> </td> <td> Pin A4:</td> <td> <a href="/?pinA4=1" target="ifr">Ein</a> <a href="/?pinA4=0" target="ifr">Aus</a> <a href="/?pina4=2" target="ifr"> getValue </a></td></tr>
    <tr> <td>Pin5:</td> <td> <a href="/?pinD5=1" target="ifr">Ein</a> <a href="/?pinD5=0" target="ifr">Aus</a> </td> <td> Pin A5:</td> <td> <a href="/?pinA5=1" target="ifr">Ein</a> <a href="/?pinA5=0" target="ifr">Aus</a> <a href="/?pina5=2" target="ifr"> getValue </a></td></tr>
    <tr> <td>Pin6:</td> <td> <a href="/?pinD6=1" target="ifr">Ein</a> <a href="/?pinD6=0" target="ifr">Aus</a> </td> <td></td></tr>
    <tr> <td>Pin7:</td> <td> <a href="/?pinD7=1" target="ifr">Ein</a> <a href="/?pinD7=0" target="ifr">Aus</a> </td> <td></td></tr>
    <tr> <td>Pin8:</td> <td> <a href="/?pinD8=1" target="ifr">Ein</a> <a href="/?pinD8=0" target="ifr">Aus</a> </td> <td></td></tr>
    <tr> <td>Pin9:</td> <td> <a href="/?pinD9=1" target="ifr">Ein</a> <a href="/?pinD9=0" target="ifr">Aus</a> </td> <td></td></tr>
    <tr> <td>Pin10:</td> <td> <a href="/?pinD10=1" target="ifr">Ein</a> <a href="/?pinD10=0" target="ifr">Aus</a> </td> <td></td></tr>
    <tr> <td>Pin11:</td> <td> <a href="/?pinD11=1" target="ifr">Ein</a> <a href="/?pinD11=0" target="ifr">Aus</a> </td> <td></td></tr>
    <tr> <td>Pin12:</td> <td> <a href="/?pinD11=1" target="ifr">Ein</a> <a href="/?pinD12=0" target="ifr">Aus</a> </td> <td></td></tr>
    <tr> <td>Pin13:</td> <td> <a href="/?pinD13=1" target="ifr">Ein</a> <a href="/?pinD13=0" target="ifr">Aus</a> </td> <td></td></tr>           
  </table>
  <iframe name="ifr" style="display:none;" width="0" height="0"></iframe>
</body>
</html>
```
