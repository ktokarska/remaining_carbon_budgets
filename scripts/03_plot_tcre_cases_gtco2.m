%-------------------------------------------------------------------------- 
% Plotting main TCRE distribution and SR1.5
%-------------------------------------------------------------------------- 

case_range=1:length(case_name_tcre);

i=1; %needed to pick colors

for case_num=1:1
   
        xbins=250;
        clear input
        input=cell2mat(TCRE_direct(case_num));
        input=input*1000/3670; %per 1000 GtCO2
        
        figure(10); hold on; %plot it on a different fig
        a=histogram(input,xbins,'Normalization','pdf', 'EdgeColor',color{7-i},'FaceColor',color{7-i},'DisplayName',case_name_tcre{case_num})
        xlabel('TCRE_{CO_2} [\circC/1000 GtCO_2]'); ylabel('Density');
        xlim([-1,5]);
        %--------------------------------------------------------------------------
        %// fitting a line to the edge of the histogram

        [Nbox_s,edges_box_s] = histcounts(input,xbins, 'Normalization','pdf');
        edges_box_s = edges_box_s(2:end) - (edges_box_s(2)-edges_box_s(1))/2;

        figure(case_num); hold on;

        if case_num==1
            subplot(3,1,1); hold on;
        end
        
        plot(edges_box_s,Nbox_s,'Color', color{7-i},'LineWidth',2,'DisplayName',case_name_tcre{case_num}); hold on;        
    

        %//Adding SR1.5 TCRE_CO2 distribution, for comparison
        hold on;
        plot(x_sr_gtco2,pdf_sr_gtco2,'LineWidth',2,'Color',color{14},'DisplayName','SR1.5 TCRE Gaussian');hold on; %plots the distribution Gaussian
 

        %// draw a grey rectangle for implausible TCRE values <0
        ymax=max(Nbox_s)*1.2;
        xmin=abs(min(x_sr_gtco2));
        rectangle('Position',[-xmin 0 xmin ymax],'FaceColor',color{15},'EdgeColor','none'); hold on;
        
%         %--------------------------------------------------------------------------
%         %Add vertical lines for AR5 TCRE comparison
%         %--------------------------------------------------------------------------
%         line([likely_sr_gtco2(1),likely_sr_gtco2(1)],[0,ymax],'Color','k','LineStyle',':'); hold on;
%         line([likely_sr_gtco2(2),likely_sr_gtco2(2)],[0,ymax],'Color','k','LineStyle',':'); hold on;
%         line([median_val_sr_gtco2,median_val_sr_gtco2],[0,ymax],'Color','k','LineStyle','-'); hold on; box on;
     
%         line([mean(input),mean(input)],[0,ymax],'Color',color{7-i},'LineStyle','-','DisplayName',case_name_tcre{case_num});


%// set axis limits and labels
    xlim([-1*1000/3670,6*1000/3670]); hold on; box on;
    ylim([0,ymax]); hold on; box on;
    xlabel('TCRE [\circ C/1000 GtCO_2]'); ylabel('Density');
    
    i=i+1;

end
%------------------------------------------------------------------


%-------------------------------------------------------------------------- 
% Plotting BOX PLOTS of the resulting distributions
%-------------------------------------------------------------------------- 
 figure(1); hold on;
 subplot(3,1,2); hold on;
 y1=0;
%-------------------------------------------------------------------------- 
%// plotting TCRE ranges for differnet cases (box plots)
%-------------------------------------------------------------------------- 
i=1;
 for case_num=1:11
       
      clear input median_val likely range90
      input=cell2mat(TCRE_direct(case_num));      
      input=input*1000/3670; %per 1000 GtCO2
      
      %[mean_val, median_val, range_likely, range90,range_sigma] = ranges_calc_sigma(input);
      [median_val, likely, range90] = ranges_calc_rb(input);
      
       %plot box plots
       y1=y1+1;
       line(range90,[y1,y1],'Color', color_rb_tcre{i},'LineStyle','-','LineWidth',2, 'DisplayName',case_name_tcre{case_num}); hold on;
       line(likely,[y1,y1],'Color', color_rb_tcre{i},'LineStyle','-','LineWidth',7); hold on;
       line([median_val,median_val],[y1-0.1,y1+0.1],'Color', 'w','LineStyle','-','LineWidth',4); hold on; box on;
       
       if case_num==2 %no uncertainties
           line([median_val,median_val],[y1-0.1,y1+0.1],'Color', color_rb_tcre{i},'LineStyle','-','LineWidth',4); hold on; box on;
       end
              
       i=i+1;
      
 end
