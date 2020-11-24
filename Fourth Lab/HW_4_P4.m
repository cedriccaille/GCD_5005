%Question 2 Part A

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
MT_Length = 5000;  %MT Length in nm
motor_position_counter = zeros(1,number_motors);
time_counter = 0;
kon_motor = 1; %?M^-1 * s^-1
mt_conc = 2.0e-7 * MT_Length; %units: ?M
motor_on_rate = kon_motor * mt_conc; %units: s^-1
motor_off_rate = 0.03; %units: s^-1
MT_Length_Array = zeros(1,round(duration/time_step)); %preallocate space for array

for i = 1: round(duration/time_step)
    MT_Length_Array(i)= MT_Length; %makes a new MT_Length array
    time(i) = time_counter; %assign time array
    time_counter = time_counter + time_step;  %increment time counter
    
    for j = 1: number_motors
        if motor_position_counter(j) == 0 %detached from microtubule
            pr_attach = 1 - exp(-1.*(motor_on_rate).*(time_step));
            if pr_attach > rand
                motor_position_counter(j) = rand.*MT_Length;
            elseif pr_attach < rand
                motor_position_counter(j) = motor_position_counter(j);
            end
        else 
            pr_deattach = 1 - exp(-1.*(motor_off_rate).*(time_step));
            if pr_deattach > rand
                motor_position_counter(j) = 0;
            elseif pr_deattach < rand
                motor_position_counter(j) = motor_position_counter(j) + (v_motor*time_step);  %increment position counter
                if motor_position_counter(j) > MT_Length
                    motor_position_counter(j) =  MT_Length;
                elseif motor_position_counter(j) < 0
                    motor_position_counter(j) = 0;
                end
            end
        end
        position(j,i) = motor_position_counter(j);  %assign position array
        if motor_position_counter(j) == MT_Length
            MT_Length = MT_Length - 0.088;
            if MT_Length <= 1
                MT_Length = 1;
            end
        end
    end
end

plot(time,MT_Length_Array);
axis([0 1200 0 20000])
xlabel("Time (s)")
ylabel("MT Length (nm)")

hold all;


% final_position = max(position,[],2);  %calculate max position of each motor
% figure
% hist(final_position)
% 
% figure
% 
% plot(position, -time, '*')
% xlabel('position (nm)')
% ylabel('time (s)')







