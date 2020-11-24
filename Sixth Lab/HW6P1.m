clear;

x = 0;
y = 0;
i = 0; %array counter
yarray = [];
xarray = [];

while y < 9.99
    y = 10*(1-exp(-x/4));
    i = i+1;
    yarray(i) = y;
    xarray(i) = x;
    x = x+1;
end

xmax = x;
plot(xarray, yarray);
xlabel("X values (units)")
ylabel("Y values (units)")