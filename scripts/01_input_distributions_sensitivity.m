%--------------------------------------------------------------------------
%// Calculating Gaussians (inputs); double standard deviation
%--------------------------------------------------------------------------
%// all variables ending with *_2s indicate double standard dev
%// variables ending in _1s indicate a Gaussian fit to empirical
%distribution (at 1 standard deviation)

%// example of the distribution names
% f_val_samples_shuffled = empirical distribution of f_nc (present-day)
% f_val_samples_shuffled_1s = Gaussian fit with 1 std
% f_val_samples_shuffled_2s = Gaussian fit with 2 std

%--------------------------------------------------------------------------
%// CE (cumulative CO2 emissions); symmetric distribution (2 sigma)
%--------------------------------------------------------------------------
% mu_CE=640; %same as in the main case
sigma_CE_2s=sigma_CE*2; %double standard deviation

%//Fitting a Gaussian, symmetric distribution
clear CE_val_samples_shuffled_2s 
CE_val_samples_shuffled_2s = normrnd(mu_CE,sigma_CE_2s,1,mc_samples_karsten); 
%// ranges of the distribution
disp('CE ranges')
[mean_val, median_val, range_likely, range_90per] = ranges_calc(CE_val_samples_shuffled_2s)

CE_val_samples_shuffled_1s=CE_val_samples_shuffled; %same as the input, since it is Gaussian (for consistency of names)

%--------------------------------------------------------------------------
%// ZEC  +/-0.3 C; symmetric normal distribution -> 2 sigma range
%--------------------------------------------------------------------------
mu_zec= 0;
val_95_zec=0.3; %5-95 symmetric range
sigma_zec= (val_95_zec-mu_zec)/Z_value; %for 90% of population inside that area, i.e. 5-95% bound

sigma_zec_2s=sigma_zec*2;

%\\ Make a Gaussian, symmetric distribution
zec_val_samples_shuffled_03_2s = normrnd(mu_zec,sigma_zec_2s,1,mc_samples_karsten); 

%// ranges of the distribution
disp('ZEC ranges')
[mean_val, median_val, range_likely, range_90per] = ranges_calc(zec_val_samples_shuffled_03_2s)


histogram(zec_val_samples_shuffled_03_2s); hold on; histogram(zec_val_samples_shuffled_03);

clear mu_zec val_95_zec sigma_zec sigma_zec_2s
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
%// T sampling (2 sigma)
%--------------------------------------------------------------------------
%//Fit a Gaussian to original data (to get idea of mu and sigma)
%// fitting a line to the edge of the histogram
clear input X Y
input=t_val_samples_shuffled_all;
% xbins=1280000;
xbins=1000;

[Nbox_s,edges_box_s] = histcounts(input,xbins, 'Normalization','pdf');
edges_box_s = edges_box_s(2:end) - (edges_box_s(2)-edges_box_s(1))/2;

plot(edges_box_s,Nbox_s,'Color', color{7},'LineWidth',2,'DisplayName','f_{nc} 2019'); hold on;        

X=edges_box_s';
Y=Nbox_s';
plot(X,Y)
%--------------------------------------------------------------------------
%// using 'cftool' to find a Gaussian fit to the above X,Y data
%
% General model Gauss1:
%      f(x) =  a1*exp(-((x-b1)/c1)^2)
% Coefficients (with 95% confidence bounds):
%        a1 =        3.92  (3.847, 3.992)
%        b1 =        1.17  (1.168, 1.172)
%        c1 =       0.138  (0.135, 0.1409)
% 
% Goodness of fit:
%   SSE: 212.6
%   R-square: 0.8922
%   Adjusted R-square: 0.892
%   RMSE: 0.4618

% pd = fitdist(Y,'Normal')
% x = [-1:.01:3];
% y = normpdf(x,0,1);
% plot(x,y)
%--------------------------------------------------------------------------
%// Additional case, fit a gaussian based on the above values
%--------------------------------------------------------------------------
%fitted a Gaussian and doubled the spread
% using values from fitted Gaussain 
mu_t_1s= 1.17;
sigma_t_1s=0.1748 ;
sigma_t_2s=sigma_t_1s*2;

