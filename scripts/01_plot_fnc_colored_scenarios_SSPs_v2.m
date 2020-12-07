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
xlabel('f_{nc}'); ylabel('f_{nc}* at net zero (all temperatures)'); box on;
% 
x=X(:); y=Y(:); %turn matrix into a column vector
% % fit=0.375*x+  0.1046;
fit=0.3141*x+  0.1416;
plot(x,fit,'Color',color{23},'LineWidth',2); hold on;

% fitlm(x,y)

clear indices1 indices2 indices3
indices1 = find(isnan(x) == 1);
indices2 = find(isnan(y) == 1);
indices3=vertcat(indices1,indices2);
% remove NaN
x(indices3)=[];
y(indices3)=[];
% 
% Linear model Poly1:
%      f(x) = p1*x + p2
% Coefficients (with 95% confidence bounds):
%        p1 =      0.3141  (0.3119, 0.3164)
%        p2 =      0.1416  (0.1411, 0.142)
% 
% Goodness of fit:
%   SSE: 120.9
%   R-square: 0.5041
%   Adjusted R-square: 0.5041
%   RMSE: 0.04078
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------

clear X Y x y fit
X=x_in(:,color1==1);
Y=y_in(:,color1==1);
plot(X,Y,'Color',color{20},'Marker','o','MarkerFaceColor','w', 'LineStyle', 'none'); hold on;
xlabel('f_{nc}'); ylabel('f_{nc}* at net zero (all temperatures)'); box on;
xlabel('f_{nc} Sustainability (SSP1)'); 

x=X(:); y=Y(:); %turn matrix into a column vector
% % fit=  0.29*x+ 0.09139;
fit=  0.2469*x+  0.1282;
plot(x,fit,'Color',color{21},'LineWidth',2); hold on;

% fitlm(x,y)
clear indices1 indices2 indices3
indices1 = find(isnan(x) == 1);
indices2 = find(isnan(y) == 1);
indices3=vertcat(indices1,indices2);
% remove NaN
x(indices3)=[];
y(indices3)=[];

% Linear model Poly1:
%      f(x) = p1*x + p2
% Coefficients (with 95% confidence bounds):
%        p1 =      0.2469  (0.2409, 0.2528)
%        p2 =      0.1282  (0.1271, 0.1293)
% 
% Goodness of fit:
%   SSE: 8.791
%   R-square: 0.4686
%   Adjusted R-square: 0.4685
%   RMSE: 0.03405
%--------------------------------------------------------------------------
%// add joined fit for both
%--------------------------------------------------------------------------
clear x y fit
x=f_nc_2019_10yr_adj;
y=f_nc_zero;
x=x(:); y=y(:); %turn matrix into a column vector
fit=0.3081 *x+ 0.14; 
plot(x,fit,'Color','k','LineWidth',2, 'LineStyle','-'); hold on;
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
xlabel('f_{nc}'); ylabel('f_{nc}* at net zero (all temperatures)'); box on;

x=X(:); y=Y(:); %turn matrix into a column vector
% % fit=0.367*x+ 0.14028 ;
% fit=0.30851 *x+  0.1031;
% plot(x,fit,'Color',color{23},'LineWidth',2); hold on;
% 
% % fitlm(x,y)
% 
% clear indices1 indices2 indices3
% indices1 = find(isnan(x) == 1);
% indices2 = find(isnan(y) == 1);
% indices3=vertcat(indices1,indices2);
% % remove NaN
% x(indices3)=[];
% y(indices3)=[];

% Linear model Poly1:
%      f(x) = p1*x + p2
% Coefficients (with 95% confidence bounds):
%        p1 =       0.367  (0.3639, 0.37)
%        p2 =      0.1031  (0.1025, 0.1037)
% 
% Goodness of fit:
%   SSE: 135.9
%   R-square: 0.4165
%   Adjusted R-square: 0.4165
%   RMSE: 0.04154
%--------------------------------------------------------------------------
clear X Y x y fit
X=x_in(:,color1==1);
Y=y_in(:,color1==1);
plot(X,Y,'Color',color{25},'Marker','o','MarkerFaceColor','w', 'LineStyle', 'none'); hold on;
xlabel('f_{nc}'); ylabel('f_{nc}* at net zero (all temperatures)'); box on;
xlabel('High-pollution ineffective policy (SSP3)'); 

x=X(:); y=Y(:); %turn matrix into a column vector
% % fit=  0.3632*x+ 0.1175;
fit=  0.2685*x+ 0.1409;
plot(x,fit,'Color',color{24},'LineWidth',2); hold on;

% fitlm(x,y)

clear indices1 indices2 indices3
indices1 = find(isnan(x) == 1);
indices2 = find(isnan(y) == 1);
indices3=vertcat(indices1,indices2);
% remove NaN
x(indices3)=[];
y(indices3)=[];

% Linear model Poly1:
%      f(x) = p1*x + p2
% Coefficients (with 95% confidence bounds):
%        p1 =      0.2685  (0.2579, 0.279)
%        p2 =      0.1409  (0.1389, 0.1428)
% 
% Goodness of fit:
%   SSE: 1.137
%   R-square: 0.6234
%   Adjusted R-square: 0.6231
%   RMSE: 0.02746
%--------------------------------------------------------------------------
%// add joined fit for both
%--------------------------------------------------------------------------
clear x y fit
x=f_nc_2019_10yr_adj;
y=f_nc_zero;
x=x(:); y=y(:); %turn matrix into a column vector
fit=0.3081 *x+ 0.14; 
plot(x,fit,'Color','k','LineWidth',2, 'LineStyle','-'); hold on;
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------

