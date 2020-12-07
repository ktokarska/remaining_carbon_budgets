%--------------------------------------------------------------------------
%plotting additional things
%--------------------------------------------------------------------------
%// get matrix of scenarios that are broadly consistent only, and calculate
%fit for that only
%--------------------------------------------------------------------------
clear x y x_in y_in fit color_in
x_in=f_nc_2019_10yr_adj;
y_in=f_nc_zero;
%--------------------------------------------------------------------------
%// Plotting: C Sustainability (SSP1)
%--------------------------------------------------------------------------
figure(1); hold on;
subplot(2,3,1); hold on; 

clear color1
color1=sc_names.C;
color1=color1';
%--------------------------------------------------------------------------
%// Reminder
%--------------------------------------------------------------------------
clear X Y x y fit
X=x_in(:,color1==0);
Y=y_in(:,color1==0);
plot(X,Y,'Color',color{22},'Marker','o','MarkerFaceColor','w', 'LineStyle', 'none'); hold on;
xlabel('f_{nc}'); ylabel('f_{nc}* at net zero'); box on; xlim([-0.601,0.601]); hold on;

% clear intercept slope fit x_out y_out rmse_out
% [intercept, slope,fit,x_out,y_out, rmse_out] = fit_line(X,Y);
% plot(x_out,fit,'Color',color{23},'LineWidth',2); hold on;
%--------------------------------------------------------------------------
% main dots
%--------------------------------------------------------------------------
clear X Y x y fit
X=x_in(:,color1==1);
Y=y_in(:,color1==1);
plot(X,Y,'Color',color{20},'Marker','o','MarkerFaceColor','w', 'LineStyle', 'none'); hold on;
xlabel('f_{nc}'); ylabel('f_{nc}* at net zero'); box on;
xlabel('f_{nc} Sustainability (SSP1)'); 

clear intercept slope fit x_out y_out rmse_out
[intercept, slope,fit,x_out,y_out, rmse_out] = fit_line(X,Y);
 
plot(x_out,fit,'Color',color{23},'LineWidth',2); hold on;

%--------------------------------------------------------------------------
%// add joined fit for both
%--------------------------------------------------------------------------
clear x y fit
x=f_nc_2019_10yr_adj;
y=f_nc_zero;
x=x(:); y=y(:); %turn matrix into a column vector
fit=0.3081 *x_out+ 0.14;  
plot(x_out,fit,'Color','k','LineWidth',2, 'LineStyle','--'); hold on;  xlim([-0.601,0.601]); hold on;
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------

%--------------------------------------------------------------------------
%// Broadly consistent with the sustainability
%--------------------------------------------------------------------------
figure(1); hold on;
subplot(2,3,4); hold on; 

clear color1
color1=sc_names.B;
color1=color1';
%--------------------------------------------------------------------------
%// Reminder
%--------------------------------------------------------------------------
clear X Y x y fit
X=x_in(:,color1==0);
Y=y_in(:,color1==0);
plot(X,Y,'Color',color{22},'Marker','o','MarkerFaceColor','w', 'LineStyle', 'none'); hold on;
xlabel('f_{nc}'); ylabel('f_{nc}* at net zero'); box on; xlim([-0.601,0.601]); hold on;

% clear intercept slope fit x_out y_out rmse_out
% [intercept, slope,fit,x_out,y_out, rmse_out] = fit_line(X,Y);
% plot(x_out,fit,'Color',color{23},'LineWidth',2); hold on;
%--------------------------------------------------------------------------
% main dots
%--------------------------------------------------------------------------
clear X Y x y fit
X=x_in(:,color1==1);
Y=y_in(:,color1==1);
plot(X,Y,'Color',color{20},'Marker','o','MarkerFaceColor','w', 'LineStyle', 'none'); hold on;
xlabel('f_{nc}'); ylabel('f_{nc}* at net zero'); box on;
xlabel({'f_{nc} Broadly consistent'; 'with other societial' ; 'and sustainability preferences'}); 

clear intercept slope fit x_out y_out rmse_out
[intercept, slope,fit,x_out,y_out, rmse_out] = fit_line(X,Y);
 
plot(x_out,fit,'Color',color{23},'LineWidth',2); hold on;

%--------------------------------------------------------------------------
%// add joined fit for both
%--------------------------------------------------------------------------
clear x y fit
x=f_nc_2019_10yr_adj;
y=f_nc_zero;
x=x(:); y=y(:); %turn matrix into a column vector
fit=0.3081 *x_out+ 0.14;  
plot(x_out,fit,'Color','k','LineWidth',2, 'LineStyle','--'); hold on;  xlim([-0.601,0.601]); hold on;
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------


%--------------------------------------------------------------------------
%// Plotting: D High-pollution ineffective policy (SSP3)
%--------------------------------------------------------------------------
figure(1); hold on;
subplot(2,3,3); hold on; 

clear color1
color1=sc_names.D;
color1=color1';
%--------------------------------------------------------------------------
%// Reminder
%--------------------------------------------------------------------------
clear X Y x y fit
X=x_in(:,color1==0);
Y=y_in(:,color1==0);
plot(X,Y,'Color',color{22},'Marker','o','MarkerFaceColor','w', 'LineStyle', 'none'); hold on;
xlabel('f_{nc}'); ylabel('f_{nc}* at net zero'); box on;

