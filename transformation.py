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


# get transformation matrix
# return Rotation matrix and Position vector
def transform_homogenous(T):
    return T[:3, :3], T[3, :3]


def matrix_multiplication(arr_matrix):
    answer = arr_matrix[0]

    for matrix in arr_matrix:
        answer = answer.dot(matrix)

    return answer


if __name__ == "__main__":
    var('theta1 theta2 l2 d3 theta2d theta1d d3 d3d')

    T01 = get_transformation_matrix(0, 0, 0, theta1)
    T12 = get_transformation_matrix(pi/2, l2, 0, theta2)
    T23 = get_transformation_matrix(0, 0, d3, 0)

    print(T01)
    print()
    R, P = transform_homogenous(T01)
    print(R)
    print()
    print(P)

    print()
    print(T12)
    print()
    print(T23)
    print()

    R = np.array([
        [cos(theta2), -sin(theta2), 0],
        [0, 0, -1],
        [sin(theta2), cos(theta2), 0]
    ]).dot(np.array([0, 0, theta2d]))

    R03 = np.array([
        [cos(theta1), -sin(theta1), 0],
        [sin(theta1), cos(theta1), 0],
        [0, 0, 1]
    ]).dot(np.array([
        [cos(theta2), -sin(theta2), 0],
        [0, 0, -1],
        [sin(theta2), cos(theta2), 0]
    ]))
