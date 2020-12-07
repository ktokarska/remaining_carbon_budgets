%--------------------------------------------------------------------------
%// This code calculates remaining budgets, using the slope method for
%f_nc*
%
% Next step: 03_plot_budgets_method_slope.m
%--------------------------------------------------------------------------
% case_name_rb{case_num,case_t}
%--------------------------------------------------------------------------
clear case_name_rb

%// geo-physical uncertainty
case_name_rb{1}='Main case'; %AWI 3
case_name_rb{2}='No uncertainty in any parameters'; 

case_name_rb{3}='No uncertainty in ZEC (ZEC = 0)'; % same as no uncertainty in ZEC
case_name_rb{4}='2 std in ZEC'; % same as main cae but 2 std in Main case ZEC 0.3

case_name_rb{5}='No uncertainty in T_{anth}'; % (using median value only)
case_name_rb{6}='Gaussian fit \Delta T_{anth}'; % (using median value only)
case_name_rb{7}='2 std Gaussian fit \Delta T_{anth}'; % (using median value only)

case_name_rb{8}='No uncertainty in E';
case_name_rb{9}='Gaussian fit E (same as main case)';
case_name_rb{10}='2 std Gaussian fit E';

case_name_rb{11}='No uncertainty in f_{nc}';
case_name_rb{12}='Gaussian fit \sigma f_{nc}';
case_name_rb{13}='2 std Gaussian fit f_{nc}';

%// these are no longer needed
case_name_rb{14}='low f_{nc}=0.10 (with no uncertainty)'; %comes from SSP estimate
case_name_rb{15}='low f_{nc}=0.15 (with no uncertainty)'; %comes from SSP estimate
case_name_rb{16}='low f_{nc}=0.20 (with no uncertainty)'; %comes from SSP estimate
case_name_rb{17}='low f_{nc}=0.25 (with no uncertainty)'; %comes from SSP estimate
case_name_rb{18}='high f_{nc}=0.35 (with no uncertainty)'; %comes from earlier Piers estimate

% color_rb_sens{19}=cell2mat(color_rb_sens(16));
% color_rb_sens{20}=cell2mat(color_rb_sens(16));
% 
% color_rb_sens{15}=cell2mat(color_rb_sens(14));
% color_rb_sens{16}=cell2mat(color_rb_sens(14));
% color_rb_sens{17}=cell2mat(color_rb_sens(14));
% color_rb_sens{18}=cell2mat(color_rb_sens(14));
% 
% color_rb_sens{21}=cell2mat(color_rb_sens(20));
% color_rb_sens{22}=cell2mat(color_rb_sens(20));
% color_rb_sens{23}=cell2mat(color_rb_sens(20));
% color_rb_sens{24}=cell2mat(color_rb_sens(20));

%--------------------------------------------------------------------------
%// socio-economic uncertainty
case_name_rb{19}='high f_{nc}* (intercept + 0.05)';  
case_name_rb{20}='low f_{nc}* (intercept -0.05)';  
case_name_rb{21}='high f_{nc}* (intercept + 0.02)';  
case_name_rb{22}='low f_{nc}* (intercept -0.02)';  
case_name_rb{23}='high f_{nc}* (intercept + 0.07)';  
case_name_rb{24}='low f_{nc}* (intercept -0.07)';  
%--------------------------------------------------------------------------
%// Constant inputs
%--------------------------------------------------------------------------
%// slope is constant, specified in the function 'direct_rb_calc_slope.m'
%// itc_fnc= f_nc_star_value; %intercept, now using the slope method for f_nc (see 01_plot_linear_fits)
%--------------------------------------------------------------------------
%target taemperature level
t_lim=1.5; 

f_nc_star_intercept=0.1400; %was before 0.1135; %intercept, now using the slope method for f_nc (see 01_plot_linear_fits)
slope_fnc=0.3081; %slope of that relationship (black fit, all scenarios, suppl table S5)
%--------------------------------------------------------------------------
% Calculate the output for different cases
%--------------------------------------------------------------------------
case_range=1:length(case_name_rb);

for t_lim_idx=1:3
    
 clear t_lim
 
    if t_lim_idx==1
        t_lim=1.5; 
    end
    
    if t_lim_idx==2
        t_lim=1.75; 
    end
    
    if t_lim_idx==3
        t_lim=2.0; 
    end

for case_num=case_range
clear CE_val_samples_shuffled_input t_val_samples_shuffled_input f_val_samples_shuffled_input zec_val_samples_shuffled_input

%regural case samples
CE_val_samples_shuffled_input=CE_val_samples_shuffled;
t_val_samples_shuffled_input=t_val_samples_shuffled_all; %single variance 
f_val_samples_shuffled_input=f_val_samples_shuffled; %single variance 
zec_val_samples_shuffled_input=zec_val_samples_shuffled_03; %use +/- 0.3 ZEC for all, including 1.5C
itc_fnc= f_nc_star_intercept; %intercept, now using the slope method for f_nc (see 01_plot_linear_fits)
%--------------------------------------------------------------------------
%//  % case_num==1  %Main case, uses empirical distributions
%--------------------------------------------------------------------------
%// Additional cases:
%--------------------------------------------------------------------------
% case_name_rb{2}='no uncertainty in any parameters'
%--------------------------------------------------------------------------
%for no uncertainty cases, the vector should be constant values of the same
%size as the original vector

