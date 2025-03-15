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

#let eq = $y' = sin(x + y^2)$

#eq subject to $y(-pi) = 0.1$ for $-pi < x < 2pi$

#py_script("03_b")
#figure(
  image("media/03_b.svg", width: 80%),
  caption: [Graph of the solution to #eq],
)

= Problem 4

For each of the following initial value problems, first solve for $y(x)$ by separating the equation.
Then use the Euler Method to determine an estimate for the minimum step size such that $y(4)$ is accurate to less than 1%.
(i.e. run an Euler Method program repeatedly, decreasing step size each time, until the calculated value of $y(4)$ is less than 1% different from the exact answer)

== Part a

$2y' = tan y$ subject to $y(0) = 0.05$

$2y' &= tan(y) \
(d y)/(d x) &= 1/2 tan(y) \
(d y)/(tan(y)) &= 1/2 d x \
integral cot(y) d y &= integral 1/2 d x \
ln(sin(y)) &= 1/2 x + C \
sin(y) &= C e^(1/2 x) \
y &= sin^(-1)(C e^(1/2 x)) \
\
underline(y(0) = 0.05) \
0.05 &= sin^(-1)(C e^(1/2 (0))) \
C &= sin(0.05) \
\
y &= sin^(-1)(sin(0.05) e^(1/2 x)) \
y(4) &= sin^(-1)(sin(0.05) e^(1/2 (4))) \
y(4) &= sin^(-1)(sin(0.05) e^(2)) approx 0.3783 \
$

#py_script("04_a")

== Part b

