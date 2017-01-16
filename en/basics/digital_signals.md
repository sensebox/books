# Digital signals

A digital signal has only two possible values, 1 and 0 or high and low. An Arduino sketch is a very simple design that consists of two main components. These contain blocks with statements, which describe the program sequence:

```arduino
void setup(){
  // statements
}
void loop(){
  // statements
}
```

The setup function will be executed only once after the program start. The loop function will be executed continuously.  Both functions are absolutely mandatory for the program to be compiled successfully.
“Compiling” means translating program code into machine code.

## Controlling digital actuators

To control a digital actuator, for example a LED, you need two commands:
The first one is placed in the setup function, while the second command belongs in the loop function.
In the setup function, the command `pinMode (13, OUTPUT);` is used to declare that an output is connected to port 13.
In the loop function, the command `digitalWrite(13, HIGH);` is used to turn on power at port 13. The counterpart of this command is `digitalWrite(13, LOW);` to turn off power at port 13.
The final sketch should look like this:

```arduino
void setup() {
  pinMode(13, OUTPUT); // declare which pin the LED is connected to
                       // connected as an output
}

void loop() {
  digitalWrite(13, HIGH); // turn on the LED
}
```

## Reading digital sensors

The same ports used to control digital actuators can be used to read digital signals. To process the incoming signals, it is necessary to save them in [variables](variables.md).
To save digital signals, a boolean variable is particularly appropriate. The boolean variable only accepts two values: 1 or 0.
To read a digital signal, two commands are necessary: The first one is placed in the setup function and is quite similar to the one used to control digital actuators. To declare pin 13 as input, you can use the command `pinMode(13, INPUT)`.
The second command is placed in the void loop: `value = digitalRead(13);`. This command saves the incoming values in the variable called “value”. Keep in mind that you have to initialize this variable before using it. If you don’t know how, check the [variables](variables.md) chapter.
Your final program should look like this:

``arduino
boolean value = 0;          // initialize a new boolean variable

void setup() {
  pinMode(13,INPUT);
}
void loop() {
  value = digitalRead (13); // write the measured value to the variable
}
```

To check out the incoming values, you can display the variable in the [serial monitor](serialmonitor.md).
