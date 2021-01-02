from math import cos, sin, pi
import numpy as np
import matplotlib.pyplot as plt


def get_T_res(l1, theta2, theta3, theta4, theta5, theta6):
    T = [
        [sin(theta6) * (cos(theta4) * sin(theta2) + cos(theta2) * cos(theta3) * sin(theta4)) - cos(theta6) * (
                    cos(theta5) * (sin(theta2) * sin(theta4) - cos(theta2) * cos(theta3) * cos(theta4)) + cos(
                theta2) * sin(theta3) * sin(theta5)), sin(theta6) * (
                     cos(theta5) * (sin(theta2) * sin(theta4) - cos(theta2) * cos(theta3) * cos(theta4)) + cos(
                 theta2) * sin(theta3) * sin(theta5)) + cos(theta6) * (
                     cos(theta4) * sin(theta2) + cos(theta2) * cos(theta3) * sin(theta4)),
         cos(theta2) * cos(theta5) * sin(theta3) - sin(theta5) * (
                     sin(theta2) * sin(theta4) - cos(theta2) * cos(theta3) * cos(theta4)),
         l1 + sin(theta2) / 10 - (cos(theta2) * sin(theta3)) / 10 + (cos(theta4) * sin(theta2)) / 10 - (
                     sin(theta5) * (sin(theta2) * sin(theta4) - cos(theta2) * cos(theta3) * cos(theta4))) / 10 + (
                     cos(theta2) * cos(theta3) * sin(theta4)) / 10 + (cos(theta2) * cos(theta5) * sin(theta3)) / 10 + 2],
        [cos(theta6) * (cos(theta5) * (cos(theta2) * sin(theta4) + cos(theta3) * cos(theta4) * sin(theta2)) - sin(
            theta2) * sin(theta3) * sin(theta5)) - sin(theta6) * (
                     cos(theta2) * cos(theta4) - cos(theta3) * sin(theta2) * sin(theta4)), - sin(theta6) * (
                     cos(theta5) * (cos(theta2) * sin(theta4) + cos(theta3) * cos(theta4) * sin(theta2)) - sin(
                 theta2) * sin(theta3) * sin(theta5)) - cos(theta6) * (
                     cos(theta2) * cos(theta4) - cos(theta3) * sin(theta2) * sin(theta4)), sin(theta5) * (
                     cos(theta2) * sin(theta4) + cos(theta3) * cos(theta4) * sin(theta2)) + cos(theta5) * sin(
            theta2) * sin(theta3), (
                     sin(theta5) * (cos(theta2) * sin(theta4) + cos(theta3) * cos(theta4) * sin(theta2))) / 10 - (
                     cos(theta2) * cos(theta4)) / 10 - (sin(theta2) * sin(theta3)) / 10 - cos(theta2) / 10 + (
                     cos(theta3) * sin(theta2) * sin(theta4)) / 10 + (cos(theta5) * sin(theta2) * sin(theta3)) / 10],
        [cos(theta6) * (cos(theta3) * sin(theta5) + cos(theta4) * cos(theta5) * sin(theta3)) + sin(theta3) * sin(
            theta4) * sin(theta6), cos(theta6) * sin(theta3) * sin(theta4) - sin(theta6) * (
                     cos(theta3) * sin(theta5) + cos(theta4) * cos(theta5) * sin(theta3)), cos(theta4) * sin(
            theta3) * sin(theta5) - cos(theta3) * cos(theta5), cos(theta3) / 10 - (cos(theta3) * cos(theta5)) / 10 + (
                     sin(theta3) * sin(theta4)) / 10 + (cos(theta4) * sin(theta3) * sin(theta5)) / 10],
        [0, 0, 0, 1]
    ]

    return T


if __name__ == "__main__":

    l = np.arange(0, 3, 0.2)

    points = []
    start_point = np.array([0, 0, 0, 1])

    all = 18 ** 5 * (3 / 0.2)
    i = 1
    for l1 in l:
        for theta2 in range(-180, 180, 20):
            for theta3 in range(-180, 180, 20):
                for theta4 in range(-180, 180, 20):
                    for theta5 in range(-180, 180, 20):
                        for theta6 in range(-180, 180, 20):
                            Tee = get_T_res(l1, theta2*pi/180, theta3*pi/180, theta4*pi/180,
                                            theta5*pi/180, theta6*pi/180)
                            points.append(np.array(Tee).dot(start_point))
                            if i % 1000 == 0:
                                print(f"Done {i / all * 100} %")
                            i += 1

    arr = np.array(points).T

    fig = plt.figure()
    ax = fig.add_subplot(111, projection='3d')
    ax.plot(arr[0], arr[1], arr[2])
    plt.show()