%-------------------------------------------------------------------------- 
%-------------------------------------------------------------------------- 
%// add SR1.5 range as the last box plot
%-------------------------------------------------------------------------- 
% y1=y1-1;
% line(range90_sr_gtco2,[y1,y1],'Color', color{14},'LineStyle','-','LineWidth',2, 'DisplayName','SR 1.5'); hold on;
% line(likely_sr_gtco2,[y1,y1],'Color', color{14},'LineStyle','-','LineWidth',7); hold on; %1 sigma and likely are the same
% line([median_val_sr_gtco2,median_val_sr_gtco2],[y1-0.1,y1+0.1],'Color', 'w','LineStyle','-','LineWidth',4); hold on; box on;
%-------------------------------------------------------------------------- 
xlabel('TCRE [\circ C/1000 GtCO_2]'); hold on;
yticks(1:12); hold on;
xlim([0.1,0.8]);
% %-------------------------------------------------------------------------- 
% %// add AR5 likely range
% %-------------------------------------------------------------------------- 
% x1=x1+1;
% % line(range90_sr,[x1,x1],'Color', color{14},'LineStyle','-','LineWidth',2, 'DisplayName','AR5'); hold on;
% line([0.8,2.5],[x1,x1],'Color', color{14},'LineStyle','-','LineWidth',7); hold on;
% % line([median_val_sr,median_val_sr],[x1-0.1,x1+0.1],'Color', 'w','LineStyle','-','LineWidth',4); hold on; box on;
%-------------------------------------------------------------------------- 

%-------------------------------------------------------------------------- 
%// add additional estimates (converted to �C per 1000 GtCO2)
%-------------------------------------------------------------------------- 
%// Add Millar et al box (for comparison)
%-------------------------------------------------------------------------- 
% best-estimate from the historical record of 1.84�C/TtC (1.43–2.37°C/TtC 5–95% uncertainty)
% https://royalsocietypublishing.org/doi/10.1098/rsta.2016.0449
% y1=y1-1;
% line([0.88*1000/3670,2.60*1000/3670],[y1,y1],'Color', 'k','LineStyle','-','LineWidth',2, 'DisplayName','Millar and Friedlinstein 2018'); hold on;
% % line(likely_sr,[x1,x1],'Color', color{14},'LineStyle','-','LineWidth',7); hold on;
% line([1.31*1000/3670,1.31*1000/3670],[y1-0.1,y1+0.1],'Color', 'w','LineStyle','-','LineWidth',4); hold on; box on;
%-------------------------------------------------------------------------- 
%-------------------------------------------------------------------------- 
%// Add other studies (for comparison)
%-------------------------------------------------------------------------- 
conv=1000/3670; %convert GtC to GtCO2 
clear all_y_ticks tick_lables

figure(1); hold on;
 subplot(3,1,3); hold on;
 
 y1=19;

y1=y1-1;
all_y_ticks(y1)=y1;
tick_lables{y1}={'Main case'};
%-------------------------------------------------------------------------- 
%// plotting Main case (box plots)
%-------------------------------------------------------------------------- 
i=1;
 for case_num=1:1
       
      clear input median_val likely range90
      input=cell2mat(TCRE_direct(case_num));      
      input=input*1000/3670; %per 1000 GtCO2
      
      %[mean_val, median_val, range_likely, range90,range_sigma] = ranges_calc_sigma(input);
      [median_val, likely, range90] = ranges_calc_rb(input);
      
       %plot box plots
       line(range90,[y1,y1],'Color', color_rb_tcre{i},'LineStyle','-','LineWidth',2, 'DisplayName',case_name_tcre{case_num}); hold on;
       line(likely,[y1,y1],'Color', color_rb_tcre{i},'LineStyle','-','LineWidth',7); hold on;
       line([median_val,median_val],[y1-0.1,y1+0.1],'Color', 'w','LineStyle','-','LineWidth',4); hold on; box on;
       
       if case_num==2 %no uncertainties
           line([median_val,median_val],[y1-0.1,y1+0.1],'Color', color_rb_tcre{i},'LineStyle','-','LineWidth',4); hold on; box on;
       end
      
 end

%-------------------------------------------------------------------------- 

