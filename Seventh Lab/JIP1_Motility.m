

function [counter_for_jip] = JIP1_Motility(counter_for_jip, v_JIP1, time_step ,axon_Length );

counter_for_jip = counter_for_jip + (v_JIP1*time_step);

if counter_for_jip >= axon_Length;
    
    counter_for_jip = axon_Length;
    
elseif counter_for_jip <= 0;
     
     counter_for_jip = 0;
     
end