* Set change to directory containing data
* cd 

import excel "Combined_data.xlsx", cellrange(A1:AJS141) firstrow clear

*STATA File for Muse Dataset**

*-----------------------==================================================================================
*--------------SLEEP
*-----------------------==================================================================================
*GENERATE COMPONENT 1, SUBJECTIVE SLEEP QUALITY, FROM SCORE GIVEN IN SURVEY RESPONSE 
gen psqi_c1 = psqi_9

*GENERATE COMPONENT 2, SLEEP LATENCY 2 COMPONENTS AND THEN SCORE GIVEN BASED ON *SUM OF THE TWO COMPONENTS
gen psqi_c2ww = psqi_2
replace psqi_c2ww = 0 if inrange(  psqi_2,0,15)
replace psqi_c2ww = 1 if inrange(  psqi_2,16,30)
replace psqi_c2ww = 2 if inrange(  psqi_2,31,60)
replace psqi_c2ww = 3 if inrange(  psqi_2,61,9999)
gen psqi_c2w = psqi_5a+psqi_c2ww
replace psqi_c2w = 0 if inrange( psqi_c2w, 0,0)
replace psqi_c2w = 1 if inrange( psqi_c2w, 1,2)
replace psqi_c2w = 2 if inrange( psqi_c2w, 3,4)
replace psqi_c2w = 3 if inrange( psqi_c2w, 5,6)
gen psqi_c2 = psqi_c2w

*GENERATE COMPONENT 3, SLEEP DURATION, 
gen psqi_c3w = psqi_4a
replace psqi_c3w =  0 if inrange( psqi_4a,7.00001,24)
replace psqi_c3w =  1 if inrange( psqi_4a,6,7)
replace psqi_c3w =  2 if inrange( psqi_4a,5,5.9999)
replace psqi_c3w =  3 if inrange( psqi_4a,0,4.9999)
gen psqi_c3 = psqi_c3w

*GENERATE COMPONENT 4, USING A WORKING COMPONENT 4, TO CALCULATE SLEEP EFFICIENCY 
*BASED ON NUMBER OF HOURS SLEPT/HRS IN BED, THEN GIVING IT A SCORE BASED ON RESULTS
*NEED TO Clean data for psqi_4a and psqi_4b, REMOVE DASHES ETC.
gen psqi_c4w = psqi_4a/psqi_4b
replace psqi_c4w = 3 if inrange( psqi_c4w,0,.64999999)
replace psqi_c4w = 2 if inrange(  psqi_c4w,.65,.74999999)
replace psqi_c4w = 1 if inrange(  psqi_c4w,.75,.84999999)
replace psqi_c4w = 0 if inrange(  psqi_c4w,.85,9999)
gen psqi_c4 = psqi_c4w

*GENERATE COMPONENT 5, SLEEP DISTURBANCE, SUM OF THE QUESTIONNAIRE RESPONSES
gen psqi_c5w = psqi_5b+psqi_5c+psqi_5d+psqi_5e+psqi_5f+psqi_5g+psqi_5h+psqi_5i+psqi_5j
replace psqi_c5w = 0 if inrange( psqi_c5w, 0,0)
replace psqi_c5w = 1 if inrange( psqi_c5w, 1,9)
replace psqi_c5w = 2 if inrange( psqi_c5w, 10,18)
replace psqi_c5w = 3 if inrange( psqi_c5w, 19,27)
gen psqi_c5 = psqi_c5w

*GENERATE COMPONENT 6, USE OF SLEEP MEDICATION,
gen psqi_c6 = psqi_6

*GENERATE COMPONENT 7,
gen psqi_c7w = psqi_8+psqi_7
replace psqi_c7w = 0 if inrange( psqi_c7w, 0,0)
replace psqi_c7w = 1 if inrange( psqi_c7w, 1,2)
replace psqi_c7w = 2 if inrange( psqi_c7w, 3,4)
replace psqi_c7w = 3 if inrange( psqi_c7w, 5,6)
gen psqi_c7 = psqi_c7w

*GENERATE GLOBAL PSQI SCORE, SUM OF ALL COMPONENTS
gen psqi = psqi_c1+psqi_c2+psqi_c3+psqi_c4+psqi_c5+psqi_c6+psqi_c7

