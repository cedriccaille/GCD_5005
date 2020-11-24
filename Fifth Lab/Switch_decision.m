%Switch_decision
function [particle_state] = Switch_decision(particle_state, switch_probability)
    if rand < switch_probability
        if particle_state == 0 %P-JIP1
            particle_state = 1; %convert to JIP1
        elseif particle_state == 1 %JIP1
            particle_state = 0; %convert to P-JIP1
        end
    end %if rand >= switch_probability, the particle_state will be unchanged
    
