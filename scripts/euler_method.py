import numpy as np

def calculate(x_0, x_f, y_0, h, diff):
    """
    Calculate the x & y values using the simple/vector Euler method on a 1st order ODE

    - x_0: starting x value
    - x_f: final x value
    - y_0: starting y value
    - h: step size (this will be the rounded to be an even multiple of x_f - x_0)
    - diff: function that takes x and y as arguments and returns dy/dx

    Note: If using the vector Euler Method, treat y like the vector u
    """
    delta_x = x_f - x_0
    N = np.round(delta_x / h).astype(int) + 1

    x, h = np.linspace(x_0, x_f, N, retstep=True)
    y = np.array([y_0 for _ in range(N)], dtype=float)

    for i in range(N - 1):
        y[i + 1] = y[i] + h * diff(x[i], y[i])

    return x, y
