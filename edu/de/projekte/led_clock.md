# LED Uhr
Du wirst Nachts wach und willst wissen wie spät es ist? Einfach zweimal in die Hände klatschen und die Uhr beginnt zu leuchten.&nbsp;
<img src="https://raw.githubusercontent.com/sensebox/resources/master/images/edu/led_clock(3).gif?raw=true" width="500"/>&nbsp; 
<img src="https://raw.githubusercontent.com/sensebox/resources/master/images/edu/led_clock(4).gif?raw=true" width="500"/>&nbsp; 

## Ziele der Station
Wir wollen mit hilfe des Neopixelring mit 60 LED eine Uhr bauen, die durch klatschen gesteuert wird.

## Materialien
* Arduino
* Mikrophon  
## Materialien die nicht in der senseBox enthalten sind
* Neopixelring
* RTC Element 
* analoge Uhr mit Glasscheibe

<img src="https://raw.githubusercontent.com/sensebox/resources/master/images/edu/led_clock(1).jpg?raw=true" width="500"/>&nbsp; 

***Hinweis** Man kann das RTC Modul auf dem senseBox-Shield verwenden. Wir verwenden aus platzgründen jedoch das Groove Module*

## Aufbau
<img src="https://raw.githubusercontent.com/sensebox/resources/master/images/edu/led_clock(2).jpg?raw=true" width="500"/>&nbsp; 
1. Mikrofon  &nbsp;
2. Neopixel LED Ring &nbsp;
3. Grove RTC &nbsp;
4. Arduino &nbsp;
5. Analoges Uhrwerk (Ist nicht mit dem Arduino verbunden) &nbsp;

# Schritt 1 Der LED Ring
Viele LED Ring kommen ohne Kabel. In diesem Fall müssen wir zunächst Kabel an die Kontakte `Di` (Steuersignale),`5V` (Spannungsversorgung) und `GND` (Minuspol) anlöten. Um den LED Ring vor überspannung zu schützen, sollte ein Widerstand an den Datenpin gelötet werden.  Anschließend müssen wir den LED Ring mittig hinter die Glasscheibe der Uhr kleben. Den Ring nun mit dem Ardunio verbindn (`Di` an Pin 6) &nbsp; 
# Schritt 2 RTC Modul (Uhr)
Die RTC wird über den I2C-Bus angeschlossen. Dazu muss der Anschluss `SCL` mit Pin A5 verbunden werden und der Anschluss `SDA` mit Pin A4. Anschluss `GND` und `VCC` wie üblich an Pin `GND` und Pin `3.3V`.&nbsp; 
# Schritt 3 Mikrofon 
Das Mikrofon wird über 3 Pins anschgeschlossen `GND`, `3.3V` und eine Datenleitung. Da wir bereits beide Pins mit konstanter Spannung beim Arduino belegt haben, müssen wir uns mit einem kleinen Trick behelfen. Entwerder löten wir die `3.3V` Anschlüsse von RTC Modul und Mikrofon zusammen oder Teilen den Pin über ein Breadboard auf. Die Datenleitung muss an einen analogen Pin des Arduino angeschlossen werden. Wir wählen pin `A0`.&nbsp; 
Jetzt müssen alle Bauteile mit heißkleber oder Panzerband hinter der Glasscheibe befestigt werden.

## Programmierung
Zunächst importieren wir die bnötigeten Bibliotheken:
```arduino
#include <Wire.h>
#include <RTClib.h>
#include <Adafruit_NeoPixel.h>
```
Dann sollten Variablen für die Pins definiert werden, welche wir beim Aufbau verwendet haben. Außerdem müssen Objekte der einzelnen Bibliotheken erstellt werden. 
```arduino
// define pins
int ring = 6;
int mic = A0;
int duration = 15; // time of backgroundlight (how long clock showes time on led ring)

RTC_DS1307 RTC; // Establish clock object
DateTime Clock; // Holds current clock time
Adafruit_NeoPixel strip = Adafruit_NeoPixel(60, ring, NEO_GRB + NEO_KHZ800); // strip object
byte hour_val, minute_val, second_val,day_val, month_val, year_val; // holds the time
byte pixelColorRed, pixelColorGreen, pixelColorBlue; // holds color values
```
In der `setup`-Methode Werden die Objekte mit der Methode `begin` inizialisiert. Den Pins für das Mikrofon und für den LED Ring wird zugewiesen, ob sie ein Eingang oder Ausgang sind und schließlich wird der Uhr eine Uhrzeit übergeben. (Dies ist spezifisch für die RTC von Grove. Wie man die RTC des senseBox-Shields startet kannst du im Grundlagenkapitel [Die Echtzeit-Uhr]((../grundlagen/uhr.md)) nachschauen.)  

