import euler_method
import numpy as np

def u_prime(t, u, g, v_oo, alpha):
    v = u[1]
    k = g / v_oo**alpha
    return np.array([
        v,
        -g - k * v * np.abs(v)**(alpha - 1)
    ])

v_oo = 1
g = 1
t_0 = 0
h = 0.001
alpha_values = np.linspace(1, 2, 5)
v_0_values = [0.75, 2.50]

for i, v_0 in enumerate(v_0_values):
    t_f = v_0 / g
    u_0 = np.array([0, v_0])

    y_max_values = []
    for alpha in alpha_values:
        diff = lambda t, u: u_prime(t, u, g, v_oo, alpha)
        t, u = euler_method.calculate(t_0, t_f, u_0, h, diff)
        y = u[:, 0]
        y_max = y.max()
        y_max_values.append(y_max)

    if i != 0: print()
    print(f"v_0 = {v_0}")
    print()

    print("alpha | max height")
    print("----- | ----------")
    for alpha, y_max in zip(alpha_values, y_max_values):
        print(f"{alpha:5.2f} | {y_max:10.4f}")
