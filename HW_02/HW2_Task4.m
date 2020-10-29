% A2 = strlength("Julia") = 5; A3 = strlength("Mihaylova") = 9;
% R = A2 + A3 = 14

rng(14);

n = input("Enter n: ");

random_array = int8(rand(1, n) * 10);

count = 0;

for i = 1:n
    for j = i+1:n
        s = random_array(i) + random_array(j);
        if (mod(s, 2) == 1) && (s > 0)
            count = count + 1;
        end
    end
end

fprintf("Group: 11-806\nName: Julia\nSecondname: Mihaylova\nn = %i\narr =", n);
disp(random_array);
fprintf("Result = %i\n", count);