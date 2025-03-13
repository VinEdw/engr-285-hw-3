import numpy as np
rng = np.random.default_rng()

def f(x):
    return np.exp(-x**2 / 2)

N = 100
count = 0
trials = 6
for i in range(trials):
    x_values = rng.random(N)
    y_values = rng.random(N)
    below = (y_values < f(x_values)).sum()
    integral = below / N
    print(f"Trial {i + 1}: {integral}")
