%Question 2 Part B

%code to simulate motor walking

clear;
clc;


rng('shuffle')  %seed random numbers with clock

number_motors = 100;  %number of motors
duration = 20*60; % duration in sec
v_motor = 3*1000/60;  %motor velocity in nm/s from howard
time_step = 0.01; %simulation time step in sec
position = zeros(number_motors,round(duration/time_step)); %initialize motor position array
time = zeros(1, round(duration/time_step));  %initialize time array
MT_Length = 10000;  %MT Length in nm
motor_position_counter = zeros(1,MT_Length);
time_counter = 0;
kon_motor = 1 %units: ?M^(-1)*s^(-1)

for i = 1: round(duration/time_step);
    
    time(i) = time_counter; %assign time array
    time_counter = time_counter + time_step;  %increment time counter
    
    for j = 1: number_motors;
         
        
        motor_position_counter(j) = motor_position_counter(j) + (v_motor*time_step);  %increment position counter
        
        if motor_position_counter(j) > MT_Length || motor_position_counter(j) < 0;
            motor_position_counter(j) =  rand*MT_Length;
        end;
        
        position(j,i) = motor_position_counter(j);  %assign position array
        
    end
    
end

final_position = max(position,[],2);  %calculate max position of each motor
figure
hist(final_position)

figure

plot(position, -time, '*')
xlabel('position (nm)')
ylabel('time (s)')







