V_max_u = 3.5;              % pmol/min per pmol cyp
k_m_u = 16;                 % umol/L
dose_schedule_u= [0,1.4;
                3600,0.5];  % [min, mg/m^2]
BV_u = 5;                   % L
BSA_u = 1.8;                % m^2
pmol_cyp = 2929510;         % pmol cyp
mm_cyp = 57,343;            % g/mol for cyp
mm_drug = 825;              % g/mol for vincristine

t_max = 3600*3;             % min
t_step = 1;                 % min

[BV,k_m,V_max,dose_schedule] = unit_helper(V_max_u,k_m_u,dose_schedule_u,BV_u,BSA_u, pmol_cyp, mm_cyp, mm_drug);

result = blood_level_conc(BV,k_m,V_max,dose_schedule,t_step,t_max);

scatter(result(:,1),result(:,2))
