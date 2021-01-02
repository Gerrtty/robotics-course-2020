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


def get_transformation_matrix_from_DH(DH_row):
    return get_transformation_matrix(DH_row[1], DH_row[0], DH_row[2], DH_row[3])


# get transformation matrix
# return Rotation matrix and Position vector
def transform_homogenous(T):
    return T[:3, :3], T[3, :3]


def matrix_multiplication(arr_matrix):
    answer = arr_matrix[0]

    for matrix in arr_matrix:
        answer = answer.dot(matrix)

    return answer


def T_to_matlab(T, name):

    return f"T{name} = [{T[0][0]} {T[0][1]} {T[0][2]} {T[0][3]};\n" \
           f"{T[1][0]} {T[1][1]} {T[1][2]} {T[1][3]};\n" \
           f"{T[2][0]} {T[2][1]} {T[2][2]} {T[2][3]};\n" \
           f"{T[3][0]} {T[3][1]} {T[3][2]} {T[3][3]}]"


def get_Tee():

    var('l1 l2 theta2 d3 theta3 d4 theta4 d5 theta5 d6 theta6')

    DH = [
        [l1, 0, 0, 0],
        [l2, 0, 0, theta2],
        [0, pi / 2, d3, theta3],
        [0, -pi / 2, d4, theta4],
        [0, pi / 2, d5, theta5],
        [0, pi / 2, d6, theta6]
    ]

    matrix = []

    i = 1
    for row in DH:
        T = get_transformation_matrix_from_DH(row)
        print(T)
        matrix.append(T)
        i += 1

    print(matrix_multiplication(matrix))


if __name__ == "__main__":

    # get_Tee()

    # raise Exception

    # vars
    var('l1 theta2 theta3 theta4 theta5 theta6')

    # consts
    l2 = 2
    d3 = 0.1
    d4 = 0.1
    d5 = 0.1
    d6 = 0.1

    # print(get_transformation_matrix(pi/2, 0, 0, theta2))

    matrix = []
    DH = [
        [l1, 0, 0, 0],
        [l2, 0, 0, theta2],
        [0, pi / 2, d3, theta3],
        [0, -pi / 2, d4, theta4],
        [0, pi / 2, d5, theta5],
        [0, pi / 2, d6, theta6]
    ]
    for row in DH:
        T = get_transformation_matrix_from_DH(row)
        print(T_to_matlab(T, "kek"))
        matrix.append(T)
    Tee = matrix_multiplication(matrix)
    print()
    print(Tee)