##The list of adverse events that will be used as a look up the costs##
##First define the parameters then assigne values to these prameters using finction##
##Store theses values locally## 
##cal is cost of AE x percentage of patients with AE hosti x AE for patients treated##
##Cost of treating AE##
#'@param COS_AB_P = Cost abdominial pain
#'@param COS_ARTH = Cost arthralgia  
#'@param COS_BP =  Cost back pain
#'@param COS_CHIL = Cost chills
#'@param COS_COLI = Cost colitus
#'@param COS_CUTA_SSC = Cost cutaneous SCC
#'@param COS_DIAR = Cost diarrhea
#'@param COS_FATUG = Cost fatigue
#'@param COS_HEAM = Cost hemorrhage
#'@param COS_AMI_TRANS_LEV = Cost increase in aspartate amino-transferase level
#'@param COS_ALAN_TRANS_LEV = Cost increase in alanine amino-transferase level
#'@param COS_NAUS = Cost nausea
#'@param COS_RASH = Cost rash
#'@param COS_PHOT_SEN = Cost photosensitivity reaction
#'@param COS_PYREXIA = Cost pyrexia
#'@param COS_RET_DET = Cost retinal detachment
#'@param COS_RENAL_FAI = Cost renal failure
#'@param COS_VOM = Cost vomiting
##the percentage of patients with AE hospit##
#'@param PER_AB_P = Percentage abdominial pain
#'@param PER_ARTH = Percentage arthralgia  
#'@param PER_BP =  Percentage back pain
#'@param PER_CHIL = Percentage chills
#'@param PER_COLI = Percentage colitus
#'@param PER_CUTA_SSC = Percentage cutaneous SCC
#'@param PER_DIAR = Percentage diarrhea
#'@param PER_FATUG = Percentage fatigue
#'@param PER_HEAM = Percentage hemorrhage
#'@param PER_AMI_TRANS_LEV = Percentage increase in aspartate amino-transferase level
#'@param PER_ALAN_TRANS_LEV = Percentage increase in alanine amino-transferase level
#'@param PER_NAUS = Percentage nausea
#'@param PER_RASH = Percentage rash
#'@param PER_PHOT_SEN = Percentage photosensitivity reaction
#'@param PER_PYREXIA = Percentage pyrexia
#'@param PER_RET_DET = Percentage retinal detachment
#'@param PER_RENAL_FAI = Percentage renal failure
#'@param PER_VOM = Percentage vomiting

##Calculate the cost of grade 3 AE##
## calculation is - cost of treating the AE x the percentage of patients with AE whom are hospitalized## 
##Calculate the cost of these AE for each of the treatment option##
## MT_RB_ND = New_market_drug_comparitor##
## Use this code - each AE <- calulated value from standard costs * user entered value##
Cost_of_grade_3_AE <- function(Name,COS_AB_P,COS_ARTH,COS_BP,COS_CHIL,COS_COLI,COS_CUTA_SSC,COS_DIAR,COS_FATUG,COS_HEAM,COS_AMI_TRANS_LEV,COS_ALAN_TRANS_LEV,
                               COS_NAUS,COS_RASH,COS_PHOT_SEN,COS_PYREXIA,COS_RET_DET,COS_RENAL_FAI,COS_VOM,PER_AB_P,PER_ARTH,PER_BP,PER_CHIL,PER_COLI,
                               PER_CUTA_SSC,PER_DIAR,PER_FATUG,PER_HEAM,PER_AMI_TRANS_LEV,PER_ALAN_TRANS_LEV,PER_NAUS,PER_RASH,PER_PHOT_SEN,PER_PYREXIA,PER_RET_DET,
                               PER_RENAL_FAI,PER_VOM,AE_AB_P,AE_ARTH,AE_BP,AE_CHIL,AE_COLI,AE_CUTA_SSC, AE_DIAR,AE_FATUG,AE_HEAM,
                               AE_AMI_TRANS_LEV,AE_ALAN_TRANS_LEV,AE_NAUS,AE_RASH,AE_PHOT_SEN,AE_PYREXIA,AE_RET_DET,AE_RENAL_FAI,AE_VOM
                               ){
  
  COST_AE <- c(COS_AB_P,COS_ARTH,COS_BP,COS_CHIL,COS_COLI,COS_CUTA_SSC,COS_DIAR,COS_FATUG,COS_HEAM,COS_AMI_TRANS_LEV,COS_ALAN_TRANS_LEV,COS_NAUS,COS_RASH,
             COS_PHOT_SEN,COS_PYREXIA,COS_RET_DET,COS_RENAL_FAI,COS_VOM)
                               
  PER_AE <- c(PER_AB_P,PER_ARTH,PER_BP,PER_CHIL,PER_COLI,PER_CUTA_SSC,PER_DIAR,PER_FATUG,PER_HEAM,PER_AMI_TRANS_LEV,PER_ALAN_TRANS_LEV,PER_NAUS,PER_RASH,PER_PHOT_SEN,
            PER_PYREXIA,PER_RET_DET,PER_RENAL_FAI,PER_VOM)
  G3_AE_COST <- COST_AE*(PER_AE/100)
  
  AE <- c(AE_AB_P,
          AE_ARTH,
          AE_BP,
          AE_CHIL,
          AE_COLI,
          AE_CUTA_SSC,
          AE_DIAR,
          AE_FATUG,
          AE_HEAM,
          AE_AMI_TRANS_LEV,
          AE_ALAN_TRANS_LEV,
          AE_NAUS,
          AE_RASH,
          AE_PHOT_SEN,
          AE_PYREXIA,
          AE_RET_DET,
          AE_RENAL_FAI,
          AE_VOM)
  
  assign(paste0(Name,"_AE_cost"),sum(G3_AE_COST*(AE/100)),envir = .GlobalEnv)
}