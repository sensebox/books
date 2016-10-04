# The Genuino Board

The Genuino UNO is a microcontroller board that is especially designed for developing prototype circuits. Besides the Genuino UNO, there are a lot of other microcontroller boards on the market.
![Genuino board](https://raw.githubusercontent.com/sensebox/resources/master/images/Genuino_Bauteile.jpg)
Above you can see the Genuino UNO and its main components, which we will introduce in the following sections. The other components are important as well, but we would like to focus on the main parts.

## USB connection
To transfer the programs you’ve written on your computer to the Genuino UNO microcontroller, we use the USB connection. In addition to data transfer, the USB connection can also work as a power supply when there is no other power source.

## Power supply
As you may have noticed, this connection provides the microcontroller with power. The Genuino UNO runs on 5V. When using an external power supply, however, 6V - 20V are recommended.

## Reset button
The Genuino UNO reboots after pressing the reset button. This means that the sketch will reset and start from the beginning. When you are unsure whether the Genuino UNO is running properly, you can press the reset button.

## Digital input and output
To communicate with digital sensors and other components, you can connect to the digital pins. This enables you to perform many actions including reading sensor values or prompting LEDs to blink. Furthermore, it is also possible to output analog signals with the digital pins. The difference between analog and digital signals is explained in the following chapters.

## Analog input
Similar to digital pins, analog pins can read out sensors and provide data to the Genuino UNO. The microcontroller does not support analog output. This function is provided by the digital pins.

##  Power supply pins
The power supply pins are neither digital nor analog pins. They provide power to the connected components. Furthermore, it is possible to provide the Genuino UNO itself with power through several pins.

## Controller
The controller is the brain of the Genuino UNO. It executes all processes.