if case_num==2 
    t_val_samples_shuffled_input=t_val_samples_shuffled_all*0+median(t_val_samples_shuffled_all);
    CE_val_samples_shuffled_input=CE_val_samples_shuffled*0+median(CE_val_samples_shuffled);
    f_val_samples_shuffled_input=f_val_samples_shuffled*0+median(f_val_samples_shuffled);
    zec_val_samples_shuffled_input=zec_val_samples_shuffled_03*0+median(zec_val_samples_shuffled_03);
end

%--------------------------------------------------------------------------
% case_name_rb{3}='ZEC=0'; %same as no uncertainty in ZEC
%--------------------------------------------------------------------------
if case_num==3 
    zec_val_samples_shuffled_input=zec_val_samples_shuffled_03*0; %to keep the vector size
end

%--------------------------------------------------------------------------
% case_name_rb{4}='2 sigma in ZEC (as Main Case)';
%--------------------------------------------------------------------------
if case_num==4 
    zec_val_samples_shuffled_input=zec_val_samples_shuffled_03_2s;
end

%--------------------------------------------------------------------------
% case_name_rb{5}='No uncertainty in T_{anth}'; % (using median value only)
%--------------------------------------------------------------------------
if case_num==5 
    t_val_samples_shuffled_input=t_val_samples_shuffled_all*0+median(t_val_samples_shuffled_all); %single variance, constant
end

%--------------------------------------------------------------------------
% case_name_rb{6}='1 \sigma \Delta T_{anth}'; (Gaussian fit, 1 std)
%--------------------------------------------------------------------------
if case_num==6 
    t_val_samples_shuffled_input=t_val_samples_shuffled_1s;
end

%--------------------------------------------------------------------------
% case_name_rb{7}='2 \sigma \Delta T_{anth}'; % (Gaussian fit, 2 std)
%--------------------------------------------------------------------------
if case_num==7 
     t_val_samples_shuffled_input=t_val_samples_shuffled_2s;
end

%--------------------------------------------------------------------------
% case_name_rb{8}='No uncertainty in E';
%--------------------------------------------------------------------------
if case_num==8 
    CE_val_samples_shuffled_input=CE_val_samples_shuffled*0+median(CE_val_samples_shuffled);
end

%--------------------------------------------------------------------------
% case_name_rb{9}='1 \sigma E (same as main case)'; (Gaussian fit, 1 std)
%--------------------------------------------------------------------------
if case_num==9 
    CE_val_samples_shuffled_input=CE_val_samples_shuffled_1s;
end

%--------------------------------------------------------------------------
% case_name_rb{10}='2 \sigma E'; (Gaussian fit, 2 std)
%--------------------------------------------------------------------------
if case_num==10 
   CE_val_samples_shuffled_input=CE_val_samples_shuffled_2s;
end

%--------------------------------------------------------------------------
% case_name_rb{11}='No uncertainty in f_{nc}';
%--------------------------------------------------------------------------
if case_num==11 
    f_val_samples_shuffled_input=f_val_samples_shuffled*0+median(f_val_samples_shuffled);
end

%--------------------------------------------------------------------------
% case_name_rb{12}='1 \sigma f_{nc}'; (Gaussian fit, 1 std)
%--------------------------------------------------------------------------
if case_num==12 
    f_val_samples_shuffled_input=f_val_samples_shuffled_1s;
end

%--------------------------------------------------------------------------
% case_name_rb{13}='2 \sigma f_{nc}'; (Gaussian fit, 2 std)
%--------------------------------------------------------------------------
if case_num==13 
    f_val_samples_shuffled_input=f_val_samples_shuffled_2s;
end

%--------------------------------------------------------------------------
% case_name_rb{14}='low f_{nc}=0.15 (with no uncertainty)'; %comes from SSP estimate
%--------------------------------------------------------------------------
if case_num==14 
    f_val_samples_shuffled_input=f_val_samples_shuffled*0+0.10;
end

if case_num==15
    f_val_samples_shuffled_input=f_val_samples_shuffled*0+0.15;
end

if case_num==16 
    f_val_samples_shuffled_input=f_val_samples_shuffled*0+0.20;
end

if case_num==17 
    f_val_samples_shuffled_input=f_val_samples_shuffled*0+0.25;
end

if case_num==18 
    f_val_samples_shuffled_input=f_val_samples_shuffled*0+0.35;
end

%--------------------------------------------------------------------------
%// socio-economic uncertainty
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
% case_name_rb{16}='f_{nc}* slope +0.2';  
%--------------------------------------------------------------------------
if case_num==19 
     itc_fnc= f_nc_star_intercept +0.05; %f_nc*, adjust the slope
end

if case_num==20 
      itc_fnc= f_nc_star_intercept -0.05; %f_nc*, adjust the slope
end

if case_num==21 
     itc_fnc= f_nc_star_intercept +0.02; %f_nc*, adjust the slope
end

if case_num==22 
      itc_fnc= f_nc_star_intercept -0.02; %f_nc*, adjust the slope
end

if case_num==23 
     itc_fnc= f_nc_star_intercept +0.07; %f_nc*, adjust the slope
end

if case_num==24
      itc_fnc= f_nc_star_intercept -0.07; %f_nc*, adjust the slope
end
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
%// calculating the distributions using functions
%--------------------------------------------------------------------------
%// Using direct sampling
clear RB_CO2_input

RB_CO2_input = direct_rb_calc_slope(slope_fnc,itc_fnc,t_lim,CE_val_samples_shuffled_input,t_val_samples_shuffled_input,f_val_samples_shuffled_input,zec_val_samples_shuffled_input);

RB_CO2_out{case_num,t_lim_idx}=RB_CO2_input;

end %end case_um

%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
end %end t_lim case

%// Main case
t_lim_idx=1;
t_lim=1.5;
