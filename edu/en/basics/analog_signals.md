# Analog signals

Unlike digital signals, analog signals can have lots of values varying between a high and a low level. The exact number of values the Arduino UNO can handle is 1024 (10 bit).
The highest level equals 5V and the lowest 0V, meaning that in-between these levels the Arduino can read 1024 different currents.
To read these currents you can use the Arduino’s six analog in pins (A0 - A5).

## Controlling analog actuators

The most important command to control analog actuators is `analogWrite()`. This command applies a specific current to the specified pin.
The Arduino doesn't have analog output pins. Instead it can use the digital pins 3, 5, 6, 9, 10 and 11 to specify the current via pulse width modulation.
The syntax of this command is `analogWrite(pin, <value>)`. The value can vary between `0` (always off) and `255`(always on).
Keep in mind, that you have to declare the used pin as `OUTPUT`.

An example program that writes the value 60 to pin 9, can look like this:

```arduino
void setup() {
  pinMode(9, OUTPUT);
}

void loop() {
  analogWrite(9, 60);
}
```

## Reading analog sensors
To read an incoming analog value, you can use the command `analogRead()` just like you would do with digital signals.
The received values between 0V and 5V are processed by the built-in digital-analog converter, converting them into `integer`-values between 0 and 1023.
The reading takes approximately 0.0001 seconds. This means approximately 10,000 readings/second are possible.
All the values can be displayed in the serial monitor.

An example program can look like this:

```arduino
int analogPin = 3; // potentiometer on pin 3
int val = 0;       // variable to save the incoming values

void setup() {
  pinMode(analogPin, INPUT);
  Serial.begin(9600);  // start of the serial monitor
}

void loop() {
  val = analogRead(analogPin); // reading the potentiometer
  Serial.println(val);         // display the measurements
}
```

