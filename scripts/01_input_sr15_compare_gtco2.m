%--------------------------------------------------------------------------
%/ Comparing with the TCRE SR 1.5 distribution from Joeri
%--------------------------------------------------------------------------
 %1-SD range of 0.8-2.5 ?C/EgC which means that the median that was used is 1.65 ?C/EgC.
%symmetric distribution
% sigma_t_low= 1.65-0.8; 
% sigma_t_high=2.5-1.65;

fig_num=1;
mu_tcre_sr_gtco2=0.45; %for Gaussian distribution, the median and mean are equal
sigma_tcre_sr_gtco2= 0.45-0.22; %0.8500

median_val_sr_gtco2=0.45;
likely_sr_gtco2=[0.22,0.68];

%--------------------------------------------------------------------------
%// calculating or adding TCRE SR 1.5 Gaussian distribution
%--------------------------------------------------------------------------
figure(fig_num+1); hold on;
xlabel('TCRE_{SR}'); box on; hold on;

clear pd x y xx yy pd1 pd2
x_sr_gtco2 = -2*1000/3670:0.005:20*1000/3670; %x-axis range

% pd = makedist('Normal','mu',mu_t,'sigma',sigma_t)
clear pd1 pd1_sr_gtco2 
pd1_sr_gtco2 = makedist('Normal','mu',mu_tcre_sr_gtco2,'sigma',sigma_tcre_sr_gtco2)
pdf_sr_gtco2 = pdf(pd1_sr_gtco2,x_sr_gtco2); %PDF distribution 

% pdf_ghg_low_norm=pdf_ghg_low_s./trapz(x_ghg,pdf_ghg_low_s);
% pdf_ghg_high_norm=pdf_ghg_high_s./trapz(x_ghg,pdf_ghg_high_s);

% y_ghg=y2;
plot(x_sr_gtco2,pdf_sr_gtco2,'LineWidth',2,'Color',color_gauss{1});hold on; %plots the distribution

% %area under the curve
% trapz(x_ghg,y)
%normalized to the area under the curve (but it is already equal to 1)
% y2=y./trapz(x,y)
% y2=y./max(y);

a=mean(pd1_sr_gtco2)
b=std(pd1_sr_gtco2)

%----------------------------------------------------------
%// getting likely ranges from the SR1.5 report
%----------------------------------------------------------
  clear sr
  
   sr_gtco2=normrnd(mu_tcre_sr_gtco2,sigma_tcre_sr_gtco2,1,mc_samples_karsten);
%   for i=1:mc_samples_karsten
%       sr_gtco2(i)=normrnd(mu_tcre_sr_gtco2,sigma_tcre_sr_gtco2);
%   end

 %[median_val_sr_gtco2, likely_sr_gtco2, range90_sr_gtco2]=ranges_calc(sr_gtco2)
 
 [mean_val_sr_gtco2, median_val_sr_gtco2, range_likely_sr_gtco2, range_90_sr_gtco2,range_sigma_sr_gtco2]=ranges_calc_sigma(sr_gtco2)

 %----------------------------------------------------------
        