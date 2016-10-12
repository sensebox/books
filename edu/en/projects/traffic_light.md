# Traffic light

## Goal
We will simulate a traffic light which will be startable from a button.

## Materials
#### From senseBox: edu
* Arduino Uno with Breadboard
* Red LED
* Yellow LED
* Green LED
* 3x 470Ω resistor
* button
* 10kΩ resistor


## Setup Description

#### Hardware configuration
! [Ampel-button-wiring diagram] (https://raw.githubusercontent.com/sensebox/resources/master/images/edu/ampel_button_schaltplan.png)

#### Software Sketch

`` `Arduino
int red = 13;
int yellow = 12;
int green = 11;

int button = 8;

void setup () {
  pinMode (red, OUTPUT);
  pinMode (yellow, OUTPUT);
  pinMode (green, OUTPUT);

  pinMode (button, INPUT);

  // set of traffic lights first to RED
  digitalWrite (red, HIGH);
  digitalWrite (yellow, LOW);
  digitalWrite (green, LOW);
}

void loop () {

  // Check if button is pressed
  if (digitalRead (button) == HIGH) {

	delay (5000);

	// RED to GREEN
	digitalWrite (red, HIGH);
	digitalWrite (yellow, HIGH);
	digitalWrite (green, LOW);

	delay (1000);

	digitalWrite (red, LOW);
	digitalWrite (yellow, LOW);
	digitalWrite (green, HIGH);

	delay (5000);


	// GREEN to RED
	digitalWrite (red, LOW);
	digitalWrite (yellow, HIGH);
	digitalWrite (green, LOW);

	delay (1000);


	digitalWrite (red, HIGH);
	digitalWrite (yellow, LOW);
	digitalWrite (green, LOW);
  }
}

`` `

* At the beginning of the `loop ()` -function we check if the start button is pressed.
* `DigitalRead (button)` reads the current state of the button.