*COMPONENTS V2:

*GENERATE COMPONENT 1, SUBJECTIVE SLEEP QUALITY, FROM SCORE GIVEN IN SURVEY RESPONSE 
gen psqi_c1_v2 = psqi_9_v2

*GENERATE COMPONENT 2, SLEEP LATENCY 2 COMPONENTS AND THEN SCORE GIVEN BASED ON *SUM OF THE TWO COMPONENTS
gen psqi_c2ww_v2 = psqi_2_v2
replace psqi_c2ww_v2 = 0 if inrange(  psqi_2_v2,0,15)
replace psqi_c2ww_v2 = 1 if inrange(  psqi_2_v2,16,30)
replace psqi_c2ww_v2 = 2 if inrange(  psqi_2_v2,31,60)
replace psqi_c2ww_v2 = 3 if inrange(  psqi_2_v2,61,9999)
gen psqi_c2w_v2 = psqi_5a_v2+psqi_c2ww_v2
replace psqi_c2w_v2 = 0 if inrange( psqi_c2w_v2, 0,0)
replace psqi_c2w_v2 = 1 if inrange( psqi_c2w_v2, 1,2)
replace psqi_c2w_v2 = 2 if inrange( psqi_c2w_v2, 3,4)
replace psqi_c2w_v2 = 3 if inrange( psqi_c2w_v2, 5,6)
gen psqi_c2_v2 = psqi_c2w_v2

*GENERATE COMPONENT 3, SLEEP DURATION, 
gen psqi_c3w_v2 = psqi_4a_v2
replace psqi_c3w_v2 =  0 if inrange( psqi_4a_v2,7.00001,24)
replace psqi_c3w_v2 =  1 if inrange( psqi_4a_v2,6,7)
replace psqi_c3w_v2 =  2 if inrange( psqi_4a_v2,5,5.9999)
replace psqi_c3w_v2 =  3 if inrange( psqi_4a_v2,0,4.9999)
gen psqi_c3_v2 = psqi_c3w_v2

*GENERATE COMPONENT 4, USING A WORKING COMPONENT 4, TO CALCULATE SLEEP EFFICIENCY 
*BASED ON NUMBER OF HOURS SLEPT/HRS IN BED, THEN GIVING IT A SCORE BASED ON RESULTS
*NEED TO Clean data for psqi_4a and psqi_4b, REMOVE DASHES ETC.
gen psqi_c4ww_v2 = psqi_4a_v2/psqi_4b_v2
replace psqi_c4ww_v2 = 3 if inrange( psqi_c4ww_v2,0,.64999999)
replace psqi_c4ww_v2 = 2 if inrange( psqi_c4ww_v2,.65,.74999999)
replace psqi_c4ww_v2 = 1 if inrange( psqi_c4ww_v2,.75,.84999999)
replace psqi_c4ww_v2 = 0 if inrange( psqi_c4ww_v2,.85,9999)
gen psqi_c4_v2 = psqi_c4ww_v2

*GENERATE COMPONENT 5, SLEEP DISTURBANCE, SUM OF THE QUESTIONNAIRE RESPONSES
gen psqi_c5w_v2 = psqi_5b_v2+psqi_5c_v2+psqi_5d_v2+psqi_5e_v2+psqi_5f_v2+psqi_5g_v2+psqi_5h_v2+psqi_5i_v2+psqi_5j_v2
replace psqi_c5w_v2 = 0 if inrange( psqi_c5w_v2, 0,0)
replace psqi_c5w_v2 = 1 if inrange( psqi_c5w_v2, 1,9)
replace psqi_c5w_v2 = 2 if inrange( psqi_c5w_v2, 10,18)
replace psqi_c5w_v2 = 3 if inrange( psqi_c5w_v2, 19,27)
gen psqi_c5_v2 = psqi_c5w_v2

*GENERATE COMPONENT 6, USE OF SLEEP MEDICATION,
gen psqi_c6_v2 = psqi_6_v2

