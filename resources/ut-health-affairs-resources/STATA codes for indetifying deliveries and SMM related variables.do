*******Programmer: Meliha Salahuddin
*******Dec2019-Jan 2020
*******UT System: Data measure codes for San Antonio Express
****Dataset to be used: THCIC inpatient hospitalization for deliveries 2016-2018 (ICD-10 codes only)


***Identify deliveries based on ICD-10 codes;
#delimit ;
gen birth=0;
replace birth= 1 if ms_drg==765 | ms_drg==766 | ms_drg==767 |
	ms_drg==768 | ms_drg==774 | ms_drg==775;
#delimit cr
#delimit ;
foreach i in dx1 dx2 dx3 dx4 dx5 dx6 dx7 dx8 dx9 dx10 dx11 dx12 dx13 dx14 dx15
			dx16 dx17 dx18 dx19 dx20 dx21 dx22 dx23 dx24 dx25 dx26 {;
	replace birth = 1 if (substr(`i',1,4) == "Z370" | substr(`i',1,4) == "Z371" |
	substr(`i',1,4) == "Z372" | substr(`i',1,4) == "Z373" | substr(`i',1,4) == "Z374" |
	substr(`i',1,5) == "Z3750" | substr(`i',1,5) == "Z3751" | substr(`i',1,5) == "Z3752" |
	substr(`i',1,5) == "Z3753" | substr(`i',1,5) == "Z3754" | substr(`i',1,5) == "Z3759" |
	substr(`i',1,5) == "Z3760" | substr(`i',1,5) == "Z3761" | substr(`i',1,5) == "Z3762" |
	substr(`i',1,5) == "Z3763" | substr(`i',1,5) == "Z3764" | substr(`i',1,5) == "Z3769" |
	substr(`i',1,4) == "Z377" | substr(`i',1,4) == "Z379" | substr(`i',1,3) == "O80" | substr(`i',1,3) == "O82" );
}
;
#delimit cr
#delimit ;
foreach i in sx1 sx2 sx3 sx4 sx5 sx6 sx7 sx8 sx9 sx10 sx11 sx12 sx13 sx14 sx15
			sx16 sx17 sx18 sx19 sx20 sx21 sx22 sx23 sx24 sx25 {;
	replace birth = 1 if (substr(`i',1,7) == "10D00Z0" | substr(`i',1,7) == "10D00Z1" |
	substr(`i',1,7) == "10D00Z2" | substr(`i',1,7) == "10D07Z3" | substr(`i',1,7) == "10D07Z4" |
	substr(`i',1,7) == "10D07Z5" | substr(`i',1,7) == "10D07Z6" | substr(`i',1,7) == "10D07Z7" |
	substr(`i',1,7) == "10D07Z8" | substr(`i',1,7) == "10E0XZZ" );
}
;
#delimit cr
*exclusion of those with abortive outcomes/abortive procedures;
#delimit ;
foreach i in dx1 dx2 dx3 dx4 dx5 dx6 dx7 dx8 dx9 dx10 dx11 dx12 dx13 dx14 dx15
			dx16 dx17 dx18 dx19 dx20 dx21 dx22 dx23 dx24 dx25 dx26 {;
	replace birth = 0 if (substr(`i',1,4) == "O000" | substr(`i',1,4) == "O001" |
	substr(`i',1,4) == "O002" | substr(`i',1,4) == "O008" | substr(`i',1,4) == "O009" |
	substr(`i',1,4) == "O010" | substr(`i',1,4) == "O011" | substr(`i',1,4) == "O019" |
	substr(`i',1,4) == "O020" | substr(`i',1,4) == "O021" | substr(`i',1,5) == "O0281" |
	substr(`i',1,5) == "O0289" | substr(`i',1,4) == "O029" | substr(`i',1,4) == "O030" |
	substr(`i',1,4) == "O031" | substr(`i',1,4) == "O032" | substr(`i',1,5) == "O0330" |
	substr(`i',1,5) == "O0331" | substr(`i',1,5) == "O0332" | substr(`i',1,5) == "O0333" | substr(`i',1,5) == "O0334" |
	substr(`i',1,5) == "O0335" | substr(`i',1,5) == "O0336" | substr(`i',1,5) == "O0337" | substr(`i',1,5) == "O0338" |
	substr(`i',1,5) == "O0339" | substr(`i',1,4) == "O034" | substr(`i',1,4) == "O035" | substr(`i',1,4) == "O036" |
	substr(`i',1,4) == "O037" | substr(`i',1,5) == "O0380" | substr(`i',1,5) == "O0381" | substr(`i',1,5) == "O0382" |
	substr(`i',1,5) == "O0383" | substr(`i',1,5) == "O0384" | substr(`i',1,5) == "O0385" | substr(`i',1,5) == "O0386" |
	substr(`i',1,5) == "O0387" | substr(`i',1,5) == "O0388" | substr(`i',1,5) == "O0389" | substr(`i',1,4) == "O039" |
	substr(`i',1,4) == "O045" | substr(`i',1,4) == "O046" | substr(`i',1,4) == "O047" |
	substr(`i',1,5) == "O0480" | substr(`i',1,5) == "O0481" | substr(`i',1,5) == "O0482" |
	substr(`i',1,5) == "O0483" | substr(`i',1,5) == "O0484" | substr(`i',1,5) == "O0485" | substr(`i',1,5) == "O0486" |
	substr(`i',1,5) == "O0487" | substr(`i',1,5) == "O0488" | substr(`i',1,5) == "O0489" |
	substr(`i',1,4) == "O070" | substr(`i',1,4) == "O071" | substr(`i',1,4) == "O072" | substr(`i',1,5) == "O0730" |
	substr(`i',1,5) == "O0731" | substr(`i',1,5) == "O0732" | substr(`i',1,5) == "O0733" | substr(`i',1,5) == "O0734" |
	substr(`i',1,5) == "O0735" | substr(`i',1,5) == "O0736" | substr(`i',1,5) == "O0737" | substr(`i',1,5) == "O0738" |
	substr(`i',1,5) == "O0739" | substr(`i',1,4) == "O074" | substr(`i',1,4) == "O080"  | 
	substr(`i',1,4) == "O081" | substr(`i',1,4) == "O082" | substr(`i',1,4) == "O083" | substr(`i',1,4) == "O084" |
	substr(`i',1,4) == "O085" | substr(`i',1,4) == "O086" | substr(`i',1,4) == "O087" | substr(`i',1,5) == "O0881" |
	substr(`i',1,5) == "O0882" | substr(`i',1,5) == "O0883" | substr(`i',1,5) == "O0889" | substr(`i',1,4) == "O089" );
}
;
#delimit cr
#delimit ;
foreach i in sx1 sx2 sx3 sx4 sx5 sx6 sx7 sx8 sx9 sx10 sx11 sx12 sx13 sx14 sx15
			sx16 sx17 sx18 sx19 sx20 sx21 sx22 sx23 sx24 sx25 {;
	replace birth = 0 if (substr(`i',1,7) == "10A00ZZ" | substr(`i',1,7) == "10A03ZZ" |
	substr(`i',1,7) == "10A04ZZ" | substr(`i',1,7) == "10A07Z6" | substr(`i',1,7) == "10A07ZW" |
	substr(`i',1,7) == "10A07ZX" | substr(`i',1,7) == "10A07ZZ" | substr(`i',1,7) == "10A08ZZ" );
}
;
#delimit cr
label variable birth "Identification of all births in TX using AIM guideline"
tab birth, missing
label value birth birth
label define birth 0 "non-delivery hospitalizations" 1 "delivery hospitalizations"
*limit to delivery hospitalizations;
drop if birth==0
tab birth, missing



***Limit to women aged 15-49 years;
tab pat_age, missing
drop if (pat_age=="0" | pat_age=="00" | pat_age=="01" | pat_age=="1" | pat_age=="02" | pat_age=="2" | pat_age=="03") 
generate ptage=.
replace ptage=1 if pat_age=="04" | pat_age=="4" 
replace ptage=2 if pat_age=="05" | pat_age=="5" | pat_age=="06" | pat_age=="6" 
replace ptage=3 if pat_age=="07" | pat_age=="7" 
replace ptage=4 if pat_age=="08" | pat_age=="8" 
replace ptage=5 if pat_age=="09" | pat_age=="9" 
replace ptage=6 if pat_age=="10" 
replace ptage=7 if pat_age=="11" 
replace ptage=8 if pat_age=="12" 
replace ptage=9 if pat_age>="13" & pat_age<="21" 
replace ptage=10 if pat_age=="23"       
replace ptage=11 if pat_age=="22" | pat_age=="24" | pat_age=="25" | pat_age=="26" 
label variable ptage "Patient age in categories"
label define pt1a1 1 "10-<15 years" 2 "15-19 years" 3 "20-24 years" 4 "25-29 years" 5 "30-34 years" 6 "35-39 years" 7 "40-44 years" 8 "45-49 years" 9 ">50 years" 10 "18-44 years HIV pt" 11 "HIV pt outside of 18-44 yrs"
label value ptage pt1a1
tab ptage, missing

**Age variable flag that denotes women within reproductive age "15-49 years";
generate ptage_repro=0
replace ptage_repro=1 if pat_age>="05" & pat_age<="12" 
replace ptage_repro=1 if pat_age>="5" & pat_age<="12"
replace ptage_repro=1 if pat_age=="5" 
replace ptage_repro=1 if pat_age=="6" 
replace ptage_repro=1 if pat_age=="7" 
replace ptage_repro=1 if pat_age=="8" 
replace ptage_repro=1 if pat_age=="9" 
replace ptage_repro=1 if pat_age=="10" 
replace ptage_repro=1 if pat_age=="11" 
replace ptage_repro=1 if pat_age=="12" 
replace ptage_repro=1 if pat_age=="23" 
replace ptage_repro=. if pat_age=="`" 
replace ptage_repro=. if pat_age=="" 
replace ptage_repro=. if pat_age==" " 
tab ptage_repro, missing
label variable ptage_repro "patient age group between 15-49 years"
label define ptage 0 "beyond age range=0" 1 "within repro age range=1"
label value ptage_repro ptage
tab ptage_repro, missing
*limit to 15-49 year olds;
drop if ptage_repro==.
tab ptage_repro, missing


*****SMM measure calculation based on CDC coding (https://www.cdc.gov/reproductivehealth/maternalinfanthealth/severematernalmorbidity.html):
***SMM measure (based on CDC coding);
***ICD-10 SMM Numerator codes - From CDC document;
gen acuteMI= 0 
#delimit ;
foreach i in dx1 dx2 dx3 dx4 dx5 dx6 dx7 dx8 dx9 dx10 dx11 dx12 dx13 dx14 dx15
			dx16 dx17 dx18 dx19 dx20 dx21 dx22 dx23 dx24 dx25 dx26 {;
	replace acuteMI = 1 if (substr(`i',1,5) == "I2101" | substr(`i',1,5) == "I2102" |
	substr(`i',1,5) == "I2109" | substr(`i',1,5) == "I2111" | substr(`i',1,5) == "I2119" |
	substr(`i',1,5) == "I2121" | substr(`i',1,5) == "I2129" | substr(`i',1,4) == "I213" |
	substr(`i',1,4) == "I214" | substr(`i',1,4) == "I219" | substr(`i',1,5) == "I21A1" |
	substr(`i',1,5) == "I21A9" | substr(`i',1,4) == "I220" | substr(`i',1,4) == "I221" |
	substr(`i',1,4) == "I222" | substr(`i',1,4) == "I228" | substr(`i',1,4) == "I229" );
}
;
#delimit cr
label variable acuteMI "Acute MI based on CDC ICD-9/ICD-10 codes"

gen ARF= 0 
#delimit ;
foreach i in dx1 dx2 dx3 dx4 dx5 dx6 dx7 dx8 dx9 dx10 dx11 dx12 dx13 dx14 dx15
			dx16 dx17 dx18 dx19 dx20 dx21 dx22 dx23 dx24 dx25 dx26 {;
	replace ARF = 1 if (substr(`i',1,4) == "N170" | substr(`i',1,4) == "N171" |
	substr(`i',1,4) == "N172" | substr(`i',1,4) == "N178" | substr(`i',1,4) == "N179" | substr(`i',1,4) == "O904" );
}
;
#delimit cr
label variable ARF "Acute renal failure based on CDC ICD-9/ICD-10 codes"

gen ARDS= 0 
#delimit ;
foreach i in dx1 dx2 dx3 dx4 dx5 dx6 dx7 dx8 dx9 dx10 dx11 dx12 dx13 dx14 dx15
			dx16 dx17 dx18 dx19 dx20 dx21 dx22 dx23 dx24 dx25 dx26 {;
	replace ARDS = 1 if (substr(`i',1,3) == "J80" | substr(`i',1,4) == "J951" |
	substr(`i',1,4) == "J952" | substr(`i',1,4) == "J953" | substr(`i',1,6) == "J95821" |
	substr(`i',1,6) == "J95822 " | substr(`i',1,5) == "J9600" | substr(`i',1,5) == "J9601" |
	substr(`i',1,5) == "J9602" | substr(`i',1,5) == "J9620" | substr(`i',1,5) == "J9621" |
	substr(`i',1,5) == "J9622" | substr(`i',1,4) == "R092" );
}
;
#delimit cr
label variable ARDS "Adult resp. distress syndrome based on CDC ICD-9/ICD-10 codes"

gen AFE= 0 
#delimit ;
foreach i in dx1 dx2 dx3 dx4 dx5 dx6 dx7 dx8 dx9 dx10 dx11 dx12 dx13 dx14 dx15
			dx16 dx17 dx18 dx19 dx20 dx21 dx22 dx23 dx24 dx25 dx26 {;
	replace AFE = 1 if (substr(`i',1,6) == "O88111" | substr(`i',1,6) == "O88112" |
	substr(`i',1,6) == "O88113" | substr(`i',1,6) == "O88119" | substr(`i',1,5) == "O8812" | substr(`i',1,5) == "O8813" );
}
;
#delimit cr
label variable AFE "Amniotic fluid embolism based on CDC ICD-9/ICD-10 codes"

gen Aneur= 0 
#delimit ;
foreach i in dx1 dx2 dx3 dx4 dx5 dx6 dx7 dx8 dx9 dx10 dx11 dx12 dx13 dx14 dx15
			dx16 dx17 dx18 dx19 dx20 dx21 dx22 dx23 dx24 dx25 dx26 {;
	replace Aneur = 1 if (substr(`i',1,5) == "I7100" | substr(`i',1,5) == "I7101" | substr(`i',1,5) == "I7102" | substr(`i',1,5) == "I7103" |
	substr(`i',1,4) == "I711" | substr(`i',1,4) == "I712" | substr(`i',1,4) == "I713" | substr(`i',1,4) == "I714" | 
	substr(`i',1,4) == "I715" | substr(`i',1,4) == "I716" | substr(`i',1,4) == "I718" | substr(`i',1,4) == "I719" | substr(`i',1,4) == "I790" );
}
;
#delimit cr
label variable Aneur "Aneurysm based on CDC ICD-9/ICD-10 codes"

gen card_arrest= 0 
#delimit ;
foreach i in dx1 dx2 dx3 dx4 dx5 dx6 dx7 dx8 dx9 dx10 dx11 dx12 dx13 dx14 dx15
			dx16 dx17 dx18 dx19 dx20 dx21 dx22 dx23 dx24 dx25 dx26 {;
	replace card_arrest = 1 if (substr(`i',1,5) == "I4901" | substr(`i',1,5) == "I4902" | substr(`i',1,4) == "I462" | 
	substr(`i',1,4) == "I468" | substr(`i',1,4) == "I469" );
}
;
#delimit cr
label variable card_arrest "cardiac arrest/VF based on CDC ICD-9/ICD-10 codes"

gen DIC=0
#delimit ;
foreach i in dx1 dx2 dx3 dx4 dx5 dx6 dx7 dx8 dx9 dx10 dx11 dx12 dx13 dx14 dx15
			dx16 dx17 dx18 dx19 dx20 dx21 dx22 dx23 dx24 dx25 dx26 {;
	replace DIC = 1 if (substr(`i',1,3) == "D65" | substr(`i',1,4) == "D688" | substr(`i',1,4) == "D689" | substr(`i',1,4) == "O723" );
}
;
#delimit cr
label variable DIC "DIC based on CDC ICD-9/ICD-10 codes"

gen eclampsia=0
#delimit ;
foreach i in dx1 dx2 dx3 dx4 dx5 dx6 dx7 dx8 dx9 dx10 dx11 dx12 dx13 dx14 dx15
			dx16 dx17 dx18 dx19 dx20 dx21 dx22 dx23 dx24 dx25 dx26 {;
	replace eclampsia = 1 if (substr(`i',1,5) == "O1500" | substr(`i',1,5) == "O1502" | substr(`i',1,5) == "O1503" | 
	substr(`i',1,4) == "O151" | substr(`i',1,4) == "O152" | substr(`i',1,4) == "O159" );
}
;
#delimit cr
label variable eclampsia "Eclampsia based on CDC ICD-9/ICD-10 codes"

gen HF=0
#delimit ;
foreach i in dx1 dx2 dx3 dx4 dx5 dx6 dx7 dx8 dx9 dx10 dx11 dx12 dx13 dx14 dx15
			dx16 dx17 dx18 dx19 dx20 dx21 dx22 dx23 dx24 dx25 dx26 {;
	replace HF = 1 if (substr(`i',1,6) == "I97120" | substr(`i',1,6) == "I97121" | substr(`i',1,6) == "I97130" | substr(`i',1,6) == "I97131" |
	substr(`i',1,6) == "I97710" | substr(`i',1,6) == "I97711");
}
;
#delimit cr
label variable HF "Heart failure during proc. or surgery based on CDC ICD-9/ICD-10 codes"

gen peur_cerb=0
#delimit ;
foreach i in dx1 dx2 dx3 dx4 dx5 dx6 dx7 dx8 dx9 dx10 dx11 dx12 dx13 dx14 dx15
			dx16 dx17 dx18 dx19 dx20 dx21 dx22 dx23 dx24 dx25 dx26 {;
	replace peur_cerb = 1 if (substr(`i',1,5) == "I6000" | substr(`i',1,5) == "I6001" | substr(`i',1,5) == "I6002" | 
	substr(`i',1,5) == "I6010" | substr(`i',1,5) == "I6011" | substr(`i',1,5) == "I6012" | substr(`i',1,4) == "I602" |
	substr(`i',1,5) == "I6020" | substr(`i',1,5) == "I6021" | substr(`i',1,5) == "I6022" | 
	substr(`i',1,5) == "I6030" | substr(`i',1,5) == "I6031" | substr(`i',1,5) == "I6032" | substr(`i',1,4) == "I604" |
	substr(`i',1,5) == "I6050" | substr(`i',1,5) == "I6051" | substr(`i',1,5) == "I6052" | substr(`i',1,4) == "I606" |
	substr(`i',1,4) == "I607" | substr(`i',1,4) == "I608" | substr(`i',1,4) == "I609" | 
	substr(`i',1,4) == "I611" | substr(`i',1,4) == "I612" | substr(`i',1,4) == "I613" | substr(`i',1,4) == "I614" |
	substr(`i',1,4) == "I615" | substr(`i',1,4) == "I616" | substr(`i',1,4) == "I618" | substr(`i',1,4) == "I619" |
	substr(`i',1,5) == "I6200" | substr(`i',1,5) == "I6201" | substr(`i',1,5) == "I6202" | substr(`i',1,5) == "I6203" |
	substr(`i',1,4) == "I621" | substr(`i',1,4) == "I629" | substr(`i',1,5) == "I6300" | substr(`i',1,6) == "I63011" | 
	substr(`i',1,6) == "I63012" | substr(`i',1,6) == "I63013" | substr(`i',1,6) == "I63019" | 
	substr(`i',1,5) == "I6302" | substr(`i',1,6) == "I63031" | substr(`i',1,6) == "I63032" | substr(`i',1,6) == "I63033" | 
	substr(`i',1,6) == "I63039" | substr(`i',1,5) == "I6309" | substr(`i',1,5) == "I6310" |
	substr(`i',1,6) == "I63111" | substr(`i',1,6) == "I63112" | substr(`i',1,6) == "I63113" | substr(`i',1,6) == "I63119" | 
	substr(`i',1,5) == "I6312" | substr(`i',1,6) == "I63131" | substr(`i',1,6) == "I63132" | 
	substr(`i',1,6) == "I63133" | substr(`i',1,6) == "I63139" | substr(`i',1,5) == "I6319" | substr(`i',1,5) == "I6320" | 
	substr(`i',1,6) == "I63211" | substr(`i',1,6) == "I63212" | substr(`i',1,6) == "I63213" |
	substr(`i',1,6) == "I63219" | substr(`i',1,5) == "I6322" | substr(`i',1,6) == "I63231" | substr(`i',1,6) == "I63232" | 
	substr(`i',1,6) == "I63233" | substr(`i',1,6) == "I63239" |
	substr(`i',1,5) == "I6329" | substr(`i',1,5) == "I6330" | substr(`i',1,6) == "I63311" | substr(`i',1,6) == "I63312" | 
	substr(`i',1,6) == "I63313" | substr(`i',1,6) == "I63319" |
    substr(`i',1,6) == "I63321" | substr(`i',1,6) == "I63322" | substr(`i',1,6) == "I63323" | substr(`i',1,6) == "I63329" |
	substr(`i',1,6) == "I63331" | substr(`i',1,6) == "I63332" | substr(`i',1,6) == "I63333" | substr(`i',1,6) == "I63339" |
	substr(`i',1,6) == "I63341" | substr(`i',1,6) == "I63342" | substr(`i',1,6) == "I63343" | substr(`i',1,6) == "I63349" |
	substr(`i',1,5) == "I6339" | substr(`i',1,5) == "I6340" | substr(`i',1,6) == "I63411" | substr(`i',1,6) == "I63412" | 
	substr(`i',1,6) == "I63413" | substr(`i',1,6) == "I63419" |
    substr(`i',1,6) == "I63421" | substr(`i',1,6) == "I63422" | substr(`i',1,6) == "I63423" | substr(`i',1,6) == "I63429" |
	substr(`i',1,6) == "I63431" | substr(`i',1,6) == "I63432" | substr(`i',1,6) == "I63433" | substr(`i',1,6) == "I63439" |
	substr(`i',1,6) == "I63441" | substr(`i',1,6) == "I63442" | substr(`i',1,6) == "I63443" | substr(`i',1,6) == "I63449" | 
	substr(`i',1,5) == "I6349" | substr(`i',1,5) == "I6350" |
	substr(`i',1,6) == "I63511" | substr(`i',1,6) == "I63512" | substr(`i',1,6) == "I63513" | substr(`i',1,6) == "I63519" |
	substr(`i',1,6) == "I63521" | substr(`i',1,6) == "I63522" | substr(`i',1,6) == "I63523" | substr(`i',1,6) == "I63529" |
	substr(`i',1,6) == "I63531" | substr(`i',1,6) == "I63532" | substr(`i',1,6) == "I63533" | substr(`i',1,6) == "I63539" | 
	substr(`i',1,6) == "I63541" | substr(`i',1,6) == "I63542" | substr(`i',1,6) == "I63543" | substr(`i',1,6) == "I63549" | 
	substr(`i',1,5) == "I6359" | substr(`i',1,4) == "I636" |
	substr(`i',1,4) == "I638" | substr(`i',1,4) == "I639" | substr(`i',1,5) == "I6501" | substr(`i',1,5) == "I6502" | 
	substr(`i',1,5) == "I6503" | substr(`i',1,5) == "I6509" |
	substr(`i',1,4) == "I651" | substr(`i',1,5) == "I6521" | substr(`i',1,5) == "I6522" | substr(`i',1,5) == "I6523" | 
	substr(`i',1,5) == "I6529" | substr(`i',1,4) == "I658" | substr(`i',1,4) == "I659" | 
	substr(`i',1,5) == "I6601" | substr(`i',1,5) == "I6602" | substr(`i',1,5) == "I6603" | substr(`i',1,5) == "I6609" | 
	substr(`i',1,5) == "I6611" | substr(`i',1,5) == "I6612" | substr(`i',1,5) == "I6613" | substr(`i',1,5) == "I6619" | 
	substr(`i',1,5) == "I6621" | substr(`i',1,5) == "I6622" | substr(`i',1,5) == "I6623" | substr(`i',1,5) == "I6629" | 
	substr(`i',1,4) == "I663" | substr(`i',1,4) == "I668" | substr(`i',1,4) == "I669" | substr(`i',1,4) == "I670" | substr(`i',1,4) == "I671" | substr(`i',1,4) == "I672" |
	substr(`i',1,4) == "I673" | substr(`i',1,4) == "I674" | substr(`i',1,4) == "I675" | substr(`i',1,4) == "I676" | substr(`i',1,4) == "I677" | substr(`i',1,5) == "I6781" |
	substr(`i',1,5) == "I6782" | substr(`i',1,5) == "I6783" | substr(`i',1,6) == "I67841" | substr(`i',1,6) == "I67848" | substr(`i',1,5) == "I6789" | substr(`i',1,4) == "I679" |
	substr(`i',1,4) == "I680" | substr(`i',1,4) == "I682" | substr(`i',1,4) == "I688" | substr(`i',1,5) == "O2251" | substr(`i',1,5) == "O2252" | substr(`i',1,5) == "O2253" |
	substr(`i',1,4) == "O873" | substr(`i',1,6) == "I97810" | substr(`i',1,6) == "I97811" | substr(`i',1,6) == "I97820" | substr(`i',1,6) == "I97821" );
}
;
#delimit cr
label variable peur_cerb "Peurperal cerebrovascular dis. based on CDC ICD-9/AIM ICD-10 codes"

gen pe=0
#delimit ;
foreach i in dx1 dx2 dx3 dx4 dx5 dx6 dx7 dx8 dx9 dx10 dx11 dx12 dx13 dx14 dx15
			dx16 dx17 dx18 dx19 dx20 dx21 dx22 dx23 dx24 dx25 dx26 {;
	replace pe = 1 if (substr(`i',1,4) == "J810" | substr(`i',1,4) == "I501" | substr(`i',1,5) == "I5020" | substr(`i',1,5) == "I5021" | substr(`i',1,5) == "I5023" | substr(`i',1,5) == "I5030" |
	substr(`i',1,5) == "I5031" | substr(`i',1,5) == "I5033" | substr(`i',1,5) == "I5040" | substr(`i',1,5) == "I5041" | substr(`i',1,5) == "I5043" | substr(`i',1,4) == "I509" );
}
;
#delimit cr
label variable pe "Acute Heart Failure/Pulmonary edema based on CDC ICD-9/AIM ICD-10 codes"

gen anes=0
#delimit ;
foreach i in dx1 dx2 dx3 dx4 dx5 dx6 dx7 dx8 dx9 dx10 dx11 dx12 dx13 dx14 dx15
			dx16 dx17 dx18 dx19 dx20 dx21 dx22 dx23 dx24 dx25 dx26 {;
	replace anaes = 1 if (substr(`i',1,4) == "O740" | substr(`i',1,4) == "O741" | substr(`i',1,4) == "O742" | substr(`i',1,4) == "O743" | substr(`i',1,5) == "O8901" | substr(`i',1,5) == "O8909" |
	substr(`i',1,4) == "O891" | substr(`i',1,4) == "O892" );
}
;
#delimit cr
label variable anaes "Severe anesthesia complications based on CDC ICD-9/ICD-10 codes"

gen sepsis=0
#delimit ;
foreach i in dx1 dx2 dx3 dx4 dx5 dx6 dx7 dx8 dx9 dx10 dx11 dx12 dx13 dx14 dx15
			dx16 dx17 dx18 dx19 dx20 dx21 dx22 dx23 dx24 dx25 dx26 {;
	replace sepsis = 1 if (substr(`i',1,3) == "O85" | substr(`i',1,7) == "T80211A" | substr(`i',1,7) == "T814XXA" | substr(`i',1,5) == "T8144" | substr(`i',1,7) == "T8144XA" | substr(`i',1,7) == "T8144XD" | substr(`i',1,7) == "T8144XS" |
	substr(`i',1,5) == "R6520" | substr(`i',1,4) == "A400" | substr(`i',1,4) == "A401" | substr(`i',1,4) == "A403" |
	substr(`i',1,4) == "A408" | substr(`i',1,4) == "A409" | substr(`i',1,5) == "A4101" | substr(`i',1,5) == "A4102" | 
	substr(`i',1,4) == "A411" | substr(`i',1,4) == "A412" | substr(`i',1,4) == "A413" | substr(`i',1,4) == "A414" | substr(`i',1,5) == "A4150" | substr(`i',1,5) == "A4151" |
	substr(`i',1,5) == "A4152" | substr(`i',1,5) == "A4153" | substr(`i',1,5) == "A4159" | substr(`i',1,5) == "A4181" | substr(`i',1,5) == "A4189" | substr(`i',1,4) == "A419" | substr(`i',1,4) == "A327" );
}
;
#delimit cr
label variable sepsis "Sepsis based on CDC ICD-9/ICD-10 codes"

gen shock=0
#delimit ;
foreach i in dx1 dx2 dx3 dx4 dx5 dx6 dx7 dx8 dx9 dx10 dx11 dx12 dx13 dx14 dx15
			dx16 dx17 dx18 dx19 dx20 dx21 dx22 dx23 dx24 dx25 dx26 {;
	replace shock = 1 if (substr(`i',1,4) == "O751" | substr(`i',1,4) == "R570" | substr(`i',1,4) == "R571" | substr(`i',1,4) == "R578" | substr(`i',1,4) == "R579" | 
	substr(`i',1,5) == "R6521" | substr(`i',1,7) == "T782XXA" | substr(`i',1,7) == "T882XXA" | substr(`i',1,7) == "T886XXA" | substr(`i',1,7) == "T8110XA" |
	substr(`i',1,7) == "T8111XA" | substr(`i',1,7) == "T8119XA" );
}
;
#delimit cr
label variable shock "Shock based on CDC ICD-9/ICD-10 codes"

gen SCA=0
#delimit ;
foreach i in dx1 dx2 dx3 dx4 dx5 dx6 dx7 dx8 dx9 dx10 dx11 dx12 dx13 dx14 dx15
			dx16 dx17 dx18 dx19 dx20 dx21 dx22 dx23 dx24 dx25 dx26 {;
	replace SCA = 1 if (substr(`i',1,5) == "D5700" | substr(`i',1,5) == "D5701" | substr(`i',1,5) == "D5702" | substr(`i',1,6) == "D57211" | substr(`i',1,6) == "D57212" | 
	substr(`i',1,6) == "D57219" | substr(`i',1,6) == "D57411" | substr(`i',1,6) == "D57412" | substr(`i',1,6) == "D57419" | substr(`i',1,6) == "D57811" | substr(`i',1,6) == "D57812" | substr(`i',1,6) == "D57819" );
}
;
#delimit cr
label variable SCA "Sickle cell disease with crisis based on CDC ICD-9/ICD-10 codes"
 
gen TE=0
#delimit ;
foreach i in dx1 dx2 dx3 dx4 dx5 dx6 dx7 dx8 dx9 dx10 dx11 dx12 dx13 dx14 dx15
			dx16 dx17 dx18 dx19 dx20 dx21 dx22 dx23 dx24 dx25 dx26 {;
	replace TE = 1 if (substr(`i',1,5) == "I2601" | substr(`i',1,5) == "I2602" | substr(`i',1,5) == "I2609" | substr(`i',1,5) == "I2690" | substr(`i',1,5) == "I2692" | substr(`i',1,5) == "I2699" | 
	substr(`i',1,6) == "O88011" | substr(`i',1,6) == "O88012" | substr(`i',1,6) == "O88013" | substr(`i',1,6) == "O88019" | substr(`i',1,5) == "O8802" | substr(`i',1,5) == "O8803" | substr(`i',1,6) == "O88211" |
	substr(`i',1,6) == "O88212" | substr(`i',1,6) == "O88213" | substr(`i',1,6) == "O88219" | substr(`i',1,5) == "O8822" | substr(`i',1,5) == "O8823" | substr(`i',1,6) == "O88311" |  
	substr(`i',1,6) == "O88312" | substr(`i',1,6) == "O88313" | substr(`i',1,6) == "O88319" | substr(`i',1,5) == "O8832"  | substr(`i',1,5) == "O8881" | substr(`i',1,5) == "O8882" | substr(`i',1,5) == "O8883" );
}
;
#delimit cr
label variable TE "Air and Thrombotic embolism based on CDC ICD-9/ICD-10 codes"

gen BT=0
#delimit ;
foreach i in sx1 sx2 sx3 sx4 sx5 sx6 sx7 sx8 sx9 sx10 sx11 sx12 sx13 sx14 sx15
			sx16 sx17 sx18 sx19 sx20 sx21 sx22 sx23 sx24 sx25 {;
	replace BT = 1 if (substr(`i',1,7) == "30233H1" | substr(`i',1,7) == "30233K1" |
	substr(`i',1,7) == "30233L1" | substr(`i',1,7) == "30233M1" | substr(`i',1,7) == "30233N1" |
	substr(`i',1,7) == "30233P1" | substr(`i',1,7) == "30233R1" | substr(`i',1,7) == "30233T1" |
	substr(`i',1,7) == "30240H1" | substr(`i',1,7) == "30240K1" |
	substr(`i',1,7) == "30240L1" | substr(`i',1,7) == "30240M1" | substr(`i',1,7) == "30240N1" |
	substr(`i',1,7) == "30240P1" | substr(`i',1,7) == "30240R1" | substr(`i',1,7) == "30240T1" |
	substr(`i',1,7) == "30243H1" | substr(`i',1,7) == "30243K1" |
	substr(`i',1,7) == "30243L1" | substr(`i',1,7) == "30243M1" | substr(`i',1,7) == "30243N1" |
	substr(`i',1,7) == "30243P1" | substr(`i',1,7) == "30243R1" | substr(`i',1,7) == "30243T1" |
	substr(`i',1,7) == "30233N0" | substr(`i',1,7) == "30233P0" |
	substr(`i',1,7) == "30240N0" | substr(`i',1,7) == "30240P0" | substr(`i',1,7) == "30243N0" | substr(`i',1,7) == "30243P0" );
}
;
#delimit cr
label variable BT "Blood transfusion procedure based on CDC ICD-9/ICD-10 codes"

gen CCR=0
#delimit ;
foreach i in sx1 sx2 sx3 sx4 sx5 sx6 sx7 sx8 sx9 sx10 sx11 sx12 sx13 sx14 sx15
			sx16 sx17 sx18 sx19 sx20 sx21 sx22 sx23 sx24 sx25 {;
	replace CCR = 1 if (substr(`i',1,7) == "5A2204Z" | substr(`i',1,7) == "5A12012" );
}
;
#delimit cr
label variable CCR "Conversion of cardiac rhythm procedure based on CDC ICD-9/ICD-10 codes"

gen Hysterectomy=0
#delimit ;
foreach i in sx1 sx2 sx3 sx4 sx5 sx6 sx7 sx8 sx9 sx10 sx11 sx12 sx13 sx14 sx15
			sx16 sx17 sx18 sx19 sx20 sx21 sx22 sx23 sx24 sx25 {;
	replace Hysterectomy = 1 if (substr(`i',1,7) == "0UT90ZZ" | substr(`i',1,7) == "0UT94ZZ" | substr(`i',1,7) == "0UT97ZZ" | substr(`i',1,7) == "0UT98ZZ" | substr(`i',1,7) == "0UT9FZZ" );
}
;
#delimit cr
label variable Hysterectomy "Hysterectomy procedure based on CDC ICD-9/ICD-10 codes"

gen TempTracheostomy=0
#delimit ;
foreach i in sx1 sx2 sx3 sx4 sx5 sx6 sx7 sx8 sx9 sx10 sx11 sx12 sx13 sx14 sx15
			sx16 sx17 sx18 sx19 sx20 sx21 sx22 sx23 sx24 sx25 {;
	replace TempTracheostomy = 1 if (substr(`i',1,7) == "0B110Z4" | substr(`i',1,7) == "0B110F4" | substr(`i',1,7) == "0B113Z4" | 
	substr(`i',1,7) == "0B113F4" | substr(`i',1,7) == "0B114Z4" | substr(`i',1,7) == "0B114F4" );
}
;
#delimit cr
label variable TempTracheostomy "Temp. Tracheostomy procedure based on CDC ICD-9/ICD-10 codes"

gen Ventilation=0
#delimit ;
foreach i in sx1 sx2 sx3 sx4 sx5 sx6 sx7 sx8 sx9 sx10 sx11 sx12 sx13 sx14 sx15
			sx16 sx17 sx18 sx19 sx20 sx21 sx22 sx23 sx24 sx25 {;
	replace Ventilation = 1 if (substr(`i',1,7) == "5A1935Z" | substr(`i',1,7) == "5A1945Z" | substr(`i',1,7) == "5A1955Z" );
}
;
#delimit cr
label variable Ventilation "Ventilation procedure based on CDC ICD-9/ICD-10 codes"


***Maternal death;
tab pat_status, missing
generate mat_death=0
replace mat_death=1 if (pat_status=="20" | pat_status=="40" | pat_status=="41" | pat_status=="42")
replace mat_death=. if  pat_status=="" 
replace mat_death=. if  pat_status=="`" 
*replace mat_death=1 if pat_status==20 | pat_status==40 | pat_status==41 | pat_status==42
*replace mat_death=. if  pat_status==.
label variable mat_death "maternal death"
label value mat_death yn
tab mat_death, missing

***To indicate women transferred from a facility and/or dies during hospitalization;
tab source_of_admission, missing
tab pat_status, missing
gen SMM_transfer_mortality=0 
replace SMM_transfer_mortality=1 if source_of_admission=="4" 
replace SMM_transfer_mortality=1 if (pat_status=="20" | pat_status=="41")
*replace SMM_transfer_mortality=1 if pat_status==20 | pat_status==41
label variable SMM_transfer_mortality "Flag for women who died and/or was transfered from a facility"
*label define yn 0 "no" 1 "yes"
label value SMM_transfer_mortality yn
tab SMM_transfer_mortality, missing

***To indicate women transferred from a facility during hospitalization;
tab source_of_admission, missing
gen SMM_transfer=0 
replace SMM_transfer=1 if source_of_admission=="4" 
label variable SMM_transfer "Flag for women who were transfered from a facility"
label value SMM_transfer yn
tab SMM_transfer, missing

***To indicate women whose length of stay >3 for VD and >4 for CD (not aplicable to those with procedure codes-similar to Callaghan 2012 suggestion);
tab hosp_stay if delv_route==0, missing
tab hosp_stay if delv_route==1, missing
gen flag_hospstay=0 
replace flag_hospstay=1 if delv_route==0 & (hosp_stay>3 & hosp_stay<.)
replace flag_hospstay=1 if delv_route==1 & (hosp_stay>4 & hosp_stay<.) 
replace flag_hospstay=1 if (BT==1 | CCR==1 | Hysterectomy==1 | TempTracheostomy==1 | Ventilation==1) 
label variable flag_hospstay "Flag women who had hosp stay>3 for VD / hosp stay>4 for CD, not applicable to proc codes"
label value flag_hospstay yn
tab flag_hospstay, missing

***Flag for Conservative estimate of SMM based on Callaghan 2012 criteria;
gen SMM_flag=0 
replace SMM_flag=1 if flag_hospstay==1 
replace SMM_flag=1 if SMM_transfer_mortality==1 
tab SMM_flag, missing
tab flag_hospstay if SMM_flag==1, missing
tab SMM_transfer_mortality if SMM_flag==1 & flag_hospstay==0, missing
tab SMM_transfer_mortality if SMM_flag==1, missing
label variable SMM_flag "Flag for conservative estimate of SMM based on Callaghan 2012 paper"
label value SMM_flag yn
tab SMM_flag, missing

**Whether or not CDC ICD-9/ICD-10 SMM numerator codes present;
gen SMM_num_callaghan= 0 
replace SMM_num_callaghan=1 if (acuteMI==1 | ARF==1 | ARDS==1 | AFE==1 | Aneur==1 | card_arrest==1 | DIC==1 | eclampsia==1 | HF==1 | peur_cerb==1 | pe==1 | anaes==1 | sepsis==1 | shock==1 | SCA==1 | TE==1 | BT==1 | CCR==1 | Hysterectomy==1 | TempTracheostomy==1 | Ventilation==1) & SMM_flag==1 
label variable SMM_num_callaghan "CDC SMM definition based on ICD-9/ICD-10 codes"
tab SMM_num_callaghan, missing


*****SMM measure calculation based on Alliance for Innovation on Maternal Health (AIM) coding (https://safehealthcareforeverywoman.org/aim-data/):
***SMM measure (based on AIM coding);
gen acuteMI_AIM=0 
#delimit ;
foreach i in dx1 dx2 dx3 dx4 dx5 dx6 dx7 dx8 dx9 dx10 dx11 dx12 dx13 dx14 dx15
			dx16 dx17 dx18 dx19 dx20 dx21 dx22 dx23 dx24 dx25 dx26 {;
	replace acuteMI_AIM = 1 if (substr(`i',1,5) == "I2101" | substr(`i',1,5) == "I2102" |
	substr(`i',1,5) == "I2109" | substr(`i',1,5) == "I2111" | substr(`i',1,5) == "I2119" |
	substr(`i',1,5) == "I2121" | substr(`i',1,5) == "I2129" | substr(`i',1,4) == "I213" |
	substr(`i',1,4) == "I214" | substr(`i',1,4) == "I219" | substr(`i',1,5) == "I21A1" |
	substr(`i',1,5) == "I21A9" | substr(`i',1,4) == "I220" | substr(`i',1,4) == "I221" |
	substr(`i',1,4) == "I222" | substr(`i',1,4) == "I228" | substr(`i',1,4) == "I229");
}
;
#delimit cr
label variable acuteMI_AIM "Acute MI based on AIM ICD-9/ICD-10 codes"

gen ARF_AIM=0 
#delimit ;
foreach i in dx1 dx2 dx3 dx4 dx5 dx6 dx7 dx8 dx9 dx10 dx11 dx12 dx13 dx14 dx15
			dx16 dx17 dx18 dx19 dx20 dx21 dx22 dx23 dx24 dx25 dx26 {;
	replace ARF_AIM = 1 if (substr(`i',1,4) == "N170" | substr(`i',1,4) == "N171" |
	substr(`i',1,4) == "N172" | substr(`i',1,4) == "N178" | substr(`i',1,4) == "N179" | substr(`i',1,4) == "O904");
}
;
#delimit cr
label variable ARF_AIM "Acute renal failure based on AIM ICD-9/ICD-10 codes"

gen ARDS_AIM=0 
#delimit ;
foreach i in dx1 dx2 dx3 dx4 dx5 dx6 dx7 dx8 dx9 dx10 dx11 dx12 dx13 dx14 dx15
			dx16 dx17 dx18 dx19 dx20 dx21 dx22 dx23 dx24 dx25 dx26 {;
	replace ARDS_AIM = 1 if (substr(`i',1,3) == "J80" | substr(`i',1,4) == "J951" |
	substr(`i',1,4) == "J952" | substr(`i',1,4) == "J953" | substr(`i',1,6) == "J95821" |
	substr(`i',1,6) == "J95822 " | substr(`i',1,5) == "J9600" | substr(`i',1,5) == "J9601" |
	substr(`i',1,5) == "J9602" | substr(`i',1,5) == "J9620" | substr(`i',1,5) == "J9621" |
	substr(`i',1,5) == "J9622" | substr(`i',1,4) == "R092" );
}
;
#delimit cr
label variable ARDS_AIM "Adult resp. distress syndrome based on AIM ICD-9/ICD-10 codes"

gen AFE_AIM=0
#delimit ;
foreach i in dx1 dx2 dx3 dx4 dx5 dx6 dx7 dx8 dx9 dx10 dx11 dx12 dx13 dx14 dx15
			dx16 dx17 dx18 dx19 dx20 dx21 dx22 dx23 dx24 dx25 dx26 {;
	replace AFE_AIM = 1 if (substr(`i',1,6) == "O88111" | substr(`i',1,6) == "O88112" |
	substr(`i',1,6) == "O88113" | substr(`i',1,6) == "O88119" | substr(`i',1,5) == "O8812" | substr(`i',1,5) == "O8813" );
}
;
#delimit cr
label variable AFE_AIM "Amniotic fluid embolism based on AIM ICD-9/ICD-10 codes"

gen Aneur_AIM=0 
#delimit ;
foreach i in dx1 dx2 dx3 dx4 dx5 dx6 dx7 dx8 dx9 dx10 dx11 dx12 dx13 dx14 dx15
			dx16 dx17 dx18 dx19 dx20 dx21 dx22 dx23 dx24 dx25 dx26 {;
	replace Aneur_AIM = 1 if (substr(`i',1,5) == "I7100" | substr(`i',1,5) == "I7101" | substr(`i',1,5) == "I7102" | substr(`i',1,5) == "I7103" |
	substr(`i',1,4) == "I711" | substr(`i',1,4) == "I712" | substr(`i',1,4) == "I713" | substr(`i',1,4) == "I714" | 
	substr(`i',1,4) == "I715" | substr(`i',1,4) == "I716" | substr(`i',1,4) == "I718" | substr(`i',1,4) == "I719" | substr(`i',1,4) == "I790" );
}
;
#delimit cr
label variable Aneur_AIM "Aneurysm based on AIM ICD-9/ICD-10 codes"

gen card_arrest_AIM=0
#delimit ;
foreach i in dx1 dx2 dx3 dx4 dx5 dx6 dx7 dx8 dx9 dx10 dx11 dx12 dx13 dx14 dx15
			dx16 dx17 dx18 dx19 dx20 dx21 dx22 dx23 dx24 dx25 dx26 {;
	replace card_arrest_AIM = 1 if (substr(`i',1,5) == "I4901" | substr(`i',1,5) == "I4902" | substr(`i',1,4) == "I462" | 
	substr(`i',1,4) == "I468" | substr(`i',1,4) == "I469" );
}
;
#delimit cr
label variable card_arrest_AIM "cardiac arrest/VF based on AIM ICD-9/ICD-10 codes"

gen DIC_AIM=0
#delimit ;
foreach i in dx1 dx2 dx3 dx4 dx5 dx6 dx7 dx8 dx9 dx10 dx11 dx12 dx13 dx14 dx15
			dx16 dx17 dx18 dx19 dx20 dx21 dx22 dx23 dx24 dx25 dx26 {;
	replace DIC_AIM = 1 if (substr(`i',1,3) == "D65" | substr(`i',1,4) == "D688" | substr(`i',1,4) == "D689" | substr(`i',1,4) == "O723" );
}
;
#delimit cr
label variable DIC_AIM "DIC based on AIM ICD-9/ICD-10 codes"

gen eclampsia_AIM=0
#delimit ;
foreach i in dx1 dx2 dx3 dx4 dx5 dx6 dx7 dx8 dx9 dx10 dx11 dx12 dx13 dx14 dx15
			dx16 dx17 dx18 dx19 dx20 dx21 dx22 dx23 dx24 dx25 dx26 {;
	replace eclampsia_AIM = 1 if (substr(`i',1,5) == "O1500" | substr(`i',1,5) == "O1502" | substr(`i',1,5) == "O1503" | 
	substr(`i',1,4) == "O151" | substr(`i',1,4) == "O152" | substr(`i',1,4) == "O159" ) ;
}
;
#delimit cr
label variable eclampsia_AIM "Eclampsia based on AIM ICD-9/ICD-10 codes"

gen HF_AIM=0 
#delimit ;
foreach i in dx1 dx2 dx3 dx4 dx5 dx6 dx7 dx8 dx9 dx10 dx11 dx12 dx13 dx14 dx15
			dx16 dx17 dx18 dx19 dx20 dx21 dx22 dx23 dx24 dx25 dx26 {;
	replace HF_AIM = 1 if (substr(`i',1,6) == "I97120" | substr(`i',1,6) == "I97121" | substr(`i',1,6) == "I97130" | substr(`i',1,6) == "I97131" ) ;
}
;
#delimit cr
label variable HF_AIM "Heart failure during proc. or surgery based on AIM ICD-9/ICD-10 codes"

gen peur_cerb_AIM=0 
#delimit ;
foreach i in dx1 dx2 dx3 dx4 dx5 dx6 dx7 dx8 dx9 dx10 dx11 dx12 dx13 dx14 dx15
			dx16 dx17 dx18 dx19 dx20 dx21 dx22 dx23 dx24 dx25 dx26 {;
	replace peur_cerb_AIM = 1 if (substr(`i',1,5) == "I6000" | substr(`i',1,5) == "I6001" | substr(`i',1,5) == "I6002" | 
	substr(`i',1,5) == "I6010" | substr(`i',1,5) == "I6011" | substr(`i',1,5) == "I6012" | substr(`i',1,4) == "I602" |
	substr(`i',1,5) == "I6020" | substr(`i',1,5) == "I6021" | substr(`i',1,5) == "I6022" | 
	substr(`i',1,5) == "I6030" | substr(`i',1,5) == "I6031" | substr(`i',1,5) == "I6032" | substr(`i',1,4) == "I604" |
	substr(`i',1,5) == "I6050" | substr(`i',1,5) == "I6051" | substr(`i',1,5) == "I6052" | substr(`i',1,4) == "I606" |
	substr(`i',1,4) == "I607" | substr(`i',1,4) == "I608" | substr(`i',1,4) == "I609" | substr(`i',1,4) == "I610" |
	substr(`i',1,4) == "I611" | substr(`i',1,4) == "I612" | substr(`i',1,4) == "I613" | substr(`i',1,4) == "I614" |
	substr(`i',1,4) == "I615" | substr(`i',1,4) == "I616" | substr(`i',1,4) == "I618" | substr(`i',1,4) == "I619" |
	substr(`i',1,5) == "I6200" | substr(`i',1,5) == "I6201" | substr(`i',1,5) == "I6202" | substr(`i',1,5) == "I6203" |
	substr(`i',1,4) == "I621" | substr(`i',1,4) == "I629" | substr(`i',1,5) == "I6300" | substr(`i',1,6) == "I63011" | 
	substr(`i',1,6) == "I63012" | substr(`i',1,6) == "I63013" | substr(`i',1,6) == "I63019" | 
	substr(`i',1,5) == "I6302" | substr(`i',1,6) == "I63031" | substr(`i',1,6) == "I63032" | substr(`i',1,6) == "I63033" | 
	substr(`i',1,6) == "I63039" | substr(`i',1,5) == "I6309" | substr(`i',1,5) == "I6310" |
	substr(`i',1,6) == "I63111" | substr(`i',1,6) == "I63112" | substr(`i',1,6) == "I63113" | substr(`i',1,6) == "I63119" | 
	substr(`i',1,5) == "I6312" | substr(`i',1,6) == "I63131" | substr(`i',1,6) == "I63132" | 
	substr(`i',1,6) == "I63133" | substr(`i',1,6) == "I63139" | substr(`i',1,5) == "I6319" | substr(`i',1,5) == "I6320" | 
	substr(`i',1,6) == "I63211" | substr(`i',1,6) == "I63212" | substr(`i',1,6) == "I63213" |
	substr(`i',1,6) == "I63219" | substr(`i',1,5) == "I6322" | substr(`i',1,6) == "I63231" | substr(`i',1,6) == "I63232" | 
	substr(`i',1,6) == "I63233" | substr(`i',1,6) == "I63239" |
	substr(`i',1,5) == "I6329" | substr(`i',1,5) == "I6330" | substr(`i',1,6) == "I63311" | substr(`i',1,6) == "I63312" | 
	substr(`i',1,6) == "I63313" | substr(`i',1,6) == "I63319" |
    substr(`i',1,6) == "I63321" | substr(`i',1,6) == "I63322" | substr(`i',1,6) == "I63323" | substr(`i',1,6) == "I63329" |
	substr(`i',1,6) == "I63331" | substr(`i',1,6) == "I63332" | substr(`i',1,6) == "I63333" | substr(`i',1,6) == "I63339" |
	substr(`i',1,6) == "I63341" | substr(`i',1,6) == "I63342" | substr(`i',1,6) == "I63343" | substr(`i',1,6) == "I63349" |
	substr(`i',1,5) == "I6339" | substr(`i',1,5) == "I6340" | substr(`i',1,6) == "I63411" | substr(`i',1,6) == "I63412" | 
	substr(`i',1,6) == "I63413" | substr(`i',1,6) == "I63419" |
    substr(`i',1,6) == "I63421" | substr(`i',1,6) == "I63422" | substr(`i',1,6) == "I63423" | substr(`i',1,6) == "I63429" |
	substr(`i',1,6) == "I63431" | substr(`i',1,6) == "I63432" | substr(`i',1,6) == "I63433" | substr(`i',1,6) == "I63439" |
	substr(`i',1,6) == "I63441" | substr(`i',1,6) == "I63442" | substr(`i',1,6) == "I63443" | substr(`i',1,6) == "I63449" | 
	substr(`i',1,5) == "I6349" | substr(`i',1,5) == "I6350" |
	substr(`i',1,6) == "I63511" | substr(`i',1,6) == "I63512" | substr(`i',1,6) == "I63513" | substr(`i',1,6) == "I63519" |
	substr(`i',1,6) == "I63521" | substr(`i',1,6) == "I63522" | substr(`i',1,6) == "I63523" | substr(`i',1,6) == "I63529" |
	substr(`i',1,6) == "I63531" | substr(`i',1,6) == "I63532" | substr(`i',1,6) == "I63533" | substr(`i',1,6) == "I63539" | 
	substr(`i',1,6) == "I63541" | substr(`i',1,6) == "I63542" | substr(`i',1,6) == "I63543" | substr(`i',1,6) == "I63549" | 
	substr(`i',1,5) == "I6359" | substr(`i',1,4) == "I636" |
	substr(`i',1,4) == "I638" | substr(`i',1,4) == "I639" | substr(`i',1,5) == "I6501" | substr(`i',1,5) == "I6502" | 
	substr(`i',1,5) == "I6503" | substr(`i',1,5) == "I6509" |
	substr(`i',1,4) == "I651" | substr(`i',1,5) == "I6521" | substr(`i',1,5) == "I6522" | substr(`i',1,5) == "I6523" | 
	substr(`i',1,5) == "I6529" | substr(`i',1,4) == "I658" | substr(`i',1,4) == "I659" | 
	substr(`i',1,5) == "I6601" | substr(`i',1,5) == "I6602" | substr(`i',1,5) == "I6603" | substr(`i',1,5) == "I6609" | 
	substr(`i',1,5) == "I6611" | substr(`i',1,5) == "I6612" | substr(`i',1,5) == "I6613" | substr(`i',1,5) == "I6619" | 
	substr(`i',1,5) == "I6621" | substr(`i',1,5) == "I6622" | substr(`i',1,5) == "I6623" | substr(`i',1,5) == "I6629" | 
	substr(`i',1,4) == "I663" | substr(`i',1,4) == "I668" | substr(`i',1,4) == "I669" | substr(`i',1,4) == "I670" | substr(`i',1,4) == "I671" | substr(`i',1,4) == "I672" |
	substr(`i',1,4) == "I673" | substr(`i',1,4) == "I674" | substr(`i',1,4) == "I675" | substr(`i',1,4) == "I676" | substr(`i',1,4) == "I677" | substr(`i',1,5) == "I6781" |
	substr(`i',1,5) == "I6782" | substr(`i',1,5) == "I6783" | substr(`i',1,6) == "I67841" | substr(`i',1,6) == "I67848" | substr(`i',1,5) == "I6789" | substr(`i',1,4) == "I679" |
	substr(`i',1,4) == "I680" | substr(`i',1,4) == "I682" | substr(`i',1,4) == "I688" | substr(`i',1,5) == "O2251" | substr(`i',1,5) == "O2252" | substr(`i',1,5) == "O2253" |
	substr(`i',1,4) == "O873" | substr(`i',1,6) == "I97810" | substr(`i',1,6) == "I97811" | substr(`i',1,6) == "I97820" | substr(`i',1,6) == "I97821" ) ;
}
;
#delimit cr
label variable peur_cerb_AIM "Peurperal cerebrovascular dis. based on ICD-9/AIM ICD-10 codes"

gen pe_AIM=0 
#delimit ;
foreach i in dx1 dx2 dx3 dx4 dx5 dx6 dx7 dx8 dx9 dx10 dx11 dx12 dx13 dx14 dx15
			dx16 dx17 dx18 dx19 dx20 dx21 dx22 dx23 dx24 dx25 dx26 {;
	replace pe_AIM = 1 if (substr(`i',1,4) == "J810" | substr(`i',1,4) == "I501" | substr(`i',1,5) == "I5020" | substr(`i',1,5) == "I5021" | substr(`i',1,5) == "I5023" | substr(`i',1,5) == "I5030" |
	substr(`i',1,5) == "I5031" | substr(`i',1,5) == "I5033" | substr(`i',1,5) == "I5040" | substr(`i',1,5) == "I5041" | substr(`i',1,5) == "I5043" | substr(`i',1,4) == "I509" );
}
;
#delimit cr
label variable pe_AIM "Acute Heart Failure/Pulmonary edema based on ICD-9/AIM ICD-10 codes"

gen anaes_AIM=0 
#delimit ;
foreach i in dx1 dx2 dx3 dx4 dx5 dx6 dx7 dx8 dx9 dx10 dx11 dx12 dx13 dx14 dx15
			dx16 dx17 dx18 dx19 dx20 dx21 dx22 dx23 dx24 dx25 dx26 {;
	replace anaes_AIM = 1 if (substr(`i',1,4) == "O740" | substr(`i',1,4) == "O741" | substr(`i',1,4) == "O742" | substr(`i',1,4) == "O743" | substr(`i',1,5) == "O8901" | substr(`i',1,5) == "O8909" |
	substr(`i',1,4) == "O891" | substr(`i',1,4) == "O892" ) ;
}
;
#delimit cr
label variable anaes_AIM "Severe anesthesia complications based on ICD-9/AIM ICD-10 codes"

gen sepsis_AIM=0 
#delimit ;
foreach i in dx1 dx2 dx3 dx4 dx5 dx6 dx7 dx8 dx9 dx10 dx11 dx12 dx13 dx14 dx15
			dx16 dx17 dx18 dx19 dx20 dx21 dx22 dx23 dx24 dx25 dx26 {;
	replace sepsis_AIM = 1 if (substr(`i',1,3) == "O85" | substr(`i',1,7) == "T80211A" | substr(`i',1,7) == "T814XXA" | 
	substr(`i',1,5) == "R6520" | substr(`i',1,4) == "A400" | substr(`i',1,4) == "A401" | substr(`i',1,4) == "A403" |
	substr(`i',1,4) == "A408" | substr(`i',1,4) == "A409" | substr(`i',1,5) == "A4101" | substr(`i',1,5) == "A4102" | 
	substr(`i',1,4) == "A411" | substr(`i',1,4) == "A412" | substr(`i',1,4) == "A413" | substr(`i',1,4) == "A414" | substr(`i',1,5) == "A4150" | substr(`i',1,5) == "A4151" |
	substr(`i',1,5) == "A4152" | substr(`i',1,5) == "A4153" | substr(`i',1,5) == "A4159" | substr(`i',1,5) == "A4181" | substr(`i',1,5) == "A4189" | substr(`i',1,4) == "A419" | substr(`i',1,4) == "A327" ) ;
}
;
#delimit cr
label variable sepsis_AIM "Sepsis based on AIM ICD-9/ICD-10 codes"

gen shock_AIM=0 
#delimit ;
foreach i in dx1 dx2 dx3 dx4 dx5 dx6 dx7 dx8 dx9 dx10 dx11 dx12 dx13 dx14 dx15
			dx16 dx17 dx18 dx19 dx20 dx21 dx22 dx23 dx24 dx25 dx26 {;
	replace shock_AIM = 1 if (substr(`i',1,4) == "O751" | substr(`i',1,4) == "R570" | substr(`i',1,4) == "R571" | substr(`i',1,4) == "R578" | substr(`i',1,4) == "R579" | 
	substr(`i',1,5) == "R6521" | substr(`i',1,7) == "T782XXA" | substr(`i',1,7) == "T882XXA" | substr(`i',1,7) == "T886XXA" | substr(`i',1,7) == "T8110XA" |
	substr(`i',1,7) == "T8111XA" | substr(`i',1,7) == "T8119XA" ) ;
}
;
#delimit cr
label variable shock_AIM "Shock based on AIM ICD-9/ICD-10 codes"

gen SCA_AIM=0
#delimit ;
foreach i in dx1 dx2 dx3 dx4 dx5 dx6 dx7 dx8 dx9 dx10 dx11 dx12 dx13 dx14 dx15
			dx16 dx17 dx18 dx19 dx20 dx21 dx22 dx23 dx24 dx25 dx26 {;
	replace SCA_AIM = 1 if (substr(`i',1,5) == "D5700" | substr(`i',1,5) == "D5701" | substr(`i',1,5) == "D5702" | substr(`i',1,6) == "D57211" | substr(`i',1,6) == "D57212" | 
	substr(`i',1,6) == "D57219" | substr(`i',1,6) == "D57411" | substr(`i',1,6) == "D57412" | substr(`i',1,6) == "D57419" | substr(`i',1,6) == "D57811" | substr(`i',1,6) == "D57812" | substr(`i',1,6) == "D57819" ) ;
}
;
#delimit cr
label variable SCA_AIM "Sickle cell disease with crisis based on AIM ICD-9/ICD-10 codes"
 
gen TE_AIM=0 
#delimit ;
foreach i in dx1 dx2 dx3 dx4 dx5 dx6 dx7 dx8 dx9 dx10 dx11 dx12 dx13 dx14 dx15
			dx16 dx17 dx18 dx19 dx20 dx21 dx22 dx23 dx24 dx25 dx26 {;
	replace TE_AIM = 1 if (substr(`i',1,5) == "I2601" | substr(`i',1,5) == "I2602" | substr(`i',1,5) == "I2609" | substr(`i',1,5) == "I2690" | substr(`i',1,5) == "I2692" | substr(`i',1,5) == "I2699" | 
	substr(`i',1,6) == "O88011" | substr(`i',1,6) == "O88012" | substr(`i',1,6) == "O88013" | substr(`i',1,6) == "O88019" | substr(`i',1,5) == "O8802" | substr(`i',1,5) == "O8803" | substr(`i',1,6) == "O88211" |
	substr(`i',1,6) == "O88212" | substr(`i',1,6) == "O88213" | substr(`i',1,6) == "O88219" | substr(`i',1,5) == "O8822" | substr(`i',1,5) == "O8823" | substr(`i',1,6) == "O88311" |  
	substr(`i',1,6) == "O88312" | substr(`i',1,6) == "O88313" | substr(`i',1,6) == "O88319" | substr(`i',1,5) == "O8832" | substr(`i',1,6) == "O88811" | substr(`i',1,6) == "O88812" | substr(`i',1,6) == "O88813" |
	substr(`i',1,6) == "O88819" | substr(`i',1,5) == "O8882" | substr(`i',1,5) == "O8883" ) ;
}
;
#delimit cr
label variable TE_AIM "Air and Thrombotic embolism based on AIM ICD-9/ICD-10 codes"

gen BT_AIM=0 
#delimit ;
foreach i in sx1 sx2 sx3 sx4 sx5 sx6 sx7 sx8 sx9 sx10 sx11 sx12 sx13 sx14 sx15
			sx16 sx17 sx18 sx19 sx20 sx21 sx22 sx23 sx24 sx25 {;
	replace BT_AIM = 1 if (substr(`i',1,7) == "30233H1" | substr(`i',1,7) == "30233K1" |
	substr(`i',1,7) == "30233L1" | substr(`i',1,7) == "30233M1" | substr(`i',1,7) == "30233N1" |
	substr(`i',1,7) == "30233P1" | substr(`i',1,7) == "30233R1" | substr(`i',1,7) == "30233T1" |
	substr(`i',1,7) == "30240H1" | substr(`i',1,7) == "30240K1" |
	substr(`i',1,7) == "30240L1" | substr(`i',1,7) == "30240M1" | substr(`i',1,7) == "30240N1" |
	substr(`i',1,7) == "30240P1" | substr(`i',1,7) == "30240R1" | substr(`i',1,7) == "30240T1" |
	substr(`i',1,7) == "30243H1" | substr(`i',1,7) == "30243K1" |
	substr(`i',1,7) == "30243L1" | substr(`i',1,7) == "30243M1" | substr(`i',1,7) == "30243N1" |
	substr(`i',1,7) == "30243P1" | substr(`i',1,7) == "30243R1" | substr(`i',1,7) == "30243T1" |
	substr(`i',1,7) == "30233N0" | substr(`i',1,7) == "30233P0" |
	substr(`i',1,7) == "30240N0" | substr(`i',1,7) == "30240P0" | substr(`i',1,7) == "30243N0" | substr(`i',1,7) == "30243P0" ) ;
}
;
#delimit cr
label variable BT_AIM "Blood transfusion procedure based on AIM ICD-9/ICD-10 codes"

gen CCR_AIM=0 
#delimit ;
foreach i in sx1 sx2 sx3 sx4 sx5 sx6 sx7 sx8 sx9 sx10 sx11 sx12 sx13 sx14 sx15
			sx16 sx17 sx18 sx19 sx20 sx21 sx22 sx23 sx24 sx25 {;
	replace CCR_AIM = 1 if (substr(`i',1,7) == "5A2204Z" | substr(`i',1,7) == "5A12012" );
}
;
#delimit cr
label variable CCR_AIM "Conversion of cardiac rhythm procedure based on AIM ICD-9/ICD-10 codes"

gen Hysterectomy_AIM=0
#delimit ;
foreach i in sx1 sx2 sx3 sx4 sx5 sx6 sx7 sx8 sx9 sx10 sx11 sx12 sx13 sx14 sx15
			sx16 sx17 sx18 sx19 sx20 sx21 sx22 sx23 sx24 sx25 {;
	replace Hysterectomy_AIM = 1 if (substr(`i',1,7) == "0UT90ZZ" | substr(`i',1,7) == "0UT94ZZ" | substr(`i',1,7) == "0UT97ZZ" | substr(`i',1,7) == "0UT98ZZ" | substr(`i',1,7) == "0UT9FZZ" ) ;
}
;
#delimit cr
label variable Hysterectomy_AIM "Hysterectomy procedure based on AIM ICD-9/ICD-10 codes"

gen TempTracheostomy_AIM=0 
#delimit ;
foreach i in sx1 sx2 sx3 sx4 sx5 sx6 sx7 sx8 sx9 sx10 sx11 sx12 sx13 sx14 sx15
			sx16 sx17 sx18 sx19 sx20 sx21 sx22 sx23 sx24 sx25 {;
	replace TempTracheostomy_AIM = 1 if (substr(`i',1,7) == "0B110Z4" | substr(`i',1,7) == "0B110F4" | substr(`i',1,7) == "0B113Z4" | 
	substr(`i',1,7) == "0B113F4" | substr(`i',1,7) == "0B114Z4" | substr(`i',1,7) == "0B114F4" ) ;
}
;
#delimit cr
label variable TempTracheostomy_AIM "Temp. Tracheostomy procedure based on AIM ICD-9/ICD-10 codes"

gen Ventilation_AIM=0 
#delimit ;
foreach i in sx1 sx2 sx3 sx4 sx5 sx6 sx7 sx8 sx9 sx10 sx11 sx12 sx13 sx14 sx15
			sx16 sx17 sx18 sx19 sx20 sx21 sx22 sx23 sx24 sx25 {;
	replace Ventilation_AIM = 1 if (substr(`i',1,7) == "5A1935Z" | substr(`i',1,7) == "5A1945Z" | substr(`i',1,7) == "5A1955Z" ) ;
}
;
#delimit cr
label variable Ventilation_AIM "Ventilation procedure based on AIM ICD-9/ICD-10 codes"

**Whether or not AIM ICD-9/ICD-10 SMM numerator codes present;
gen SMM_num= 0 
replace SMM_num=1 if (acuteMI_AIM==1 | ARF_AIM==1 | ARDS_AIM==1 | AFE_AIM==1 | Aneur_AIM==1 | card_arrest_AIM==1 | DIC_AIM==1 | eclampsia_AIM==1 | HF_AIM==1 | peur_cerb_AIM==1 | pe_AIM==1 | anaes_AIM==1 | sepsis_AIM==1 | shock_AIM==1 | SCA_AIM==1 | TE_AIM==1 | BT_AIM==1 | CCR_AIM==1 | Hysterectomy_AIM==1 | TempTracheostomy_AIM==1 | Ventilation_AIM==1)
label variable SMM_num "AIM SMM definition based on ICD-9/ICD-10 codes"
tab SMM_num, missing



***SMM measure excluding blood transfusion (based on AIM coding);
**SMM definition per AIM excluding BT only indicator;
gen SMM_num_noBT= 0
replace SMM_num_noBT=1 if (acuteMI==0 & ARF==0 & ARDS==0 & AFE==0 & Aneur==0 & card_arrest==0 & DIC==0 & eclampsia==0 & HF==0 & peur_cerb==0 & pe==0 & anaes==0 & sepsis==0 & shock==0 & SCA==0 & TE==0 & CCR==0 & Hysterectomy==0 & TempTracheostomy==0 & Ventilation==0) & BT==1 
label variable SMM_num_noBT "SMM excluding BT based on ICD-9/ICD-10 for AIM bundle"
tab SMM_num_noBT, missing



***Obstetric Hemorrhage codes (based on AIM);
*Placenta previa;
generate placprev=0
#delimit ;
foreach i in dx1 dx2 dx3 dx4 dx5 dx6 dx7 dx8 dx9 dx10 dx11 dx12 dx13 dx14 dx15
			dx16 dx17 dx18 dx19 dx20 dx21 dx22 dx23 dx24 dx25 dx26 {;
	replace placprev=1 if (substr(`i',1,5) == "O4410" | substr(`i',1,5) == "O4412" | substr(`i',1,5) == "O4413" |
	substr(`i',1,5) == "O4430" | substr(`i',1,5) == "O4432" | substr(`i',1,5) == "O4433" |
	substr(`i',1,5) == "O4450" | substr(`i',1,5) == "O4452" | substr(`i',1,5) == "O4453" );
}
;
#delimit cr
label variable placprev "Placenta previa diagnosis based on ICD-9/ICD-10 codes"

*Abruption placenta;
generate abruptioplac=0
#delimit ;
foreach i in dx1 dx2 dx3 dx4 dx5 dx6 dx7 dx8 dx9 dx10 dx11 dx12 dx13 dx14 dx15
			dx16 dx17 dx18 dx19 dx20 dx21 dx22 dx23 dx24 dx25 dx26 {;
	replace abruptioplac=1 if (substr(`i',1,6) == "O45002" | substr(`i',1,6) == "O45003" | substr(`i',1,6) == "O45009" |
	substr(`i',1,6) == "O45012" | substr(`i',1,6) == "O45013" | substr(`i',1,6) == "O45019" |
	substr(`i',1,6) == "O45022" | substr(`i',1,6) == "O45023" | substr(`i',1,6) == "O45029" |
	substr(`i',1,6) == "O45092" | substr(`i',1,6) == "O45093" | substr(`i',1,6) == "O45099" |
	substr(`i',1,6) == "O458X2" | substr(`i',1,6) == "O458X3" | substr(`i',1,6) == "O458X9" |
	substr(`i',1,5) == "O4590" | substr(`i',1,5) == "O4592" | substr(`i',1,5) == "O4593" );
}
;
#delimit cr
label variable abruptioplac "Abruption placenta diagnosis based on ICD-9/ICD-10 codes"

*Antepartum hemorrhage;
generate antehem=0
#delimit ;
foreach i in dx1 dx2 dx3 dx4 dx5 dx6 dx7 dx8 dx9 dx10 dx11 dx12 dx13 dx14 dx15
			dx16 dx17 dx18 dx19 dx20 dx21 dx22 dx23 dx24 dx25 dx26 {;
	replace antehem=1 if (substr(`i',1,6) == "O46002" | substr(`i',1,6) == "O46003" | substr(`i',1,6) == "O46009" |
	substr(`i',1,6) == "O46012" | substr(`i',1,6) == "O46013" | substr(`i',1,6) == "O46019" |
	substr(`i',1,6) == "O46022" | substr(`i',1,6) == "O46023" | substr(`i',1,6) == "O46029" |
	substr(`i',1,6) == "O46092" | substr(`i',1,6) == "O46093" | substr(`i',1,6) == "O46099" |
	substr(`i',1,6) == "O468X2" | substr(`i',1,6) == "O468X3" | substr(`i',1,6) == "O468X9" |
	substr(`i',1,5) == "O4690" | substr(`i',1,5) == "O4692" | substr(`i',1,5) == "O4693" );
}
;
#delimit cr
label variable antehem "Antepartum hemorrhage diagnosis based on ICD-9/ICD-10 codes"

*Postpartum hemorrhage;
generate PPH=0
#delimit ;
foreach i in dx1 dx2 dx3 dx4 dx5 dx6 dx7 dx8 dx9 dx10 dx11 dx12 dx13 dx14 dx15
			dx16 dx17 dx18 dx19 dx20 dx21 dx22 dx23 dx24 dx25 dx26 {;
	replace PPH=1 if (substr(`i',1,6) == "O43212" | substr(`i',1,6) == "O43213" | substr(`i',1,6) == "O43219" |
	substr(`i',1,6) == "O43222" | substr(`i',1,6) == "O43223" | substr(`i',1,6) == "O43223" |
	substr(`i',1,6) == "O43229" | substr(`i',1,6) == "O43232" | substr(`i',1,6) == "O43233" |
	substr(`i',1,6) == "O43239" | substr(`i',1,6) == "O720" | substr(`i',1,4) == "O721" |
	substr(`i',1,4) == "O722" | substr(`i',1,4) == "O723" );
}
;
#delimit cr
label variable PPH "Postpartum hemorrhage diagnosis based on ICD-9/ICD-10 codes"

*BT counted as hemorrhage only if Sickle cell crisis is absent;
generate BT_hem=0
replace BT_hem=1 if BT==1 & SCA==0
label variable BT_hem "BT counted as OBH if sickle cell crisis is absent based on ICD-9/ICD-10 codes"

**Whether or not ICD-9 denominator hemorrhage codes present;
gen OBH = 0
replace OBH=1 if  placprev==1 | abruptioplac==1 | antehem==1 | PPH==1 | BT_hem==1
label variable OBH "Obstetric hemorrhage based on ICD-9/ICD-10 codes per AIM criteria"
tab OBH, missing



***Severe preeclampsia/eclampsia codes (based on AIM coding);
*Severe preeclampsia or eclampsia;
generate sev_pe_eclampsia=0
#delimit ;
foreach i in dx1 dx2 dx3 dx4 dx5 dx6 dx7 dx8 dx9 dx10 dx11 dx12 dx13 dx14 dx15
			dx16 dx17 dx18 dx19 dx20 dx21 dx22 dx23 dx24 dx25 dx26 {;
	replace sev_pe_eclampsia=1 if (substr(`i',1,4) == "O111" | substr(`i',1,4) == "O112" | substr(`i',1,4) == "O113" |
	substr(`i',1,4) == "O114" | substr(`i',1,4) == "O115" | substr(`i',1,4) == "O119" |
	substr(`i',1,5) == "O1410" | substr(`i',1,5) == "O1412" | substr(`i',1,5) == "O1413" |
	substr(`i',1,5) == "O1414" | substr(`i',1,5) == "O1415" | substr(`i',1,5) == "O1420" |
	substr(`i',1,5) == "O1422" | substr(`i',1,5) == "O1423" | substr(`i',1,5) == "O1424" | substr(`i',1,5) == "O1425" |
	substr(`i',1,5) == "O1500" | substr(`i',1,5) == "O1502" | substr(`i',1,5) == "O1503" | 
	substr(`i',1,4) == "O151" | substr(`i',1,4) == "O152" | substr(`i',1,4) == "O159");
}
;
#delimit cr
label variable sev_pe_eclampsia "Severe preeclampsia or eclampsia based on ICD-9/ICD-10 codes per AIM criteria"
tab sev_pe_eclampsia, missing



***Women delivery route based on ms_drg code - total cesraen delivery and vaginal birth;
tab ms_drg, missing
generate delv_route=.
*replace delv_route=0 if ms_drg =="767" | ms_drg=="768" | ms_drg=="774" | ms_drg=="775" 
*replace delv_route=1 if ms_drg =="765" | ms_drg=="766" 
replace delv_route=0 if (ms_drg ==767 | ms_drg==768 | ms_drg==774 | ms_drg==775) 
replace delv_route=1 if (ms_drg ==765 | ms_drg==766) 
tab delv_route, missing
label variable delv_route "Delivery route: 1=CD, 0=VD based on ms_drg code"
label define del 0 "Vaginal delivery=0" 1 "Cesarean delivery=1"
label value delv_route del
tab delv_route, missing


**Previous cesarean section;
#delimit ;
gen comorb_precsec_cmi = 0;
foreach i in dx1 dx2 dx3 dx4 dx5 dx6 dx7 dx8 dx9 dx10 dx11 dx12 dx13 dx14 dx15
			dx16 dx17 dx18 dx19 dx20 dx21 dx22 dx23 dx24 dx25 dx26 {;
	replace comorb_precsec_cmi = 1 if (substr(`i',1,4) == "6542") | (substr(`i',1,6) == "O34211");
}
;
#delimit cr
label variable comorb_precsec_cmi "Previous cesarean delivery comorbid - Bateman 2013"
tab comorb_precsec_cmi if group!=1, missing


**Primary cesarean section;
generate primary_csec=0
replace primary_csec=1 if delv_route==1 & comorb_precsec_cmi==0
label variable primary_csec "Primary cesarean delivery"
tab primary_csec if group!=1, missing