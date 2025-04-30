clear all
clc

load('.\data\CYP3A4_kinetics.mat')

BV_u = 5;                   % L
BSA_u = 1.8;                % m^2
pmol_cyp = 2929510;         % pmol cyp
mm_cyp = 57343;            % g/mol for cyp
mm_drug = 825;              % g/mol for vincristine
dose_schedule_u= [0,1.4];  % [min, mg/m^2]
slowdown_factor = 85/18;

t_max = 100000;             % min
t_step = 1;                 % min
threshold = 0.025;

t_max_opt = ones([length(CYP3A4_alleles),1]) * 0;

for i = 1:length(t_max_opt)
    
    V_max_u = CYP3A4_alleles{i,2}/slowdown_factor;
    k_m_u = CYP3A4_alleles{i,4};

    [BV,k_m,V_max,dose_schedule] = unit_helper(V_max_u,k_m_u,dose_schedule_u,BV_u,BSA_u, pmol_cyp, mm_cyp, mm_drug);
    BLC_curve = blood_level_conc(BV,k_m,V_max,dose_schedule,t_step,t_max);
        
    under_threshold = BLC_curve(:,2) < threshold;

    t_max_opt(i) = find(under_threshold,1,'first');
    t_max_opt(i) = max(t_max_opt(i), t_max_opt(1));

    i
end
