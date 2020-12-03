clc; clear all; close all;

T1 = [
    1, 0, 0, 0;
    0, 1, 0, 0;
    0, 0, 1, 4;
    0, 0, 0, 1;
    ];

T2 = [
       1, 0, 0, 0;            
       0, 0, -1, 2;            
       0 1 0 2;
       0 0 0 1;
    ];

t = WS_DISPLAY(T2);
disp(t);

function out = WS_DISPLAY(T)
    l1 = 4;
    theta = pi/2;
    l2 = 5;
    p = 4;
    phi = 0;
    n = 4;

    L(1) = Link([theta, l1, 0, pi/2, 1]); % theta, d, a, alpha, P=1/R=0
    L(2) = Link([phi, p, l2, -pi/2, 0]); % theta, d, a, alpha, P=1/R=0
    L(3) = Link([0, 0, n, 0, 0]); % theta, d, a, alpha, P=1/R=0

    threeLinkRobot = SerialLink(L,'name','prr');
    threeLinkRobot.plot([l1 pi/2 pi/3],'workspace', [-15 15 -15 15 -15 15]);
    
    out = threeLinkRobot.ikine(T, 'q0', [0, 0, 0], 'mask', [1, 1, 1, 0, 0, 0]);
end

