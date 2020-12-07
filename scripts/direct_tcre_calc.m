function [TCRE_CO2] = direct_tcre_fast(ce_val,t_val,f_val)

%output 
%// function that outputs TCRE distributoin

%input parameters ce_val, t_val, f_val are either emiprical
%or gaussian distributions

%--------------------------------------------------------------------------
%// make sure all inputs are same dimension
%--------------------------------------------------------------------------
if size(ce_val)~= size(t_val)
 t_val = t_val'; 
end 

if size(ce_val)~= size(f_val)
 f_val = f_val'; 
end 

%--------------------------------------------------------------------------
%// Direct Random sampling from the input distributions
%--------------------------------------------------------------------------
%Units [\circ C/1000 PgC]

ce_val=ce_val./1000; % from PgC to EgC

%calculate TCRE
TCRE_CO2=(t_val./ce_val).*(1-f_val); 
% output TCRE_CO2

end