clear all
clc

BV_u = 5;                   % L
BSA_u = 1.8;                % m^2
pmol_cyp = 2929510;         % pmol cyp
mm_cyp = 57343;            % g/mol for cyp
mm_drug = 825;              % g/mol for vincristine

t_max = 500;             % min
t_step = 1;                 % min

%
V_max_u = 3.5;              % pmol/min per pmol cyp
k_m_u = 16;                 % umol/L
dose_schedule_u= [0,1.4];  % [min, mg/m^2]

[BV,k_m,V_max,dose_schedule] = unit_helper(V_max_u,k_m_u,dose_schedule_u,BV_u,BSA_u, pmol_cyp, mm_cyp, mm_drug);

target = blood_level_conc(BV,k_m,V_max,dose_schedule,t_step,t_max);
%
V_max_u = 8.2;              % pmol/min per pmol cyp
k_m_u = 12;                 % umol/L
dose_schedule_u= [0,3.8/BSA_u; 60, 0.9/BSA_u];  % [min, mg/m^2]

[BV,k_m,V_max,dose_schedule] = unit_helper(V_max_u,k_m_u,dose_schedule_u,BV_u,BSA_u, pmol_cyp, mm_cyp, mm_drug);

mut = blood_level_conc(BV,k_m,V_max,dose_schedule,t_step,t_max);
%

diff = target(:,2) - mut(:,2);
cost = sum(diff .* diff)

plot(target(:,1),target(:,2))
hold on
plot(mut(:,1),mut(:,2))
hold off