import euler_method
import numpy as np
import matplotlib.pyplot as plt

x, y = euler_method.calculate(-np.pi, 2*np.pi, 0.1, 0.01, lambda x, y: np.sin(x + y**2))
fig, ax = plt.subplots()
ax.plot(x, y)
ax.set(xlabel="$x$", ylabel="$y$")
fig.savefig("media/03_b.svg")
