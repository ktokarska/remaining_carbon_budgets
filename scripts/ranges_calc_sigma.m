function [mean_val, median_val, range_likely, range_90per,range_sigma] = ranges_calc_sigma(derived_val)

%--------------------------------------------------------------------------
%// Calculate percentiles of the derived distributions

% Input: 
% derived_val: 		Distribution 

% Output: 
% mean_val: 		Mean of the distribution
% median_val:       Median of the distribution
% range_likely:     Likely range (note differnt defintions; comment out as needed) 
% range_90per:       5-95% range (i.e., the 90th percentile) 
%--------------------------------------------------------------------------

% range_likely = quantile(derived_val,[0.33  0.67]);  % -- IPCC likely range carbon budgets

range_likely = quantile(derived_val,[0.17  0.83]);  % -- IPCC likely range used for ECS(66%) 
range_90per  = quantile(derived_val,[0.05  0.95]);  % -- 90% range (5-95%)
range_95per  = quantile(derived_val,[0.025 0.975]); % -- 95% range 
mean_val     = nanmean(derived_val);
median_val   = nanmedian(derived_val);

range_sigma = quantile(derived_val,[0.16  0.84]);  % --  %1 sigma range defined as 16 - 84 % 68% range;   

end

