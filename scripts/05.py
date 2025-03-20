import euler_method
import numpy as np
import matplotlib.pyplot as plt

def u_prime(t, u, m, k):
    x, v = u
    return np.array([
        v,
        -k/m * x
    ])

def energy(x, v, m, k):
    K = 1/2 * m * v**2
    U_s = 1/2 * k * x**2
    return K + U_s

t_0 = 0
t_f = 4
u_0 = np.array([1, 0])
m = 1
k = np.pi**2

for h in [0.001, 0.01, 0.1]:
    diff = lambda t, u: u_prime(t, u, m, k)
    t, u = euler_method.calculate(t_0, t_f, u_0, h, diff)
    x = u[:, 0]
    v = u[:, 1]
    E = energy(x, v, m, k)

    fig, axes = plt.subplots(1, 2, figsize=[12.8, 4.8])

    position_ax = axes[0]
    position_ax.plot(t, x, "o")
    position_ax.set(xlabel="$t$", ylabel="$x$")

    energy_ax = axes[1]
    energy_ax.plot(t, E, "o")
    energy_ax.set(xlabel="$t$", ylabel="$E$")

    fig.tight_layout()
    fig.savefig(f"media/05_h_{h}.svg")
