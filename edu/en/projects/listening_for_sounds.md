# Listening for sounds

## Goal
In this station, we will learn how to use the microphone.

## Materials
* Mic Breakout

## Basics
The microphone is fit with an amplifier (100x) on the board.
It requires an operating voltage between 2.7V and 5.5V, and is able to perceive sounds between 58dB and 110dB.

## Construction
Consider the graphic below, and build the circuit as shown.

<img src="https://raw.githubusercontent.com/sensebox/resources/master/images/edu/aufbau_station_lauschangriff.png?raw=true" width="500"/>

> ***Note:*** *If your analog Pin `A0` is already occupied, you can use a different pin. Do not forget to change this in the code.*

## Task 1
Define the pin where your microphone’s output rests, as usual. A variable must be defined representing where the values ​​of the microphone are stored:

```arduino
int mic = A0;
long micVal = 0; // Stores the value of the sound collected by the microphone
```

Now the serial output must be initialized and the pin `mic` must be defined as `INPUT`. We will do this in `setup`:

```Arduino
void setup() {
  Serial.begin(9600);
  pinMode(mic, INPUT);
}
```

We then write a function to read the sound value collected by the microphone:


```arduino
long getMicVal() {
  micVal = analogRead(mic);
  return micVal;
}
```

Now you can show the value from the microphone in the Serial Monitor.

```arduino
void loop() {
  Serial.print(getMicVal());
}
```

You will notice that the output varies around the value of 510.
Negative values ​​may be returned.
To improve the readability of the values, we can change them in the function `getMicVal()`:

```arduino
long getMicVal() {
  int period = 3; // Averaging three values ​​in order to catch any 'outliers'
  int correction_value = 510;
  for (int i = 0; i < period; i++) {
    // Computes the absolute value of the value to intercept negative deflections
    micVal = micVal + abs (analogRead(mic) - correction_value);
    delay(5);
  }
  micVal = constrain(abs(micVal / period), 1, 500);
  return (micVal);
}
```

Now you can test out what happens when the sensor is exposed to certain sounds:

- How strong is the amplitude of conversations?
- What happens if you hold the beeper to the microphone?
- And what happens if you breath into the microphone?

## Task 2
Construct a noise operated traffic light using three LEDs.
The light should turn green when it is quiet, it should turn orange when there’s low volume, and finally it should turn red when it is noisy.
