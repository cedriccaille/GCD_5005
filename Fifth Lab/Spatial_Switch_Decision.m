%Spatial_Switch_Decision
function [particle_state] = Spatial_Switch_Decision(particle_state,particle_position,axon_length)
    if particle_state == 1
        pr_JIP_to_PJIP = 1 - exp((particle_position - axon_length) / axon_length);
        if rand < pr_JIP_to_PJIP
            particle_state = 0; %change to PJIP state
        end %if rand >= pr_JIP_to_PJIP then the particle_state will be unchanged
    else
        pr_PJIP_to_JIP = 0.5;
        if rand < pr_PJIP_to_JIP
            particle_state = 1; %change to JIP state
        end %if rand >= pr_PJIP_to_JIP then the particle_state will be unchanged
    end
            