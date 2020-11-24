%Problem 1
clear;

my_array = zeros(1, 50);

for n = 1:50;
    estim = (1 - (1/n))^n;
    error = abs(exp(-1) - estim);
    my_array(n) = error;
end;

plot(my_array);
title('Error vs. n')
xlabel('n')
ylabel('Error')

