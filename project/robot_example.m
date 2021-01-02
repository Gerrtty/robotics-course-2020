clc; clear all; close all;
theta2 = pi/6;
theta3 = pi/4;
theta4 = pi/4;
theta5 = pi/4;
theta6 = pi/3;
l2 = 0.5;
d3 = 0.2;
d4 = 0.2;
d5 = 0.2;
d6 = 0.2;

L(1) = Link([0, 0, 1, 0, 1]); % theta, d, a, alpha, P=1/R=0L(2) = Revolute('d', 0, 'a', 50, 'alpha', 0);
L(2) = Link([theta2, 0, l2, 0, 0]);
L(3) = Link([theta3, d3, 0, pi/2, 0]);
L(4) = Link([theta4, d4, 0, -pi/2, 0]);
L(5) = Link([theta6, d6, 0, pi/2, 0]);
L(6) = Link([theta5, d5, 0, pi/2, 0]);

R = SerialLink(L,'name','RJ');
figure (1)
R.plot([0.5 pi/3 pi/6 pi/2 pi/5 pi/6],'workspace', [-2 2 -2 2 -2 2]);