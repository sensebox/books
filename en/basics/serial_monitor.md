# Serial Monitor

The serial monitor allows to transfer data (text or numbers) from and to the Arduino directly from the Arduino IDE. It is an essential tool to check what the Arduino is doing without connecting an LCD to the microcontroller.

## Starting the serial monitor

To access the serial monitor, start the Arduino IDE and click on the magnifying glass in the icon bar.

![Magnifying glass](https://raw.githubusercontent.com/sensebox/resources/master/images/arduino_magnifying_glass.png "Magnifying glass")

The serial monitor conists of an input field, a button to send and a scrolling text area for the output. The text area shows the messages the microcontroller sends through its serial interface. Ticking the Autoscroll checkbox enables the autoscroll feature which is used to only show the newest messages. New messages will appear at the bottom of the text area.

![Serial Monitor](https://raw.githubusercontent.com/sensebox/resources/master/images/arduino_serial_monitor.jpg "Serial Monitor")

## Displaying Values on the Serial Monitor

To send values from the microcontroller to the PC, first the serial interface has to be enabled through `Serial.begin(9600)` in the `setup()` method. The number 9600 defines the baud rate which is the speed at which the computer and microcontroller communicate. The baud rate defined in the sketch has to be the same in the serial monitor. Otherwise, only scrambled text will be displayed in the serial monitor. The computer and Arduino don't understand each other.

Text or Numbers can be sent over the serial interface using the methods `Serial.print()` and `Serial.println`. The former just submits the data in the parentheses, the latter appends a line break.

You can now try to use the serial interface and serial monitor for yourself. To transmit text you have to put it in quotation marks.

```arduino
Serial.println("senseBox rocks!");
Serial.print("senseBox ");
Serial.println("rocks!");
```

The example should show two lines of the text "senseBox rocks!". Please note the use of `Serial.print()` and `Serial.println()`.

It is also possible to transfer the contents of variables through the serial interface. Just put the variable name in the parentheses of either `Serial.print()` or `Serial.println()`.

```arduino
String helloString = "hello world!";
Serial.println(helloString);
```

