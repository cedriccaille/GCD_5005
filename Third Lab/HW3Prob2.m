clear;

my_array = zeros(1, 150);
counter = 1;

for t = -15:0.2:15;
    y = (t.^4) - (3.*(t.^2)) + (2.*t) - 1;
    my_array(counter) = y;
    counter = counter + 1;
end;

plot(my_array, 'g:*');
title('y vs. t');
xlabel('t');
ylabel('y');
