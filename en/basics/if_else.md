# if/else Conditions

The `if` expression enables the Arduino to execute different blocks of code by evaluating the given conditional expression. For example, to light up a LED dependent on a switch, you would write the following code:


```arduino
if (digitalRead(BUTTON_PIN) == HIGH) {
  digitalWrite(LED_PIN, HIGH);
}
```

The first line starts with `if`. The following parentheses contain the condition. In this example if the Button is pressed, or not. If the condition appears to be true, the code in the curly brackets is run.

The condition in the parentheses uses a comparision operator. Here it is the double equal sign(`==`). It is important to use this double equal sign for equality comparision. If you use just one equal sign, the Arduino thinks you want to assign the right value to the left variable.

## Using else

With `else` you can add an alternative to the `if` block if the condition was not true. Together with the `else ` block, the code from above would look like:

```arduino
#define LED_PIN 13
#define BUTTON_PIN 7

void setup() {
  pinMode(LED_PIN, OUTPUT);
  pinMode(BUTTON_PIN, INPUT);
}

void loop() {
  if (digitalRead(BUTTON_PIN)==HIGH){
    digitalWrite(LED_PIN, HIGH);
  } else {
    digitalWrite(LED_PIN, LOW);
  }
}
```

