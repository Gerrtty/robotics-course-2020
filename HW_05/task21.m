clc; clear all; close all;

L(1) = Link([0, 0, 0, -pi/2, 1]); % theta, d, a, alpha, P=1/R=0
L(2) = Link([-pi/2, 0, 2, 0, 1]); % theta, d, a, alpha, P=1/R=0
L(3) = Link([0, 0, 1, 0, 0]); % theta, d, a, alpha, P=1/R=0

threeLinkRobot = SerialLink(L,'name','ppr');
threeLinkRobot.plot([0 1 pi/2],'workspace', [-5 5 -5 5 -5 5]);