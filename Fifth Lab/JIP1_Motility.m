%JIP1_Motility
function [particle_position] = JIP1_Motility(particle_position, JIP1_velocity, time_step_size, axon_length)
    particle_position = particle_position + (time_step_size .* JIP1_velocity);
    if particle_position > axon_length
        particle_position = axon_length;
    elseif particle_position < 0
        particle_position = 0;
    end