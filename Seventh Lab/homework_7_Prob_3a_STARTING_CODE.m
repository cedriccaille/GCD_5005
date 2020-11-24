

clear;
clc;
close all;

rng('shuffle')  %seed random numbers with clock

number_motors = 10;  %number of motors
duration = 20*60; % duration in sec
kin_velocity = 1.2;  %kinesin velocity um/sec
dyn_velocity = -1.3 ;   %dynein velocity um/sec
time_step = 0.1; %simulation time step in sec
position = zeros(number_motors,round(duration/time_step)); %initialize motor position array
time = zeros(1, round(duration/time_step));  %initialize time array
Axon_Length = 300;  %axon length in um
motor_position_counter = (ones(1,number_motors)).*Axon_Length;
motor_state_counter = ones(1,number_motors);  %all motors start in JIP1 state
time_counter = 0;
switch_probability = 0.5;  %factor to adjust spatial probability function



for i = 1: round(duration/time_step);
    
    time(i) = time_counter; %assign time array
    time_counter = time_counter + time_step;  %increment time counter
    
    
    for j = 1: number_motors;
        
        if motor_state_counter(j) == 1; %JIP1 state, now move
            
            [motor_position_counter(j)] = JIP1_Motility(motor_position_counter(j), dyn_velocity, time_step, Axon_Length);
            
        else  %motor state == 1, PJIP1 state, now move
            
            [motor_position_counter(j)] = P_JIP1_Motility(motor_position_counter(j), kin_velocity, time_step, Axon_Length);
            
        end
        
        [motor_state_counter(j)] = Spatial_Switch_Decision(motor_state_counter(j), motor_position_counter(j), Axon_Length);
        
        position(j,i) = motor_position_counter(j);  %assign position array
        
    end
    
    
end





