%--------------------------------------------------------------------------
% plot Figure 2 in the paper; Panel A
%--------------------------------------------------------------------------
%// Main case for 1.5C
t_lim_idx=1; %t_lim=1.5;
%RB_CO2_out{case_num,t_lim_idx}=RB_CO2_input;

plt_idx=0; 
i=1; %picks colors

for t_lim_idx=1:3
    
       case_num=1; %main case only
    
       xbins=250;
        
        clear input
        input=cell2mat(RB_CO2_out(case_num,t_lim_idx));
        
        input=input*3.67; %from PgC to GtCO2
          
        figure(10); hold on; %plot it on a different fig
        a=histogram(input,xbins,'Normalization','pdf', 'EdgeColor',color_target{i},'FaceColor',color_target{i},'DisplayName',case_name_rb{case_num})
        xlabel('Remaining budget [GtCO_2]'); ylabel('Density');
        xlim([xmin,4400]); hold on; box on;
        %--------------------------------------------------------------------------
        %// fitting a line to the edge of the histogram

        [Nbox_s,edges_box_s] = histcounts(input,xbins, 'Normalization','pdf');
        edges_box_s = edges_box_s(2:end) - (edges_box_s(2)-edges_box_s(1))/2;

        figure(case_num); hold on;

        if case_num==1
            subplot(1,2,1); hold on;
        end
    
figure(18); hold on;
subplot(3,2,t_lim_idx+plt_idx); hold on;
 
plot(edges_box_s,Nbox_s,'Color', color_target{i},'LineWidth',2,'DisplayName',case_name_rb{case_num}); hold on;        
    
%--------------------------------------------------------------------------
%//draw a grey rectangle for implausible remaining budget values <0
%--------------------------------------------------------------------------
ymax=max(Nbox_s)*1.2;
% xmin=abs(min(Nbox_s))*1.2;
xmin=-300*3.67;
rectangle('Position',[xmin 0 -xmin ymax],'FaceColor',color{15},'EdgeColor','none'); hold on;
        
% line([mean(input),mean(input)],[0,2],'Color',color_target{i},'LineStyle','-','DisplayName',case_name_rb{case_num});

%--------------------------------------------------------------------------
% Add SR1.5 lines, for comparison; Remaining 1.5C budget
%--------------------------------------------------------------------------
line([(580- 84.41) (580- 84.41)], [0 .003], 'Color','k','LineStyle','-', 'DisplayName','SR1.5 50%');
%worst case and best case scenario (adding up all the feedbacks to the
%median budget in Figure 2)
line([(580+250+200+200+250+20- 84.41) (580+250+200+200+250+20- 84.41)], [0 .003], 'Color','k','LineStyle',':', 'DisplayName','SR1.5 TCRE distribution uncertainty');
line([(580-250-400+100-250-20- 84.41) (580-250-400+100-250-20- 84.41)], [0 .003], 'Color','k','LineStyle',':', 'DisplayName','SR1.5 TCRE distribution uncertainty');
xlim([-100*3.67,1000*3.67]); box on
%--------------------------------------------------------------------------
        
    xlim([xmin,1200*3.67]); hold on; box on;
    ylim([0,ymax]); hold on; box on;
    xlabel('Remaining budget [GtCO_2]'); ylabel('Density');
    xlim([-1000,3500]);
    yticks(0:0); hold on;
    
    i=i+1; %picks color
    
    plt_idx=plt_idx+1;

end


%--------------------------------------------------------------------------
% plot Figure 2 in the paper; Panel B
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
% Plotting BOX PLOTS of the resulting distributions
%-------------------------------------------------------------------------- 

plt_idx=1;

for t_lim_idx=1:3

 figure(18); hold on;
 subplot(3,2,t_lim_idx+plt_idx); hold on;

