#import "engr-conf.typ": conf, py_script
#show: conf.with(
)

= ENGR 285 --- Homework 3

== Problem 1

Write a program that utilizes a while-loop to return the square root of an arbitrary positive number to the nearest whole number; i.e. find the largest integer who’s square is less than the given number, and compare to the square of the next integer.
Do not use any non-elementary math operations (i.e. the only math operations you can use are addition, subtraction, multiplication, and division).
Test your code with several numbers of various sizes to check that it is working properly.
Write out or copy/paste the code.

#py_script("01")

== Problem 2

One of the simplest ways to numerically calculate definite integrals is with Monte Carlo integration.
Write a program that will approximately integrate the function $f(x) = e^(-1/2 x^2)$ from $0 < x < 1$ by choosing 100 points $(x, y)$ in the square $0 < x < 1$ and $0 < y < 1$ with random coordinates, counting how many of them lie under the curve, and dividing by the total number of points.
Write out or copy/paste the code.
Run your program 6 times and record the
outcomes.

#py_script("02")