y1=y1-1;
line([1.0*conv,2.7*conv],[y1,y1],'Color', 'k','LineStyle','-','LineWidth',2, 'DisplayName','Spafford and MacDougall, 2020'); hold on;
line([1.8*conv,1.8*conv],[y1-0.1,y1+0.1],'Color', 'w','LineStyle','-','LineWidth',4); hold on; box on;
line([1.9*conv,1.9*conv],[y1-0.1,y1+0.1],'Color', 'y','LineStyle','-','LineWidth',4); hold on; box on;
all_y_ticks(y1)=y1;
tick_lables{y1}={'Spafford and MacDougall, 2020'};


y1=y1-1;
line([1.1*conv,2.4*conv],[y1,y1],'Color', 'k','LineStyle','-','LineWidth',2, 'DisplayName','Katavouta et al. 2018 [63]'); hold on;
line([1.70*conv,1.70*conv],[y1-0.1,y1+0.1],'Color', 'w','LineStyle','-','LineWidth',4); hold on; box on;
line([1.80*conv,1.80*conv],[y1-0.1,y1+0.1],'Color', 'y','LineStyle','-','LineWidth',4); hold on; box on;
all_y_ticks(y1)=y1;
tick_lables{y1}={'Katavouta et al. 2018'};

y1=y1-1;
line([0.88*conv,2.60*conv],[y1,y1],'Color', 'k','LineStyle','-','LineWidth',2, 'DisplayName','Millar and Friedlingstein [26]'); hold on;
line([1.3*conv,1.3*conv],[y1-0.1,y1+0.1],'Color', 'y','LineStyle','-','LineWidth',4); hold on; box on;
all_y_ticks(y1)=y1;
tick_lables{y1}={'Millar and Friedlingstein, 2018'};


y1=y1-1;
line([0.96*conv,2.23*conv],[y1,y1],'Color', 'k','LineStyle','-','LineWidth',2, 'DisplayName','Smith et al. 2018 FaIR [61]'); hold on;
line([1.40*conv,1.40*conv],[y1-0.1,y1+0.1],'Color', 'w','LineStyle','-','LineWidth',4); hold on; box on;
all_y_ticks(y1)=y1;
tick_lables{y1}={'Smith et al. 2018'};

y1=y1-1;
line([0.88*conv,2.52*conv],[y1,y1],'Color', 'k','LineStyle','-','LineWidth',2, 'DisplayName','MacDougall et al. 2017 [31]'); hold on;
line([1.720*conv,1.720*conv],[y1-0.1,y1+0.1],'Color', 'y','LineStyle','-','LineWidth',4); hold on; box on;
all_y_ticks(y1)=y1;
tick_lables{y1}={'MacDougall et al. 2017'};

y1=y1-1;
line([1.0*conv,2.4*conv],[y1,y1],'Color', 'k','LineStyle','-','LineWidth',2, 'DisplayName','Millar et al [68]'); hold on;
line([1.5*conv,1.5*conv],[y1-0.1,y1+0.1],'Color', 'y','LineStyle','-','LineWidth',4); hold on; box on;
all_y_ticks(y1)=y1;
tick_lables{y1}={'Millar et al. 2017'};

y1=y1-1;
line([0.6*conv,1.6*conv],[y1,y1],'Color', 'k','LineStyle','-','LineWidth',2, 'DisplayName','Goodwin et al [44]'); hold on;
line([1.1*conv,1.1*conv],[y1-0.1,y1+0.1],'Color', 'y','LineStyle','-','LineWidth',4); hold on; box on;
all_y_ticks(y1)=y1;
tick_lables{y1}={'Goodwin et al. 2015'};

y1=y1-1;
line([1.1*conv,1.7*conv],[y1,y1],'Color', 'k','LineStyle','-','LineWidth',2, 'DisplayName','Tachiiri et al [80]'); hold on;
all_y_ticks(y1)=y1;
tick_lables{y1}={'Tachiiri et al. 2015'};

y1=y1-1;
line([1.9*conv,2.4*conv],[y1,y1],'Color', 'k','LineStyle','-','LineWidth',2, 'DisplayName','Friedlingstein et al. 2013 [37]'); hold on;
line([2.1*conv,2.1*conv],[y1-0.1,y1+0.1],'Color', 'w','LineStyle','-','LineWidth',4); hold on; box on;
all_y_ticks(y1)=y1;
tick_lables{y1}={'Friedlingstein et al. 2013'};

