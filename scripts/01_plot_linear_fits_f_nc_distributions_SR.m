
%// first use the 01_load_f_nc_scenario_database or the sample workspace
%// i.e. 
% cd 'data_f_nc/no_headers'
% %//fills in missing values as NaN
% clear f_nc_zero f_nc_peak f_nc_2019 f_nc_200 f_nc_175 f_nc_150 
% f_nc_zero = readmatrix('f_nczero.csv');
% f_nc_peak = readmatrix('f_ncpeak.csv');
% f_nc_2019_10yr = readmatrix('f_nc2019_10yr.csv'); %f_nc for 2019, 10 yr mean
% f_nc_2019_single = readmatrix('f_nc2019.csv');
% f_nc_200 = readmatrix('f_nc200.csv');
% f_nc_175 = readmatrix('f_nc175.csv');
% f_nc_150 = readmatrix('f_nc150.csv');

%--------------------------------------------------------------------------
% note that one row has to be removed for the data to match the net-zero
% output
f_nc_2019_10yr_m1_SR=f_nc_2019_10yr_SR(:,1:end-1);

%--------------------------------------------------------------------------
figure(1); hold on;
subplot(2,2,1); hold on
clear x y fit
x=f_nc_2019_10yr_SR;
y=f_nc_150_SR;
x=x(:); y=y(:); %turn matrix into a column vector
fit=0.5217*x+ 0.104;
plot(x,y,'Color',color{14},'Marker','o','MarkerFaceColor','w', 'LineStyle', 'none'); hold on;
plot(x,fit,'Color','k','LineWidth',2); hold on;
xlabel('f_{nc}'); ylabel('f_{nc}* at 1.5 \circ C');box on;


figure(1); hold on;
subplot(2,2,2); hold on
clear x y fit
x=f_nc_2019_10yr_m1_SR;
y=f_nc_zero_SR;
x=x(:); y=y(:); %turn matrix into a column vector
fit=0.3221 *x+ 0.1135;
plot(x,y,'Color',color{4},'Marker','o','MarkerFaceColor','w', 'LineStyle', 'none'); hold on;
plot(x,fit,'Color','r','LineWidth',2); hold on;
xlabel('f_{nc}'); ylabel('f_{nc}* at net zero (all temperatures)'); box on;

figure(1); hold on;
subplot(2,2,3); hold on
clear x y fit
x=f_nc_2019_10yr_m1_SR;
y=f_nc_zero_SR;
x=x(:); y=y(:); %turn matrix into a column vector
fit=0.3221 *x+ 0.1135;
plot(x,y,'Color',color{4},'Marker','o','MarkerFaceColor','w', 'LineStyle', 'none'); hold on;
plot(x,fit,'Color','r','LineWidth',2); hold on;
xlabel('f_{nc}'); ylabel('f_{nc}* at net zero (all temperatures)'); box on;

x1=f_nc_2019_10yr_SR;
y1=f_nc_150_SR;
x1=x1(:); y1=y1(:); %turn matrix into a column vector
fit1=0.5217*x1+ 0.104;
plot(x1,y1,'Color',color{14},'Marker','o','MarkerFaceColor','w', 'LineStyle', 'none'); hold on;
plot(x1,fit1,'Color','k','LineWidth',2); hold on;
xlabel('f_{nc}'); ylabel('f_{nc}* at 1.5 \circ C');box on;

plot(x,fit,'Color','r','LineWidth',2); hold on;

figure(1); hold on;
subplot(2,2,4); hold on

x1=f_nc_2019_10yr_m1_SR;
y1=f_nc_peak_SR;
fit1=0.3555*x1+ 0.1236;
plot(x1,y1,'Color',color{1},'Marker','o','MarkerFaceColor','w', 'LineStyle', 'none'); hold on;
plot(x1,fit1,'Color','g','LineWidth',2); hold on;
xlabel('f_{nc}'); ylabel('f_{nc}* at peak warming');box on;

%--------------------------------------------------------------------------
%// since the data is 2d, I first used the'cftool' (type it in the main console), and this is
%the linear fit it generated for differnt inputs
%--------------------------------------------------------------------------
%linear fit for f_150 vs present f_nc (x, y values as shown in each case)
% Linear model Poly1:
%      f(x) = p1*x + p2
% Coefficients (with 95% confidence bounds):
%        p1 =      0.5217  (0.52, 0.5234)
%        p2 =       0.104  (0.1036, 0.1044)
% 
% Goodness of fit:
%   SSE: 163.5
%   R-square: 0.7968
%   Adjusted R-square: 0.7968
%   RMSE: 0.04216
%--------------------------------------------------------------------------
%// using cftool
%linear fit for f_net zero
% Linear model Poly1:
%      f(x) = p1*x + p2
% Coefficients (with 95% confidence bounds):
%        p1 =      0.3221  (0.3194, 0.3248)
%        p2 =        (0.1128, 0.1141)
% 
% Goodness of fit:
%   SSE: 211
%   R-square: 0.449
%   Adjusted R-square: 0.449
%   RMSE: 0.05642  
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
% using cftool
% peak wamring
% Linear model Poly1:
%      f(x) = p1*x + p2
% Coefficients (with 95% confidence bounds):
%        p1 =      0.3555  (0.3532, 0.3578)
%        p2 =      0.1236  (0.123, 0.1242)
% 
% Goodness of fit:
%   SSE: 264.4
%--------------------------------------------------------------------------
