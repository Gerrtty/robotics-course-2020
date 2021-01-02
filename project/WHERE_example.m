% disp(WHERE(, pi/3, pi/3, pi/3, pi/3, pi/3));

disp(WHERE(2, pi/6, pi/2, -pi/2, pi/3, pi/3));

function out = WHERE(l1, theta2, theta3, theta4, theta5, theta6)
    % consts variables
    l2 = 1;
    d3 = 0.2;
    d4 = 0.2;
    d5 = 0.2;
    d6 = 0.2;

   T12 = [1 0 0 l1;
         0 1 0 0;
         0 0 1 0;
         0 0 0 1];
     
  T23 = [cos(theta2) -sin(theta2) 0 l2;
      sin(theta2) cos(theta2) 0 0;
      0 0 1 0;
      0 0 0 1];
  
T34 = [cos(theta3) -sin(theta3) 0 0;
      0 0 -1 -d3;
      1.0*sin(theta3) cos(theta3) 0 0;
      0 0 0 1];
  
T45 = [cos(theta4) -sin(theta4) 0 0;
      0 0 1 d4;
      -sin(theta4) -cos(theta4) 0 0;
      0 0 0 1];
  
T56 = [cos(theta5) -sin(theta5) 0 0;
      0 0 -1 -d5;
      sin(theta5) cos(theta5) 0 0;
      0 0 0 1];
  
T6ee = [cos(theta6) -sin(theta6) 0 0;
      0 0 -1 -d6;
      sin(theta6) cos(theta6) 0 0;
      0 0 0 1];
 
   out = T12*T23*T34*T45*T56*T6ee;
   
   L(1) = Link([0, 0, l1, 0, 1]); % theta, d, a, alpha, P=1/R=0L(2) = Revolute('d', 0, 'a', 50, 'alpha', 0);
   L(2) = Link([theta2, 0, l2, 0, 0]);
   L(3) = Link([theta3, d3, 0, pi/2, 0]);
   L(4) = Link([theta4, d4, 0, -pi/2, 0]);
   L(5) = Link([theta6, d6, 0, pi/2, 0]);
   L(6) = Link([theta5, d5, 0, pi/2, 0]);

R = SerialLink(L,'name','RPP');
figure (1)
R.plot([l1 theta2 theta3 theta4 theta5 theta6],'workspace', [-3 3 -3 3 -3 3]);
end