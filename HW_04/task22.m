theta1 = pi/4;
theta2 = pi/18;
theta3 = pi/9 + pi/36;
theta4 = pi/2;
theta5 = pi/3;
theta6 = 0;

L1 = 0; L2 = 50; L3 = 0; L4 = 0; L5 = 0; L6 = 0;

L(1) = Revolute('d', 0, 'a', L1, 'alpha', pi/2);
L(2) = Revolute('d', 0, 'a', L2, 'alpha', 0);
L(3) = Revolute('d', 0, 'a', L3, 'alpha', pi/2);
L(4) = Revolute('d', 60, 'a', L4, 'alpha', -pi/2);
L(5) = Revolute('d', 0, 'a', L5, 'alpha', pi/2);
L(6) = Revolute('d', 2, 'a', L6, 'alpha', pi/2);

robot = SerialLink(L);
figure
robot.plot([theta1, theta2, theta3, theta4, theta5, theta6, 0])