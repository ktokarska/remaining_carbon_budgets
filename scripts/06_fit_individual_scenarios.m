clear x y x_in y_in fit color_in x_input y_input
x_input=f_nc_2019_10yr_adj;
y_input=f_nc_zero;

% [184,243,25,109]
 clear y_diff_all y_in_all y_fit_all x_out_all

for i=1:256
    clear X Y x y fit
    X=x_input(:,i);
    Y=y_input(:,i);
    % plot(x_in,y_in,'Color',color{22},'Marker','o','MarkerFaceColor','w', 'LineStyle', 'none'); hold on;
    % xlabel('f_{nc}'); ylabel('f_{nc}* at net zero'); box on;
    % xlabel('f_{nc} Sustainability (SSP1)'); 

    clear intercept slope fit x_out y_out rmse_out
    [intercept, slope,fit,x_out,y_out, rmse_out] = fit_line(X,Y);

    %plot(x_out,fit,'Color',color{23},'LineWidth',2); hold on;

    slope_all(i)=slope;
    intercept_all(i)=intercept;
    rmse_all(i)=rmse_out;
    
    %// calculate difference between the fitted value and the true
    %predicted value for each scenario
    plot(x_out,fit,'Color','k','LineWidth',2); hold on;

    clear x_in_fit y_in_i y_fit_i
    x_in_fit=X(:);
    y_in_i=Y(:);
    y_fit_i=slope*x_in_fit+ intercept;

    plot(X,Y,'Color',color{22},'Marker','o','MarkerFaceColor','w', 'LineStyle', 'none'); hold on;
    plot(x_in_fit,y_in_i,'Color',color{22},'Marker','o','MarkerFaceColor','w', 'LineStyle', 'none'); hold on;
    plot(x_in_fit,y_fit_i,'Color',color{20},'Marker','o','MarkerFaceColor','w', 'LineStyle', 'none'); hold on;

    y_diff_i=y_in_i-y_fit_i;

    plot(x_in_fit,y_diff_i,'Color',color{20},'Marker','o','MarkerFaceColor','w', 'LineStyle', 'none'); hold on;

    histogram(y_diff_i)
    
    %// save it
    y_diff_all(:,i)=y_diff_i;
    y_in_all(:,i)=y_in_i;
    y_fit_all(:,i)=y_fit_i;
    %x_out_all(:,i)=x_out;
    
    if i==1
        y_diff_example=y_diff_i;
    end
    
% [median_val, likely, range90] = ranges_calc_rb(y_diff)  
end
%==========================================================================
histogram(y_diff_main); hold on;

histogram(y_diff_all); hold on;
histogram(y_diff_example); hold on;


histogram(y_diff_all,'Normalization','probability'); hold on;
histogram(y_diff_example,'Normalization','probability'); hold on;

histogram(intercept_all-0.14,'Normalization','probability')

%==========================================================================
[median_val, likely, range90] = ranges_calc_rb(y_diff_all(:))

[median_val, likely, range90] = ranges_calc_rb(y_diff_example(:))

xlabel('y minus y_{fit}')
ylabel('Density of samples')

% %// remove NaN
% clear indices1 y_diff_all_no_nan y_diff_all_no_nan_all
% 
% for i=1:256
% y_diff_all_no_nan=y_diff_all(:,i);
% indices1 = find(isnan(y_diff_all_no_nan) == 1);
% y_diff_all_no_nan(indices1)=[];
% 
% if  isempty(y_diff_all_no_nan)~=1 
%     y_diff_all_no_nan_all(:,i)=y_diff_all_no_nan;
% end
% 
% end
% 
% histogram(y_diff_all_no_nan(:,i));
% 
% histogram(y_diff_all(:,i));
% 
% clear input
% input=(y_diff_all(:,i);
% histfit(input)
% pd = fitdist(input,'Normal')


%==========================================================================
[median_val, likely, range90] = ranges_calc_rb(intercept_all2)

median_val = 0.1430;
likely = [0.1286, 0.1572]; %33 to 67th percentiles
range90 = [0.0894, 0.1857] %5-95% range

histogram(intercept_all)
histogram(intercept_all-0.14)

clear indices1 
indices1 = find(isnan(intercept_all) == 1);
% remove NaN
intercept_all2(indices1)=[];
