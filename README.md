# cyp-vincristine


**function [BLC] = blood_level_conc(BV,k_m,V_max,dose_schedule,t_step,t_max)**

Inputs: 
- BV,k_m,V_max,t_step,t_max : numbers in agreeing units
- dose_schedule: N*2 Matrix, where N is number of drug adminstrations per cycle
      - Column 1 = Dose time (note first dose must be at t=0)
      - Column 2 = Dose amount

Outputs:
- BLC: M*2 Matrix, where M is the number of time points simulated (t_max/t_step + 1)
      - Column 1 = Time (starting at t=0 and increasing in increments of t_step)
      - Column 2 = Blood Level Concentration
