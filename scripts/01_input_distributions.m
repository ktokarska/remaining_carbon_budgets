%--------------------------------------------------------------------------
%// Generating input distributions to be used for MCMC sampling
%--------------------------------------------------------------------------
%// Next Steps after running this code:

% load "input_distributions_sensitivity.m" for double variance (sensitivity analysis)
% run "02_main_tcre_sampling.m" (for calculating TCRE distributions)
% run "02_main_remaining_budgets" (for calculating remaining carbon budget distributions)
%--------------------------------------------------------------------------
%// Alternatively, load colors from the workspace
load('color_custom.mat')
%--------------------------------------------------------------------------
%// Calculating Gaussian input distributions
%--------------------------------------------------------------------------
fig_num=1;
Z_value= 1.644854 ; %statistical value for 90% interval (or 5-95% range, with 90% of the population inside)

% choose number of MC samples
mc_samples_in=1000000; % one million samples (does not really matter)
% mc_samples=100000; %number of mc_samples
% mc_samples_in=1280000; %does not really matter if it is larger

%--------------------------------------------------------------------------
%// CE (cumulative CO2 emissions); symmetric distribution
%--------------------------------------------------------------------------
%for 1870-2019 it is 640 ± 65 (1-sigma) for 1870-2018 (Global Carbon Project)
mu_CE=640;
sigma_CE=65; 

%//Make a Gaussian, symmetric distribution
clear CE_val_samples_shuffled 
CE_val_samples_shuffled = normrnd(mu_CE,sigma_CE,1,mc_samples_in); 

%// ranges of the distribution
disp('CE ranges')
[mean_val, median_val, range_likely, range_90per] = ranges_calc(CE_val_samples_shuffled)

%--------------------------------------------------------------------------
%// Zero emission committment (ZEC) treated as 5-95% range
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
%// ZEC  +/-0.1 C; symmetric normal distribution
%--------------------------------------------------------------------------
mu_zec= 0;
val_95_zec=0.1; %5-95 symmetric range
sigma_zec= (val_95_zec-mu_zec)/Z_value; %for 90% of population inside that area, i.e. 5-95% bound

%\\ Make a Gaussian, symmetric distribution
zec_val_samples_shuffled_01 = normrnd(mu_zec,sigma_zec,1,mc_samples_in); 

%// ranges of the distribution
disp('ZEC ranges')
[mean_val, median_val, range_likely, range_90per] = ranges_calc(zec_val_samples_shuffled_01)
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
%// ZEC  +/-0.2 C; symmetric normal distribution
%--------------------------------------------------------------------------
mu_zec= 0;
val_95_zec=0.2; %5-95 symmetric range
sigma_zec= (val_95_zec-mu_zec)/Z_value; %for 90% of population inside that area, i.e. 5-95% bound

%\\ Make a Gaussian, symmetric distribution
zec_val_samples_shuffled_02 = normrnd(mu_zec,sigma_zec,1,mc_samples_in); 

%// ranges of the distribution
disp('ZEC ranges')
[mean_val, median_val, range_likely, range_90per] = ranges_calc(zec_val_samples_shuffled_02)
%--------------------------------------------------------------------------
%// ZEC  +/-0.3 C; symmetric normal distribution
%--------------------------------------------------------------------------
mu_zec= 0;
val_95_zec=0.3; %5-95 symmetric range
sigma_zec= (val_95_zec-mu_zec)/Z_value; %for 90% of population inside that area, i.e. 5-95% bound

%\\ Make a Gaussian, symmetric distribution
zec_val_samples_shuffled_03 = normrnd(mu_zec,sigma_zec,1,mc_samples_in); 

%// ranges of the distribution
disp('ZEC ranges')
[mean_val, median_val, range_likely, range_90per] = ranges_calc(zec_val_samples_shuffled_03)


histogram(zec_val_samples_shuffled_03); hold on; histogram(zec_val_samples_shuffled_02);

clear mu_zec val_95_zec sigma_zec
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
%// Delta T (Observed Anthropogenic Warming estimate)
%--------------------------------------------------------------------------
%// getting data from Karsten
%--------------------------------------------------------------------------
cd   'data_AWI_distributions'

distr_tas=ncread('GWI_FullCoverage_1850_1900_201801_201909.nc','Tmean');
time_tas=ncread('GWI_FullCoverage_1850_1900_201801_201909.nc','time');

tas_2018=distr_tas(1:12,:);

clear c
c=nanmean(tas_2018,1);
histogram(c); hold on;

%jan-sept 2019only
time_tas(13:21)

tas_2019=distr_tas(13:21,:);

clear tas_2019_ann
tas_2019_ann=nanmean(tas_2019,1);
histogram(tas_2019_ann)
xlabel('Anthropogenic warming [\circ C]'); ylabel('Density');

%// draw random samples with replacement from this data
t_val_samples_r = datasample(tas_2019_ann,mc_samples_in); 

t_val_samples_shuffled_all=t_val_samples_r(randperm(length(t_val_samples_r)));

%change directory back to the main one
cd ..

disp('T values')
[mean_val, median_val, range_likely, range_90per] = ranges_calc(t_val_samples_shuffled_all)

%--------------------------------------------------------------------------
%// f_nc (non-CO2 fraction of total forcing)
%--------------------------------------------------------------------------
%// returns k observations sampled uniformly at random, with replacement, from the data in data.
%--------------------------------------------------------------------------

%// use 01_load_fnc_scenario_database to get this data (or the sample
%  workspace)

clear input a b

input=f_nc_2019_10yr; %using input from SR 1.5 database (10 yr mean 2010-2019)
[a   len]=size(input); 
clear a
a=input(:,1);
a=a(~isnan(a)); %only select exisiting values
for i=2:len
clear b
b=input(:,i);
b=b(~isnan(b)); %only select exisiting values
a=vertcat(a,b); %concentate vertically
end

%draw random samples
f_nc = datasample(a,mc_samples_in); 

%randomly shuffle (not needed)
clear f_val_samples_shuffled
f_val_samples_shuffled=f_nc(randperm(length(f_nc)));

%// ranges of the distribution
disp('f_{nc} ranges')
[mean_val, median_val, range_likely, range_90per] = ranges_calc(f_val_samples_shuffled)

% nanmean(f_val_samples_shuffled)
% mu_f=mean(f_val_samples_shuffled);

%--------------------------------------------------------------------------
%--------------------------------------------------------------------------