x1=0;
%-------------------------------------------------------------------------- 
%// plotting remaining budget ranges for differnet cases (box plots)
%-------------------------------------------------------------------------- 
i=1;
% case_num from 1 to 18 are geophysical uncertainty
% for names of each case see 02_main_remaining_budgets.m 

 for case_num=1:13
     
      clear input median_val likely range90
      input=cell2mat(RB_CO2_out(case_num,t_lim_idx));
      
      input=input*3.67; %from PgC to GtCO2
      
      [median_val, likely, range90] = ranges_calc_rb(input);
      
       %plot box plots
       x1=x1+1;
       line(range90,[x1,x1],'Color', color_rb_sens{i},'LineStyle','-','LineWidth',2, 'DisplayName',case_name_rb{case_num}); hold on;
       line(likely,[x1,x1],'Color', color_rb_sens{i},'LineStyle','-','LineWidth',7); hold on;
       line([median_val,median_val],[x1-0.1,x1+0.1],'Color', 'w','LineStyle','-','LineWidth',4); hold on; box on;
       
       if case_num==2 %no uncertainties
           line([median_val,median_val],[x1-0.1,x1+0.1],'Color', color_rb_sens{i},'LineStyle','-','LineWidth',4); hold on; box on;
       end

       
       %// percent change of likely range from the median 
%        text(-1200,x1,num2str(round(((likely-median_val)/median_val*100),1)))
  
       i=i+1;
      
 end
 
%xlim([xmin,800*3.67]); hold on; box on;
xlabel('Remaining budget [GtCO_2]'); %ylabel('Density');
yticks(1:17); hold on;
%-------------------------------------------------------------------------- 
%-------------------------------------------------------------------------- 
%// add SR1.5 range as the last box plot
%-------------------------------------------------------------------------- 
%// SR 1.5 for 1.5C target
%-------------------------------------------------------------------------- 
if t_lim_idx==1
    
    xlim([-1000,3500]);
    
    offset2020=84.41; %reduced by 15 PgC (difference in CE 2018 - 2017 GCB)

    x1=x1+1;
    median_val_sr_rb=(580-offset2020); %reduced by 15 PgC (difference in CE 2018 - 2017 GCB)
    likely_sr_rb=[420-offset2020,840-offset2020]; 
    line(likely_sr_rb,[x1,x1],'Color', color{14},'LineStyle','-','LineWidth',7); hold on;
    line([median_val_sr_rb,median_val_sr_rb],[x1-0.1,x1+0.1],'Color', 'w','LineStyle','-','LineWidth',4); hold on; box on;

    x1=x1+1;

    %Geophysical uncertainty only
    %SR.15 case (minus feedbacks)
    line([(580-400+100-250-20-offset2020-100) (580+200+200+250+20-offset2020-100)], [x1 x1], 'Color',color{14},'LineStyle','-','LineWidth',7, 'DisplayName','SR1.5 geophysical uncertainty');

    % line(likely_sr_rb,[x1,x1],'Color', color{14},'LineStyle','-','LineWidth',7); hold on;
    % line([median_val_sr_rb,median_val_sr_rb],[x1-0.1,x1+0.1],'Color', 'w','LineStyle','-','LineWidth',4); hold on; box on;
end
%-------------------------------------------------------------------------- 
%-------------------------------------------------------------------------- 
%// SR 1.5 for 1.75C target
%-------------------------------------------------------------------------- 
if t_lim_idx==2
    
    xlim([-1000,4000]);
    
    offset2020=84.41; %reduced by 15 PgC (difference in CE 2018 - 2017 GCB)

    x1=x1+1;
    median_val_sr_rb=(1040-offset2020); %reduced by 15 PgC (difference in CE 2018 - 2017 GCB)
    likely_sr_rb=[800-offset2020,1440-offset2020]; 
    line(likely_sr_rb,[x1,x1],'Color', color{14},'LineStyle','-','LineWidth',7); hold on;
    line([median_val_sr_rb,median_val_sr_rb],[x1-0.1,x1+0.1],'Color', 'w','LineStyle','-','LineWidth',4); hold on; box on;

