clear;

rng('shuffle'); %seed random numbers with the clock

Number_motors = 1;
Duration = 600; %10 minutes converted to seconds
Time_step_size = 0.1; %when motor position will be determined, in seconds
Total_Steps = Duration/Time_step_size;
MT_length = 10000; %Microtubule length in nm
Time = 0; %Starting time for the simulation in seconds
Motor_position = rand*MT_length; %Motor placed randomly between 1nm and the end of the microtubule
V_motor = 50; %Velocity of motor in nm / s
%Need to preallocate data for two arrays
Motor_position_array = zeros(1, Total_Steps);
Time_array = zeros(1, Total_Steps);

for j = 
    
    for i = 1:Total_Steps;


        Motor_position_array(i) = Motor_position;
        Time_array(i) = Time;
        Motor_position = Motor_position + (V_motor.*Time_step_size);
        Time = Time + Time_step_size;

    end;
    
end;

Final_motor_position = Motor_position;

plot(Time_array, Motor_position_array);
title('Motor Position vs. Time');
xlabel('Time (s)');
ylabel('Motor Position (nm)');

