

function [state_ctr_] = Switch_Decision(state_ctr_, position_cntr, Axon_length);

if state_ctr_ == 1;  %In JIP1 state
    
    switch_probability = 1 - exp((position_cntr-Axon_length)/Axon_length);
    
else
    
    switch_probability = 0.5; %In P-JIP1 state
    
end
 
 if rand < switch_probability;
     
     state_ctr_  = ~(state_ctr_);
     
 end
     
     
 
 