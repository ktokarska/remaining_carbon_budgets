cd   '/Users/ktokarska/Dropbox/kasia_uvic_2017_2018/Bayes_TCRE_calc/obs_tcre_more/budgets_uncertainty_code_updated_AR6_2020/data_f_nc_30yr_mean'

%-----------------------------------------------------------------------------
clear f_nc_peak f_nc_peak_tbl f_nc_peak_sc
%read data as a table
f_nc_peak_tbl = readtable('f_ncpeak.xls');
%data to matrix
f_nc_peak=f_nc_peak_tbl{:,:};
%-----------------------------------------------------------------------------
%-----------------------------------------------------------------------------
clear f_nc_150  f_nc_150_tbl f_nc_150_sc
%read data as a table
f_nc_150_tbl = readtable('f_nc150.xls');
%data to matrix
f_nc_150=f_nc_150_tbl{:,:};
%-----------------------------------------------------------------------------
%-----------------------------------------------------------------------------
clear f_nc_175  f_nc_175_tbl f_nc_175_sc
%read data as a table
f_nc_175_tbl = readtable('f_nc175.xls');
%data to matrix
f_nc_175=f_nc_175_tbl{:,:};
%-----------------------------------------------------------------------------
%-----------------------------------------------------------------------------
clear f_nc_200  f_nc_200_tbl f_nc_200_sc
%read data as a table
f_nc_200_tbl = readtable('f_nc200.xls');
%data to matrix
f_nc_200=f_nc_200_tbl{:,:};
%-----------------------------------------------------------------------------
%--------------------------------------------------------------------------
%//plot the distributions
%--------------------------------------------------------------------------

xbins=50; 
xmin=-0.2; xmax=0.6;

figure(10); hold on; %plot it on a different fig
subplot(1,2,1); hold on;

clear input
input=f_nc_peak ;
a=histogram(input,xbins,'Normalization','pdf', 'EdgeColor',color{7},'FaceColor',color{7},'DisplayName','f_{nc}* at peak warming')
xlabel('Forcing ratio f_{nc}*'); ylabel('Density');
xlim([xmin,xmax]); hold on; box on;

clear input
input=f_nc_zero;
a=histogram(input,xbins,'Normalization','pdf', 'EdgeColor',color{5},'FaceColor',color{5},'DisplayName','f_{nc}* at net-zero')
xlabel('Forcing ratio f_{nc}*'); ylabel('Density');
xlim([xmin,xmax]); hold on; box on;

figure(10); hold on; %plot it on a different fig
subplot(1,2,2); hold on;

clear input
input=f_nc_2019_10yr;
a=histogram(input,xbins*1.5,'Normalization','pdf', 'EdgeColor',color{14},'FaceColor',color{14},'DisplayName','f_{nc} in 2019')
xlabel('Forcing ratio f_{nc} in 2019'); ylabel('Density');
xlim([xmin,xmax]); hold on; box on;

clear input
input=f_nc_150;
a=histogram(input,xbins,'Normalization','pdf', 'EdgeColor',color{12},'FaceColor',color{12},'DisplayName','f_{nc}* at  1.50 \circ C')
xlabel('Forcing ratio f_{nc}'); ylabel('Density');
xlim([xmin,xmax]); hold on; box on;


clear input
input=f_nc_175;
a=histogram(input,xbins,'Normalization','pdf', 'EdgeColor',color{10},'FaceColor',color{10},'DisplayName','f_{nc}* at  1.75 \circ C')
xlabel('Forcing ratio f_{nc}'); ylabel('Density');
xlim([xmin,xmax]); hold on; box on;


clear input
input=f_nc_200;
a=histogram(input,xbins,'Normalization','pdf', 'EdgeColor',color{7},'FaceColor',color{7},'DisplayName','f_{nc}* at 2.0 \circ C')
xlabel('Forcing ratio f_{nc}'); ylabel('Density');
xlim([xmin,xmax]); hold on; box on;

%--------------------------------------------------------------------------
