L(1) = Revolute('d', 0, 'a', 0, 'alpha', 0);
L(2) = Revolute('d', 0, 'a', 0.3, 'alpha', pi/2);
L(3) = Revolute('d', 0, 'a', 1, 'alpha', 0);
L(4) = Revolute('d', 0, 'a', 0.2, 'alpha', -pi/2);
L(5) = Revolute('d', 0, 'a', 1.5, 'alpha', 0);
L(6) = Revolute('d', 0, 'a', 0, 'alpha', pi/2);

robot = SerialLink(L);
figure
robot.plot([pi/2,pi/4,pi/6,pi/2,pi/9,pi/9])