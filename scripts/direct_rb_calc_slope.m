function [RB_CO2] = direct_rb_fast_slope(slope_fnc,itc_fnc,t_lim,ce_val,t_val,f_val,t_zec_val)

%// function that outputs remaining carbon budget RB_CO2 given the inputs

%input parameters: (all inputs are column vectors size nx1, n is number of
%samples drawn from the input distributions
%are either emiprical or gaussian distributions

%cumulative emissions: ce_val
%temperature: t_val
%present-day radiative forcing f_val 
% ZEC t_zec_val

%// constant values
% temperature target: t_lim 
% slope of the f_nc vs f_nc* = itc_fnc (constant input)

%--------------------------------------------------------------------------
%// make sure all inputs are the same dimension
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
% f_nc_star_input=ones(size(ce_val)).*slope_fnc; not needed as we use slope
% method now

%make t_lim the same size as other vectors
t_lim_input=ones(size(ce_val)).*t_lim;

%for the main case: f*_nc = 0.3221 * f_nc + 0.1135
%i.e. f_nc_star_input =  f_val.*0.3221 + itc_fnc

%--------------------------------------------------------------------------
%// Direct Random sampling from the input distributions
%--------------------------------------------------------------------------
%Units [C/PgC]
%//REMAINING BUDGET

RB_CO2=ce_val.*(((t_lim_input-t_zec_val)./t_val).*((1-(f_val.*slope_fnc + itc_fnc))./(1-f_val))-1); 
     
%output RB_CO2
end