y1=y1-1;
line([0.7*conv,2.0*conv],[y1,y1],'Color', 'k','LineStyle','-','LineWidth',2, 'DisplayName','Gillett et al. 2013 Obs. const.'); hold on;
line([1.3*conv,1.3*conv],[y1-0.1,y1+0.1],'Color', 'y','LineStyle','-','LineWidth',4); hold on; box on;
all_y_ticks(y1)=y1;
tick_lables{y1}={'Gillett et al. 2013'};

% y1=y1+1
% line([0.8*conv,2.4*conv],[y1,y1],'Color', 'k','LineStyle','-','LineWidth',2, 'DisplayName','Gillett et al. 2013 CMIP5 raw'); hold on;

y1=y1-1;
line([1.4*conv,2.5*conv],[y1,y1],'Color', 'k','LineStyle','-','LineWidth',2, 'DisplayName','Zickfeld et al. [67]'); hold on;
line([1.9*conv,1.9*conv],[y1-0.1,y1+0.1],'Color', 'y','LineStyle','-','LineWidth',4); hold on; box on;
all_y_ticks(y1)=y1;
tick_lables{y1}={'Zickfeld et al. 2013'};

y1=y1-1;
line([1.0*conv,2.5*conv],[y1,y1],'Color', 'k','LineStyle','-','LineWidth',2, 'DisplayName','Matthews et al. [81]'); hold on;
line([1.8*conv,1.8*conv],[y1-0.1,y1+0.1],'Color', 'y','LineStyle','-','LineWidth',4); hold on; box on;
all_y_ticks(y1)=y1;
tick_lables{y1}={'Matthews et al. 2012'};

y1=y1-1;
line([1.0*conv,2.0*conv],[y1,y1],'Color', 'k','LineStyle','-','LineWidth',2, 'DisplayName','Rogelj et al. [82]'); hold on;
all_y_ticks(y1)=y1;
tick_lables{y1}={'Rogelj et al. 2012'};

y1=y1-1;
line([1.3*conv,1.52*conv],[y1,y1],'Color', 'k','LineStyle','-','LineWidth',2, 'DisplayName','Zickfeld et al. [22]'); hold on;
line([1.4*conv,1.4*conv],[y1-0.1,y1+0.1],'Color', 'y','LineStyle','-','LineWidth',4); hold on; box on;
all_y_ticks(y1)=y1;
tick_lables{y1}={'Zickfeld et al. 2012'};

y1=y1-1;
line([1.4*conv,2.5*conv],[y1,y1],'Color', 'k','LineStyle','-','LineWidth',2, 'DisplayName','Allen et al. [20]'); hold on;
line([1.9*conv,1.9*conv],[y1-0.1,y1+0.1],'Color', 'y','LineStyle','-','LineWidth',4); hold on; box on;
all_y_ticks(y1)=y1;
tick_lables{y1}={'Allen et al. 2009'};

y1=y1-1;
line([1.0*conv,2.0*conv],[y1,y1],'Color', 'k','LineStyle','-','LineWidth',2, 'DisplayName','Matthews et al. [16]'); hold on;
line([1.6*conv,1.6*conv],[y1-0.1,y1+0.1],'Color', 'y','LineStyle','-','LineWidth',4); hold on; box on;
all_y_ticks(y1)=y1;
tick_lables{y1}={'Matthews et al. 2009'};

y1=y1-1;
line([1.1*conv,2.7*conv],[y1,y1],'Color', 'k','LineStyle','-','LineWidth',2, 'DisplayName','Meinshausen et al. [84]'); hold on;
all_y_ticks(y1)=y1;
tick_lables{y1}={'Meinshausen et al. 2009'};

xlabel('TCRE [\circ C/1000 GtCO_2]'); hold on;

%--------------------------------------------------------------------------
%// make tick labels

a=tick_lables{1};
for i=2:18
b=tick_lables{i};
a=[a,b];
end

yticks(all_y_ticks); hold on;
yticklabels(a); hold on;
xlim([0.1,0.8]);

%-------------------------------------------------------------------------- 
%  %add dividing line
% line([x1+0.5,x1+0.5],[y0,y2],'Color', 'k','LineStyle',':','LineWidth',1 ); hold on;
% x1=x1+1;
%-------------------------------------------------------------------------- 
%-------------------------------------------------------------------------- 
