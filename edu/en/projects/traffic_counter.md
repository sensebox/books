# Traffic Counter

## Goal
Building a functioning traffic counter.
For this purpose we use an ultrasonic distance sensor.
The recorded values ​​will be shown in the * Serial Monitor *.

## Materials
* Arduino Uno with Breadboard
* Ultrasonic distance sensor

## Additional materials
* No additional materials.

## Basics
The ultrasonic distance sensor uses sound to calculate the distance of objects. The sensor sends out a pulse and measures the time until it receives the echo of the pulse. The distance is calculated by using the speed of sound and the meassured time.

## Construction
The ultrasonic sensor will be connected to four different ports on the Arduino.
For the power supply connect the VCC pin with the 5V port on the Arduino. To close the circuit, the GND pin has to be connected to the GND port of the Arduino. Finally the echo and the trigger pin of the sensor have to be connected to two different digital ports of the Arduino. (e.g. 12 and 11)

<Img src = "https://raw.githubusercontent.com/sensebox/resources/master/images/edu/Verkehrszaehler.jpg" width = "500" />


## Programming

Define the pins that are connected to the sensor as usual.
In addition to that we need to define two variables to safe the measured time and the calculated distance.

`` `Arduino
int trig = 12; // Trig pin of the sensor is connected to Pin 12
int echo = 11; // Echo-pin of the sensor is connected to Pin 11
unsigned int time = 0;
unsigned int distance = 0;
`` `

In `setup ()` we must now start the * Serial Monitor * .  We then have to define which pin will be input and which one output. The trigger pin of the sensor must be defined as output and the echo pin as input.

`` `Arduino
Serial.begin (9600);
pinMode (trig, OUTPUT);
pinMode (echo, INPUT);

`` `

In `loop ()` we execute
`` `Arduino
digitalWrite (trig, HIGH);
delay microseconds (10);
digitalWrite (trig, LOW);
`` `
a 10 microseconds long ultrasonic pulse.
The subsequent command `time = pulseIn (echo, HIGH);` saves the time to catch the echo into the variable `Time`.
Finally the distance to the car must be calculated. To do this we use the variable ‘time’. The result we than display on the Serial Monitor.

`` `Arduino
distance = time / 58;
Serial.println (distance);
`` `

## Task 1
Try to build a traffic counter.

Notice:
 - Try to evaluate a specific distance range, to prevent disturbances by movements in the background.

- To avoid double counting of a stationary vehicle we should program a condition which stops counting until the lane is free again.
