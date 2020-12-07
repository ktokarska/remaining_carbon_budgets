% %convert table to a matrix
% X = Tbl{:,:};
% %get scenario names
% a=Tbl.Properties.VariableNames
%--------------------------------------------------------------------------
% cd '/Users/ktokarska/Dropbox/kasia_uvic_2017_2018/Bayes_TCRE_calc/obs_tcre_more/budgets_uncertainty_code_updated_AR6_2020/data_f_nc_AR6/excel2'
cd   '/Users/ktokarska/Dropbox/kasia_uvic_2017_2018/Bayes_TCRE_calc/obs_tcre_more/budgets_uncertainty_code_updated_AR6_2020/data_f_nc_30yr_mean'

clear f_nc_zero f_nc_zero_tbl f_nc_zero_sc
%read data as a table
f_nc_zero_tbl = readtable('f_nczero.xls');
%data to matrix
f_nc_zero=f_nc_zero_tbl{:,:};
%scenario names
f_nc_zero_sc=f_nc_zero_tbl.Properties.VariableNames;


clear f_nc_2019_10yr_tbl f_nc_2019_10yr f_nc_2019_10yr_sc
f_nc_2019_10yr_tbl = readtable('f_nc2019.xls');
f_nc_2019_10yr=f_nc_2019_10yr_tbl{:,:};
f_nc_2019_10yr_sc=f_nc_2019_10yr_tbl.Properties.VariableNames;

cd ..
cd ..
%load scenario names and values
clear sc_names 
sc_names = readtable('Scenario selection - Sustainable_short.xls');

%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
%// making sure that the scenario names are in the same position 
%// both in Joeris table and and Chris input data

a=sc_names.Scenario;
b=f_nc_2019_10yr_sc(1:end-1); b=b';
%compare scenario names
cellfun(@isequal, a,b)

% cellfun(@isequal, a(1),b(1))
% index = find([a{:}] == b(1));
% index = find(strcmp(a, b(1)));
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
%// Plotting
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
%remove one more ensemble member from this to match sizes
f_nc_2019_10yr_adj=f_nc_2019_10yr(1:end-1,:);
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
%// get matrix of scenarios that are broadly consistent only, and calculate
%fit for that only
%--------------------------------------------------------------------------
clear x y x_in y_in fit color_in
x_in=f_nc_2019_10yr_adj;
y_in=f_nc_zero;
%--------------------------------------------------------------------------
%// Plotting: Broadly consistent with other societial and sustainability
%preferences
%--------------------------------------------------------------------------
color{20}=[43,140,190]/255;
color{21}=[8,81,156]/255;

color{22}=[251,106,74]/255;
color{23}=[165,15,21]/255;
%--------------------------------------------------------------------------
color{20}=[43,140,190]/255;
color{21}=[8,81,156]/255;

color{22}=[192,192,192]/255;
color{23}=[64,64,64]/255;

color{24}=[128, 0, 32]/255;
color{25}=[255, 148, 174]/255;

%--------------------------------------------------------------------------
figure(1); hold on;
subplot(2,3,2); hold on; 

clear color1
color1=sc_names.B;
color1=color1';

clear X Y x y fit
X=x_in(:,color1==1);
Y=y_in(:,color1==1);
plot(X,Y,'Color',color{20},'Marker','o','MarkerFaceColor','w', 'LineStyle', 'none'); hold on;
xlabel('f_{nc} Broadly consistent with other societial and sustainability preferences'); 
ylabel('f_{nc}* at net zero (all temperatures)'); box on;

x=X(:); y=Y(:); %turn matrix into a column vector
% fit= 0.2991*x+  0.09225;
fit= 0.2561*x+ 0.133;

plot(x,fit,'Color',color{21},'LineWidth',2); hold on;

% fitlm(x,y)

clear indices1 indices2 indices3
indices1 = find(isnan(x) == 1);
indices2 = find(isnan(y) == 1);
indices3=vertcat(indices1,indices2);
% remove NaN
x(indices3)=[];
y(indices3)=[];

% NOW (30 yr mean) Linear model Poly1:
%      f(x) = p1*x + p2
% Coefficients (with 95% confidence bounds):
%        p1 =      0.2561  (0.2504, 0.2619)
%        p2 =       0.133  (0.132, 0.1341)
% 
% Goodness of fit:
%   SSE: 11.95
%   R-square: 0.4565
%   Adjusted R-square: 0.4564
%   RMSE: 0.03623

% BEFORE (10 yr mean) Linear model Poly1:
%      f(x) = p1*x + p2
% Coefficients (with 95% confidence bounds):
%        p1 =      0.2991  (0.2921, 0.306)
%        p2 =     0.09225  (0.09083, 0.09367)
% 
% Goodness of fit:
%   SSE: 9.063
%   R-square: 0.4374
%   Adjusted R-square: 0.4373
%   RMSE: 0.03155

%--------------------------------------------------------------------------
%// Reminder
%--------------------------------------------------------------------------

