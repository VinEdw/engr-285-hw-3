import euler_method
import numpy as np

def f(x, y):
    return np.tan(y) / 2

x_0 = 0
x_f = 4
y_0 = 0.05

y_true = np.asin(np.sin(0.05) * np.exp(2))
threshold = 0.01
N = 1

while True:
    h = (x_f - x_0) / N
    x, y = euler_method.calculate(x_0, x_f, y_0, h, f)
    y_estimate = y[-1]
    relative_error = np.abs(y_estimate - y_true) / y_true
    if relative_error < threshold:
        break
    N += 1

print(f"With h = {h:.3}, y(4) is estimated to be {y_estimate:.4} ({relative_error:.4%} from the true value)")
