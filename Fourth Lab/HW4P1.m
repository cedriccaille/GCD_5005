%Problem 1
%Part A
clear;

MyGauss = zeros(1,5000);

for i = 1:5000
    num = (randn*2 + 10);
    if num < 6
        num = 0;      
    end;
    MyGauss(i) = num;
end;

histogram(MyGauss);
title("Histogram of Random Normal Distribution of Numbers");
ylabel("Frequency of Number");
xlabel("Number Value");