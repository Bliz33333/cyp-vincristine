function [BLC] = blood_level_conc(BV,k_m,V_max,dose_schedule,t_step,t_max)
% 
% BV = 1;
% k_m = 1;
% V_max = 1;
% 
% dose_schedule = [0,1;
%                  3,5];
% 
% t_step = 0.01;
% t_max = 10;




t= 0:t_step:t_max;

dose_times = dose_schedule(:,1);
dose_amounts = dose_schedule(:,2);

D_tot = ones([1,length(t)]) * 0;
M = ones([1,length(t)]) * 0;
C_B = ones([1,length(t)]) * 0;

size(C_B)

D_tot(1) = dose_amounts(1);
M(1) = 0;
C_B(1) = dose_amounts(1)/BV;

size(C_B)

for i = 2:length(t)

    C_B_temp = C_B(i-1);

    dose = 0;
    if ismember(t(i),dose_times)
        
        dose = dose_amounts((dose_times==t(i)));
        C_B_temp = C_B_temp + dose/BV;
    end

    D_tot(i) = D_tot(i-1)+dose;

    M(i) = M(i-1) + V_max*C_B_temp/(k_m+C_B_temp)*t_step;

    
    C_B(i) = (D_tot(i)-M(i))/BV;

end

size(C_B)

BLC = [t;C_B].';

% scatter(t,C_B)

% 
% a = BV * k_m + D;
% b = V_max*D;
% c = V_max;
% 
% t = 5;
% 
% % v1 = (exp((c^2)*t/(b-1)))^((b)/(b-a*c));
% % v2 = v1/(-1*(b-a*c));
% 
% % v1 = b^(-1*c^2/b);
% % v2= v1^(b/(b-a*c));
% % v3= v2*exp(-1*b/(b-a*c));
% % v4 = v3*-1/(b-a*c);
% % v5 = lambertw(0,v4);
% 
% v1 = b^(-1*c^2/b);
% v2 = exp(c^2*t/(b-1));
% v3= (v1*v2)^(b/(b-a*c));
% v4 = v3*(-1)/(b-a*c);
% v5 = lambertw(0,v4);
% 
% x = (b*v5-a*c*v5+b)/c