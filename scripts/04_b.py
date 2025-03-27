import problem_04
import numpy as np

def f(x, y):
    return x * np.sin(y**2) / (6 * y)

x_0 = 0
x_f = 4
y_0 = 1.5

insides = np.exp(-x_f**2 / 6) / np.tan(y_0**2 / 2)
y_true = np.sqrt(2 * np.atan(1 / insides))
threshold = 0.01

h, y_estimate, relative_error = problem_04.maximize_h_within_error(x_0, x_f, y_0, f, y_true, threshold)

if h is None:
    print("Estimates do not get close enough to the true value as h decreases")
else:
    print(f"With h = {h:.3}, y(4) is estimated to be {y_estimate:.4} ({relative_error:.4%} from the true value)")
