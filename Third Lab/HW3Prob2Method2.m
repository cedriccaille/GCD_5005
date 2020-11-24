clear;

t = [-15:0.2:15];
y = (t.^4) - (3.*(t.^2)) + (2.*t) - 1;
i = [1:150];

y_array = zeros(1,150);
y_array = y;
y_array(i);

plot(y_array, 'g:*');
xlabel('t');
ylabel('y');