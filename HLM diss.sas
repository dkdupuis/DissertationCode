PROC IMPORT OUT= WORK.data 
            DATAFILE= "E:\Dave\Diss_Participants.sav" 
            DBMS=SPSS REPLACE;
RUN;


/*PROC CONTENTS DATA=work.data;
RUN;

proc print data=data ;
var id nonIntervention tcageatrvgk tcageatrvg1 tcageatrvg2 ; 
run;*/

DATA stacked;
  SET WORK.data (where=(level~=1));* & FzNumTimePoints =3)); 

  	age = tcAgeAtRVGK-6; /*time=1;*/
	ERNDiffFz=ERNDiffT1_clean;
	ERNAvgFz=ERNAvgT1_clean;
	avgThetaPowerFz=avgThetaPowerT1_clean;
	avgThetaCoherFz=avgThetaCoherT1_clean; *needs fixed*;
	ERNDiffCz=ERNDiffCz_t1_log;
	ERNAvgCz=ERNAvgCzT1_clean;
	avgThetaPowerCz=avgThetaPowerCzT1_clean;
	avgThetaCoherCz=avgThetaCoherT1Cz_log;
	RTV_win=RTVT1_win;;
	CVRT_win=CVRTT1_win;
	ERNDiffFz_win=ERNDiffT1_win;*+5.5142437;
	ERNAvgFz_win=ERNAvgT1_win;
	avgThetaPowerFz_win=avgThetaPowerT1_win;
	avgThetaCoherFz_win=avgThetaCoherT1_win;
	ERNDiffCz_win=ERNDiffCzT1_win;
	ERNAvgCz_win=ERNAvgCzT1_win;
	avgThetaPowerCz_win=avgThetaPowerCzT1_win;
	avgThetaCoherCz_win=avgThetaCoherCzT1_win;
	RTV=RTVT1;
	ERNDiffFz_log=ERNDiffT1_log;
	avgThetaCoherFz_log=avgThetaCoherT1_logNoConst;
	OUTPUT;
  	age = tcAgeAtRVG1-6; /*time=2;*/
	ERNDiffFz=ERNDiffT2_clean;
	ERNAvgFz=ERNAvgT2_clean;
	avgThetaPowerFz=avgThetaPowerT2_clean;
	avgThetaCoherFz=avgThetaCoherT2_clean;
	ERNDiffCz=ERNDiffCz_t2_log;
	ERNAvgCz=ERNAvgCzT2_clean;
	avgThetaPowerCz=avgThetaPowerCzT2_clean;
	avgThetaCoherCz=avgThetaCoherT2Cz_log;
	RTV_win=RTVT2_win;
	CVRT_win=CVRTT2_win;
	ERNDiffFz_win=ERNDiffT2_win;*+5.5142437;
	ERNAvgFz_win=ERNAvgT2_win;
	avgThetaPowerFz_win=avgThetaPowerT2_win;
	avgThetaCoherFz_win=avgThetaCoherT2_win;
	ERNDiffCz_win=ERNDiffCzT2_win;
	ERNAvgCz_win=ERNAvgCzT2_win;
	avgThetaPowerCz_win=avgThetaPowerCzT2_win;
	avgThetaCoherCz_win=avgThetaCoherCzT2_win;
	RTV=RTVT2;
	ERNDiffFz_log=ERNDiffT2_log;
	avgThetaCoherFz_log=avgThetaCoherT2_logNoConst;
	OUTPUT;
	age = tcAgeAtRVG2-6; /*time=3;*/
	ERNDiffFz=ERNDiffT3_clean;
	ERNAvgFz=ERNAvgT3_clean;
	avgThetaPowerFz=avgThetaPowerT3_clean;
	avgThetaCoherFz=avgThetaCoherT3_clean;
	ERNDiffCz=ERNDiffCz_t3_log;
	ERNAvgCz=ERNAvgCzT3_clean;
	avgThetaPowerCz=avgThetaPowerCzT3_clean;
	avgThetaCoherCz=avgThetaCoherT3Cz_log;
	RTV_win=RTVT3_win;
	CVRT_win=CVRTT3_win;
	ERNDiffFz_win=ERNDiffT3_win;*+5.5142437;
	ERNAvgFz_win=ERNAvgT3_win;
	avgThetaPowerFz_win=avgThetaPowerT3_win;
	avgThetaCoherFz_win=avgThetaCoherT3_win;
	ERNDiffCz_win=ERNDiffCzT3_win;
	ERNAvgCz_win=ERNAvgCzT3_win;
	avgThetaPowerCz_win=avgThetaPowerCzT3_win;
	avgThetaCoherCz_win=avgThetaCoherCzT3_win;
	RTV=RTVT3;
	ERNDiffFz_log=ERNDiffT3_log;
	avgThetaCoherFz_log=avgThetaCoherT3_logNoConst;
	OUTPUT;
  
	keep ID nonIntervention FzNumTimePoints age genderCentered TCMALE isBlack RTV ERNDiffFz_log avgThetaCoherFz_log RTV_win CVRT_win ERNDiffFz ERNAvgFz avgThetaPowerFz avgThetaCoherFz ERNDiffCz ERNAvgCz avgThetaPowerCz avgThetaCoherCz ERNDiffFz_win ERNAvgFz_win avgThetaPowerFz_win avgThetaCoherFz_win ERNDiffCz_win ERNAvgCz_win avgThetaPowerCz_win avgThetaCoherCz_win;
  
