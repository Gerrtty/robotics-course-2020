Task21()

function T03 = Task21()

T01 = [[rotz(pi) * roty(pi*2); 0, 0, 0]'; 4, 2, 0, 1]';

% то что сверху равно тому что снизу (T01 в плане)
T01 = [-1, 0, 0, 4;
      0, -1, 0, 2;
      0, 0, 1, 0;
      0, 0, 0, 1];
 
T21 = [[rotz(-pi) * rotx(-(pi+pi/4)); 0, 0, 0]'; -4, 4, 0, 1]';
T23 = [[rotx(pi + pi/4) * rotx(-(pi+pi/4)); 0, 0, 0]'; 4, 7, 1.4, 1]';
    
trplot(eye(3), 'frame', '0', 'color', 'r');
hold on

trplot(T01, 'frame', '1', 'color', 'g');
trplot(T21, 'frame', '2', 'color', 'b');
trplot(T23, 'frame', '3', 'color', 'magenta');

xlim([-10, 15]); ylim([-10, 10]); zlim([-2, 8]);

T03 = T01 * T21 * T23;
trplot(T03, 'frame', '3', 'color', 'y');
hold off;
end