disp("Hello");

user_input = input("Enter something: ", 's');

id_start_my_name_is = strfind(user_input, 'my name is');

if id_start_my_name_is ~= 0
    string_with_name = user_input(id_start_my_name_is + 11 : end);
    id_end_name = strfind(string_with_name, ' ');
    if id_end_name ~= 0
        username = string_with_name(1:strfind(string_with_name, ' ') - 1);
    else
        username = string_with_name(1:end);
    end
    if username ~= ""
        fprintf("Hello %s\n", username);
    else
        disp("No name");
    end
else
    disp("Incorrect input!");
end