%// Make a Gaussian, symmetric distribution
clear t_val_samples_shuffled_1s
t_val_samples_shuffled_1s = normrnd(mu_t_1s,sigma_t_1s,1,mc_samples_karsten);  
%// ranges of the distribution
[mean_val, median_val, range_likely, range_90per] = ranges_calc(t_val_samples_shuffled_1s)

%// Make a Gaussian, symmetric distribution
clear t_val_samples_shuffled_2s
t_val_samples_shuffled_2s = normrnd(mu_t_1s,sigma_t_2s,1,mc_samples_karsten);  
%// ranges of the distribution
[mean_val, median_val, range_likely, range_90per] = ranges_calc(t_val_samples_shuffled_2s)

%--------------------------------------------------------------------------
%// f_nc sampling
%--------------------------------------------------------------------------
%fitted a Gaussian and doubled the spread
%// using 10 yr mean
% mu_f_1s= 0.1857; %b1 Gaussian fit parameter
% sigma_f_1s=0.1313; %c1 Gaussian fit parameter
% sigma_f_2s=sigma_f_1s*2;

%// using 30 yr mean
mu_f_1s=0.1424; %b1 Gaussian fit parameter
sigma_f_1s=0.1748; %c1 Gaussian fit parameter
sigma_f_2s=sigma_f_1s*2;

%// Make a Gaussian, symmetric distribution
clear f_val_samples_shuffled_1s
f_val_samples_shuffled_1s = normrnd(mu_f_1s,sigma_f_1s,1,mc_samples_karsten); 
%// ranges of the distribution
[mean_val, median_val, range_likely, range_90per] = ranges_calc(f_val_samples_shuffled_1s)

%// Make a Gaussian, symmetric distribution
clear f_val_samples_shuffled_2s
f_val_samples_shuffled_2s = normrnd(mu_f_1s,sigma_f_2s,1,mc_samples_karsten); 
%// ranges of the distribution
[mean_val, median_val, range_likely, range_90per] = ranges_calc(f_val_samples_shuffled_2s)
%--------------------------------------------------------------------------
% mu_f_1s= 0.1839 ; %b1 Gaussian fit parameter
% sigma_f_1s=0.1332 ; %c1 Gaussian fit parameter
%--------------------------------------------------------------------------
%// how to get the mu and sigma for the Gaussian fit:
%
% %//fitting a line to the edge of the histogram
% xbins=1000;
% 
% input=f_val_samples_shuffled;
%  
% [Nbox_s,edges_box_s] = histcounts(input,xbins, 'Normalization','pdf');
% edges_box_s = edges_box_s(2:end) - (edges_box_s(2)-edges_box_s(1))/2;
% 
% %check it
% histogram(input,xbins, 'Normalization','pdf'); hold on;
% plot(edges_box_s,Nbox_s,'Color', 'b','LineWidth',2,'DisplayName','f_{nc} 2019'); hold on;        
% 
% clear X Y
% X=edges_box_s;
% Y=Nbox_s;
% plot(X,Y)

%get the fit from cftool on X and Y
%--------------------------------------------------------------------------
%b1 is mu and c1 is std
%--------------------------------------------------------------------------
%// NOW: using 30-yr mean General model Gauss1:
%      f(x) =  a1*exp(-((x-b1)/c1)^2)
% Coefficients (with 95% confidence bounds):
%        a1 =       3.182  (3.112, 3.251)
%        b1 =      0.1424  (0.1393, 0.1456)
%        c1 =      0.1748  (0.1704, 0.1792)
% 
% Goodness of fit:
%   SSE: 190.5
%   R-square: 0.8655
%   Adjusted R-square: 0.8652
%   RMSE: 0.4371
%--------------------------------------------------------------------------
% FROM BEFORE, using 10-yr mean General model Gauss1: 
%      f(x) =  a1*exp(-((x-b1)/c1)^2)
% Coefficients (with 95% confidence bounds):
%        a1 =       4.276  (4.011, 4.542)
%        b1 =      0.1857  (0.1791, 0.1924)
%        c1 =      0.1313  (0.1219, 0.1407)
% 
% Goodness of fit:
%   SSE: 29.18
%   R-square: 0.8858
%   Adjusted R-square: 0.8834
%   RMSE: 0.5485
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
