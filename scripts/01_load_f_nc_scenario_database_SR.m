%// Load Chris data (based on the FaIR model, and SR1.5 scenarios)

cd 'data_f_nc/no_headers'

%// data files there (with no headers)
% 'f_nc150.csv'
% 'f_nc175.csv'
% 'f_nc200.csv'
% 'f_nc2019.csv'
% 'f_ncpeak.csv'
% 'f_nczero.csv'


%//fills in missing values as NaN
clear f_nc_zero f_nc_peak f_nc_2019 f_nc_200 f_nc_175 f_nc_150 
f_nc_zero_SR = readmatrix('f_nczero.csv');
f_nc_peak_SR = readmatrix('f_ncpeak.csv');
f_nc_2019_10yr_SR = readmatrix('f_nc2019_10yr.csv'); %f_nc for 2019, 10 yr mean
f_nc_2019_single_SR = readmatrix('f_nc2019.csv');
f_nc_200_SR = readmatrix('f_nc200.csv');
f_nc_175_SR = readmatrix('f_nc175.csv');
f_nc_150_SR = readmatrix('f_nc150.csv');

%--------------------------------------------------------------------------
%//plot the distributions
%--------------------------------------------------------------------------

xbins=50; 
xmin=-0.2; xmax=0.6;

figure(10); hold on; %plot it on a different fig
subplot(1,2,1); hold on;

clear input
input=f_nc_peak_SR ;
a=histogram(input,xbins,'Normalization','pdf', 'EdgeColor',color{7},'FaceColor',color{7},'DisplayName','f_{nc}* at peak warming')
xlabel('Forcing ratio f_{nc}*'); ylabel('Density');
xlim([xmin,xmax]); hold on; box on;

clear input
input=f_nc_zero_SR;
a=histogram(input,xbins,'Normalization','pdf', 'EdgeColor',color{5},'FaceColor',color{5},'DisplayName','f_{nc}* at net-zero')
xlabel('Forcing ratio f_{nc}*'); ylabel('Density');
xlim([xmin,xmax]); hold on; box on;

figure(10); hold on; %plot it on a different fig
subplot(1,2,2); hold on;

clear input
input=f_nc_2019_10yr_SR;
a=histogram(input,xbins*1.5,'Normalization','pdf', 'EdgeColor',color{14},'FaceColor',color{14},'DisplayName','f_{nc} in 2019')
xlabel('Forcing ratio f_{nc}'); ylabel('Density');
xlim([xmin,xmax]); hold on; box on;


clear input
input=f_nc_150_SR;
a=histogram(input,xbins,'Normalization','pdf', 'EdgeColor',color{12},'FaceColor',color{12},'DisplayName','f_{nc}* at  1.50 \circ C')
xlabel('Forcing ratio f_{nc}'); ylabel('Density');
xlim([xmin,xmax]); hold on; box on;


clear input
input=f_nc_175_SR;
a=histogram(input,xbins,'Normalization','pdf', 'EdgeColor',color{10},'FaceColor',color{10},'DisplayName','f_{nc}* at  1.75 \circ C')
xlabel('Forcing ratio f_{nc}'); ylabel('Density');
xlim([xmin,xmax]); hold on; box on;


clear input
input=f_nc_200_SR;
a=histogram(input,xbins,'Normalization','pdf', 'EdgeColor',color{7},'FaceColor',color{7},'DisplayName','f_{nc}* at 2.0 \circ C')
xlabel('Forcing ratio f_{nc}'); ylabel('Density');
xlim([xmin,xmax]); hold on; box on;

%--------------------------------------------------------------------------
