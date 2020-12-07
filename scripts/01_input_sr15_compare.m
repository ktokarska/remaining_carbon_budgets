%--------------------------------------------------------------------------
%/ Comparing with the TCRE SR 1.5 distribution from Joeri
%--------------------------------------------------------------------------
 %1-SD range of 0.8-2.5 ?C/EgC which means that the median that was used is 1.65 ?C/EgC.
%symmetric distribution
% sigma_t_low= 1.65-0.8; 
% sigma_t_high=2.5-1.65;

fig_num=1;
mu_tcre_sr=1.65; %for Gaussian distribution, the median and mean are equal
sigma_tcre_sr= 1.65-0.8; %0.8500
%--------------------------------------------------------------------------
%// calculating or adding TCRE SR 1.5 Gaussian distribution
%--------------------------------------------------------------------------
figure(fig_num+1); hold on;
xlabel('TCRE_{SR}'); box on; hold on;

clear pd x y xx yy pd1 pd2
x_sr = -2:0.001:20; %x-axis range

% pd = makedist('Normal','mu',mu_t,'sigma',sigma_t)
clear pd1
pd1_sr = makedist('Normal','mu',mu_tcre_sr,'sigma',sigma_tcre_sr)
pdf_sr = pdf(pd1_sr,x_sr); %PDF distribution 

% pdf_ghg_low_norm=pdf_ghg_low_s./trapz(x_ghg,pdf_ghg_low_s);
% pdf_ghg_high_norm=pdf_ghg_high_s./trapz(x_ghg,pdf_ghg_high_s);

% y_ghg=y2;
plot(x_sr,pdf_sr,'LineWidth',2,'Color',color_gauss{1});hold on; %plots the distribution

% %area under the curve
% trapz(x_ghg,y)
%normalized to the area under the curve (but it is already equal to 1)
% y2=y./trapz(x,y)
% y2=y./max(y);

a=mean(pd1_sr)
b=std(pd1_sr)

%----------------------------------------------------------
%// getting likely ranges from the SR1.5 report
%----------------------------------------------------------
clear sr
sr=normrnd(mu_tcre_sr,sigma_tcre_sr,1,mc_samples_karsten);

[mean_val_sr, median_val_sr, range_likely_sr, range_90per_sr,range_sigma_sr]=ranges_calc_sigma(sr)
%--------------------------------------------------------------------------
  %long way of doing it
%                   for i=1:mc_samples_karsten
%                       sr(i)=normrnd(mu_tcre_sr,sigma_tcre_sr);
%                   end
%                   
%--------------------------------------------------------------------------

                               
                
