%--------------------------------------------------------------------------
%// Direct Random sampling from the input distributions
%--------------------------------------------------------------------------
%// Calculates TCRE for given inputs, using 'direct_tcre_calc.m' function
%--------------------------------------------------------------------------
%  name_case{case_t,case_num}

case_name_tcre{1}='Main case'; %AWI 3 for T, empirical distributons
case_name_tcre{2}='No uncertainty in any parameters'; 

case_name_tcre{3}='No uncertainty in T_{anth}'; % (using median value only)
case_name_tcre{4}='Gaussian fit T_{anth}'; % (using median value only)
case_name_tcre{5}='2 std Gaussian fit T_{anth}'; % (using median value only)

case_name_tcre{6}='No uncertainty in E';
case_name_tcre{7}='Gaussian fit E';
case_name_tcre{8}='2 std Gaussian fit E';

case_name_tcre{9}='No uncertainty in f_{nc}';
case_name_tcre{10}='Gaussian fit f_{nc}';
case_name_tcre{11}='2 std Gaussian fit f_{nc}';

%// no longer needed
case_name_tcre{12}='low f_{nc}=0.10 (with no uncertainty in f_{nc})'; %//FYI mu 1s is mu_f_1s= 0.1857
case_name_tcre{13}='low f_{nc}=0.15 (with no uncertainty in f_{nc})'; %comes from SSP estimate
case_name_tcre{14}='high f_{nc}=0.20 (with no uncertainty in f_{nc})'; %//
case_name_tcre{15}='high f_{nc}=0.25 (with no uncertainty in f_{nc})'; %//
case_name_tcre{16}='high f_{nc}=0.35 (with no uncertainty in f_{nc})'; %comes from earlier Piers estimate

color_rb_tcre{13}=cell2mat(color_rb_tcre(12));
color_rb_tcre{14}=cell2mat(color_rb_tcre(12));
color_rb_tcre{15}=cell2mat(color_rb_tcre(12));
color_rb_tcre{16}=cell2mat(color_rb_tcre(12));
%--------------------------------------------------------------------------
%// Calculating TCRE distribution for different cases
%--------------------------------------------------------------------------
clear TCRE_direct
case_range=1:length(case_name_tcre);

for case_num=case_range

