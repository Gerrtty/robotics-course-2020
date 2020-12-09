from math import cos
from math import sin
from sympy import *
import numpy as np
from math import pi


# get DH params
# return transformation matrix
def get_transformation_matrix(alpha, a, d, theta):
    return np.array([
        [cos(theta), -sin(theta), 0, a],
        [sin(theta) * cos(alpha), cos(theta) * cos(alpha), -sin(alpha), -sin(alpha) * d],
        [sin(theta) * sin(alpha), cos(theta) * sin(alpha), cos(alpha), cos(alpha) * d],
        [0, 0, 0, 1]
    ])


if __name__ == "__main__":
    var('l1 l2 d2 l3 theta3')

    print(cos(pi*(1/2)))

    T01 = get_transformation_matrix(0, l1, 0, 0)
    T12 = get_transformation_matrix(pi/2, l2, d2, 0)
    T23 = get_transformation_matrix(0, l3, 0, theta3)
    T3ee = get_transformation_matrix(0, 50, 0, 0)

    print(T01)
    print()
    print(T12)