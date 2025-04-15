function [BV,k_m,V_max,dose_schedule] = unit_helper(V_max_u,k_m_u,dose_schedule_u,BV_u,BSA_u, pmol_cyp, mm_cyp, mm_drug)

V_max = V_max_u* pmol_cyp * mm_drug * 10^-9;

k_m = k_m_u * 10^-2 * mm_drug;

BV = BV_u;

dose_schedule = dose_schedule_u;

dose_schedule(:,2) = dose_schedule(:,2) * BSA_u;

end
