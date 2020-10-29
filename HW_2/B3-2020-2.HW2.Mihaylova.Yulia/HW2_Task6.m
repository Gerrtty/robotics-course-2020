% x + 2y - z = 2,
% 2x - 3y + 2z = 2,
% 3x + y + x = 8;

m = [1, 2, -1; 2, -3, 2,; 3, 1, 1];
b = [2, 2, 8]';

answear = linsolve(m, b);

fprintf("x = %g, y = %g, z = %g\n", answear(1), answear(2), answear(3));