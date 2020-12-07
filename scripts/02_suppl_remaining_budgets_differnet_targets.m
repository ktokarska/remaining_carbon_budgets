%// not needed: calculate remaining budgets for higher warming targets,
%using different ZEC estimates
%// for f_nc* use the slope method (so no inputs needed for each target)

target_idx=1;
 
for t_lim=[1.5,1.75,2.0]
%--------------------------------------------------------------------------
%// choosing f_nc* value for other target levels
%--------------------------------------------------------------------------
clear f_nc_star_main_more zec_val_samples_shuffled_input
%--------------------------------------------------------------------------
case_num=1;  %only the main case (using empirical distributions)
clear CE_val_samples_shuffled_input t_val_samples_shuffled_input f_val_samples_shuffled_input
%regural samples
CE_val_samples_shuffled_input=CE_val_samples_shuffled;
t_val_samples_shuffled_input=t_val_samples_shuffled_all; %single variance
f_val_samples_shuffled_input=f_val_samples_shuffled;
zec_val_samples_shuffled_input=zec_val_samples_shuffled_03; %use +/- 0.3 ZEC for all targets

%--------------------------------------------------------------------------
% f_nc_star_input= f_nc_star_main_more; % not needed if using the slope
% method

itc_fnc= f_nc_star_intercept; % 0.140; was before 0.1135; %intercept, now using the slope method for f_nc (see 01_plot_linear_fits)
%intercept (using the slope method)
%the intercept was calculated earlier in the
%01_plot_linear_fits_f_nc_distrbitions 

%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
%// calculating the distributions using functions
%--------------------------------------------------------------------------
%// Using direct sampling
clear RB_CO2_input
RB_CO2_input = direct_rb_calc_slope(itc_fnc,t_lim,CE_val_samples_shuffled_input,t_val_samples_shuffled_input,f_val_samples_shuffled_input,zec_val_samples_shuffled_input);

RB_CO2_out_targets{case_num,target_idx}=RB_CO2_input;
target_value{case_num,target_idx}=t_lim;

clear RB_CO2_input

case_num

target_idx=target_idx+1;


end %end case_um

%--------------------------------------------------------------------------

t_lim=1.5;
%keep it at 1.5 for plotting main figs.