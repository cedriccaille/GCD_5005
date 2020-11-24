clear;

r = 0.001; %minutes. bacterial growth rate within host
K = 1e4; %carrying capacity of a host
V_start = 1; %one bacteria begins within the host
time_step = 0.01; %minutes, for sampling number of bacteria
t = 0; %minutes. time counter, records elapsed time of simulation
bacteria = 1; %calculate number of bacteria in the host at each time step
i = 0; %index iterator variable
time_array = zeros(1, K); %preallocating an estimate. Could be larger or smaller than this
V = zeros(1, K); %bacteria array
B = 1000; %parameter that control infectiousness of the infected hosts
Beta = 1e-4; %minutes. rate related to coupling between within-host and between-host dynamics
T_array = zeros(1, K); %preallocate for unknown length

while bacteria < K
    i = i + 1; %increment iterator variable
    t = t + time_step; %increase elapsed time each iteration
    bacteria = (V_start * K) / (V_start + (K - V_start)*exp(-r*t));
    Trans_rate = Beta*(1-exp(-1*(bacteria/B)));
    
    time_array(i) = t;
    V(i) = bacteria;
    T_array(i) = Trans_rate;
end

x = time_array;
y = V;
yyaxis left
plot(x,y);
xlabel("Time (minutes)");
ylabel("Number of Bacteria in Host");
title("Bacterial Growth and Transmission Rate Curve");
axis([0 12000 0 10000]);


z = T_array;
yyaxis right
plot(x,z);
ylabel("Transmission Rate of Bacteria");
axis([0 12000 0 1e-4]);

