import euler_method
import numpy as np

def relative_error(x, x_true):
    return np.abs(x - x_true) / x_true

def maximize_h_within_error(x_0, x_f, y_0, diff, y_true, error_threshold, h_min=1e-9):
    N = 1
    while (h := (x_f - x_0) / N) > h_min:
        x, y = euler_method.calculate(x_0, x_f, y_0, h, diff)
        y_estimate = y[-1]
        error = relative_error(y_estimate, y_true)
        if error < error_threshold:
            return h, y_estimate, error
        N += 1
    return None, None, None
