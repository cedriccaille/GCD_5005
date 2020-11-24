clear;
clc;
n = 5000; %cm
height = 5; %cm
volume = zeros(1,n);
radius = zeros(1,n);
for i = 1:n
    radius(i) = i;
    [volume(i)] = volume_calculator(height, radius(i));
    i = i + 1;
end

plot(radius, volume);
xlabel("Radius (cm)");
ylabel("Volume (cm^3)");