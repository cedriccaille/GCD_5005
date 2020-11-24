

function [state_ctr_] = Switch_Decision(state_ctr_, switch_probability);
 
 if rand < switch_probability;
     
     state_ctr_  = ~(state_ctr_);
     
 end
     
     
 
 