%     x1=x1+1;
% 
%     %Geophysical uncertainty only
%     %SR.15 case (minus feedbacks)
%     line([(580-400+100-250-20-offset2020-100) (580+200+200+250+20-offset2020-100)], [x1 x1], 'Color',color{14},'LineStyle','-','LineWidth',7, 'DisplayName','SR1.5 geophysical uncertainty');

    % line(likely_sr_rb,[x1,x1],'Color', color{14},'LineStyle','-','LineWidth',7); hold on;
    % line([median_val_sr_rb,median_val_sr_rb],[x1-0.1,x1+0.1],'Color', 'w','LineStyle','-','LineWidth',4); hold on; box on;
end
%-------------------------------------------------------------------------- 
%-------------------------------------------------------------------------- 
%// SR 1.5 for 2.0 C target
%-------------------------------------------------------------------------- 
if t_lim_idx==3
    
    xlim([-1000,4500]);
    
    offset2020=84.41; %reduced by 15 PgC (difference in CE 2018 - 2017 GCB)

    x1=x1+1;
    median_val_sr_rb=(1500-offset2020); %reduced by 15 PgC (difference in CE 2018 - 2017 GCB)
    likely_sr_rb=[1170-offset2020,2030-offset2020]; 
    line(likely_sr_rb,[x1,x1],'Color', color{14},'LineStyle','-','LineWidth',7); hold on;
    line([median_val_sr_rb,median_val_sr_rb],[x1-0.1,x1+0.1],'Color', 'w','LineStyle','-','LineWidth',4); hold on; box on;

%     x1=x1+1;

%     %Geophysical uncertainty only
%     %SR.15 case (minus feedbacks)
%     line([(580-400+100-250-20-offset2020-100) (580+200+200+250+20-offset2020-100)], [x1 x1], 'Color',color{14},'LineStyle','-','LineWidth',7, 'DisplayName','SR1.5 geophysical uncertainty');

    % line(likely_sr_rb,[x1,x1],'Color', color{14},'LineStyle','-','LineWidth',7); hold on;
    % line([median_val_sr_rb,median_val_sr_rb],[x1-0.1,x1+0.1],'Color', 'w','LineStyle','-','LineWidth',4); hold on; box on;
end
%-------------------------------------------------------------------------- 
%-------------------------------------------------------------------------- 
%-------------------------------------------------------------------------- 
%  %// add vertical zero line
line([0 0],[0 x1+1],'Color', 'k','LineStyle',':','LineWidth',1 ); hold on;
ylim([0, x1+1]);
%-------------------------------------------------------------------------- 
xlabel('Remaining budget [GtCO_2]'); hold on;
%xlim([-250*3.67,750*3.67]);

plt_idx=plt_idx+1;

end
%-------------------------------------------------------------------------- 
%// End of figure 2 
%--------------------------------------------------------------------------


%--------------------------------------------------------------------------
% plot Figure 3 in the paper; top panel
%--------------------------------------------------------------------------

%-------------------------------------------------------------------------- 
% Plotting BOX PLOTS of the resulting distributions
%-------------------------------------------------------------------------- 
%// socio-economic uncertainty
% case_name_rb{19}='high f_{nc}* (intercept + 0.05)';  
% case_name_rb{20}='low f_{nc}* (intercept -0.05)';  
% case_name_rb{21}='high f_{nc}* (intercept + 0.1)';  
% case_name_rb{22}='low f_{nc}* (intercept -0.1)';  
%// no longer needed
% case_name_rb{23}='high f_{nc}* (intercept + 0.2)';  
% case_name_rb{24}='low f_{nc}* (intercept -0.2)';  
%-------------------------------------------------------------------------- 
%// Plotting Fig 3a
%-------------------------------------------------------------------------- 
 figure(19); hold on;

 t_lim_idx=1; %1.5C target only
 x1=0;
