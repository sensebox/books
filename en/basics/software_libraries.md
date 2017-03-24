# Die Verwendung von Software-Bibliotheken
Similar to the way a shield extends the hardware functionality of your Arduino, software libraries can extend your sketch by useful functions.

In principle such a library can be created by anyone, because it just separates code and functionality into additional files.
Usually we use libraries to make communication with specific sensors less complicated, and fortunately most hardware vendors provide such libraries for us.

A lot of libraries are already included with the Arduino IDE, but those for the senseBox sensors have to be installed manually.

## Importing additional Libraries
Wenn du eigene Sensoren benutzen möchtest, kann es sein dass du die dazugehörigen Bibliotheken selbst herunterladen und importieren musst.

First you have to download the library which usually is a zip file.
The Arduino IDE has a function to add external libraries. To do this, click in the menu on *Sketch* -> *Import Library* -> *Add Library*.
In the following dialog navigate to the downloaded zip file and select it.

## Adding a library to your sketch
To use a library, you have to include it in your sketch, **after** adding the library to the Arduino IDE.
To do this, you generally have two options:

### Using the menu
In the menu click on *Sketch* -> *Import Library*, and select the desired library in the following list.
When a certain library is required for one of our projects, you will be told which libraries to include.

### Writing code
When you do this task often, it may be more efficient and convenient to write a single line of code to include a library.

This line has to be at the very top of your sketch, even before the `setup()` function is defined.
Using the `#include` directive a library can be included.
For example, with the line `#include <Ethernet.h>` the required library for the ethernet-shield is included.

To make things more clear, have a look at the following code example:

```arduino
#include <Ethernet.h> // including the library

int Sensor;           // declaration of variables


void setup() {
  Ethernet.begin();   // this function is only available after importing
                      // the Ethernet.h library!
}

void loop() {
  // continuously executed commands, as usual
}
```