*GENERATE COMPONENT 7,
gen psqi_c7w_v2 = psqi_8_v2+psqi_7_v2
replace psqi_c7w_v2 = 0 if inrange( psqi_c7w_v2, 0,0)
replace psqi_c7w_v2 = 1 if inrange( psqi_c7w_v2, 1,2)
replace psqi_c7w_v2 = 2 if inrange( psqi_c7w_v2, 3,4)
replace psqi_c7w_v2 = 3 if inrange( psqi_c7w_v2, 5,6)
gen psqi_c7_v2 = psqi_c7w_v2

*GENERATE GLOBAL PSQI SCORE, SUM OF ALL COMPONENTS
gen psqi_v2 = psqi_c1_v2+psqi_c2_v2+psqi_c3_v2+psqi_c4_v2+psqi_c5_v2+psqi_c6_v2+psqi_c7_v2


*RUN SLEEP STATS USING NEW VARIABLES
sum psqi
sum psqi_v2

ttest psqi==psqi_v2 if group==0

ttest psqi==psqi_v2 if group==1

sum psqi if group==0
sum psqi if group==1
sum psqi_v2 if group==0
sum psqi_v2 if group==1
sum psqi if group==1
sum psqi_v2 if group==0

*-----------------------==================================================================================
*-------------dass-21-----------==================================================================================
*-----------------------==================================================================================

*depression
alpha (dass_3 dass_5 dass_10 dass_13 dass_16 dass_17 dass_21)  
gen dep= dass_3 + dass_5 + dass_10 + dass_13 + dass_16 + dass_17 + dass_21
sum dep
*group 0=app, 1=muse
sum dep if group==0
sum dep if group==1
*post depression
gen dep2= dass_3_v2 + dass_5_v2 + dass_10_v2 + dass_13_v2 + dass_16_v2 + dass_17_v2 + dass_21_v2
sum dep2 if group==0
sum dep2 if group==1
*anxiety
alpha (dass_2 dass_4 dass_7 dass_9 dass_15 dass_19 dass_20)
gen anx_dass= dass_2 + dass_4 + dass_7 + dass_9 + dass_15 + dass_19 + dass_20
sum anx_dass if group==0
sum anx_dass if group==1
*post anxiety
alpha (dass_2_v2 dass_4_v2 dass_7_v2 dass_9_v2 dass_15_v2 dass_19_v2 dass_20_v2)
gen anx2_dass= dass_2_v2 + dass_4_v2 + dass_7_v2 + dass_9_v2 + dass_15_v2 + dass_19_v2 + dass_20_v2
sum anx2_dass if group==0
sum anx2_dass if group==1
*stress
alpha (dass_1 dass_6 dass_8 dass_11 dass_12 dass_14 dass_18)
gen str_dass= dass_1 + dass_6 + dass_8 + dass_11 + dass_12 + dass_14 + dass_18
sum str_dass
sum str_dass if group==0
sum str_dass if group==1
*post stress
alpha (dass_1_v2 dass_6_v2 dass_8_v2 dass_11_v2 dass_12_v2 dass_14_v2 dass_18_v2)
gen str2_dass= dass_1_v2 + dass_6_v2 + dass_8_v2 + dass_11_v2 + dass_12_v2 + dass_14_v2 + dass_18_v2
sum str2_dass
sum str2_dass if group==0
sum str2_dass if group==1

