#import "engr-conf.typ": conf, py_script
#show: conf.with(
  title: [ENGR 285 --- Homework 3],
  author: (first_name: "Vincent", last_name: "Edwards"),
  date: datetime(year: 2025, month: 3, day: 24),
)

= Euler Method

$
(d y)/(d x) &= f(x, y) \
y(x_(i+1)) &approx y(x_i) + h dot f(x_i, y_i)
$

#py_script("euler_method")

= Problem 1

Write a program that utilizes a while-loop to return the square root of an arbitrary positive number to the nearest whole number; i.e. find the largest integer who’s square is less than the given number, and compare to the square of the next integer.
Do not use any non-elementary math operations (i.e. the only math operations you can use are addition, subtraction, multiplication, and division).
Test your code with several numbers of various sizes to check that it is working properly.
Write out or copy/paste the code.

#py_script("01")

= Problem 2

One of the simplest ways to numerically calculate definite integrals is with Monte Carlo integration.
Write a program that will approximately integrate the function $f(x) = e^(-1/2 x^2)$ from $0 < x < 1$ by choosing 100 points $(x, y)$ in the square $0 < x < 1$ and $0 < y < 1$ with random coordinates, counting how many of them lie under the curve, and dividing by the total number of points.
Write out or copy/paste the code.
Run your program 6 times and record the
outcomes.

#py_script("02")

= Problem 3

For each of the following initial value problems, solve using the Euler Method and either sketch or copy/paste a graph of the result over the given interval.
Use a step size small enough that continuing to lower the step size further yields no noticeable change in the appearance of the graph.

== Part a

#let eq = $y' = (x-y)^2$

#eq subject to $y(0) = 0.5$ for $0 < x < 2$

#py_script("03_a")
#figure(
  image("media/03_a.svg", width: 80%),
  caption: [Graph of the solution to #eq],
)

== Part b

$y' = sin(x + y^2)$ subject to $y(-pi) = 0.1$ for $-pi < x < 2pi$