clear X Y x y fit
X=x_in(:,color1==0);
Y=y_in(:,color1==0);
plot(X,Y,'Color',color{22},'Marker','o','MarkerFaceColor','w', 'LineStyle', 'none'); hold on;
xlabel('f_{nc}'); ylabel('f_{nc}* at net zero (all temperatures)'); box on;

x=X(:); y=Y(:); %turn matrix into a column vector
% fit=0.376*x+  0.1048;
fit=0.3144*x+  0.1412 ;
plot(x,fit,'Color',color{23},'LineWidth',2); hold on;

% fitlm(x,y)

clear indices1 indices2 indices3
indices1 = find(isnan(x) == 1);
indices2 = find(isnan(y) == 1);
indices3=vertcat(indices1,indices2);
% remove NaN
x(indices3)=[];
y(indices3)=[];


% NOW (30-yr mean) Linear model Poly1:
%      f(x) = p1*x + p2
% Coefficients (with 95% confidence bounds):
%        p1 =      0.3144  (0.3121, 0.3167)
%        p2 =      0.1412  (0.1408, 0.1416)
% 
% Goodness of fit:
%   SSE: 119.2
%   R-square: 0.5029
%   Adjusted R-square: 0.5029
%   RMSE: 0.04092

% BEFORE: (10-yr mean) Linear model Poly1:
%      f(x) = p1*x + p2
% Coefficients (with 95% confidence bounds):
%        p1 =       0.376  (0.3728, 0.3791)
%        p2 =      0.1048  (0.1041, 0.1054)
% 
% Goodness of fit:
%   SSE: 122
%   R-square: 0.432
%   Adjusted R-square: 0.432
%   RMSE: 0.04139

%--------------------------------------------------------------------------
%// add joined fit for both
%--------------------------------------------------------------------------
clear x y fit
x=f_nc_2019_10yr_adj;
y=f_nc_zero;
x=x(:); y=y(:); %turn matrix into a column vector
% fit=0.3669 *x+ 0.1028;
fit=0.3081 *x+ 0.14;
plot(x,fit,'Color','k','LineWidth',2, 'LineStyle','-'); hold on;

% fitlm(x,y)

clear indices1 indices2 indices3
indices1 = find(isnan(x) == 1);
indices2 = find(isnan(y) == 1);
indices3=vertcat(indices1,indices2);
% remove NaN
x(indices3)=[];
y(indices3)=[];
%--------------------------------------------------------------------------
% NOW: 30-yr mean Linear model Poly1:
%      f(x) = p1*x + p2
% Coefficients (with 95% confidence bounds):
%        p1 =      0.3081  (0.306, 0.3103)
%        p2 =        0.14  (0.1396, 0.1404)
% 
% Goodness of fit:
%   SSE: 134.3
%   R-square: 0.4949
%   Adjusted R-square: 0.4949
%   RMSE: 0.0407


% BEFORE: 10-yr mean Linear model Poly1:
%      f(x) = p1*x + p2
% Coefficients (with 95% confidence bounds):
%        p1 =      0.3669  (0.3639, 0.3699)
%        p2 =      0.1028  (0.1022, 0.1034)
% 
% Goodness of fit:
%   SSE: 139.9
%   R-square: 0.4166
%   Adjusted R-square: 0.4166
%   RMSE: 0.04154
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------

%// Plotting scenarios by color

figure(10); hold on; 

dot_names=f_nc_2019_10yr_sc(1:end-1)'; b=b';

for i=1:length(dot_names)
clear X Y 
X=x_in(:,i);
Y=y_in(:,i);
plot(X,Y,'Color',color{4},'Marker','o','MarkerFaceColor','w', 'LineStyle', 'none','DisplayName',cell2mat(dot_names(i))); hold on;
end

xlabel('f_{nc}'); 
ylabel('f_{nc}* at net zero (all temperatures)'); box on;
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
figure(10); hold on; 
dot_names=f_nc_2019_10yr_sc(1:end-1)'; b=b';
plt_num=1;

% a=181;
% b=181;
%--------------------------------------------------------------------------
%// Plot all scenarios for a quick comparison
%--------------------------------------------------------------------------
subplot(4,7,plt_num); hold on;

for i=1:length(dot_names)
clear X Y 
X=x_in(:,i);
Y=y_in(:,i);
plot(X,Y,'Color',color{22},'Marker','o','MarkerFaceColor','w', 'LineStyle', 'none','DisplayName',cell2mat(dot_names(i))); hold on;
end
%--------------------------------------------------------------------------
for i=a:b
clear X Y 
X=x_in(:,i);
Y=y_in(:,i);
plot(X,Y,'Color',color{4},'Marker','o','MarkerFaceColor','w', 'LineStyle', 'none','DisplayName',cell2mat(dot_names(i))); hold on;
end

ylabel('f_{nc}*'); 
xlabel(strcat(cell2mat(dot_names(i))),'Interpreter', 'none'); box on;
plt_num=plt_num+1;
%--------------------------------------------------------------------------