*CREATE SUMMARY DASS SCORES
gen dass_total=(2*dep)+(2*anx_dass)+(2*str_dass) 
sum dass_total if group==0
sum dass_total if group==1
gen dass_v2_total=(2*dep2)+(2*anx2_dass)+(2*str2_dass) 
sum dass_v2_total if group==0
sum dass_v2_total if group==1
*---------------self-esteem----------------
*----------- RSES NEW VARIABLES DEFINED ------
*THIS FIX WAS REQUIRED BECAUSE OF THE WAY DATA WAS SET UP IN REDCAP
gen se1=rses_1
replace se1=0 if se1==4
replace se1=22 if se1==1
replace se1=1 if se1==3
replace se1=3 if se1==22
gen se2=rses_2
replace se2=0 if se2==4
replace se2=22 if se2==1
replace se2=1 if se2==3
replace se2=3 if se2==22
gen se3=rses_3
replace se3=0 if se3==4
replace se3=22 if se3==1
replace se3=1 if se3==3
replace se3=3 if se3==22
gen se4=rses_4
replace se4=0 if se4==4
replace se4=22 if se4==1
replace se4=1 if se4==3
replace se4=3 if se4==22
gen se5=rses_5
replace se5=0 if se5==4
replace se5=22 if se5==1
replace se5=1 if se5==3
replace se5=3 if se5==22
gen se6=rses_6
replace se6=0 if se6==4
replace se6=22 if se6==1
replace se6=1 if se6==3
replace se6=3 if se6==22
gen se7=rses_7
replace se7=0 if se7==4
replace se7=22 if se7==1
replace se7=1 if se7==3
replace se7=3 if se7==22
gen se8=rses_8
replace se8=0 if se8==4
replace se8=22 if se8==1
replace se8=1 if se8==3
replace se8=3 if se8==22
gen se9=rses_9
replace se9=0 if se9==4
replace se9=22 if se9==1
replace se9=1 if se9==3
replace se9=3 if se9==22
gen se10=rses_10
replace se10=0 if se10==4
replace se10=22 if se10==1
replace se10=1 if se10==3
replace se10=3 if se10==22

*V2

gen se1_v2=rses_1_v2
replace se1_v2=0 if se1_v2==4
replace se1_v2=22 if se1_v2==1
replace se1_v2=1 if se1_v2==3
replace se1_v2=3 if se1_v2==22
gen se2_v2=rses_2_v2
replace se2_v2=0 if se2_v2==4
replace se2_v2=22 if se2_v2==1
replace se2_v2=1 if se2_v2==3
replace se2_v2=3 if se2_v2==22
gen se3_v2=rses_3_v2
replace se3_v2=0 if se3_v2==4
replace se3_v2=22 if se3_v2==1
replace se3_v2=1 if se3_v2==3
replace se3_v2=3 if se3_v2==22
gen se4_v2=rses_4_v2
replace se4_v2=0 if se4_v2==4
replace se4_v2=22 if se4_v2==1
replace se4_v2=1 if se4_v2==3
replace se4_v2=3 if se4_v2==22
gen se5_v2=rses_5_v2
replace se5_v2=0 if se5_v2==4
replace se5_v2=22 if se5_v2==1
replace se5_v2=1 if se5_v2==3
replace se5_v2=3 if se5_v2==22
gen se6_v2=rses_6_v2
replace se6_v2=0 if se6_v2==4
replace se6_v2=22 if se6_v2==1
replace se6_v2=1 if se6_v2==3
replace se6_v2=3 if se6_v2==22
gen se7_v2=rses_7_v2
replace se7_v2=0 if se7_v2==4
replace se7_v2=22 if se7_v2==1
replace se7_v2=1 if se7_v2==3
replace se7_v2=3 if se7_v2==22
gen se8_v2=rses_8_v2
replace se8_v2=0 if se8_v2==4
replace se8_v2=22 if se8_v2==1
replace se8_v2=1 if se8_v2==3
replace se8_v2=3 if se8_v2==22
gen se9_v2=rses_9_v2
replace se9_v2=0 if se9_v2==4
replace se9_v2=22 if se9_v2==1
replace se9_v2=1 if se9_v2==3
replace se9_v2=3 if se9_v2==22
gen se10_v2=rses_10_v2
replace se10_v2=0 if se10_v2==4
replace se10_v2=22 if se10_v2==1
replace se10_v2=1 if se10_v2==3
replace se10_v2=3 if se10_v2==22
*----------- RSES CODE FIXED------
alpha (se7 se10 se2 se4 se5 se9 se1 se8 se3 se6)
gen selfest= se7 + se10 + se2 + se4 + se5 + se9 + se1 + se8 + se3 + se6
sum selfest
sum selfest if group==0
sum selfest if group==1

*post self esteem 
alpha (se7_v2 se10_v2 se2_v2 se4_v2 se5_v2 se9_v2 se1_v2 se8_v2 se3_v2 se6_v2)
gen selfest2= se7_v2 + se10_v2 + se2_v2 + se4_v2 + se5_v2 + se9_v2 + se1_v2 + se8_v2 + se3_v2 + se6_v2
sum selfest2
sum selfest2 if group==0
sum selfest2 if group==1

