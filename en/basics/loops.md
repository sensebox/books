# Loops

> *Groundhog day*

The naive way of writing code to blink a LED 50 times is really tiresome to write:

```arduino
digitalWrite(led, HIGH);
delay(100);
digitalWrite(led, LOW);
delay(100);
digitalWrite(led, HIGH);
delay(100);
digitalWrite(led, LOW);
//...
```

Programmers are lazy, so they invented a really cool solution to this problem: Loops.
A loop is a special block which executes the code in the block until a condition is met.

## Structure of loops

Loop expressions contain two parts. The **head of the loop** contains the condition which controls for how often the code in the **body of the loop** should be repeated. The body usually starts and ends with curly braces (`{ }`).

There are several types of loops each tailored for different needs. The following sections will show you two of the most common loop types.


## for loops

`for` loops are usually used for when you exactly want to specify how often the code in the body should be executed.
In this example, a LED will be switched on and off 50 times.
The head of the `for` loop contains three parts delimited by a semicolon (`;`).

1. Variable initialization. Allows to initialize a variable which holds the count of loops
2. A Condition. The condition allows you to explicitly say when the loop should run. If the expression evaluates truthy, the loop will continue. How to write a condition is explained in the chapter about [if-else](if_else.md)
3. An expression to run after each loop of the code in the body. Usually it is used to increment the counter variable.


```arduino
for (int counter = 1; counter < 50; counter = counter + 1) {
  // blink LED
}
```
In this example the counter variable is named `counter`.
The condition is “while `counter` is below 50`
After each loop iteration, increase `counter` by one.

> **Hint:**
> - *The code `counter = counter + 1` is the longer form of `counter++`. Both forms do the same. Take the number in the variable `counter`, increment by one and store the result in the `counter` variable.*
> - *You can use any name for the counter variable you like. Often the name `i` for “index” is used.*

### Exercise 1

Think of a loop body which prints the current value of the counter variable to the serial monitor.

> ***Hint:*** *The chapter [Serial Monitor](serial_monitor.md) explains how to communicate over the serial interface.*

- **a)** Observe the output if you exchange `counter = counter+ 1` with `counter = counter*2` or `counter--`.
- **b)** Observe the output if you exchange `int counter= 0` with `int counter = 25`.

---

##  The while loop

Sometimes you don’t know how often the code in the block should be executed.
For this, you can use the `while` loop.
The while loop only contains a condition and a block. The condition is evaluated before the code in the block runs. If it evaluates truthy, the code in the body is executed.

```arduino
while (condition) {
  // blink LED
}
```

For example, this allows you to evaluate the state of a button attached to the Arduino and only execute the loop if the button is pressed.

> **Attention:** *A common error is to write a condition which is always true. (For example `1 > 0`). In this case, your program will hang indefinitely in the loop and will not continue. This is called an endless loop.*

### Exercise 2
- **a)** Write the code for a program that prints `Statement true!` in the serial monitor if a variable `a` is above 0.
- **b)** Write the code for a program that blinks a LED if a button is pressed.
- **c)** Every `for` loop can be expressed as a `while` loop. Rewrite this `for` loop so that it uses a `while` loop:
   ```arduino
   for (int i = 10; i > 0; i--) {
     Serial.print("Countdown: ");
     Serial.println(i);
   }
   ```