RUN;


/*PROC print DATA=stacked;
	var ID ERNDiffFz_log avgThetaCoherFz_log;
RUN;
proc PRINT data=stacked;
run;
proc means data=data;

	where nonIntervention=1 &FzNumTimePoints>0;
	var tcAgeAtRVGK tcAgeAtRVG1 tcAgeAtRVG2 ERNDiffT1_clean ERNDiffT2_clean ERNDiffT3_clean avgThetaPowerT1_clean avgThetaPowerT2_clean avgThetaPowerT3_clean avgThetaCoherT1_clean avgThetaCoherT2_clean avgThetaCoherT3_clean RTVT1 RTVT2 RTVT3;

run;
proc means data=stacked;

	where nonIntervention=1;
	var ERNDiffFz_log;

run;*/

proc corr data=data;

	where nonIntervention=1;
	var ERNDiffT1_log ERNDiffT2_log ERNDiffT3_log avgThetaPowerT1_clean avgThetaPowerT2_clean avgThetaPowerT3_clean avgThetaCoherT1_logNoConst avgThetaCoherT2_logNoConst avgThetaCoherT3_logNoConst RTVT1 RTVT2 RTVT3;

run;
/*
PROC MIXED DATA=stacked NOCLPRINT COVTEST METHOD=REML;
	where nonIntervention = 1;
	model ERNDiffFz_log = age avgThetaCoherFz_log/DDFM=BW solution;
	random intercept /subject=ID type=UN GCORR;
RUN;*/

/****Sobel Test****/

PROC MIXED DATA=stacked NOCLPRINT COVTEST METHOD=REML;
	where nonIntervention = 1;
	model avgThetaCoherFz_log = age/DDFM=BW solution;
	random intercept /subject=ID type=UN GCORR;
RUN;

PROC MIXED DATA=stacked NOCLPRINT COVTEST METHOD=REML;
	where nonIntervention = 1;
	model ERNDiffFz_log = age avgThetaCoherFz_log/DDFM=BW solution;
	random intercept /subject=ID type=UN GCORR;
RUN;
/*
Solution for Fixed Effects 
Effect 				Estimate 	Standard Error 	DF 		t Value Pr > |t| 
age 				0.3816 		0.7458 			293 	0.51 	0.6093 
age*avgThetaPowerFz -0.02567 	0.02249 		293 	-1.14 	0.2547 
age*avgThetaCoherFz_ -0.1849 	0.04867 		293 	-3.80 	0.0002 
*/


/***************Interclass Correlations**************/
/****************************************************/

PROC MIXED DATA=stacked NOCLPRINT COVTEST METHOD=REML;
	where nonIntervention = 1;
	model ERNDiffFz_log = /DDFM=BW solution;
	random intercept /subject=ID type=UN GCORR;
	/*Covariance Parameter Estimates 
Cov Parm Subject Estimate Standard Error Z Value Pr > Z 
UN(1,1) ID 0.03074 0.01729 1.78 0.0378 
Residual   0.3137 0.02440 12.86 <.0001 

ICC(between) = .03074/(.03074+0.3137)=
9% between
91% within
*/
RUN;