*----------------Experiences Questionnaire - EQ---------
*Decentering
alpha (eq_3 eq_15 eq_9 eq_14 eq_10 eq_16 eq_6 eq_17 eq_18 eq_12 eq_20)
gen decent_eq= eq_3 + eq_15 + eq_9 + eq_14 + eq_10 + eq_16 + eq_6 + eq_17 + eq_18 + eq_12 + eq_20
sum decent_eq
sum decent_eq if group==0
sum decent_eq if group==1
*post decentering
alpha (eq_3_v2 eq_15_v2 eq_9_v2 eq_14_v2 eq_10_v2 eq_16_v2 eq_6_v2 eq_17_v2 eq_18_v2 eq_12_v2 eq_20_v2)
gen decent2_eq= eq_3_v2 + eq_15_v2 + eq_9_v2 + eq_14_v2 + eq_10_v2 + eq_16_v2 + eq_6_v2 + eq_17_v2 + eq_18_v2 + eq_12_v2 + eq_20_v2
sum decent2_eq
sum decent2_eq if group==0
sum decent2_eq if group==1
*Rumination
alpha (eq_1 eq_2 eq_4 eq_5 eq_7 eq_8 eq_11 eq_13 eq_19)
gen rumin_eq= eq_1 + eq_2 + eq_4 + eq_5 + eq_7 + eq_8 + eq_11 + eq_13 + eq_19
sum rumin_eq
sum rumin_eq if group==0
sum rumin_eq if group==1
*post rumination
alpha (eq_1_v2  eq_2_v2  eq_4_v2  eq_5_v2 eq_7_v2  eq_8_v2  eq_11_v2  eq_13_v2  eq_19_v2 )
gen rumin_eq2= eq_1_v2  + eq_2_v2  + eq_4_v2  + eq_5_v2  + eq_7_v2  + eq_8_v2  + eq_11_v2  + eq_13_v2  + eq_19_v2 
sum rumin_eq2
sum rumin_eq2 if group==0
sum rumin_eq2 if group==1

*---------------MAIA------------
gen not_maia=(maia_1 + maia_2 + maia_3 + maia_4) / 4
gen not_maia2= (maia_1_v2 + maia_2_v2 + maia_3_v2 + maia_4_v2) /4
gen notdis_maia= (maia_5 + maia_6 + maia_7) /3
gen notdis_maia2= (maia_5_v2 + maia_6_v2 + maia_7_v2) /3
gen notwor_maia= (maia_8 + maia_9 + maia_10) /3
gen notwor_maia2= (maia_8_v2 + maia_9_v2 + maia_10_v2) /3
gen attenreg_maia= (maia_11 + maia_12 + maia_13 + maia_14 + maia_15 + maia_16 + maia_17) /7
gen attenreg_maia2= (maia_11_v2 + maia_12_v2 + maia_13_v2 + maia_14_v2 + maia_15_v2 + maia_16_v2 + maia_17_v2) /7
gen emoaw_maia= (maia_18 + maia_19 + maia_20 + maia_21 + maia_22) /5
gen emoaw_maia2= (maia_18_v2 + maia_19_v2 + maia_20_v2 + maia_21_v2 + maia_22_v2) /5
gen selfreg_maia= (maia_23 + maia_24 + maia_25 + maia_26) /4
gen selfreg_maia2= (maia_23_v2 + maia_24_v2 + maia_25_v2 + maia_26_v2) /4
gen bodlist_maia= (maia_27 + maia_28 + maia_29) /3
gen bodlist_maia2= (maia_27_v2 + maia_28_v2 + maia_29_v2) /3
gen trust_maia= (maia_30 + maia_31 + maia_32) /3
gen trust_maia2= (maia_30_v2 + maia_31_v2 + maia_32_v2) /3

