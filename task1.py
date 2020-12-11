from math import cos
from math import sin
from sympy import *
import numpy as np
from math import pi


if __name__ == "__main__":
    var('theta3 theta3d')

    R23 = np.array([
        [cos(theta3), -sin(theta3), 0],
        [sin(theta3), cos(theta3), 0],
        [0, 0, 1]
    ])

    Z23 = np.array([0, 0, theta3d])

    # print(R23.dot(Z23))

    R03 = np.array([
        [1, 0, 0],
        [0, 1, 0],
        [0, 0, 1]
    ]).dot(np.array([
        [1, 0, 0],
        [0, 0, -1],
        [0, 1, 0]
    ])).dot(np.array([
        [cos(theta3), -sin(theta3), 0],
        [sin(theta3), cos(theta3), 0],
        [0, 0, 1]
    ]))

    print(R03)