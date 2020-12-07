function [intercept, slope,fit,x_out,y,rmse] = fit_line(x,y)
%--------------------------------------------------------------------------
%check if input is a column vector
% if not, %turn matrix into a column vector
if isvector(x)==0
    x=x(:); 
end

if isvector(y)==0
    y=y(:); 
end
%--------------------------------------------------------------------------
%linear fits using ordinary least squares
%--------------------------------------------------------------------------
%// get positions of NaN and remove these positions in both x and y
clear indices1 indices2 indices3
indices1 = find(isnan(x) == 1);
indices2 = find(isnan(y) == 1);
indices3=vertcat(indices1,indices2);
% remove NaN
x(indices3)=[];
y(indices3)=[];

if isempty(x)==1 || isempty(y)==1
    intercept=NaN;
    slope=NaN;
    fit=NaN*x;
    rmse=NaN;
    x_out=NaN*x;
    no_data=1;
else
    %// fit a linear model Ordinary Least Squares 
    clear mdl
    mdl=fitlm(x,y, 'RobustOpts','ols'); %least square fit (using ordinary least squares)

    intercept=mdl.Coefficients.Estimate(1);
    slope=mdl.Coefficients.Estimate(2);
    rmse=mdl.RMSE;

    x_out=linspace(-0.7,0.7);
    %evaluate the model at x_out values
    fit=slope*x_out+ intercept;
    no_data=0; %data exists
end
%--------------------------------------------------------------------------

end