*NOTICING
alpha (maia_1 maia_2 maia_3 maia_4)
sum not_maia
sum not_maia if group==0
sum not_maia if group==1
*post noticing
sum not_maia2
sum not_maia2 if group==0
sum not_maia2 if group==1
*NOT DISTRACTING
alpha (maia_5 maia_6 maia_7)
sum notdis_maia
sum notdis_maia if group==0
sum notdis_maia if group==1
*post not distracting
alpha (maia_5_v2 maia_6_v2 maia_7_v2)
sum notdis_maia2
sum notdis_maia2 if group==0
sum notdis_maia2 if group==1
*NOT WORRYING
alpha (maia_8 maia_9 maia_10)
sum notwor_maia
sum notwor_maia if group==0
sum notwor_maia if group==1
*post not worrying
alpha (maia_8_v2 maia_9_v2 maia_10_v2)
sum notwor_maia2
sum notwor_maia2 if group==0
sum notwor_maia2 if group==1
*ATTENTION REGULATION
alpha (maia_11 maia_12 maia_13 maia_14 maia_15 maia_16 maia_17)
sum attenreg_maia
sum attenreg_maia if group==0
sum attenreg_maia if group==1
*post attention regulation
alpha (maia_11_v2 - maia_17_v2)
sum attenreg_maia2
sum attenreg_maia2 if group==0
sum attenreg_maia2 if group==1
*EMOTIONAL AWARENESS
alpha (maia_18 maia_19 maia_20 maia_21 maia_22)
sum emoaw_maia
sum emoaw_maia if group==0
sum emoaw_maia if group==1
*post emotional awareness
alpha (maia_18_v2 - maia_22_v2)
sum emoaw_maia2
sum emoaw_maia2 if group==0
sum emoaw_maia2 if group==1
*SELF REGULATION
alpha (maia_23 maia_24 maia_25 maia_26)
sum selfreg_maia
sum selfreg_maia if group==0
sum selfreg_maia if group==1
*post self regulation
alpha (maia_23_v2 - maia_26_v2)
sum selfreg_maia2
sum selfreg_maia2 if group==0
sum selfreg_maia2 if group==1
*BODY LISTENING
alpha (maia_27 maia_28 maia_29)
sum bodlist_maia
sum bodlist_maia if group==0
sum bodlist_maia if group==1
*post body listening
alpha (maia_27_v2 - maia_29_v2)
sum bodlist_maia2
sum bodlist_maia2 if group==0
sum bodlist_maia2 if group==1
*TRUSTING
alpha (maia_30 maia_31 maia_32)
sum trust_maia
sum trust_maia if group==0
sum trust_maia if group==1
*post trusting
alpha (maia_30_v2 - maia_32_v2)
sum trust_maia2
sum trust_maia2 if group==0
sum trust_maia2 if group==1
*maia t-tests
ttest not_maia==not_maia2 
ttest notdis_maia==notdis_maia2
ttest notwor_maia==notwor_maia2
ttest attenreg_maia==attenreg_maia2
ttest emoaw_maia==emoaw_maia2
ttest selfreg_maia==selfreg_maia2
ttest bodlist_maia=bodlist_maia2
ttest trust_maia==trust_maia2
*------------------Self Regulation of Eating Behavior Questionnaire SREBQ-------
*2 alphas because one is reverse coded already
alpha (srebq_4a srebq_4c srebq_4e)
alpha (srebq_4b srebq_4d)
gen srebq= srebq_4a + srebq_4b + srebq_4c + srebq_4d + srebq_4e
sum srebq
sum srebq if group==0
sum srebq if group==1
*post eating
gen srebq2= srebq_4a_v2 + srebq_4b_v2 + srebq_4c_v2 + srebq_4d_v2 + srebq_4e_v2
sum srebq2
sum srebq2 if group==0
sum srebq2 if group==1
*------------------Emotions regulations questionnaire-------
*cognitive reappraisal
alpha (erq_1 erq_3 erq_5 erq_7 erq_8 erq_10)
gen cogre_erq= erq_1 + erq_3 + erq_5 + erq_7 + erq_8 + erq_10
sum cogre_erq
sum cogre_erq if group==0
sum cogre_erq if group==1
*post cognitive reappraisal
alpha (erq_1_v2 erq_3_v2 erq_5_v2 erq_7_v2 erq_8_v2 erq_10_v2)
gen cogre_erq2= erq_1_v2 + erq_3_v2 + erq_5_v2 + erq_7_v2 + erq_8_v2 + erq_10_v2
sum cogre_erq2
sum cogre_erq2 if group==0
sum cogre_erq2 if group==1
*expressive supression?--------
alpha (erq_2 erq_4 erq_6 erq_9)
gen expsup_erq= erq_2 + erq_4 + erq_6 + erq_9
sum expsup_erq
sum expsup_erq if group==0
sum expsup_erq if group==1
*post expressive suppression
alpha (erq_2_v2 erq_4_v2 erq_6_v2 erq_9_v2)
gen expsup_erq2= erq_2_v2 + erq_4_v2 + erq_6_v2 + erq_9_v2
sum expsup_erq2
sum expsup_erq2 if group==0
sum expsup_erq2 if group==1
*--------------Connor Davis Resilience Scale----------
alpha (cdrisc_1 cdrisc_2 cdrisc_3 cdrisc_4 cdrisc_5 cdrisc_6 cdrisc_7 cdrisc_8 cdrisc_9 cdrisc_10 cdrisc_11 cdrisc_12 cdrisc_13 cdrisc_14 cdrisc_15 cdrisc_16 cdrisc_17 cdrisc_18 cdrisc_19 cdrisc_20 cdrisc_21 cdrisc_22 cdrisc_23 cdrisc_24 cdrisc_25)
gen cdrisc= cdrisc_1 + cdrisc_2 + cdrisc_3 + cdrisc_4 + cdrisc_5 + cdrisc_6 + cdrisc_7 + cdrisc_8 + cdrisc_9 + cdrisc_10 + cdrisc_11 + cdrisc_12 + cdrisc_13 + cdrisc_14 + cdrisc_15 + cdrisc_16 + cdrisc_17 + cdrisc_18 + cdrisc_19 + cdrisc_20 + cdrisc_21 + cdrisc_22 + cdrisc_23 + cdrisc_24 + cdrisc_25
sum cdrisc
sum cdrisc if group==0
sum cdrisc if group==1
*post resilience
alpha (cdrisc_1_v2 - cdrisc_25_v2)
gen cdrisc2= cdrisc_1_v2 + cdrisc_2_v2 + cdrisc_3_v2 + cdrisc_4_v2 + cdrisc_5_v2 + cdrisc_6_v2 + cdrisc_7_v2 + cdrisc_8_v2 + cdrisc_9_v2 + cdrisc_10_v2 + cdrisc_11_v2 + cdrisc_12_v2 + cdrisc_13_v2 + cdrisc_14_v2 + cdrisc_15_v2 + cdrisc_16_v2 + cdrisc_17_v2 + cdrisc_18_v2 + cdrisc_19_v2 + cdrisc_20_v2 + cdrisc_21_v2 + cdrisc_22_v2 + cdrisc_23_v2 + cdrisc_24_v2 + cdrisc_25_v2
sum cdrisc2
sum cdrisc2 if group==0
sum cdrisc2 if group==1
*--------------MINDSENS MINDFULNESS SCALE - COMPOSITE-
alpha (ffmq_1 ffmq_29 ffmq_33 ffmq_19 ffmq_21 ffmq_36 ffmq_26 ffmq_20 ffmq_24 ffmq_31 eq_9 eq_4 eq_2 eq_3 eq_10 eq_11 eq_5 eq_7 eq_8)
gen mindsens= (ffmq_1 + ffmq_29 + ffmq_33 + ffmq_19 + ffmq_21 + ffmq_36 + ffmq_26 + ffmq_20 + ffmq_24 + ffmq_31 + eq_9 + eq_4 + eq_2 + eq_3 + eq_10 + eq_11 + eq_5 + eq_7 + eq_8) / 19
sum mindsens
sum mindsens if group==0
sum mindsens if group==1
*post mindsens
alpha (ffmq_1_v2 ffmq_29_v2 ffmq_33_v2 ffmq_19_v2 ffmq_21_v2 ffmq_36_v2 ffmq_26_v2 ffmq_20_v2 ffmq_24_v2 ffmq_31_v2 eq_9_v2 eq_4_v2 eq_2_v2 eq_3_v2 eq_10_v2 eq_11_v2 eq_5_v2 eq_7_v2 eq_8_v2)
gen mindsens2= (ffmq_1_v2 + ffmq_29_v2 + ffmq_33_v2 + ffmq_19_v2 + ffmq_21_v2 + ffmq_36_v2 + ffmq_26_v2 + ffmq_20_v2 + ffmq_24_v2 + ffmq_31_v2 + eq_9_v2 + eq_4_v2 + eq_2_v2 + eq_3_v2 + eq_10_v2 + eq_11_v2 + eq_5_v2 + eq_7_v2 + eq_8_v2) / 19
sum mindsens2
sum mindsens2 if group==0
sum mindsens2 if group==1
*----------------Ten Item Personality Inventory--TIPI-------
*create variables
gen tipi_2_r=8-critical
gen tipi_4_r=8-anxious
gen tipi_6_r=8-intrav
gen tipi_8_r=8-disorg
gen tipi_10_r=8-conventional
*create post variables
gen tipi_2_r_v2=8-critical_v2
gen tipi_4_r_v2=8-anxious_v2
gen tipi_6_r_v2=8-intrav_v2
gen tipi_8_r_v2=8-disorg_v2
gen tipi_10_r_v2=8-conventional_v2
*Extraversion
alpha (extra tipi_6_r)
gen ext_bfpi= extra + tipi_6_r
sum ext_bfpi
sum ext_bfpi if group==0
sum ext_bfpi if group==1

