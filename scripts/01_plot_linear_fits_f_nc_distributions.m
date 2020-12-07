
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
f_nc_2019_10yr_m1=f_nc_2019_10yr(:,1:end-1);

f_nc_2019_10yr_adj=f_nc_2019_10yr(1:end-1,1:end-1);
%--------------------------------------------------------------------------
%// ignoring NaN data, fit is done using cftool, but could also be done
%using polyfit

figure(1); hold on;
subplot(2,2,1); hold on
clear x y fit
x=f_nc_2019_10yr;
y=f_nc_150;
x=x(:); y=y(:); %turn matrix into a column vector
fit= 0.647*x+ 0.07617 ;
plot(x,y,'Color',color{14},'Marker','o','MarkerFaceColor','w', 'LineStyle', 'none'); hold on;
plot(x,fit,'Color','k','LineWidth',2); hold on;
xlabel('f_{nc}'); ylabel('f_{nc}* at 1.5 \circ C');box on;


figure(1); hold on;
subplot(2,2,2); hold on
clear x y fit
x=f_nc_2019_10yr_adj;
y=f_nc_zero;
x=x(:); y=y(:); %turn matrix into a column vector
fit=0.3541*x+ 0.09893;
plot(x,y,'Color',color{4},'Marker','o','MarkerFaceColor','w', 'LineStyle', 'none'); hold on;
plot(x,fit,'Color','r','LineWidth',2); hold on;
xlabel('f_{nc}'); ylabel('f_{nc}* at net zero (all temperatures)'); box on;

% figure(1); hold on;
% subplot(2,2,3); hold on
% clear x y fit
% x=f_nc_2019_10yr_m1;
% y=f_nc_zero;
% x=x(:); y=y(:); %turn matrix into a column vector
% fit=0.3221 *x+ 0.1135;
% plot(x,y,'Color',color{4},'Marker','o','MarkerFaceColor','w', 'LineStyle', 'none'); hold on;
% plot(x,fit,'Color','r','LineWidth',2); hold on;
% xlabel('f_{nc}'); ylabel('f_{nc}* at net zero (all temperatures)'); box on;
% 
% clear x1 y1 fit
% x1=f_nc_2019_10yr;
% y1=f_nc_150;
% x1=x1(:); y1=y1(:); %turn matrix into a column vector
% fit1=0.5217*x1+ 0.104;
% plot(x1,y1,'Color',color{14},'Marker','o','MarkerFaceColor','w', 'LineStyle', 'none'); hold on;
% plot(x1,fit1,'Color','k','LineWidth',2); hold on;
% xlabel('f_{nc}'); ylabel('f_{nc}* at 1.5 \circ C');box on;
% 
% plot(x,fit,'Color','r','LineWidth',2); hold on;
% 
% figure(1); hold on;
% subplot(2,2,4); hold on
% clear x1 y1 fit
% x1=f_nc_2019_10yr_m1;
% y1=f_nc_peak;
% x1=x1(:); y1=y1(:); %turn matrix into a column vector
% fit1=0.3555*x1+ 0.1236;
% plot(x1,y1,'Color',color{1},'Marker','o','MarkerFaceColor','w', 'LineStyle', 'none'); hold on;
% plot(x1,fit1,'Color','g','LineWidth',2); hold on;
% xlabel('f_{nc}'); ylabel('f_{nc}* at peak warming');box on;

%--------------------------------------------------------------------------