Die Uhrzeit soll nur dann auf dem LED Ring angezeigt werden, wenn das Mikrofon zwei laute Geräusche in einem Zeitintervall von ca. 3 Sekunden registriert. Dazu schreiben wir die Methode `checkfordoubleClap`. Sie gibt `true` zurück falls zwei Geräusche registriet wurden. Ansonsten gibt sie `false` zurück.

```arduino
boolean checkDoubleClap(){
  if(analogRead(mic) > 90){ 
     //Serial.println("trigger1");
     delay(200);
    int counter = 0;
    //checks for second sound for ca. 5*500 ms
    while(counter<100){     
      if(analogRead(mic) > 90){
         //Serial.println("trigger2");        
        return true;        
      }      
     counter++;
     delay(5);
    }
  }
  return false;
}
```
Außerdem wollen wir uns eine Methode `getTime` schreiben, die die aktuelle Uhrzeit vom RTC Modul erfragt und in Variablen speicher.
```arduino
void getTime(){
   Clock = RTC.now(); // get the RTC time
   second_val = Clock.second();  // get seconds      
   minute_val = Clock.minute();  // get minutes
   hour_val = Clock.hour();   // get hours
   day_val = Clock.day();
   month_val =Clock.month();
   year_val = (Clock.year() +1792);
}
```
Etwas komplizierter ist die Methode `setPixelColour, welche aus der Uhrzeit berechnet, welcher Pixel in welcher Farbe gesetzt sein muss. 
```arduino 
void setPixelColour(){
  for(uint8_t i=0; i<strip.numPixels(); i++){    
        pixelColorBlue = 255;
        pixelColorRed = 0;
        pixelColorGreen = 0;
            
        if(i <= minute_val){
          pixelColorGreen = 255;
          pixelColorBlue = 0;
        }
        if(i == second_val){
          pixelColorRed = 255;
          pixelColorBlue = 0;
          pixelColorGreen = 0;
        }
        
        //set hour led red
        float temp_h = (hour_val % 12);//from 24 to 12
        temp_h = temp_h *5;   //  temp_h /12*60   
        temp_h = temp_h + (minute_val/12); // ever 12 minutes the red dot wanders           one led further  
        int temp_h2 = int(temp_h)%60;//if temp_h bigger 60 eg 12:24
        if((temp_h2 == i)){          
          pixelColorRed = 255;
          pixelColorBlue = 0;
          pixelColorGreen = 0;
        }        
        strip.setPixelColor(i, strip.Color(pixelColorRed, pixelColorGreen,                  pixelColorBlue));  
      } 
      strip.show();      
      // wait
      delay(100);
}
```

Nun haben alle Teile die wir brauchen. In der 'loop'-Methode soll nun alles verbunden werden.
```arduino
void loop(){
  //checks for two loud noises within 3 sec.
  boolean double_clapp = false;
  double_clapp =  checkDoubleClap();  
  
  //showes time on led ring
  if(double_clapp){   
    //keeps clock brigth for `duration`
    strip.setBrightness(64); 
    second_val = Clock.second();
    int timer = ((second_val+ duration) % 59);    
    
    while(second_val != timer){             
      // get time
      getTime();
      //Ring to show minutes(green), sec(red) and hour (red) else (blue)
      setPixelColour();
    }    
    strip.setBrightness(0);
    strip.show();
  }
  delay(5);
}
```
