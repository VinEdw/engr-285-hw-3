#import "engr-conf.typ": conf, py_script
#show: conf.with(
  title: [ENGR 285 --- Homework 3],
  author: (first_name: "Vincent", last_name: "Edwards"),
  date: datetime(year: 2025, month: 3, day: 24),
)

= Euler Method

== Simple Euler Method

$
(d y)/(d x) &= f(x, y) \
y(x_(i+1)) &approx y(x_i) + h dot f(x_i, y_i)
$

== Vector Euler Method

$
(d arrow(u))/(d t) &= arrow(f)(t, arrow(u)) quad "where" quad arrow(u)(t) = vec(x(t), y(t)) \
arrow(u)_(i + 1) &approx arrow(u)_i + h dot arrow(f)(t_i, arrow(u)_i) \
$

== Python Program

#py_script("euler_method", put_fname: true)

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
#let point = $y(0) = 0.5$ 

#eq subject to #point for $0 < x < 2$

#py_script("03_a")
#figure(
  image("media/03_a.svg", width: 80%),
  caption: [Graph of the solution to #eq subject to #point],
)

== Part b

#let eq = $y' = sin(x + y^2)$
#let point = $y(-pi) = 0.1$ 

#eq subject to #point for $-pi < x < 2pi$

#py_script("03_b")
#figure(
  image("media/03_b.svg", width: 80%),
  caption: [Graph of the solution to #eq subject to #point],
)

= Problem 4

For each of the following initial value problems, first solve for $y(x)$ by separating the equation.
Then use the Euler Method to determine an estimate for the maximum step size such that $y(4)$ is accurate to less than 1%.
(i.e. run an Euler Method program repeatedly, decreasing step size each time, until the calculated value of $y(4)$ is less than 1% different from the exact answer)

#py_script("problem_04", put_fname: true)

== Part a

$2y' = tan y$ subject to $y(0) = 0.05$

$2y' &= tan(y) \
(d y)/(d x) &= 1/2 tan(y) \
(d y)/(tan(y)) &= 1/2 d x \
integral cot(y) d y &= integral 1/2 d x \
ln(sin(y)) &= 1/2 x + C \
sin(y) &= C e^(1/2 x) \
y &= sin^(-1)(C e^(1/2 x)) \
$

$underline(y(0) = 0.05) \
0.05 &= sin^(-1)(C e^(1/2 (0))) \
C &= sin(0.05) \
$

$y &= sin^(-1)(sin(0.05) e^(1/2 x)) \
y(4) &= sin^(-1)(sin(0.05) e^(1/2 (4))) \
y(4) &= sin^(-1)(sin(0.05) e^(2)) approx 0.3783 \
$

#py_script("04_a")

== Part b

$6 y y' = x sin(y^2)$ subject to $y(0) = 1.5 = 3/2$

$6 y y' &= x sin(y^2) \
(d y)/(d x) &= (x sin(y^2)) / (6 y) \
y / sin(y^2) d y &= x / 6 d x \
integral y / sin(y^2) d y &= integral x / 6 d x \
integral y csc(y^2) d y &= integral x / 6 d x \
-1/2 sinh^(-1)(cot(y^2)) &= 1/12 x^2 + C \
sinh^(-1)(cot(y^2)) &= -1/6 x^2 + C \
cot(y^2) &= sinh(C - 1/6 x^2) \
$

Using the trig identity found below, the equation can be simplified greatly.

