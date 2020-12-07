clear median_tcre_case  likely1_tcre_case  likely2_tcre_case range90_1_tcre_case range90_2_tcre_case name_tcre_case
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
      
      median_tcre_case(case_num)=median_val;
      likely1_tcre_case(case_num)=likely(1);
      likely2_tcre_case(case_num)=likely(2);
      range90_1_tcre_case(case_num)=range90(1);
      range90_2_tcre_case(case_num)=range90(2);
      name_tcre_case{case_num}=case_name_tcre{case_num};
 end
%-------------------------------------------------------------------------- 
clear TableTCRE
TableTCRE = table(name_tcre_case',median_tcre_case',likely1_tcre_case', likely2_tcre_case',range90_1_tcre_case',range90_2_tcre_case');
clear median_tcre_case  likely1_tcre_case  likely2_tcre_case range90_1_tcre_case range90_2_tcre_case name_tcre_case
%------=-------------------------------------------------------------------- 
%-------------------------------------------------------------------------- 
clear median_tcre_case  likely1_tcre_case  likely2_tcre_case range90_1_tcre_case range90_2_tcre_case name_tcre_case
%-------------------------------------------------------------------------- 
%// plotting ranges of remaining budgets
%-------------------------------------------------------------------------- 
%// for 1.5 C
%-------------------------------------------------------------------------- 
t_lim_idx=1; %1.5C
 for case_num=1:13
     
      clear input median_val likely range90
      input=cell2mat(RB_CO2_out(case_num,t_lim_idx));
      
      input=input*3.67; %from PgC to GtCO2
      
      [median_val, likely, range90] = ranges_calc_rb(input);
      
      %[mean_val, median_val, range_likely, range90,range_sigma] = ranges_calc_sigma(input);
      [median_val, likely, range90] = ranges_calc_rb(input);
      
      median_tcre_case(case_num)=median_val;
      likely1_tcre_case(case_num)=likely(1);
      likely2_tcre_case(case_num)=likely(2);
      range90_1_tcre_case(case_num)=range90(1);
      range90_2_tcre_case(case_num)=range90(2);
      name_tcre_case{case_num}=case_name_rb{case_num};
       
 end
%-------------------------------------------------------------------------- 
clear Tablebudgets15
Tablebudgets15 = table(name_tcre_case',median_tcre_case',likely1_tcre_case', likely2_tcre_case',range90_1_tcre_case',range90_2_tcre_case');
clear median_tcre_case  likely1_tcre_case  likely2_tcre_case range90_1_tcre_case range90_2_tcre_case name_tcre_case
%-------------------------------------------------------------------------- 
%-------------------------------------------------------------------------- 
%// for 1.75 C
%-------------------------------------------------------------------------- 
t_lim_idx=2; %1.5C
 for case_num=1:13
     
      clear input median_val likely range90
      input=cell2mat(RB_CO2_out(case_num,t_lim_idx));
      
      input=input*3.67; %from PgC to GtCO2
      
      [median_val, likely, range90] = ranges_calc_rb(input);
      
      %[mean_val, median_val, range_likely, range90,range_sigma] = ranges_calc_sigma(input);
      [median_val, likely, range90] = ranges_calc_rb(input);
      
      median_tcre_case(case_num)=median_val;
      likely1_tcre_case(case_num)=likely(1);
      likely2_tcre_case(case_num)=likely(2);
      range90_1_tcre_case(case_num)=range90(1);
      range90_2_tcre_case(case_num)=range90(2);
      name_tcre_case{case_num}=case_name_rb{case_num};
       
 end
%-------------------------------------------------------------------------- 
clear Tablebudgets175
Tablebudgets175 = table(name_tcre_case',median_tcre_case',likely1_tcre_case', likely2_tcre_case',range90_1_tcre_case',range90_2_tcre_case');
clear median_tcre_case  likely1_tcre_case  likely2_tcre_case range90_1_tcre_case range90_2_tcre_case name_tcre_case
%-------------------------------------------------------------------------- 

 %-------------------------------------------------------------------------- 
%// for 2.0 C
%-------------------------------------------------------------------------- 
t_lim_idx=3; %1.5C
 for case_num=1:13
     
      clear input median_val likely range90
      input=cell2mat(RB_CO2_out(case_num,t_lim_idx));
      
      input=input*3.67; %from PgC to GtCO2
      
      [median_val, likely, range90] = ranges_calc_rb(input);
      
      %[mean_val, median_val, range_likely, range90,range_sigma] = ranges_calc_sigma(input);
      [median_val, likely, range90] = ranges_calc_rb(input);
      
      median_tcre_case(case_num)=median_val;
      likely1_tcre_case(case_num)=likely(1);
      likely2_tcre_case(case_num)=likely(2);
      range90_1_tcre_case(case_num)=range90(1);
      range90_2_tcre_case(case_num)=range90(2);
      name_tcre_case{case_num}=case_name_rb{case_num};
       
 end
%-------------------------------------------------------------------------- 
clear Tablebudgets20
Tablebudgets20 = table(name_tcre_case',median_tcre_case',likely1_tcre_case', likely2_tcre_case',range90_1_tcre_case',range90_2_tcre_case');
clear median_tcre_case  likely1_tcre_case  likely2_tcre_case range90_1_tcre_case range90_2_tcre_case name_tcre_case
%-------------------------------------------------------------------------- 
%// 1.5 budget socioeconomical human uncertainty
%--------------------------------------------------------------------------
 t_lim_idx=1; %1.5C target only
 x1=0;
%-------------------------------------------------------------------------- 
%// plotting remaining budget ranges for differnet cases (box plots)
%-------------------------------------------------------------------------- 
i=1; %for colors
%only plot the main case, and socio-economic uncertainty cases 16 and 17
 for case_num=[21,19,1,20,22]
     
      clear input median_val likely range90
      input=cell2mat(RB_CO2_out(case_num,t_lim_idx));
      input=input*3.67; %from PgC to GtCO2
      
      [median_val, likely, range90] = ranges_calc_rb(input);
      
      median_tcre_case(case_num)=median_val;
      likely1_tcre_case(case_num)=likely(1);
      likely2_tcre_case(case_num)=likely(2);
      range90_1_tcre_case(case_num)=range90(1);
      range90_2_tcre_case(case_num)=range90(2);
      name_tcre_case{case_num}=case_name_rb{case_num};
       
 end
%-------------------------------------------------------------------------- 
clear Tablebudgets15human
Tablebudgets15human = table(name_tcre_case',median_tcre_case',likely1_tcre_case', likely2_tcre_case',range90_1_tcre_case',range90_2_tcre_case');
clear median_tcre_case  likely1_tcre_case  likely2_tcre_case range90_1_tcre_case range90_2_tcre_case name_tcre_case
%-------------------------------------------------------------------------- 
 
 %-------------------------------------------------------------------------- 