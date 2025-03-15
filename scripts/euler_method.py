import numpy as np

def calculate(x_0, x_f, y_0, h, diff):
    delta_x = x_f - x_0
    N = np.round(delta_x / h).astype(int) + 1

    x, h = np.linspace(x_0, x_f, N, retstep=True)
    y = np.array([y_0 for _ in range(N)], dtype=float)

    for i in range(N - 1):
        y[i + 1] = y[i] + h * diff(x[i], y[i])

    return x, y
