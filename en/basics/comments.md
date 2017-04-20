# Source Code Comments

Did you ever read some code and would not understand what it means?
Because programs can be very complicated and abstract, supplementary explanations in the form of code comments are very useful.

Even if you think a piece of code does not need an explanation, you should consider adding a comment to it, in case someone else looks at your code (or even you forgot after a while what you meant to write).

A comment is a line of text in the program code, which is ignored by the compiler, and thus may contain any
text.
In Arduino you can create two types of comments:

## Single-line Comments
These comments are useful to annotate a specific line of code with a short description.
They begin with a `//`.
Alternatively you can add a comment to the end of a program statement:

```arduino
// I am a comment
int led = 13;  // The value 13 is assigned to the variable led.
```

Additionally these comments are useful, if you want to test a change of your code, without deleting the statements:
Just comment the line, and the compiler will ignore the command!

## Multi-line Comments
These comments are often times written on top of a program or function.
They begin with `/*` and end with `*/`.
All text between these two expressions will be ignored by the compiler.
This is also useful to 'disable' a whole block of code during development.

```arduino
/*
 *
* I am a multi-line comment.
* I can describe which purpose a program or function has, and who has written it.
* 
* by the way:
* <- these stars are created automatically, but not required for the comment..
*
*/
```

## How many comments should I add to my program?
This question cannot be answered easily. Some advanced programmers expect to have every line of code commented.
This is generally not necessary for the simple Arduino programs we are writing.

In principle at least the following program sections should be commented:

- A comment at the top of the program, describing the programs purpose and usage instructions.
- Each function should be described, especially the type of its parameters.
- Complicated commands like mathematical formulas should be explained in plain language.