clear CE_val_samples_shuffled_in t_val_samples_shuffled_in f_val_samples_shuffled_in
      
        %'Main case'; %AWI 3; uses empirical distributions
        if case_num==1
            t_val_samples_shuffled_in=t_val_samples_shuffled_all;
            CE_val_samples_shuffled_in=CE_val_samples_shuffled;
            f_val_samples_shuffled_in=f_val_samples_shuffled;
        end
        
        %'No uncertainties'; % using median values only
        %vectors of the same length, using constant values
        if case_num==2
            t_val_samples_shuffled_in=t_val_samples_shuffled_all*0+median(t_val_samples_shuffled_all);
            CE_val_samples_shuffled_in=CE_val_samples_shuffled*0+median(CE_val_samples_shuffled);
            f_val_samples_shuffled_in=f_val_samples_shuffled*0+median(f_val_samples_shuffled);
        end
        
        %// no uncertainty in T  (using median value)
        if case_num==3
            t_val_samples_shuffled_in=t_val_samples_shuffled_all*0+median(t_val_samples_shuffled_all);
            CE_val_samples_shuffled_in=CE_val_samples_shuffled;
            f_val_samples_shuffled_in=f_val_samples_shuffled;

        end
        
        %// 1 sigma T  (Gaussian fit)
        if case_num==4
            t_val_samples_shuffled_in=t_val_samples_shuffled_1s;
            CE_val_samples_shuffled_in=CE_val_samples_shuffled;
            f_val_samples_shuffled_in=f_val_samples_shuffled;

        end
        
        %// 2 sigma T  (Gaussian fit with 2 standard deviations)
        if case_num==5
            t_val_samples_shuffled_in=t_val_samples_shuffled_2s;
            CE_val_samples_shuffled_in=CE_val_samples_shuffled;
            f_val_samples_shuffled_in=f_val_samples_shuffled;

        end
  
        
        %//no uncertainty in CE
        if case_num==6
            CE_val_samples_shuffled_in=CE_val_samples_shuffled*0+median(CE_val_samples_shuffled);
            f_val_samples_shuffled_in=f_val_samples_shuffled;
            t_val_samples_shuffled_in=t_val_samples_shuffled_all;
        end
        
        %//2 sigma CE (Gaussian fit with 1 stanard deviation)
        if case_num==7
            CE_val_samples_shuffled_in=CE_val_samples_shuffled_1s;
            f_val_samples_shuffled_in=f_val_samples_shuffled;
            t_val_samples_shuffled_in=t_val_samples_shuffled_all;
        end
        
        %//2 sigma CE (Gaussian fit with 2 stanard deviations)
        if case_num==8
            CE_val_samples_shuffled_in=CE_val_samples_shuffled_2s;
            f_val_samples_shuffled_in=f_val_samples_shuffled;
            t_val_samples_shuffled_in=t_val_samples_shuffled_all;
        end
        
       
       %// no uncertainty in f_nc
       if case_num==9
            %double sigma f_nc
            CE_val_samples_shuffled_in=CE_val_samples_shuffled;
            f_val_samples_shuffled_in=f_val_samples_shuffled*0+median(f_val_samples_shuffled);
            t_val_samples_shuffled_in=t_val_samples_shuffled_all;
       end
       
       %// 1 sigma in f_nc (Gaussian fit with 1 stanard deviation)
       if case_num==10
            %double sigma f_nc
            CE_val_samples_shuffled_in=CE_val_samples_shuffled;
            f_val_samples_shuffled_in=f_val_samples_shuffled_1s;
            t_val_samples_shuffled_in=t_val_samples_shuffled_all;
       end

       
      %// 2 sigma in f_nc (Gaussian fit with 2 stanard deviations)
       if case_num==11
            %double sigma f_nc
            CE_val_samples_shuffled_in=CE_val_samples_shuffled;
            f_val_samples_shuffled_in=f_val_samples_shuffled_2s;
            t_val_samples_shuffled_in=t_val_samples_shuffled_all;
       end
       
       %// lower f_{nc}=0.10 (with no uncertainty)
        if case_num==12
            t_val_samples_shuffled_in=t_val_samples_shuffled_all;
            CE_val_samples_shuffled_in=CE_val_samples_shuffled;
            f_val_samples_shuffled_in=f_val_samples_shuffled*0+0.10;
        end
        
        %// higher f_{nc} (with no uncertainty)
        if case_num==13
            t_val_samples_shuffled_in=t_val_samples_shuffled_all;
            CE_val_samples_shuffled_in=CE_val_samples_shuffled;
            f_val_samples_shuffled_in=f_val_samples_shuffled*0+0.15;
        end
        
        %// higher f_{nc} (with no uncertainty)
        if case_num==14
            t_val_samples_shuffled_in=t_val_samples_shuffled_all;
            CE_val_samples_shuffled_in=CE_val_samples_shuffled;
            f_val_samples_shuffled_in=f_val_samples_shuffled*0+0.20;
        end
        
        %// higher f_{nc} (with no uncertainty)
        if case_num==15
            t_val_samples_shuffled_in=t_val_samples_shuffled_all;
            CE_val_samples_shuffled_in=CE_val_samples_shuffled;
            f_val_samples_shuffled_in=f_val_samples_shuffled*0+0.25;
        end
        
       %// higher f_{nc} (with no uncertainty)
        if case_num==16
            t_val_samples_shuffled_in=t_val_samples_shuffled_all;
            CE_val_samples_shuffled_in=CE_val_samples_shuffled;
            f_val_samples_shuffled_in=f_val_samples_shuffled*0+0.35;
        end
        
%--------------------------------------------------------------------------        
%// calculate resulting TCRE distribution
clear TCRE_CO2_EgC
TCRE_CO2_EgC=direct_tcre_calc(CE_val_samples_shuffled_in,t_val_samples_shuffled_in,f_val_samples_shuffled_in);   
%--------------------------------------------------------------------------
%// saving output
TCRE_direct{case_num}=TCRE_CO2_EgC;
%--------------------------------------------------------------------------  
end %case_num

%--------------------------------------------------------------------------
%--------------------------------------------------------------------------