/*PROC MIXED DATA=stacked NOCLPRINT COVTEST METHOD=REML;
	where nonIntervention = 1;
	model ERNAvgFz_win = /DDFM=BW solution;
	random intercept /subject=ID type=UN GCORR;
	
RUN;*/
PROC MIXED DATA=stacked NOCLPRINT COVTEST METHOD=REML;
	where nonIntervention = 1;
	model avgThetaPowerFz = /DDFM=BW solution;
	random intercept /subject=ID type=UN GCORR;
	/*Covariance Parameter Estimates 
Cov Parm Subject Estimate Standard Error Z Value Pr > Z 
UN(1,1) ID 0.5418 0.06692 8.10 <.0001 
Residual   0.3867 0.03104 12.46 <.0001 

ICC(between) = 0.5418/(0.5418+0.3867)=
58% between
42% within
*/
RUN;

PROC MIXED DATA=stacked NOCLPRINT COVTEST METHOD=REML;
	where nonIntervention = 1;
	model avgThetaCoherFz_log = /DDFM=BW solution;
	random intercept /subject=ID type=UN GCORR;
	/*Covariance Parameter Estimates 
Cov Parm Subject Estimate Standard Error Z Value Pr > Z 
UN(1,1) ID 0.001371 0.008658 0.16 0.4371 
Residual   0.1758 0.01377 12.77 <.0001 

ICC(between) = 0.001371/(0.001371+0.1758)=
1% between
99% within
*/
RUN;

PROC MIXED DATA=stacked NOCLPRINT COVTEST METHOD=REML;
	where nonIntervention = 1;
	model RTV = /DDFM=BW solution;
	random intercept /subject=ID type=UN GCORR;
	/*Covariance Parameter Estimates 
Cov Parm Subject Estimate Standard Error Z Value Pr > Z 
UN(1,1) ID 1086.12 284.78 3.81 <.0001 
Residual   4228.96 321.63 13.15 <.0001 

ICC(between) = 1086.12/(1086.12+4228.96)=
20% between
80% within
*/
RUN;

PROC MIXED DATA=stacked NOCLPRINT COVTEST METHOD=REML;
	where nonIntervention = 1;
	model CVRT_win = /DDFM=BW solution;
	random intercept /subject=ID type=UN GCORR;
	/*                                 
*/
RUN;

PROC MIXED DATA=stacked NOCLPRINT COVTEST METHOD=REML;
	where nonIntervention = 1;
	model ERNDiffCz_win = /DDFM=BW solution;
	random intercept /subject=ID type=UN GCORR;
	/*                                  
*/
RUN;

PROC MIXED DATA=stacked NOCLPRINT COVTEST METHOD=REML;
	where nonIntervention = 1;
	model ERNAvgCz_win = /DDFM=BW solution;
	random intercept /subject=ID type=UN GCORR;
	/*                                  
*/
RUN;

PROC MIXED DATA=stacked NOCLPRINT COVTEST METHOD=REML;
	where nonIntervention = 1;
	model avgThetaPowerCz_win = /DDFM=BW solution;
	random intercept /subject=ID type=UN GCORR;
	/*               
*/
RUN;

PROC MIXED DATA=stacked NOCLPRINT COVTEST METHOD=REML;
	where nonIntervention = 1;
	model avgThetaCoherCz_win = /DDFM=BW solution;
	random intercept /subject=ID type=UN GCORR;
	/* 
*/
RUN;

/***************ICC Conditioned on Age***************/
/****************************************************/

PROC MIXED DATA=stacked NOCLPRINT COVTEST METHOD=REML;
	where nonIntervention = 1;
	model ERNDiffFz_log = age/DDFM=BW solution;
	random intercept /subject=ID type=UN GCORR;/*  solution;
	ODS OUTPUT SolutionR=ERNDiffSlopes;
	/*Covariance Parameter Estimates 
Cov Parm Subject Estimate Standard Error Z Value Pr > Z 
UN(1,1) ID 0.03778 0.01737 2.18 0.0148 
Residual   0.2970 0.02329 12.75 <.0001 

ICC(between) = .03778/(.03778+0.2970)=
11% between
89% within
*/
RUN;

