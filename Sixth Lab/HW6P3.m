clear;

r = 0.003; %minutes^-1. viral growth rate within a host
K = 1e4; %carrying capacity of host
V_start = 1; %one virus begins inside of a host
time_step = 0.01; %minutes
number_people = 100; %population of the simulation
virus_load_at_death = 1; %total virus load that will cause death. starting value
death_rate_array = zeros(1,30); %initialize array of 1 row and 30 columns
virus_load_at_death_array = zeros(1,30); %records tested values for total virus load that causes death
numb_death = 0; %used to track total deaths

for j = 1:30
    numb_death = 0;
    for i = 1:number_people
        t = 0; %time scalar set to 0 mins
        numb_virus = 1; %reset starting number of viral infection
        contact_time = rand*10000; %calculate random contact time with infected person using ~10000 minutes in a week
        while t <= contact_time
            t = t + time_step;
            numb_virus = (V_start * K) / (V_start + (K - V_start)*exp(-r*t));
        end
        if numb_virus >= virus_load_at_death
            numb_death = numb_death + 1;
        end
    end
    death_rate = (numb_death / number_people);
    death_rate_array(j) = death_rate;
    virus_load_at_death_array(j) = virus_load_at_death;
    virus_load_at_death = virus_load_at_death + 300; %larger numbers indicate a less lethal virus
end

hold on;

plot(-virus_load_at_death_array, death_rate_array);
axis([-9000 0 0 1]);
xlabel("Individual Virus Lethality");
ylabel("Death Rate per 100 People");

legend('transmissibility .001', 'transmissibility .0015', 'transmissibility .002','transmissibility .003', 'Location', 'northwest', 'NumColumns', 2);