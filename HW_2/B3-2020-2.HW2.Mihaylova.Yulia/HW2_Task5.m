% A2 = strlength("Julia") = 5; A3 = strlength("Mihaylova") = 9;
% R = A2 + A3 = 14

rng(14);

m = input("Enter m: ");
n = input("Enter n: ");

random_matrix = int8(rand(m, n) * 10);

mean_of_random_matrix = mean(mean(random_matrix));

for i = 1:m
    for j = 1:n
        if (random_matrix(i, j) > mean_of_random_matrix)
            random_matrix(i, j) = 100;
        end
    end
end

fprintf("Group: 11-806\nName: Julia\nSecondname: Mihaylova\nm = %i; n = %i;\nNew matrix:\n", m, n);
disp(random_matrix);