PROC MIXED DATA=stacked NOCLPRINT COVTEST METHOD=REML;
	where nonIntervention = 1;
	model avgThetaPowerFz = age/DDFM=BW solution;
	random intercept /subject=ID type=UN GCORR;/*  solution;
	ODS OUTPUT SolutionR=avgThetaPowerFzSlopes;
	/*Covariance Parameter Estimates 
Cov Parm Subject Estimate Standard Error Z Value Pr > Z 
UN(1,1) ID 0.5560 0.06578 8.45 <.0001 
Residual   0.3309 0.02667 12.41 <.0001 

ICC(between) = 0.5560/(0.5560+0.3309)=
63% between
37% within
*/
RUN;

PROC MIXED DATA=stacked NOCLPRINT COVTEST METHOD=REML;
	where nonIntervention = 1;
	model avgThetaCoherFz_log = age/DDFM=BW solution;
	random intercept /subject=ID type=UN GCORR;/*  solution;
	ODS OUTPUT SolutionR=avgThetaCoherFzSlopes;
	/*Covariance Parameter Estimates 
Cov Parm Subject Estimate Standard Error Z Value Pr > Z 
UN(1,1) ID 0.006091 0.008285 0.74 0.2311 
Residual   0.1601 0.01257 12.74 <.0001 

ICC(between) = 0.006091/(0.006091+0.1601)=
4% between
96% within
*/
RUN;

PROC MIXED DATA=stacked NOCLPRINT COVTEST METHOD=REML;
	where nonIntervention = 1;
	model RTV = age/DDFM=BW solution;
	random intercept /subject=ID type=UN GCORR;/* solution;
	ODS OUTPUT SolutionR=RTVSlopes;
	/*Covariance Parameter Estimates 
Cov Parm Subject Estimate Standard Error Z Value Pr > Z 
UN(1,1) ID 1511.84 236.87 6.38 <.0001 
Residual   2218.54 171.87 12.91 <.0001 

ICC(between) = 1511.84/(1511.84+2218.54)=
41% between
59% within
*/
RUN;


/**********Age & Gender + Interaction**********/
/**********************************************/
PROC MIXED DATA=stacked NOCLPRINT COVTEST METHOD=REML;	
	where nonIntervention = 1;
	model ERNDiffFz_log = age TCMALE TCMALE*age/DDFM=BW solution;
	random intercept /subject=ID type=UN GCORR;
RUN;

/*PROC MIXED DATA=stacked NOCLPRINT COVTEST METHOD=REML;
	where nonIntervention = 1;
	model ERNAvgFz_win = age TCMALE TCMALE*age/DDFM=BW solution;
	random intercept /subject=ID type=UN GCORR solution;
	/*ODS OUTPUT SolutionR=Ujdata;
RUN;*/

PROC MIXED DATA=stacked NOCLPRINT COVTEST METHOD=REML;
	where nonIntervention = 1;
	model avgThetaPowerFz = age TCMALE TCMALE*age/DDFM=BW solution;
	random intercept /subject=ID type=UN GCORR;
RUN;

PROC MIXED DATA=stacked NOCLPRINT COVTEST METHOD=REML;
	where nonIntervention = 1;	
	model avgThetaCoherFz_log = age TCMALE TCMALE*age/DDFM=BW solution;
	random intercept /subject=ID type=UN GCORR;
RUN;

PROC MIXED DATA=stacked NOCLPRINT COVTEST METHOD=REML;
	where nonIntervention = 1;
	model RTV = age TCMALE TCMALE*age/DDFM=BW solution;
	random intercept /subject=ID type=UN GCORR;
RUN;
/*
PROC MIXED DATA=stacked NOCLPRINT COVTEST METHOD=REML;
	where nonIntervention = 1;
	model CVRT = age /DDFM=BW solution;
	random intercept /subject=ID type=UN GCORR;
RUN;

PROC MIXED DATA=stacked NOCLPRINT COVTEST METHOD=REML;
	where nonIntervention = 1;
	model ERNDiffCz_win = age /DDFM=BW solution;
	random intercept /subject=ID type=UN GCORR;
RUN;

PROC MIXED DATA=stacked NOCLPRINT COVTEST METHOD=REML;
	where nonIntervention = 1;
	model ERNAvgCz_win = age /DDFM=BW solution;
	random intercept /subject=ID type=UN GCORR;
RUN;

PROC MIXED DATA=stacked NOCLPRINT COVTEST METHOD=REML;
	where nonIntervention = 1;
	model avgThetaPowerCz_win = age /DDFM=BW solution;
	random intercept /subject=ID type=UN GCORR;
RUN;

PROC MIXED DATA=stacked NOCLPRINT COVTEST METHOD=REML;
	where nonIntervention = 1;
	model avgThetaCoherCz_win = age /DDFM=BW solution;
	random intercept /subject=ID type=UN GCORR;
	/*
*/
RUN;

