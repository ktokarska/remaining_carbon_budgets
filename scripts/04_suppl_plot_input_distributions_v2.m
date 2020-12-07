ymax=6000;
% ymax=mc_samples/50;
ymax=5;
%--------------------------------------------------------------------------
figure(1); hold on;
subplot(2,2,1); hold on;
histogram(f_val_samples_shuffled_2s,nbins,'EdgeColor',color{11},'FaceColor',color{11}); hold on; 
histogram(f_val_samples_shuffled_1s,nbins,'EdgeColor',color{8},'FaceColor',color{8}); hold on; 
histogram(f_val_samples_shuffled,nbins,'EdgeColor',color{5},'FaceColor',color{5}); hold on; 
box on; ylabel('Density');
xlabel('f_{nc}');
yticks(0:0); hold on;
% [median_val, range_likely, range_90per] = ranges_calc(f_val_samples_shuffled)
% text(median_val,ymax,num2str(median_val));
% text(range_90per(1),ymax,num2str(range_90per(1)));
% text(range_90per(2),ymax,num2str(range_90per(2)));

% line([median_val,median_val],[0,ymax],'color','k','LineStyle','- -'); hold on;
% line([range_90per(1),range_90per(1)],[0,ymax],'color','k','LineStyle',':'); hold on;
% line([range_90per(2),range_90per(2)],[0,ymax],'color','k','LineStyle',':'); hold on;
% ylim([0,ymax]);

%--------------------------------------------------------------------------
figure(1); hold on;
subplot(2,2,2); hold on;
histogram(CE_val_samples_shuffled_2s,nbins,'EdgeColor',color{11},'FaceColor',color{11}); hold on; 
%histogram(CE_val_samples_shuffled_1s,nbins,'EdgeColor',color{8},'FaceColor',color{8}); hold on; 
histogram(CE_val_samples_shuffled,nbins,'EdgeColor',color{8},'FaceColor',color{5}); hold on; 
box on; ylabel('Density');
xlabel('Cumulative emissions E [PgC]');

[median_val, range_likely, range_90per] = ranges_calc(CE_val_samples_shuffled)
% text(median_val,ymax,num2str(median_val));
% text(range_90per(1),ymax,num2str(range_90per(1)));
% text(range_90per(2),ymax,num2str(range_90per(2)));

% line([median_val,median_val],[0,ymax],'color','k','LineStyle','- -'); hold on;
% line([range_90per(1),range_90per(1)],[0,ymax],'color','k','LineStyle',':'); hold on;
% line([range_90per(2),range_90per(2)],[0,ymax],'color','k','LineStyle',':'); hold on;
% ylim([0,ymax*10^(-3)]);
yticks(0:0); hold on;
%--------------------------------------------------------------------------
figure(1); hold on;
subplot(2,2,3); hold on;
histogram(t_val_samples_shuffled_2s,nbins,'EdgeColor',color{11},'FaceColor',color{11}); hold on; 
histogram(t_val_samples_shuffled_1s,nbins,'EdgeColor',color{8},'FaceColor',color{8}); hold on; 
histogram(t_val_samples_shuffled_all,nbins,'EdgeColor',color{5},'FaceColor',color{5}); hold on; 
box on; ylabel('Density');
xlabel('\Delta T_{anth} [\circ C]');

[median_val, range_likely, range_90per] = ranges_calc(t_val_samples_shuffled_all)
% text(median_val,ymax,num2str(median_val));
% text(range_90per(1),ymax,num2str(range_90per(1)));
% text(range_90per(2),ymax,num2str(range_90per(2)));

% line([median_val,median_val],[0,ymax],'color','k','LineStyle','- -'); hold on;
% line([range_90per(1),range_90per(1)],[0,ymax],'color','k','LineStyle',':'); hold on;
% line([range_90per(2),range_90per(2)],[0,ymax],'color','k','LineStyle',':'); hold on;
% ylim([0,ymax]);
yticks(0:0); hold on;
%--------------------------------------------------------------------------
figure(1); hold on;
subplot(2,2,4); hold on;
histogram(zec_val_samples_shuffled_03_2s,nbins,'EdgeColor',color{11},'FaceColor',color{11}); hold on; 
histogram(zec_val_samples_shuffled_03,nbins,'EdgeColor',color{8},'FaceColor',color{5}); hold on; 
%histogram(zec_val_samples_shuffled_01,nbins,'EdgeColor',color{8},'FaceColor',color{5}); hold on; 
box on; ylabel('Density');
xlabel('Zero emission committment (ZEC) [\circ C]');
yticks(0:0); hold on;
% [median_val, range_likely, range_90per] = ranges_calc(zec_val_samples_shuffled_03)
% text(median_val,ymax,num2str(median_val));
% text(range_90per(1),ymax,num2str(range_90per(1)));
% text(range_90per(2),ymax,num2str(range_90per(2)));
% 
% line([median_val,median_val],[0,ymax],'color','k','LineStyle','- -'); hold on;
% line([range_90per(1),range_90per(1)],[0,ymax],'color','k','LineStyle',':'); hold on;
% line([range_90per(2),range_90per(2)],[0,ymax],'color','k','LineStyle',':'); hold on;

% ylim([0,ymax]);
%--------------------------------------------------------------------------

figure(10); hold on;
subplot(1,2,1); hold on;
histogram(f_val_samples_shuffled,nbins,'EdgeColor',color{5},'FaceColor',color{5}); hold on; 
box on; ylabel('Density');
xlabel('f_{nc}');
yticks(0:0); hold on;

figure(10); hold on;
subplot(1,2,2); hold on;
histogram(t_val_samples_shuffled_all,nbins,'EdgeColor',color{5},'FaceColor',color{5}); hold on; 
box on; ylabel('Density');
xlabel('\Delta T_{anth} [\circ C]');
yticks(0:0); hold on;
