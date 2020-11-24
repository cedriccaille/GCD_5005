clear;
clc;

Axon_Length = 300; %micrometers
Duration = 1200; %seconds
time_step = 0.1; %seconds
time_counter = 0;
number_steps = round(Duration/time_step);
number_particles = 10;
particle_position = zeros(1,number_particles) + 300; %all particles originate at distal plus-end (300micrometers)
particle_state = zeros(1,number_particles) + 1; %to keep track of which state particles are in, either 1 - JIP1 or 0 - P-JIP1(phosphorylated). All start as JIP1
switch_probability = 0.5; %probability of switching between JIP1 and P-JIP1
JIP1_velocity = -1.3; %JIP1 particles associated with dynein move retrograde at -1.3 micrometers/sec
PJIP1_velocity = 1.4; %PJIP1 particles w/ kinesins move anterograde at 1.2 micrometers/sec
Time_array = zeros(1,number_steps); %1D vector
Position_array = zeros(number_particles, number_steps); %2D vector

for j = 1:number_steps
    time_counter = time_counter + time_step;
    Time_array(j) = time_counter;
    for i = 1:number_particles
        Position_array(i, j) = particle_position(i);
        if particle_state(i) == 1
            [particle_position(i)] = JIP1_Motility(particle_position(i), JIP1_velocity, time_step, Axon_Length);
        else
            [particle_position(i)] = P_JIP1_Motility(particle_position(i), PJIP1_velocity, time_step, Axon_Length);
        end
        
        [particle_state(i)] = Switch_decision(particle_state(i), switch_probability);
        
    end
end

figure;

plot(Position_array, -Time_array, 'green');
% axis([0 300 -1200 0]);
xlabel("Position (?m)");
ylabel("Time (s)");
            
        