/***************Random Intercepts & Slopes***************/
/********************************************************/
PROC MIXED DATA=stacked NOCLPRINT COVTEST METHOD=MIVQUE0;
	class id;
	where FzNumTimePoints>0 & nonIntervention = 1;
	model ERNDiffFz_log = age genderCentered genderCentered*agesolution DDFM=BW;
	random intercept age /solution subject=ID type=UN GCORR;
	ODS OUTPUT SolutionR=ERNDiffSlopes;
RUN;

/*PROC MIXED DATA=stacked NOCLPRINT COVTEST METHOD=MIVQUE0;
	class id;
	where FzNumTimePoints>0 & nonIntervention = 1;
	model ERNAvgFz_win = age TCMALE TCMALE*age/DDFM=BW solution;
	random intercept age /subject=ID type=UN GCORR solution;
	ODS OUTPUT SolutionR=ERNAvgFzSlopes;	
RUN;*/

PROC MIXED DATA=stacked NOCLPRINT COVTEST METHOD=MIVQUE0;
	class id;
	where FzNumTimePoints>0 & nonIntervention = 1;
	model avgThetaPowerFz = age genderCentered genderCentered*age/DDFM=BW solution;
	random intercept age /subject=ID type=UN GCORR solution;
	ODS OUTPUT SolutionR=avgThetaPowerFzSlopes;
RUN;

PROC MIXED DATA=stacked NOCLPRINT COVTEST METHOD=MIVQUE0;
	class id;
	where FzNumTimePoints>0 & nonIntervention = 1;
	model avgThetaCoherFz_log = age genderCentered genderCentered*age/DDFM=BW solution;
	random intercept age /subject=ID type=UN GCORR solution;
	ODS OUTPUT SolutionR=avgThetaCoherFzSlopes;
RUN;

PROC MIXED DATA=stacked NOCLPRINT COVTEST METHOD=MIVQUE0;
	class id;
	where FzNumTimePoints>0 & nonIntervention = 1;* & ID~=204325 & ID~=201822;
	model RTV = age genderCentered genderCentered*age/DDFM=BW solution;
	random intercept age /subject=ID type=UN GCORR solution;
	ODS OUTPUT SolutionR=RTVSlopes;
RUN;

PROC MIXED DATA=stacked NOCLPRINT COVTEST METHOD=MIVQUE0;
	class id;
	where FzNumTimePoints>0 & nonIntervention = 1;
	model ERNDiffCz = age/DDFM=BW solution;
	random intercept age /subject=ID type=UN GCORR solution;
	ODS OUTPUT SolutionR=ERNDiffSlopesCz;
RUN;

PROC MIXED DATA=stacked NOCLPRINT COVTEST METHOD=MIVQUE0;
	class id;
	where FzNumTimePoints>0 & nonIntervention = 1;
	model avgThetaPowerCz = age/DDFM=BW solution;
	random intercept age /subject=ID type=UN GCORR solution;
	ODS OUTPUT SolutionR=avgThetaPowerCzSlopes;
RUN;

PROC MIXED DATA=stacked NOCLPRINT COVTEST METHOD=MIVQUE0;
	class id;
	where FzNumTimePoints>0 & nonIntervention = 1;* & ID~=204325 & ID~=201822;
	model avgThetaCoherCz = age /DDFM=BW solution;
	random intercept age /subject=ID type=UN GCORR solution;
	ODS OUTPUT SolutionR=avgThetaCoherCzSlopes;
RUN;

/*************Random Intercepts & Slopes Cz**************/
/********************************************************/
PROC MIXED DATA=stacked NOCLPRINT COVTEST METHOD=MIVQUE0;
	class id;
	where FzNumTimePoints>0 & nonIntervention = 1;
	model ERNDiffCz = age genderCentered genderCentered*age/DDFM=BW solution;
	random intercept age /subject=ID type=UN GCORR solution;
	ODS OUTPUT SolutionR=x;
RUN;

