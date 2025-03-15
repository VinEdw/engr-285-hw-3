import euler_method
import matplotlib.pyplot as plt

x, y = euler_method.calculate(0, 2, 0.5, 0.01, lambda x, y: (x - y)**2)
fig, ax = plt.subplots()
ax.plot(x, y)
ax.set(xlabel="$x$", ylabel="$y$")
fig.savefig("media/03_a.svg")