%--------------------------------------------------------------------------
%// Plotting: E Middle od the road (SSP2)
%--------------------------------------------------------------------------
figure(1); hold on;
subplot(2,3,4); hold on; 

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
xlabel('f_{nc}'); ylabel('f_{nc}* at net zero (all temperatures)'); box on;

% x=X(:); y=Y(:); %turn matrix into a column vector
% fit=0.3085 *x+ 0.1403;
% plot(x,fit,'Color',color{23},'LineWidth',2); hold on;
% 
% % fitlm(x,y)
% 
% clear indices1 indices2 indices3
% indices1 = find(isnan(x) == 1);
% indices2 = find(isnan(y) == 1);
% indices3=vertcat(indices1,indices2);
% % remove NaN
% x(indices3)=[];
% y(indices3)=[];

% Linear model Poly1:
%      f(x) = p1*x + p2
% Coefficients (with 95% confidence bounds):
%        p1 =      0.3085  (0.3062, 0.3108)
%        p2 =      0.1403  (0.1398, 0.1407)
% 
% Goodness of fit:
%   SSE: 127
%   R-square: 0.4849
%   Adjusted R-square: 0.4849
%   RMSE: 0.04158
%--------------------------------------------------------------------------
clear X Y x y fit
X=x_in(:,color1==1);
Y=y_in(:,color1==1);
plot(X,Y,'Color',color{20},'Marker','o','MarkerFaceColor','w', 'LineStyle', 'none'); hold on;
xlabel('f_{nc}'); ylabel('f_{nc}* at net zero (all temperatures)'); box on;
xlabel('Middle od the road (SSP2)'); 

x=X(:); y=Y(:); %turn matrix into a column vector
fit=  0.3392*x+ 0.1123;
plot(x,fit,'Color',color{21},'LineWidth',2); hold on;
% 
% % fitlm(x,y)

% 
% clear indices1 indices2 indices3
% indices1 = find(isnan(x) == 1);
% indices2 = find(isnan(y) == 1);
% indices3=vertcat(indices1,indices2);
% % remove NaN
% x(indices3)=[];
% y(indices3)=[];

% Linear model Poly1:
%      f(x) = p1*x + p2
% Coefficients (with 95% confidence bounds):
%        p1 =      0.3392  (0.3299, 0.3485)
%        p2 =      0.1123  (0.1104, 0.1141)
% 
% Goodness of fit:
%   SSE: 9.56
%   R-square: 0.4307
%   Adjusted R-square: 0.4306
%   RMSE: 0.03746
  
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
%// add joined fit for both
%--------------------------------------------------------------------------
clear x y fit
x=f_nc_2019_10yr_adj;
y=f_nc_zero;
x=x(:); y=y(:); %turn matrix into a column vector
fit=0.3081 *x+ 0.14; 
plot(x,fit,'Color','k','LineWidth',2, 'LineStyle','-'); hold on;
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------

%--------------------------------------------------------------------------
%// Plotting: F High fossil fuel and energy demand
%--------------------------------------------------------------------------
figure(1); hold on;
subplot(2,3,5); hold on; 

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
xlabel('f_{nc}'); ylabel('f_{nc}* at net zero (all temperatures)'); box on;
% 
% x=X(:); y=Y(:); %turn matrix into a column vector
% fit=0.3689 *x+ 0.102;
% plot(x,fit,'Color',color{23},'LineWidth',2); hold on;
% 
% % fitlm(x,y)
% 
% clear indices1 indices2 indices3
% indices1 = find(isnan(x) == 1);
% indices2 = find(isnan(y) == 1);
% indices3=vertcat(indices1,indices2);
% % remove NaN
% x(indices3)=[];
% y(indices3)=[];

% Linear model Poly1:
%      f(x) = p1*x + p2
% Coefficients (with 95% confidence bounds):
%        p1 =      0.3689  (0.3658, 0.3719)
%        p2 =       0.102  (0.1014, 0.1027)
% 
% Goodness of fit:
%   SSE: 132.7
%   R-square: 0.4201
%   Adjusted R-square: 0.4201
%   RMSE: 0.04143
%--------------------------------------------------------------------------
clear X Y x y fit
X=x_in(:,color1==1);
Y=y_in(:,color1==1);
plot(X,Y,'Color',color{25},'Marker','o','MarkerFaceColor','w', 'LineStyle', 'none'); hold on;
xlabel('f_{nc} High fossil fuel and energy demand (SSP5)'); ylabel('f_{nc}* at net zero (all temperatures)'); box on;

x=X(:); y=Y(:); %turn matrix into a column vector
fit=  0.3383*x+ 0.134;
plot(x,fit,'Color',color{24},'LineWidth',2); hold on;

% fitlm(x,y)

clear indices1 indices2 indices3
indices1 = find(isnan(x) == 1);
indices2 = find(isnan(y) == 1);
indices3=vertcat(indices1,indices2);
% remove NaN
x(indices3)=[];
y(indices3)=[];

% Linear model Poly1:
%      f(x) = p1*x + p2
% Coefficients (with 95% confidence bounds):
%        p1 =      0.3383  (0.3281, 0.3484)
%        p2 =       0.134  (0.132, 0.136)
% 
% Goodness of fit:
%   SSE: 2.32
%   R-square: 0.5851
%   Adjusted R-square: 0.5849
%   RMSE: 0.02776
  

%--------------------------------------------------------------------------
%// add joined fit for both
%--------------------------------------------------------------------------
clear x y fit
x=f_nc_2019_10yr_adj;
y=f_nc_zero;
x=x(:); y=y(:); %turn matrix into a column vector
fit=0.3081 *x+ 0.14; 
plot(x,fit,'Color','k','LineWidth',2, 'LineStyle','-'); hold on;
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------