%--------------------------------------------------------------------------
% making a contour plot of TCRE given any values of T and CE
%--------------------------------------------------------------------------
% i.e. assume zero uncertainty in T and CE
% and vary T and CE for a given putative range
% calculate resulting TCRE 
%--------------------------------------------------------------------------
%// colors for the conotour
colors_contour_ce=[103,0,31; 214,96,77; 146,197,222; 67,147,195; 33,102,172; 5,48,97];
colors_contour_ce=colors_contour_ce./255;
colors_contour_ce=flipud(colors_contour_ce);

%--------------------------------------------------------------------------
%target temperature level
t_lim=1.5; 
%--------------------------------------------------------------------------
% Calculate the output for different cases
%--------------------------------------------------------------------------
t_ant_range=linspace(0.8,1.8,50); % T values 
ce_range=linspace(300,1200,50); % cumulative emission values

X_val_ce=ce_range;
Y_val_ce=t_ant_range;
  
X_val_ce=X_val_ce';
Y_val_ce=Y_val_ce';

clear X_ce Y_ce Z_ce
[X_ce,Y_ce] = meshgrid(X_val_ce,Y_val_ce);

%--------------------------------------------------------------------------
%// calculate Z_ce that is used to plotting conotour plot
%--------------------------------------------------------------------------
%// this one takes several minutes to run 
%// if only plotting contour (below) use Z_ce from the sample workspace
%--------------------------------------------------------------------------
   for i=1:length(X_ce)       
       for j=1:length(X_ce)   
           
        clear f_nc_star f_nc_val_input
        t_val_input=Y_ce(i,j);
        ce_val_input=X_ce(i,j);
 
        clear CE_val_samples_shuffled_input t_val_samples_shuffled_input f_val_samples_shuffled_input zec_val_samples_shuffled_input

        %regural case samples (no uncertainty in f_val samples)
        CE_val_samples_shuffled_input=CE_val_samples_shuffled.*0+ce_val_input;
        t_val_samples_shuffled_input=t_val_samples_shuffled_all.*0+t_val_input;
        f_val_samples_shuffled_input=f_val_samples_shuffled;

        %--------------------------------------------------------------------------
        %// calculating the distributions using functions
        %--------------------------------------------------------------------------
        %// Using direct sampling
        
        clear input
        input=direct_tcre_calc(CE_val_samples_shuffled_input,t_val_samples_shuffled_input,f_val_samples_shuffled_input);   
        input=input*1000/3670; %per 1000 GtCO2
 
        [median_val, likely, range90] = ranges_calc_rb(input);

        %save median value
        Z_ce(i,j)=median_val;
 
       end
   end
   
%-----------------------------------------------------------------------
%// Plot the contour plot with histograms on sides
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
%// plot the histograms (of T and CE) around respective x and y axis
%--------------------------------------------------------------------------
clear xx yy
figure(1); hold on;
xx_ce=CE_val_samples_shuffled_1s;
yy_ce=t_val_samples_shuffled_all;
scatterhist(xx_ce,yy_ce,'Color','w','Marker','o'); hold on;
%--------------------------------------------------------------------------
%// plot the contour plot
%--------------------------------------------------------------------------
figure(1); hold on;
contour(X_ce,Y_ce,Z_ce,'levels',0.1,'LineWidth',2,'ShowText','on'); colormap(colors_contour_ce)
xlim([300,1200]);
ylabel('\Delta T_{anth}'); xlabel('Cumulative CO_2 emissions [GtCO_2]'); box on;
%--------------------------------------------------------------------------
%// use contourf(...) if you'd like a filled map, I prefer the lines
% contourf(X_ce,Y_ce,Z_ce,'levels',0.1,'ShowText','on'); colormap(colors_contour_ce)
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------

