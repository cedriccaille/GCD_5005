clear;

rng('shuffle'); %seed random numbers with the clock

Final_position_array = zeros(1, 500); %If this was inside the for loop, it would reset to zero for every molecule

for j = 1:500
    
Number_motors = 1;
Duration = 600; %10 minutes converted to seconds
Time_step_size = 0.1; %when motor position will be determined, in seconds
Total_Steps = Duration/Time_step_size;
MT_length = 10000; %Microtubule length in nm
Time = 0; %Starting time for the simulation in seconds
Motor_position = rand*MT_length; %Motor placed randomly between 1nm and the end of the microtubule %Very important to be within the loop
V_motor = 50; %Velocity of motor in nm / s

%Need to preallocate data for two arrays
Motor_position_array = zeros(1, Total_Steps);
Time_array = zeros(1, Total_Steps);

    for i = 1:Total_Steps
        Motor_position_array(i) = Motor_position;
        Time_array(i) = Time;
        Motor_position = Motor_position + (V_motor.*Time_step_size);
        Time = Time + Time_step_size;

    end
    
    plot(Time_array, Motor_position_array);
    title('Motor Position vs. Time');
    xlabel('Time (s)');
    ylabel('Motor Position (nm)');
        
    hold all;
    
    Final_position_array(j) = Motor_position;
    
end

figure;
histogram(Final_position_array);
title("Histogram of Final Position Distribution")
xlabel("Motor position (nm)")
ylabel("Frequency of occurrence")