*post extraversion
gen ext_bfpi_v2= extra_v2 + tipi_6_r_v2
sum ext_bfpi_v2
sum ext_bfpi_v2 if group==0
sum ext_bfpi_v2 if group==1

*Agreeableness	
alpha (sympath tipi_2_r)
gen agr_bfpi= sympath + tipi_2_r
sum agr_bfpi
sum agr_bfpi if group==0
sum agr_bfpi if group==1

*post agreeableness
gen agr_bfpi_v2= sympath_v2 + tipi_2_r_v2
sum agr_bfpi_v2
sum agr_bfpi_v2 if group==0
sum agr_bfpi_v2 if group==1

*Conscientiousness
alpha (depend tipi_8_r)
gen cons_bfpi= depend + tipi_8_r
sum cons_bfpi
sum cons_bfpi if group==0
sum cons_bfpi if group==1

*post conscientiousness
gen cons_bfpi_v2= depend_v2 + tipi_8_r_v2
sum cons_bfpi_v2
sum cons_bfpi_v2 if group==0
sum cons_bfpi_v2 if group==1

*	Emotional Stability
alpha (calm tipi_4_r)
gen emosta_bfpi= calm + tipi_4_r
sum emosta_bfpi
sum emosta_bfpi if group==0
sum emosta_bfpi if group==1

