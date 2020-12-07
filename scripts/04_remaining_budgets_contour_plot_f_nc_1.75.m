%--------------------------------------------------------------------------
% making a contour plot of the median 1.5C remaining budget 
%--------------------------------------------------------------------------
% as a function of f_nc and f*_nc
% i.e. assume zero uncertainty in each, 
% and vary f_nc and f*_nc for a range of values
%--------------------------------------------------------------------------
%target temperature level
t_lim=1.75; 
%--------------------------------------------------------------------------
% Calculate the output for different cases
%--------------------------------------------------------------------------

f_nc_star_range=linspace(-0.6,0.6,25); %f_nc* values from -0.35 to 0.5, in steps of 0.05
f_nc_val_input_range=linspace(-0.6,0.6,25); %f_nc* values from -0.2 to 0.5, in steps of 0.05

clear X_val_f_nc_contour Y_val_f_nc_contour
X_val_f_nc_contour=f_nc_val_input_range;
Y_val_f_nc_contour=f_nc_star_range;
  
X_val_f_nc_contour=X_val_f_nc_contour';
Y_val_f_nc_contour=Y_val_f_nc_contour';

clear X_fnc_contour Y_fnc_contour Z_val_contour_75
[X_fnc_contour,Y_fnc_contour] = meshgrid(X_val_f_nc_contour,Y_val_f_nc_contour);

%--------------------------------------------------------------------------
%// calculates remaining budgets as a function of f_nc and f_nc*
%   output: Z_val (for plotting the contour plot)
%// using old method (i.e. no slope)
%--------------------------------------------------------------------------
%// this loop runs for about 10 minutes, or load Z_val from the sample
%workspace for plotting the contour below
%--------------------------------------------------------------------------

   for i=1:length(X_fnc_contour)       
       for j=1:length(X_fnc_contour)   
           
        clear f_nc_star f_nc_val_input
        f_nc_star=Y_fnc_contour(i,j);
        f_nc_val_input=X_fnc_contour(i,j);
 
        clear CE_val_samples_shuffled_input t_val_samples_shuffled_input f_val_samples_shuffled_input zec_val_samples_shuffled_input

        %regural case samples (no uncertainty in f_val samples)
        CE_val_samples_shuffled_input=CE_val_samples_shuffled;
        t_val_samples_shuffled_input=t_val_samples_shuffled_all; %single variance
        f_val_samples_shuffled_input=f_val_samples_shuffled.*0+f_nc_val_input;
        zec_val_samples_shuffled_input=zec_val_samples_shuffled_03; %use +/- 0.3 ZEC for 1.5C

        %--------------------------------------------------------------------------
        %// calculating the distributions using functions
        %--------------------------------------------------------------------------
        %// Using direct sampling
        clear RB_CO2_input input median_val

        RB_CO2_input = direct_rb_fnc(f_nc_star,t_lim,CE_val_samples_shuffled_input,t_val_samples_shuffled_input,f_val_samples_shuffled_input,zec_val_samples_shuffled_input);

        input=RB_CO2_input;    
        input=input*3.67; %from PgC to GtCO2

        [median_val, likely, range90] = ranges_calc_rb(input);

   
        Z_val_contour_75(i,j)=median_val;
%         Z_val_contour_likely_1(i,j)=likely(1);
%         Z_val_contour_likely_2(i,j)=likely(2);
%         Z_val_contour_90per1(i,j)=range90(1);
%         Z_val_contour_90per2(i,j)=range90(2);
        
       end
   end
      
%-----------------------------------------------------------------------
%// Plotting figure 3 bottom panel
%-----------------------------------------------------------------------
%-----------------------------------------------------------------------
%// plot histograms by the x and y axis
%-----------------------------------------------------------------------
clear xx_contour yy_contour
yy_contour=reshape(f_nc_zero,[],1);
xx_contour=reshape(f_nc_2019_10yr_adj,[],1);
scatterhist(xx_contour,yy_contour,'Color','w','Marker','o'); hold on;

%-----------------------------------------------------------------------
%// add the distributions ad grey points
%-----------------------------------------------------------------------
% x=f_nc_2019_10yr_m1;

x_cont=f_nc_2019_10yr_adj;
y_cont=f_nc_zero;

plot(x_cont,y_cont,'Color',color{14},'Marker','o','MarkerFaceColor','w', 'LineStyle', 'none'); hold on;

%-----------------------------------------------------------------------
%// plot conotour
%-----------------------------------------------------------------------
contour(X_fnc_contour,Y_fnc_contour,Z_val_contour_75,'LineWidth',2,'levels',500,'ShowText','on'); colormap(colors_contour2)
xlabel('f_{nc}'); ylabel('f_{nc}* (at net-zero emissions)'); box on;

%-----------------------------------------------------------------------
%// add linear fits +/- offset; values from 01_plot_linear_fits_f_nc_distributions
%-----------------------------------------------------------------------
% fit=0.3221.*x+ 0.1135;
% fit=0.3541*x_cont+ 0.09893;

%// joined fit for all - use that
% fit_cont=0.3669 *x+ 0.1028;

% fit2=0.3221.*x+ 0.1135+0.2;
% fit3=0.3221.*x+ 0.1135-0.2;

% fit2=0.3669 *x+ 0.1028+0.05;
% fit3=0.3669 *x+ 0.1028-0.05;

% x_out=linspace(-0.8,0.8);

fit_cont=0.3081 *x_out+ 0.14;  

fit1=0.3081 *x_out+ 0.14+0.05;  
fit2=0.3081 *x_out+ 0.14-0.05;  

fit11=0.3081 *x_out+ 0.14+0.1;  
fit12=0.3081 *x_out+ 0.14-0.1;  

plot(x_out,fit_cont,'Color','k','LineWidth',2); hold on;

plot(x_out,fit1,'Color','k','LineWidth',0.5,'LineStyle','- -'); hold on;
plot(x_out,fit2,'Color','k','LineWidth',0.5,'LineStyle','- -'); hold on;

plot(x_out,fit11,'Color','k','LineWidth',0.5,'LineStyle',':'); hold on;
plot(x_out,fit12,'Color','k','LineWidth',0.5,'LineStyle',':'); hold on;

%---------------------------------------------------------------------------
%// add a star of where we are now
a=0.14; %median value of f_nc
b=0.3081*a+0.14;
plot(a,b,'Marker','p','MarkerSize',12,'MarkerFaceColor','y','MarkerEdgeColor','k');hold on;
%---------------------------------------------------------------------------

% high emission scenarios
% fit=  0.3383*x+ 0.134;

% Linear fit to scenarios that are broadly consistent
% fit= 0.2991*x+  0.09225;

%-----------------------------------------------------------------------
%-----------------------------------------------------------------------