$cot(2 theta) &= cos(2 theta) / sin(2 theta) \
cot(2 theta) &= (cos^2(theta) - sin^2(theta)) / (2 sin(theta) cos(theta)) \
cot(2 theta) &= 1/2 cot(theta) - 1/(2 cot(theta)) \
2 cot(2 theta) &= cot(theta) - 1/cot(theta) \
2 cot(2 theta) cot(theta) &= cot^2(theta) - 1 \
1 &= cot^2(theta) - 2 cot(2 theta) cot(theta) \
1 + cot^2(2 theta) &= cot^2(theta) - 2 cot(2 theta) cot(theta) + cot^2(2 theta) \
1 + cot^2(2 theta) &= (cot(theta) - cot(2 theta))^2 \
plus.minus sqrt(1 + cot^2(2 theta)) &= cot(theta) - cot(2 theta) \
cot(theta) &= cot(2 theta) plus.minus sqrt(1 + cot^2(2 theta)) \
cot(y^2 / 2) &= cot(y^2) plus.minus sqrt(1 + cot^2(y^2)) \
$

Since we have the initial condition $y(0) = 3/2$, it can be checked which version is valid in this case.

$cot((3/2)^2 / 2) &approx 0.4779 \
cot((3/2)^2) + sqrt(1 + cot^2((3/2)^2)) &approx 0.4779 \
cot((3/2)^2) - sqrt(1 + cot^2((3/2)^2)) &approx -2.0926 \
$

Thus, $cot(y^2 / 2) &= cot(y^2) plus sqrt(1 + cot^2(y^2))$ should be used.

#v(1em)

$cot(y^2) &= sinh(C - 1/6 x^2) \
cot(y^2 / 2) &= sinh(C - 1/6 x^2) + sqrt(1 + sinh^2(C - 1/6 x^2)) \
cot(y^2 / 2) &= sinh(C - 1/6 x^2) + cosh(C - 1/6 x^2) \
cot(y^2 / 2) &= e^(C - x^2 / 6) \
cot(y^2 / 2) &= C e^(-x^2 / 6) \
$

$underline(y(0) = 3/2) \
cot(1/2 (3/2)^2) &= C e^(-(0)^2 / 6) \
C &= cot(9/8) \
$

$cot(y^2 / 2) &= cot(9/8) e^(-x^2 / 6) \
y^2 / 2 &= cot^(-1)[e^(-x^2 / 6) cot(9/8)] \
y &= plus.minus sqrt(2 cot^(-1)[e^(-x^2 / 6) cot(9/8)]) \
y &= sqrt(2 cot^(-1)[e^(-x^2 / 6) cot(9/8)]) \
$

#v(1em)

$y(4) &= sqrt(2 cot^(-1)[e^(-(4)^2 / 6) cot(9/8)]) \
y(4) &= sqrt(2 cot^(-1)[e^(-8/3) cot(9/8)]) \
y(4) &approx 1.7536 \
$

#py_script("04_b")

= Problem 5

Error in the Euler Method is difficult to conceptualize outside of physical contexts;
in this problem we will look at the degree of the violation of energy conservation present in Euler solutions of a simple spring-mass system.
Consider the system
$
(d x)/(d t) = v quad "and" quad (d v)/(d t) = -k/m x
$
We'll choose $m = 1$ and $k = pi^2$ so that the period should be $T = 2$.

#[
  #set enum(numbering: "a)")

  + Plot the trajectory of the mass over time $0 < t < 4$ with the initial conditions $x(0) = 1$ and $v(0) = 0$ for several different step sizes between 0.001 and 0.1.
    Describe how you can tell visually from the trajectories whether there is significant error in the calculation, and describe how the magnitude of that error appears to change when the step size increases.
  + The energy of the spring-mass system is given by
    $ E(t) = 1/2 m [v(t)]^2 + 1/2 k [x(t)]^2 $
    and theoretically should not change in time; i.e. $E(t) = E(0)$.
    Add code to your program from part (a) to additionally calculate $E(t)$ and plot it as a function of time $0 < t < 4$ for three different step sizes between 0.001 and 0.1.
    Comment on any trends that you observe.
]

#py_script("05")

