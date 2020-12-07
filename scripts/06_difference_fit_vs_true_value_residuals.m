%--------------------------------------------------------------------------
%// add joined fit for both %// MAIN CASE: FIT FOR ALL
%--------------------------------------------------------------------------
clear x y fit X Y
X=f_nc_2019_10yr_adj;
Y=f_nc_zero;

clear intercept_main slope_main fit x_out y_out
[intercept_main, slope_main,fit,x_out,y_out] = fit_line(X,Y);
 
plot(x_out,fit,'Color','k','LineWidth',2); hold on;

clear x_in y_in y_fit
x_in=X(:);
y_in=Y(:);
y_fit=slope_main*x_in+ intercept_main;

plot(X,Y,'Color',color{22},'Marker','o','MarkerFaceColor','w', 'LineStyle', 'none'); hold on;

plot(x_in,y_in,'Color',color{22},'Marker','o','MarkerFaceColor','w', 'LineStyle', 'none'); hold on;

plot(x_in,y_fit,'Color',color{20},'Marker','o','MarkerFaceColor','w', 'LineStyle', 'none'); hold on;

y_diff_main=y_in-y_fit;

plot(x_in,y_diff_main,'Color',color{20},'Marker','o','MarkerFaceColor','w', 'LineStyle', 'none'); hold on;

histogram(y_diff_main)

[median_val, likely, range90] = ranges_calc_rb(y_diff_main)


% median_val =  %should be zero
% 
%    9.6276e-04
% 
% 
% likely =
% 
%    -0.0173    0.0185
% 
% 
% range90 =
% 
%    -0.0692    0.0662


% So we could use offset of +/- 0.02 (as likely) and +/- 0.07 as the 5-95%?
%--------------------------------------------------------------------------
