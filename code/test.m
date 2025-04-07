




BV = 1;
k_m = 1;
V_max = 1;

dose_schedule = [0,1;
                 3,5];

t_step = 0.01;
t_max = 10;

result = blood_level_conc(BV,k_m,V_max,dose_schedule,t_step,t_max);

scatter(result(:,1),result(:,2))