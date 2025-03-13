def int_sqrt(x):
    """
    Return the square root of an arbitrary positive number to the nearest whole number
    """
    n = 1
    while n * n < x:
        n += 1
    previous = n - 1
    previous_squared = previous * previous
    if (n * n) - x <= x - previous_squared:
        return n
    else:
        return n - 1

test_input = [2, 3, 6, 7, 12, 13, 20, 21, 30, 31, 42]
print("Input | Output")
print("----- | ------")
for x in test_input:
    print(f"{x:5} | {int_sqrt(x):6}")