% clear intercept slope fit x_out y_out rmse_out
% [intercept, slope,fit,x_out,y_out, rmse_out] = fit_line(X,Y);
% plot(x_out,fit,'Color',color{23},'LineWidth',2); hold on;
%--------------------------------------------------------------------------
%// Main dots
%--------------------------------------------------------------------------
clear X Y x y fit
X=x_in(:,color1==1);
Y=y_in(:,color1==1);
plot(X,Y,'Color',color{25},'Marker','o','MarkerFaceColor','w', 'LineStyle', 'none'); hold on;
xlabel('f_{nc}'); ylabel('f_{nc}* at net zero'); box on;
xlabel('f_{nc} High-pollution ineffective policy (SSP3)'); 

clear intercept slope fit x_out y_out rmse_out
[intercept, slope,fit,x_out,y_out, rmse_out] = fit_line(X,Y);
plot(x_out,fit,'Color',color{25},'LineWidth',2); hold on;

%--------------------------------------------------------------------------
%// add joined fit for both
%--------------------------------------------------------------------------
clear x y fit
x=f_nc_2019_10yr_adj;
y=f_nc_zero;
x=x(:); y=y(:); %turn matrix into a column vector
fit=0.3081 *x_out+ 0.14;  
plot(x_out,fit,'Color','k','LineWidth',2, 'LineStyle','--'); hold on;  xlim([-0.601,0.601]); hold on;
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------

%--------------------------------------------------------------------------
%// Plotting: E Middle od the road (SSP2)
%--------------------------------------------------------------------------
figure(1); hold on;
subplot(2,3,2); hold on; 

clear color1
color1=sc_names.E;
color1=color1';

%--------------------------------------------------------------------------
%// Reminder
%--------------------------------------------------------------------------
clear X Y x y fit
X=x_in(:,color1==0);
Y=y_in(:,color1==0);
plot(X,Y,'Color',color{22},'Marker','o','MarkerFaceColor','w', 'LineStyle', 'none'); hold on;
xlabel('f_{nc}'); ylabel('f_{nc}* at net zero'); box on;

% clear intercept slope fit x_out y_out rmse_out
% [intercept, slope,fit,x_out,y_out, rmse_out] = fit_line(X,Y);
% plot(x_out,fit,'Color',color{23},'LineWidth',2); hold on;

%--------------------------------------------------------------------------
%// Main dots
%--------------------------------------------------------------------------
clear X Y x y fit
X=x_in(:,color1==1);
Y=y_in(:,color1==1);
plot(X,Y,'Color',color{26},'Marker','o','MarkerFaceColor','w', 'LineStyle', 'none'); hold on;
xlabel('f_{nc}'); ylabel('f_{nc}* at net zero'); box on;
xlabel('f_{nc} Middle od the road (SSP2)'); 

clear intercept slope fit x_out y_out rmse_out
[intercept, slope,fit,x_out,y_out, rmse_out] = fit_line(X,Y);
plot(x_out,fit,'Color',color{27},'LineWidth',2); hold on;

%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
%// add joined fit for both
%--------------------------------------------------------------------------
clear x y fit
x=f_nc_2019_10yr_adj;
y=f_nc_zero;
x=x(:); y=y(:); %turn matrix into a column vector
fit=0.3081 *x_out+ 0.14;  
plot(x_out,fit,'Color','k','LineWidth',2, 'LineStyle','--'); hold on;  xlim([-0.601,0.601]); hold on;
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------

%--------------------------------------------------------------------------
%// Plotting: F High fossil fuel and energy demand
%--------------------------------------------------------------------------
figure(1); hold on;
subplot(2,3,6); hold on; 

clear color1
color1=sc_names.F;
color1=color1';
%--------------------------------------------------------------------------
%// Reminder
%--------------------------------------------------------------------------
clear X Y x y fit
X=x_in(:,color1==0);
Y=y_in(:,color1==0);
plot(X,Y,'Color',color{22},'Marker','o','MarkerFaceColor','w', 'LineStyle', 'none'); hold on;
xlabel('f_{nc}'); ylabel('f_{nc}* at net zero'); box on;

% clear intercept slope fit x_out y_out rmse_out
% [intercept, slope,fit,x_out,y_out, rmse_out] = fit_line(X,Y);
% plot(x_out,fit,'Color',color{23},'LineWidth',2); hold on;

%--------------------------------------------------------------------------
%// Main dots
%--------------------------------------------------------------------------
clear X Y x y fit
X=x_in(:,color1==1);
Y=y_in(:,color1==1);
plot(X,Y,'Color',color{25},'Marker','o','MarkerFaceColor','w', 'LineStyle', 'none'); hold on;
xlabel('f_{nc} High fossil fuel and energy demand (SSP5)'); ylabel('f_{nc}* at net zero'); box on;

clear intercept slope fit x_out y_out rmse_out
[intercept, slope,fit,x_out,y_out, rmse_out] = fit_line(X,Y);
plot(x_out,fit,'Color',color{25},'LineWidth',2); hold on;

%--------------------------------------------------------------------------
%// add joined fit for both
%--------------------------------------------------------------------------
clear x y fit
x=f_nc_2019_10yr_adj;
y=f_nc_zero;
x=x(:); y=y(:); %turn matrix into a column vector
fit=0.3081 *x_out+ 0.14;  
plot(x_out,fit,'Color','k','LineWidth',2, 'LineStyle','--'); hold on; xlim([-0.601,0.601]); hold on;
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------