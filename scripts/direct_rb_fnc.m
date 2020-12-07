function [RB_CO2] = direct_rb_fast(f_nc_star,t_lim,ce_val,t_val,f_val,t_zec_val)

%direct_rb_fast(mc_samples,f_nc_star,t_lim,CE_val_samples_shuffled,t_val_samples_shuffled,f_val_samples_shuffled,zec_val_samples_shuffled)

%// function that outputs RB_CO2
% distribution of the remaining budgets

%input parameters ce_val, t_val, f_val and t_zec_val are either emiprical
%or gaussian distributions

%// constant values
%f_nc_star, t_lim
%--------------------------------------------------------------------------
%// make sure all inputs are same dimension
%--------------------------------------------------------------------------
%make it column vectors
if size(ce_val,2)~= 1
    ce_val = ce_val'; 
end 

if size(ce_val)~= size(t_val)
 t_val = t_val'; 
end 

if size(ce_val)~= size(f_val)
 f_val = f_val'; 
end 

if size(ce_val)~= size(t_zec_val)
 t_zec_val = t_zec_val'; 
end 
%--------------------------------------------------------------------------
%// constant values need to be converted to vectors of the same size
%--------------------------------------------------------------------------
f_nc_star_input=ones(size(ce_val)).*f_nc_star;
t_lim_input=ones(size(ce_val)).*t_lim;

%--------------------------------------------------------------------------
%// Direct Random sampling from the input distributions
%--------------------------------------------------------------------------
%Units [C/PgC]
%//REMAINING BUDGET

RB_CO2=ce_val.*(((t_lim_input-t_zec_val)./t_val).*((1-f_nc_star_input)./(1-f_val))-1); 
     
%output RB_CO2
end