#{
  for h in (0.1, 0.01, 0.001) {
    let fname = "media/05_h_" + str(h) + ".svg"
    figure(
      image(fname, width: 90%),
      caption: [Position vs Time & Energy vs Time ($h = #h$)],
    )
  }
}

The total energy of the system, and thus the amplitude, are supposed to remain constant.
If the amplitude increases or decreases over time, then the total energy must be increasing or decreasing, which should not happen.

In the position vs time graphs, the amplitude increases over time, indicating that the energy must be increasing too.
There must be some error in the calculations using the Euler Method.
The effect is more pronounced for larger step sizes ($h$).
Larger step sizes lead to larger changes in amplitude and total energy.
In other words, decreasing the step size reduces the error.

Looking at the energy vs time graphs, the energy increases over time at an increasing rate.
An increase in energy was expected on account of the increase in amplitude.
Since the energy changes continuously, a boost in energy is gained on each iteration of the Euler Method, 
Thus, each iteration accumulates some error.

= Problem 6

Air resistance is notoriously difficult to model;
as it turns out the most accurate models of air resistance are complicated functions of the speed.
Consider a more general air resistance model, where we take the friction force to be proportional to the speed to an arbitrary power $alpha$:
$
(d v)/(d t) = -g - k v|v|^(alpha - 1)
$
We would ultimately like to compare the maximum height achieved by vertically thrown objects as we vary $alpha$.

== Part a

In order to compare these air resistance models, we should choose the proportionality constants so that the models have the same _terminal speed_ (i.e. the speed at which a _dropped_ object will not change its velocity; $(d v)/(d t) = 0$).
Express the proportionality constant $k$ in terms of the terminal speed $v_oo$, the power $alpha$, and $g$.

$(d v)/(d t) = 0 "when" v = -v_oo \
0 = -g - k (-v_oo)|-v_oo|^(alpha - 1) \
g = k v_oo (v_oo)^(alpha - 1) \
g = k (v_oo)^alpha \
k = g / (v_oo)^alpha \
$

== Parts b & c

#[
  #set enum(numbering: "a)", start: 2)

  + From here we will work in units of time where $g = 1$ and units of distance where $v_oo = 1$ for convenience.
    Write a program using the vector Euler Method that will determine the maximum height achieved by a vertically thrown object.
    Choose a value for $v_0$ such that $0 < v_0 < 1$ and record the maximum height for 5 different values of $alpha$ such that $1 < alpha < 2$.
  + Repeat the previous part for a different value of $v_0$ such that $v_0 > 1$.
]

#py_script("06")

= Problem 7

In this problem you'll code a simple simulation of a baseball at-bat.
Suppose a baseball pitcher will throw a pitch into the strikezone 50% of the time, and the batter will swing at a pitch 50% of the time.
When the pitch is in the strikezone (and the batter swings), the batter hits in-field 40% of the time, hits a foul ball 30% of the time, and misses 30% of the time.
If the pitch is not in the strikezone (and the batter swings), these probabilities change to 15%, 35%, and 50% respectively.
The following is a list of the at-bat rules of baseball:

- Batters start the at-bat with 0 "strikes" and 0 "balls".
- If the batter swings and misses, they add a strike.
- If the pitch is in the strikezone and the batter doesn't swing, they add a strike.
- If the pitch is out of the strikezone and the batter doesn't swing, they add a ball.
- If the batter hits a foul ball, they add a strike unless they are at 2 strikes (if they are, nothing happens and the at-bat continues).
- The at-bat ends with an in-field hit, or when the batter reaches 3 strikes (a strikeout), or when the batter reaches 4 balls (a walk).

#[
  #set enum(numbering: "a)")

  + Write a program using a while-loop that will simulate a complete at-bat according to the probabilities and rules above.
    Your program should output the total number of pitches, the total number of foul balls, and the result of the at-bat.
  + Convert the while-loop portion of your code into a function, and then build a program that will use the function 100 times and then use the results to calculate the following statistics for at-bats:

    - The average number of pitches
    - The average number of foul balls
    - The overall probability that the at-bat will result in an in-field hit
    - The overall probability that the at-bat will result in a strikeout
    - The overall probability that the at-bat will result in a walk
]

#py_script("07")