PROC MIXED DATA=stacked NOCLPRINT COVTEST METHOD=MIVQUE0;
	class id;
	where FzNumTimePoints>0 & nonIntervention = 1;
	model avgThetaPowerCz = age genderCentered genderCentered*age/DDFM=BW solution;
	random intercept age /subject=ID type=UN GCORR solution;
	ODS OUTPUT SolutionR=xx;
RUN;

PROC MIXED DATA=stacked NOCLPRINT COVTEST METHOD=MIVQUE0;
	class id;
	where FzNumTimePoints>0 & nonIntervention = 1;* & ID~=204325 & ID~=201822;
	model avgThetaCoherCz = age genderCentered genderCentered*age/DDFM=BW solution;
	random intercept age /subject=ID type=UN GCORR solution;
	ODS OUTPUT SolutionR=xxx;
RUN;

/*PROC MIXED DATA=stacked NOCLPRINT COVTEST METHOD=MIVQUE0;
	class id;
	where FzNumTimePoints>0 & nonIntervention = 1;
	model CVRT_win = age genderCentered genderCentered*age/DDFM=BW solution;
	random intercept age /subject=ID type=UN GCORR solution;
	ODS OUTPUT SolutionR=CVRTSlopes;
RUN;*/

/****Winsorized Random Intercepts & Slopes, No Gender ****/
/********************************************************/
/*
PROC MIXED DATA=stacked NOCLPRINT COVTEST METHOD=MIVQUE0;
	class id;
	where nonIntervention = 1;* & FzNumTimePoints=3;
	model ERNDiffFz_log = age /solution DDFM=BW;
	random intercept age /solution subject=ID type=UN GCORR;
	ODS OUTPUT SolutionR=ERNDiffSlopes;
RUN;

PROC MIXED DATA=stacked NOCLPRINT COVTEST METHOD=MIVQUE0;
	class id;
	where nonIntervention = 1;* &FzNumTimePoints=3;
	model ERNAvgFz_win = age /DDFM=BW solution;
	random intercept age /subject=ID type=UN GCORR solution;
	ODS OUTPUT SolutionR=ERNAvgFzSlopes;	
RUN;

PROC MIXED DATA=stacked NOCLPRINT COVTEST METHOD=MIVQUE0;
	class id;
	where nonIntervention = 1;* &FzNumTimePoints=3;
	model avgThetaPowerFz_win = age /DDFM=BW solution;
	random intercept age /subject=ID type=UN GCORR solution;
	ODS OUTPUT SolutionR=avgThetaPowerFzSlopes;
RUN;

PROC MIXED DATA=stacked NOCLPRINT COVTEST METHOD=MIVQUE0;
	class id;
	where nonIntervention = 1;* &FzNumTimePoints=3;
	model avgThetaCoherFz_win = age/DDFM=BW solution;
	random intercept age /subject=ID type=UN GCORR solution;
	ODS OUTPUT SolutionR=avgThetaCoherFzSlopes;
RUN;

PROC MIXED DATA=stacked NOCLPRINT COVTEST METHOD=MIVQUE0;
	class id;
	where nonIntervention = 1;* &FzNumTimePoints=3;* & ID~=204325 & ID~=201822;
	model RTV_win = age /DDFM=BW solution;
	random intercept age /subject=ID type=UN GCORR solution;
	ODS OUTPUT SolutionR=RTVSlopes;
RUN;

PROC MIXED DATA=stacked NOCLPRINT COVTEST METHOD=MIVQUE0;
	class id;
	where nonIntervention = 1;* &FzNumTimePoints=3;
	model CVRT_win = age /DDFM=BW solution;
	random intercept age /subject=ID type=UN GCORR solution;
	ODS OUTPUT SolutionR=CVRTSlopes;
RUN;*/

/************** Export Intercepts & Slopes **************/
/********************************************************/

proc transpose data=ERNDiffSlopes out=ERNDiffSlopes prefix=Estimate;
    by ID;
    id Effect;
    var Estimate;
run;

data ERNDiffSlopes;
	set ERNDiffSlopes;
	rename EstimateIntercept=ERNDiffFzInter_log EstimateAge=ERNDiffFzSlope_log;
	drop _NAME_;
run;

