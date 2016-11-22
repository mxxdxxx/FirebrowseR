#' Obtain identities of tissue source sites in TCGA.
#' 
#' By default this function returns a table of all sites which contributed source tissue to TCGA, aka TSS's. A subset of this table may be obtained by explicitly specifying one or more sites.
#'
#' @param format Format of result. Default value is json. While json,tsv,csv are available. 
#' @param tss_code Narrow search to one or more TSS codes Multiple values are allowed 01,02,04,05,06,07,08,09,10,11,12,13,14,15,16,17,18,19,1Z,20,21,22,23,24,25,26,27,28,29,2A,2E,2F,2G,2H,2J,2K,2L,2M,2N,2P,2V,2W,2X,2Y,2Z,30,31,32,33,34,35,36,37,38,39,3A,3B,3C,3E,3G,3H,3J,3K,3L,3M,3N,3P,3Q,3R,3S,3T,3U,3W,3X,3Z,41,42,43,44,46,49,4A,4B,4C,4D,4E,4G,4H,4J,4K,4L,4N,4P,4Q,4R,4S,4T,4V,4W,4X,4Y,4Z,50,51,52,53,55,56,57,58,59,5A,5B,5C,5D,5F,5G,5H,5J,5K,5L,5M,5N,5P,5Q,5R,5S,5T,5U,5V,5W,5X,60,61,62,63,64,65,66,67,68,69,6A,6D,6G,6H,70,71,72,73,74,75,76,77,78,79,80,81,82,83,85,86,87,90,91,92,93,94,95,96,97,98,99,A1,A2,A3,A4,A5,A6,A7,A8,AA,AB,AC,AD,AF,AG,AH,AJ,AK,AL,AM,AN,AO,AP,AQ,AR,AS,AT,AU,AV,AW,AX,AY,AZ,B0,B1,B2,B3,B4,B5,B6,B7,B8,B9,BA,BB,BC,BD,BF,BG,BH,BI,BJ,BK,BL,BM,BP,BQ,BR,BS,BT,BW,C4,C5,C8,C9,CA,CB,CC,CD,CE,CF,CG,CH,CI,CJ,CK,CL,CM,CN,CQ,CR,CS,CU,CV,CW,CX,CZ,D1,D3,D5,D6,D7,D8,D9,DA,DB,DC,DD,DE,DF,DG,DH,DI,DJ,DK,DM,DO,DQ,DR,DS,DT,DU,DV,DW,DX,DY,DZ,E1,E2,E3,E5,E6,E7,E8,E9,EA,EB,EC,ED,EE,EF,EI,EJ,EK,EL,EM,EO,EP,EQ,ER,ES,ET,EU,EV,EW,EX,EY,EZ,F1,F2,F4,F5,F6,F7,F9,FA,FB,FC,FD,FE,FF,FG,FH,FI,FJ,FK,FL,FM,FN,FP,FQ,FR,FS,FT,FU,FV,FW,FX,FY,FZ,G2,G3,G4,G5,G6,G7,G8,G9,GC,GD,GE,GF,GG,GH,GI,GJ,GK,GL,GM,GN,GP,GR,GS,GU,GV,GZ,H1,H2,H3,H4,H5,H6,H7,H8,H9,HA,HB,HC,HD,HE,HF,HG,HH,HI,HJ,HK,HL,HM,HN,HP,HQ,HR,HS,HT,HU,HV,HW,HZ,IA,IB,IC,IE,IF,IG,IH,IJ,IK,IM,IN,IP,IQ,IR,IS,IW,IZ,J1,J2,J4,J7,J8,J9,JA,JL,JU,JV,JW,JX,JY,JZ,K1,K4,K6,K7,K8,KA,KB,KC,KD,KE,KF,KG,KH,KJ,KK,KL,KM,KN,KO,KP,KQ,KR,KS,KT,KU,KV,KZ,L1,L3,L4,L5,L6,L7,L8,L9,LA,LB,LC,LD,LG,LH,LI,LK,LL,LN,LP,LQ,LS,LT,M7,M8,M9,MA,MB,ME,MF,MG,MH,MI,MJ,MK,ML,MM,MN,MO,MP,MQ,MR,MS,MT,MU,MV,MW,MX,MY,MZ,N1,N5,N6,N7,N8,N9,NA,NB,NC,ND,NF,NG,NH,NI,NJ,NK,NM,NP,NQ,NS,O1,O2,O8,O9,OC,OD,OE,OJ,OK,OL,OR,OU,OW,OX,OY,P3,P4,P5,P6,P7,P8,P9,PA,PB,PC,PD,PE,PG,PH,PJ,PK,PL,PN,PQ,PR,PT,PZ,Q1,Q2,Q3,Q4,Q9,QA,QB,QC,QD,QF,QG,QH,QJ,QK,QL,QM,QN,QQ,QR,QS,QT,QU,QV,QW,R1,R2,R3,R5,R6,R7,R8,R9,RA,RB,RC,RD,RE,RG,RH,RL,RM,RN,RP,RQ,RR,RS,RT,RU,RV,RW,RX,RY,RZ,S2,S3,S4,S5,S6,S7,S8,S9,SA,SB,SC,SD,SE,SG,SH,SI,SJ,SK,SL,SN,SO,SP,SQ,SR,SS,ST,SU,SW,SX,SY,T1,T2,T3,T6,T7,T9,TE,TG,TK,TL,TM,TN,TP,TQ,TR,TS,TT,TV,UB,UC,UD,UE,UF,UJ,UL,UN,UP,UR,US,UT,UU,UV,UW,UY,UZ,V1,V2,V3,V4,V5,V6,V7,V8,V9,VA,VB,VD,VF,VG,VK,VL,VM,VN,VP,VQ,VR,VS,VT,VV,VW,VX,VZ,W2,W3,W4,W5,W6,W7,W8,W9,WA,WB,WC,WD,WE,WF,WG,WH,WJ,WK,WL,WM,WN,WP,WQ,WR,WS,WT,WU,WW,WX,WY,WZ,X2,X3,X4,X5,X6,X7,X8,X9,XA,XB,XC,XD,XE,XF,XG,XH,XJ,XK,XM,XN,XP,XQ,XR,XS,XT,XU,XV,XX,XY,Y3,Y5,Y6,Y8,YA,YB,YC,YD,YF,YG,YH,YJ,YL,YN,YR,YS,YT,YU,YV,YW,YX,YY,YZ,Z2,Z3,Z4,Z5,Z6,Z7,Z8,ZA,ZB,ZC,ZD,ZE,ZF,ZG,ZH,ZJ,ZK,ZL,ZM,ZN,ZP,ZQ,ZR,ZS,ZT,ZU,ZW,ZX.
#' 
#' @export
Metadata.TSSites = function(format = "json",
                             tss_code = ""
                             ){
                             
  parameters = list(format = format,
                    tss_code = tss_code)
  
  validate.Parameters(params = parameters)

  url = build.Query(parameters = parameters,
                    invoker = "Metadata",
                    method = "TSSites")
  ret = download.Data(url, format)

  return(ret)

}