%-------------------------------------------------------------------------- 
%// plotting remaining budget ranges for differnet cases (box plots)
%-------------------------------------------------------------------------- 
i=1; %for colors
%only plot the main case, and socio-economic uncertainty cases 16 and 17
 for case_num=[23,21,1,22,24]
     
      clear input median_val likely range90
      input=cell2mat(RB_CO2_out(case_num,t_lim_idx));
      input=input*3.67; %from PgC to GtCO2
      
      [median_val, likely, range90] = ranges_calc_rb(input);
      
       %plot box plots
       x1=x1+1;
       line(range90,[x1,x1],'Color', color_rb_sens{case_num},'LineStyle','-','LineWidth',2, 'DisplayName',case_name_rb{case_num}); hold on;
       line(likely,[x1,x1],'Color', color_rb_sens{case_num},'LineStyle','-','LineWidth',7); hold on;
       line([median_val,median_val],[x1-0.1,x1+0.1],'Color', 'w','LineStyle','-','LineWidth',4); hold on; box on;
       
       i=i+1;
      
 end
 
 
xlim([xmin,800*3.67]); hold on; box on;
xlabel('Remaining budget [GtCO_2]'); ylabel('Socio-economic uncertainty');

%-------------------------------------------------------------------------- 
%// add SR1.5 range as the last box plot
%-------------------------------------------------------------------------- 
offset2020=84.41; %reduced by 15 PgC (difference in CE 2018 - 2017 GCB)

x1=x1+1;
%high non-CO2
line([(580-400+100-250-20-offset2020-100-250) (580+200+200+250+20-offset2020-100-250)], [x1 x1], 'Color',color{14},'LineStyle','-','LineWidth',7, 'DisplayName','SR1.5 geophysical uncertainty high non-CO2');
hold on;
x1=x1+1;

%low non-CO2
line([(580-400+100-250-20-offset2020-100+250) (580+200+200+250+20-offset2020-100+250)], [x1 x1], 'Color',color{14},'LineStyle','-','LineWidth',7, 'DisplayName','SR1.5 geophysical uncertainty low non-CO2');
hold on;
x1=x1+1;

median_val_sr_rb=(580-offset2020); %reduced by 15 PgC (difference in CE 2018 - 2017 GCB)
likely_sr_rb=[420-offset2020,840-offset2020]; 
line(likely_sr_rb,[x1,x1],'Color', color{14},'LineStyle','-','LineWidth',7); hold on;
line([median_val_sr_rb,median_val_sr_rb],[x1-0.1,x1+0.1],'Color', 'w','LineStyle','-','LineWidth',4); hold on; box on;

x1=x1+1;

%Geophysical uncertainty only
%SR.15 case (minus feedbacks)
line([(580-400+100-250-20-offset2020-100) (580+200+200+250+20-offset2020-100)], [x1 x1], 'Color',color{14},'LineStyle','-','LineWidth',7, 'DisplayName','SR1.5 geophysical uncertainty');

% line(likely_sr_rb,[x1,x1],'Color', color{14},'LineStyle','-','LineWidth',7); hold on;
% line([median_val_sr_rb,median_val_sr_rb],[x1-0.1,x1+0.1],'Color', 'w','LineStyle','-','LineWidth',4); hold on; box on;

%-------------------------------------------------------------------------- 
%  %// add vertical zero line
line([0 0],[0 x1+1],'Color', 'k','LineStyle',':','LineWidth',1 ); hold on;
ylim([0, x1+1]);
%-------------------------------------------------------------------------- 
xlabel('Remaining budget [GtCO_2]'); hold on;
xlim([-250*3.67,750*3.67]);
%------------------------------------------------------------------------
%// end of figure 3 top box
%------------------------------------------------------------------------
 yticks(1:10); hold on;
xlim([-1000,3500]);