/*
proc transpose data=ERNAvgFzSlopes out=ERNAvgFzSlopes prefix=Estimate;
    by ID;
    id Effect;
    var Estimate;
run;

data ERNAvgFzSlopes;
	set ERNAvgFzSlopes;
	rename EstimateIntercept=ERNAvgFzInter EstimateAge=ERNAvgFzSlope;
	drop _NAME_;
run;
*/
proc transpose data=avgThetaPowerFzSlopes out=avgThetaPowerFzSlopes prefix=Estimate;
    by ID;
    id Effect;
    var Estimate;
run;

data avgThetaPowerFzSlopes;
	set avgThetaPowerFzSlopes;
	rename EstimateIntercept=avgThetaPowerFzInter EstimateAge=avgThetaPowerFzSlope;
	drop _NAME_;
run;

proc transpose data=avgThetaCoherFzSlopes out=avgThetaCoherFzSlopes prefix=Estimate;
    by ID;
    id Effect;
    var Estimate;
run;

data avgThetaCoherFzSlopes;
	set avgThetaCoherFzSlopes;
	rename EstimateIntercept=avgThetaCoherFzInter_log EstimateAge=avgThetaCoherFzSlope_log;
	drop _NAME_;
run;

proc transpose data=RTVSlopes out=RTVSlopes prefix=Estimate;
    by ID;
    id Effect;
    var Estimate;
run;

data RTVSlopes;
	set RTVSlopes;
	rename EstimateIntercept=RTVInter EstimateAge=RTVSlope;
	drop _NAME_;
run;
/*
proc transpose data=CVRTSlopes out=CVRTSlopes prefix=Estimate;
    by ID;
    id Effect;
    var Estimate;
run;

data CVRTSlopes;
	set CVRTSlopes;
	rename EstimateIntercept=CVRTInter_win EstimateAge=CVRTSlope_win;
	drop _NAME_;
run;
*/

data MergedSlopes;
	merge ERNDiffSlopes avgThetaPowerFzSlopes avgThetaCoherFzSlopes RTVSlopes;
	by ID;
run;



proc corr data=MergedSlopes;
	var ERNDiffFzInter_log ERNDiffFzSlope_log avgThetaPowerFzInter avgThetaPowerFzSlope avgThetaCoherFzInter_log avgThetaCoherFzSlope_log RTVInter RTVSlope;
run;

proc transpose data=ERNDiffSlopesCz out=ERNDiffSlopesCz prefix=Estimate;
    by ID;
    id Effect;
    var Estimate;
run;

data ERNDiffSlopesCz;
	set ERNDiffSlopesCz;
	rename EstimateIntercept=ERNDiffCzInter_log EstimateAge=ERNDiffCzSlope_log;
	drop _NAME_;
run;

proc transpose data=avgThetaPowerCzSlopes out=avgThetaPowerCzSlopes prefix=Estimate;
    by ID;
    id Effect;
    var Estimate;
run;

data avgThetaPowerCzSlopes;
	set avgThetaPowerCzSlopes;
	rename EstimateIntercept=avgThetaPowerCzInter EstimateAge=avgThetaPowerCzSlope;
	drop _NAME_;
run;

proc transpose data=avgThetaCoherCzSlopes out=avgThetaCoherCzSlopes prefix=Estimate;
    by ID;
    id Effect;
    var Estimate;
run;

data avgThetaCoherCzSlopes;
	set avgThetaCoherCzSlopes;
	rename EstimateIntercept=avgThetaCoherCzInter_log EstimateAge=avgThetaCoherCzSlope_log;
	drop _NAME_;
run;

data MergedSlopes;
	merge ERNDiffSlopesCz avgThetaPowerCzSlopes avgThetaCoherCzSlopes RTVSlopes;
	by ID;
run;

proc corr data=MergedSlopes;
	var ERNDiffCzInter_log ERNDiffCzSlope_log avgThetaPowerCzInter avgThetaPowerCzSlope avgThetaCoherCzInter_log avgThetaCoherCzSlope_log RTVInter RTVSlope;
run;
/*
*Big ANOVA (aka Lisa Model);
PROC MIXED DATA=intravar_ilong2 NOCLPRINT COVTEST METHOD=REML;
	WHERE block=2 AND wasdecision=1;
 	MODEL allEDA = pointVal costVal pointVal*costVal
					totalPoints totalPoints*totalPoints 
					trial trial*trial
					playedcard  / SOLUTION DDFM=BW NOTEST OUTP=predEDA;
 	RANDOM intercept totalPoints trial pointVal costVal /SUBJECT=id1 TYPE=UN GCORR;
RUN; */