*post emotional stability
gen emosta_bfpi_v2= calm_v2 + tipi_4_r_v2
sum emosta_bfpi_v2
sum emosta_bfpi_v2 if group==0
sum emosta_bfpi_v2 if group==1

*	Openness to Experiences
alpha (open tipi_10_r)
gen open_bfpi= open + tipi_10_r
sum open_bfpi
sum open_bfpi if group==0
sum open_bfpi if group==1

*post openness to experiences
gen open_bfpi_v2= open_v2 + tipi_10_r_v2
sum open_bfpi_v2
sum open_bfpi_v2 if group==0
sum open_bfpi_v2 if group==1

*-------------------PERCEIVED STRESS SCALE------------
alpha (pss_1 pss_2 pss_3 pss_4 pss_5 pss_6 pss_7 pss_8 pss_9 pss_10)
gen pss= (pss_1 + pss_2 + pss_3 + pss_4 + pss_5 + pss_6 + pss_7 + pss_8 + pss_9 + pss_10)
sum pss
sum pss if group==0
sum pss if group==1

*POST PSS
alpha (pss_1_v2 pss_2_v2 pss_3_v2 pss_4_v2 pss_5_v2 pss_6_v2 pss_7_v2 pss_8_v2 pss_9_v2 pss_10_v2)
gen pss2= (pss_1_v2 + pss_2_v2 + pss_3_v2 + pss_4_v2 + pss_5_v2 + pss_6_v2 + pss_7_v2 + pss_8_v2 + pss_9_v2 + pss_10_v2)
sum pss2
sum pss2 if group==0
sum pss2 if group==1

