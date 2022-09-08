
#rm(list=ls())

#Filepath <- "//gb-man-fsvr/PROVE/Innovation/HE and Data Analysis/Innovations/R modelling/BIM template development/"
BIM_inputs_results <- function(Y,P,G,C,C_1,C1_2,C2_3,E,S_1,S_2,Treat_rate,waste,avg_weight,avg_BSA,vial_cost_1,vial_cost_2){

########################
#####GENERAL INPUTS#####
########################
#Time-horizon (Years)
#Y<-3

########################
#####CONTROL LINKS######
########################

##Subgroups
##options all_patients, subgroup_1, subgroup_2

#subgroup<<-all_patients

##comparators
#Comparators(local(monotherapy_IV_comparator_1=true),
#            local(monotherapy_IV_comparator_2=true),
#            local(monotherapy_IV_comparator_3=true),
#            local(monotherapy_IV_comparator_4=true),
#            local(monotherapy_IV_comparator_5=true),
#            local(combination_IV_comparator_1=true),
#            local(combination_IV_comparator_2=true),
#            local(monotherapy_Oral_comparator_1=true),
#            local(monotherapy_Oral_comparator_2=true),
#            local(monotherapy_Oral_comparator_3=true),
#            local(combination_Oral_comparator_1=true),
#            local(combination_Oral_comparator_2=true))

####################
#####Population#####
####################
#Calling the macros#
##source(paste(Filepath,"population v0_2.R",sep = ""))

##Population-Inputs##
#Population <- new.env()

#local(P <- 1000000,env=Population)
#local(G <- 0.7,env=Population)
#local(C <- 22.8,env=Population)
#local(C_1 <- 25,env=Population)
#local(C1_2 <- 50,env=Population)
#local(C2_3 <- 75,env=Population)
#local(E <- 80,env=Population)
#local(S_1 <- 45,env=Population)
#local(S_2 <- 55,env=Population)
#local(Treat_rate <- c(70,80,85),env=Population)
#local(avg_weight <- 80.54,env=Population)
#local(avg_BSA <- 1.97,env=Population)

##Population-Outputs##
Eligibility_total(Y,
                  P,
                  G,
                  C,
                  C_1,
                  C1_2,
                  C2_3,
                  E,
                  S_1,
                  S_2,
                  Treat_rate)

###########################
#####Vial optimisation#####
###########################
##Vial optimisation-Outputs##
#Calling the macros#
#source(paste(Filepath,"vial_optimisation_and_cost_calculations_v0_10.R",sep = ""))

  ###New drug inputs environment###
  IVND <- new.env()

  ##New drug Vial optimisation inputs## MINE IVND
  local(DrugNumber <- "1",env=IVND)
#  local(vial_cost_1 <- 4590.92,env=IVND)
#  local(vial_cost_2 <- 2290.46,env=IVND)
  local(vial_cost_3 <- 0,env=IVND)
  local(vial_cost_4 <- 0,env=IVND)
  local(vial_size <- c(100,50,0,0),env=IVND)
  local(initial_dose_amount <- 200,env=IVND)
  local(initial_dose_unit <- "mg",env=IVND)
  local(maintenance_dose_amount <- 3,env=IVND)
  local(maintenance_dose_unit <- "mg",env=IVND)
  local(init_Admin_per_cycle <- 1.00 ,env=IVND)
  local(subs_Admin_per_cycle <- 1.00 ,env=IVND)
  local(phys_vis_cycle <- 0.230769230769231 ,env=IVND)
  local(admin_cost_per_dose <- 72.36 ,env=IVND)
  local(rebate <- 0.0 ,env=IVND)
  local(cost_phys_visit_mont <- 147.60 ,env=IVND)
  local(cycle_length <- 3.00,env=IVND)
  local(initial_treatment_duration <- 20.00 ,env=IVND)
  local(total_treatment_duration <- 40.5254285714286 ,env=IVND)

##New drug Vial optimisation outputs## MINE IVND
Vial_optimisation_Cost_calculations("IVND",
                                    local(DrugNumber,env=IVND),
                                    vial_cost_1,
                                    vial_cost_2,
                                       local(vial_cost_3,env=IVND),
                                       local(vial_cost_4,env=IVND),
                                       local(vial_size,env=IVND),
                                       local(initial_dose_amount,env=IVND),
                                       local(initial_dose_unit,env=IVND),
                                       local(maintenance_dose_amount,env=IVND),
                                       local(maintenance_dose_unit,env=IVND),
                                       local(cycle_length,env=IVND),
                                       local(init_Admin_per_cycle,env=IVND),
                                       local(subs_Admin_per_cycle,env=IVND),
                                       local(phys_vis_cycle,env=IVND),
                                       local(admin_cost_per_dose,env=IVND),
                                       local(rebate,env=IVND),
                                       local(cost_phys_visit_mont,env=IVND),
                                       local(initial_treatment_duration,env=IVND),
                                       local(total_treatment_duration,env=IVND),
                                       waste,
                                    avg_weight,
                                    avg_BSA)

###New drug inputs environment###
IVMONC1 <- new.env()
##IV_monotherapy_C1-Vial optimisation inputs## MINE IVMONC1
local(DrugNumber <- "1",env=IVMONC1)
local(vial_cost_1 <- 28270.77,env=IVMONC1)
local(vial_cost_2 <- 7067.7,env=IVMONC1)
local(vial_cost_3 <- 0,env=IVMONC1)
local(vial_cost_4 <- 0,env=IVMONC1)
local(vial_size<-c(200,50,0,0),env=IVMONC1)
local(initial_dose_amount<-3,env=IVMONC1)
local(initial_dose_unit<-"mg/kg",env=IVMONC1)
local(maintenance_dose_amount<-10,env=IVMONC1)
local(maintenance_dose_unit<-"mg",env=IVMONC1)
local(cycle_length <- 3.00 ,env=IVMONC1)
local(init_Admin_per_cycle <- 1.00 ,env=IVMONC1)
local(subs_Admin_per_cycle <- 3.00 ,env=IVMONC1)
local(phys_vis_cycle <- 0.23 ,env=IVMONC1)
local(admin_cost_per_dose <- 160.56 ,env=IVMONC1)
local(rebate <- 0.0 ,env=IVMONC1)
local(cost_phys_visit_mont <- 147.60 ,env=IVMONC1)
local(total_treatment_duration <- 37.47 ,env=IVMONC1)
local(initial_treatment_duration <- 4.00 ,env=IVMONC1)

##IV_monotherapy_C1-Vial optimisation outputs## MINE IVMONC1
Vial_optimisation_Cost_calculations("IVMONC1",
                                    local(DrugNumber,env=IVMONC1),
                                    local(vial_cost_1,env=IVMONC1),
                                    local(vial_cost_2,env=IVMONC1),
                                    local(vial_cost_3,env=IVMONC1),
                                    local(vial_cost_4,env=IVMONC1),
                                    local(vial_size,env=IVMONC1),
                                    local(initial_dose_amount,env=IVMONC1),
                                    local(initial_dose_unit,env=IVMONC1),
                                    local(maintenance_dose_amount,env=IVMONC1),
                                    local(maintenance_dose_unit,env=IVMONC1),
                                    local(cycle_length,env=IVMONC1),
                                    local(init_Admin_per_cycle,env=IVMONC1),
                                    local(subs_Admin_per_cycle,env=IVMONC1),
                                    local(phys_vis_cycle,env=IVMONC1),
                                    local(admin_cost_per_dose,env=IVMONC1),
                                    local(rebate,env=IVMONC1),
                                    local(cost_phys_visit_mont,env=IVMONC1),
                                    local(initial_treatment_duration,env=IVMONC1),
                                    local(total_treatment_duration,env=IVMONC1),
                                    waste,
                                    avg_weight,
                                    avg_BSA)


###New drug inputs environment###
IVMONC2 <- new.env()
##IV_monotherapy_C2-Vial optimisation inputs## MINE IVMONC2
local(DrugNumber <- "1",env=IVMONC2)
local(vial_cost_1 <- 6199.99,env=IVMONC2)
local(vial_cost_2 <- 2583.33,env=IVMONC2)
local(vial_cost_3 <- 1033.33,env=IVMONC2)
local(vial_cost_4 <- 0,env=IVMONC2)
local(vial_size<-c(240,100,40,0),env=IVMONC2)
local(initial_dose_amount<-480,env=IVMONC2)
local(initial_dose_unit<-"mg",env=IVMONC2)
local(maintenance_dose_amount<-3,env=IVMONC2)
local(maintenance_dose_unit<-"mg",env=IVMONC2)
local(cycle_length <- 4.00 ,env=IVMONC2)
local(init_Admin_per_cycle <- 1.00 ,env=IVMONC2)
local(subs_Admin_per_cycle <- 3.00 ,env=IVMONC2)
local(phys_vis_cycle <- 0.31 ,env=IVMONC2)
local(admin_cost_per_dose <- 72.36 ,env=IVMONC2)
local(rebate <- 0.0 ,env=IVMONC2)
local(cost_phys_visit_mont <- 147.60 ,env=IVMONC2)
local(total_treatment_duration <- 44.61 ,env=IVMONC2)
local(initial_treatment_duration <- 6.66 ,env=IVMONC2)

##IV_monotherapy_C2-Vial optimisation outputs## MINE IVMONC2
Vial_optimisation_Cost_calculations("IVMONC2",
                                    local(DrugNumber,env=IVMONC2),
                                    local(vial_cost_1,env=IVMONC2),
                                    local(vial_cost_2,env=IVMONC2),
                                    local(vial_cost_3,env=IVMONC2),
                                    local(vial_cost_4,env=IVMONC2),
                                    local(vial_size,env=IVMONC2),
                                    local(initial_dose_amount,env=IVMONC2),
                                    local(initial_dose_unit,env=IVMONC2),
                                    local(maintenance_dose_amount,env=IVMONC2),
                                    local(maintenance_dose_unit,env=IVMONC2),
                                    local(cycle_length,env=IVMONC2),
                                    local(init_Admin_per_cycle,env=IVMONC2),
                                    local(subs_Admin_per_cycle,env=IVMONC2),
                                    local(phys_vis_cycle,env=IVMONC2),
                                    local(admin_cost_per_dose,env=IVMONC2),
                                    local(rebate,env=IVMONC2),
                                    local(cost_phys_visit_mont,env=IVMONC2),
                                    local(initial_treatment_duration,env=IVMONC2),
                                    local(total_treatment_duration,env=IVMONC2),
                                    waste,
                                    avg_weight,
                                    avg_BSA)


###New drug inputs environment###
IVMONC3 <- new.env()
##IV_monotherapy_C3-Vial optimisation inputs## MINE IVMONC3
local(DrugNumber <- "1",env=IVMONC3)
local(vial_cost_1 <- 15,env=IVMONC3)
local(vial_cost_2 <- 10,env=IVMONC3)
local(vial_cost_3 <- 5,env=IVMONC3)
local(vial_cost_4 <- 0,env=IVMONC3)
local(vial_size<-c(888,444,296,0),env=IVMONC3)
local(initial_dose_amount<-6,env=IVMONC3)
local(initial_dose_unit<-"mg",env=IVMONC3)
local(maintenance_dose_amount<-3,env=IVMONC3)
local(maintenance_dose_unit<-"mg",env=IVMONC3)
local(cycle_length <- 1.00 ,env=IVMONC3)
local(init_Admin_per_cycle <- 1.00 ,env=IVMONC3)
local(subs_Admin_per_cycle <- 1.00 ,env=IVMONC3)
local(phys_vis_cycle <- 0.08 ,env=IVMONC3)
local(admin_cost_per_dose <- 72.36 ,env=IVMONC3)
local(rebate <- 0.0 ,env=IVMONC3)
local(cost_phys_visit_mont <- 147.60 ,env=IVMONC3)
local(total_treatment_duration <- 117.60 ,env=IVMONC3)
local(initial_treatment_duration <- 20.0 ,env=IVMONC3)

##IV_monotherapy_C3-Vial optimisation outputs## MINE IVMONC3
Vial_optimisation_Cost_calculations("IVMONC3",
                                    local(DrugNumber,env=IVMONC3),
                                    local(vial_cost_1,env=IVMONC3),
                                    local(vial_cost_2,env=IVMONC3),
                                    local(vial_cost_3,env=IVMONC3),
                                    local(vial_cost_4,env=IVMONC3),
                                    local(vial_size,env=IVMONC3),
                                    local(initial_dose_amount,env=IVMONC3),
                                    local(initial_dose_unit,env=IVMONC3),
                                    local(maintenance_dose_amount,env=IVMONC3),
                                    local(maintenance_dose_unit,env=IVMONC3),
                                    local(cycle_length,env=IVMONC3),
                                    local(init_Admin_per_cycle,env=IVMONC3),
                                    local(subs_Admin_per_cycle,env=IVMONC3),
                                    local(phys_vis_cycle,env=IVMONC3),
                                    local(admin_cost_per_dose,env=IVMONC3),
                                    local(rebate,env=IVMONC3),
                                    local(cost_phys_visit_mont,env=IVMONC3),
                                    local(initial_treatment_duration,env=IVMONC3),
                                    local(total_treatment_duration,env=IVMONC3),
                                    waste,
                                    avg_weight,
                                    avg_BSA)



###New drug inputs environment###
IVMONC4 <- new.env()
##IV_monotherapy_C4-Vial optimisation inputs## MINE IVMONC4
local(DrugNumber <- "1",env=IVMONC4)
local(vial_cost_1 <- 40,env=IVMONC4)
local(vial_cost_2 <- 20,env=IVMONC4)
local(vial_cost_3 <- 10,env=IVMONC4)
local(vial_cost_4 <- 0,env=IVMONC4)
local(vial_size<-c(50,18,10,0),env=IVMONC4)
local(initial_dose_amount<-20,env=IVMONC4)
local(initial_dose_unit<-"mg",env=IVMONC4)
local(maintenance_dose_amount<-5,env=IVMONC4)
local(maintenance_dose_unit<-"mg",env=IVMONC4)
local(cycle_length <- 1.00 ,env=IVMONC4)
local(init_Admin_per_cycle <- 5.00 ,env=IVMONC4)
local(subs_Admin_per_cycle <- 3.00 ,env=IVMONC4)
local(phys_vis_cycle <- 0.08 ,env=IVMONC4)
local(admin_cost_per_dose <- 48.24 ,env=IVMONC4)
local(rebate <- 0.0 ,env=IVMONC4)
local(cost_phys_visit_mont <- 147.60 ,env=IVMONC4)
local(total_treatment_duration <- 46.47 ,env=IVMONC4)
local(initial_treatment_duration <- 4.00 ,env=IVMONC4)

##IVMONC4-Vial optimisation outputs## MINE IVMONC4
Vial_optimisation_Cost_calculations("IVMONC4",
                                    local(DrugNumber,env=IVMONC4),
                                    local(vial_cost_1,env=IVMONC4),
                                    local(vial_cost_2,env=IVMONC4),
                                    local(vial_cost_3,env=IVMONC4),
                                    local(vial_cost_4,env=IVMONC4),
                                    local(vial_size,env=IVMONC4),
                                    local(initial_dose_amount,env=IVMONC4),
                                    local(initial_dose_unit,env=IVMONC4),
                                    local(maintenance_dose_amount,env=IVMONC4),
                                    local(maintenance_dose_unit,env=IVMONC4),
                                    local(cycle_length,env=IVMONC4),
                                    local(init_Admin_per_cycle,env=IVMONC4),
                                    local(subs_Admin_per_cycle,env=IVMONC4),
                                    local(phys_vis_cycle,env=IVMONC4),
                                    local(admin_cost_per_dose,env=IVMONC4),
                                    local(rebate,env=IVMONC4),
                                    local(cost_phys_visit_mont,env=IVMONC4),
                                    local(initial_treatment_duration,env=IVMONC4),
                                    local(total_treatment_duration,env=IVMONC4),
                                    waste,
                                    avg_weight,
                                    avg_BSA)


###New drug inputs environment###
IVMONC5 <- new.env()
##IVMONC5-Vial optimisation inputs## MINE IVMONC5
local(DrugNumber <- "1",env=IVMONC5)
local(vial_cost_1 <- 3,env=IVMONC5)
local(vial_cost_2 <- 2,env=IVMONC5)
local(vial_cost_3 <- 1.5,env=IVMONC5)
local(vial_cost_4 <- 1,env=IVMONC5)
local(vial_size<-c(9,6,5,3),env=IVMONC5)
local(initial_dose_amount<-3,env=IVMONC5)
local(initial_dose_unit<-"mg",env=IVMONC5)
local(maintenance_dose_amount<-3,env=IVMONC5)
local(maintenance_dose_unit<-"mg",env=IVMONC5)
local(cycle_length <- 1.00 ,env=IVMONC5)
local(init_Admin_per_cycle <- 3.00 ,env=IVMONC5)
local(subs_Admin_per_cycle <- 3.00 ,env=IVMONC5)
local(phys_vis_cycle <- 0.08 ,env=IVMONC5)
local(admin_cost_per_dose <- 72.36 ,env=IVMONC5)
local(rebate <- 0.0 ,env=IVMONC5)
local(cost_phys_visit_mont <- 147.60 ,env=IVMONC5)
local(total_treatment_duration <- 46.69 ,env=IVMONC5)
local(initial_treatment_duration <- 6.00 ,env=IVMONC5)

##IVMONC5-Vial optimisation outputs## MINE IVMONC5
Vial_optimisation_Cost_calculations("IVMONC5",
                                    local(DrugNumber,env=IVMONC5),
                                    local(vial_cost_1,env=IVMONC5),
                                    local(vial_cost_2,env=IVMONC5),
                                    local(vial_cost_3,env=IVMONC5),
                                    local(vial_cost_4,env=IVMONC5),
                                    local(vial_size,env=IVMONC5),
                                    local(initial_dose_amount,env=IVMONC5),
                                    local(initial_dose_unit,env=IVMONC5),
                                    local(maintenance_dose_amount,env=IVMONC5),
                                    local(maintenance_dose_unit,env=IVMONC5),
                                    local(cycle_length,env=IVMONC5),
                                    local(init_Admin_per_cycle,env=IVMONC5),
                                    local(subs_Admin_per_cycle,env=IVMONC5),
                                    local(phys_vis_cycle,env=IVMONC5),
                                    local(admin_cost_per_dose,env=IVMONC5),
                                    local(rebate,env=IVMONC5),
                                    local(cost_phys_visit_mont,env=IVMONC5),
                                    local(initial_treatment_duration,env=IVMONC5),
                                    local(total_treatment_duration,env=IVMONC5),
                                    waste,
                                    avg_weight,
                                    avg_BSA)

###New drug inputs environment###
IVCOMC1_D1 <- new.env()
##IVCOMC1_D1-Vial optimisation inputs## MINE IVCOMC1_D1
local(DrugNumber <- "1",env=IVCOMC1_D1)
local(vial_cost_1 <- 40,env=IVCOMC1_D1)
local(vial_cost_2 <- 20,env=IVCOMC1_D1)
local(vial_cost_3 <- 10,env=IVCOMC1_D1)
local(vial_cost_4 <- 0,env=IVCOMC1_D1)
local(vial_size<-c(50,18,10,0),env=IVCOMC1_D1)
local(initial_dose_amount<-3,env=IVCOMC1_D1)
local(initial_dose_unit<-"mg/kg",env=IVCOMC1_D1)
local(maintenance_dose_amount<-10,env=IVCOMC1_D1)
local(maintenance_dose_unit<-"mg",env=IVCOMC1_D1)
local(cycle_length <- 3.00 ,env=IVCOMC1_D1)
local(init_Admin_per_cycle <- 1.00 ,env=IVCOMC1_D1)
local(subs_Admin_per_cycle <- 3.00 ,env=IVCOMC1_D1)
local(phys_vis_cycle <- 0.00 ,env=IVCOMC1_D1)
local(admin_cost_per_dose <- 160.56 ,env=IVCOMC1_D1)
local(rebate <- 0.0 ,env=IVCOMC1_D1)
local(cost_phys_visit_mont <- 147.60 ,env=IVCOMC1_D1)
local(total_treatment_duration <- 37.47 ,env=IVCOMC1_D1)
local(initial_treatment_duration <- 4.00 ,env=IVCOMC1_D1)

##IVCOMC1_D1-Vial optimisation outputs## MINE IVCOMC1_D1
Vial_optimisation_Cost_calculations("IVCOMC1",
                                    local(DrugNumber,env=IVCOMC1_D1),
                                    local(vial_cost_1,env=IVCOMC1_D1),
                                    local(vial_cost_2,env=IVCOMC1_D1),
                                    local(vial_cost_3,env=IVCOMC1_D1),
                                    local(vial_cost_4,env=IVCOMC1_D1),
                                    local(vial_size,env=IVCOMC1_D1),
                                    local(initial_dose_amount,env=IVCOMC1_D1),
                                    local(initial_dose_unit,env=IVCOMC1_D1),
                                    local(maintenance_dose_amount,env=IVCOMC1_D1),
                                    local(maintenance_dose_unit,env=IVCOMC1_D1),
                                    local(cycle_length,env=IVCOMC1_D1),
                                    local(init_Admin_per_cycle,env=IVCOMC1_D1),
                                    local(subs_Admin_per_cycle,env=IVCOMC1_D1),
                                    local(phys_vis_cycle,env=IVCOMC1_D1),
                                    local(admin_cost_per_dose,env=IVCOMC1_D1),
                                    local(rebate,env=IVCOMC1_D1),
                                    local(cost_phys_visit_mont,env=IVCOMC1_D1),
                                    local(initial_treatment_duration,env=IVCOMC1_D1),
                                    local(total_treatment_duration,env=IVCOMC1_D1),
                                    waste,
                                    avg_weight,
                                    avg_BSA)


###New drug inputs environment###
IVCOMC1_D2 <- new.env()
##IVCOMC1_D2-Vial optimisation inputs## MINE IVCOMC1_D2
local(DrugNumber <- "2",env=IVCOMC1_D2)
local(vial_cost_1 <- 3,env=IVCOMC1_D2)
local(vial_cost_2 <- 2,env=IVCOMC1_D2)
local(vial_cost_3 <- 1.5,env=IVCOMC1_D2)
local(vial_cost_4 <- 1,env=IVCOMC1_D2)
local(vial_size<-c(9,6,5,3),env=IVCOMC1_D2)
local(initial_dose_amount<-1,env=IVCOMC1_D2)
local(initial_dose_unit<-"mg/kg",env=IVCOMC1_D2)
local(maintenance_dose_amount<-3,env=IVCOMC1_D2)
local(maintenance_dose_unit<-"mg",env=IVCOMC1_D2)
local(cycle_length <- 3.00 ,env=IVCOMC1_D2)
local(init_Admin_per_cycle <- 1.00 ,env=IVCOMC1_D2)
local(subs_Admin_per_cycle <- 3.00 ,env=IVCOMC1_D2)
local(phys_vis_cycle <- 0.23 ,env=IVCOMC1_D2)
local(admin_cost_per_dose <- 34.74 ,env=IVCOMC1_D2)
local(rebate <- 0.0 ,env=IVCOMC1_D2)
local(cost_phys_visit_mont <-  147.60,env=IVCOMC1_D2)
local(total_treatment_duration <- 44.61 ,env=IVCOMC1_D2)
local(initial_treatment_duration <- 6.66 ,env=IVCOMC1_D2)

##IVCOMC1_D2-Vial optimisation outputs## MINE IVCOMC1_D2
Vial_optimisation_Cost_calculations("IVCOMC1",
                                    local(DrugNumber,env=IVCOMC1_D2),
                                    local(vial_cost_1,env=IVCOMC1_D2),
                                    local(vial_cost_2,env=IVCOMC1_D2),
                                    local(vial_cost_3,env=IVCOMC1_D2),
                                    local(vial_cost_4,env=IVCOMC1_D2),
                                    local(vial_size,env=IVCOMC1_D2),
                                    local(initial_dose_amount,env=IVCOMC1_D2),
                                    local(initial_dose_unit,env=IVCOMC1_D2),
                                    local(maintenance_dose_amount,env=IVCOMC1_D2),
                                    local(maintenance_dose_unit,env=IVCOMC1_D2),
                                    local(cycle_length,env=IVCOMC1_D2),
                                    local(init_Admin_per_cycle,env=IVCOMC1_D2),
                                    local(subs_Admin_per_cycle,env=IVCOMC1_D2),
                                    local(phys_vis_cycle,env=IVCOMC1_D2),
                                    local(admin_cost_per_dose,env=IVCOMC1_D2),
                                    local(rebate,env=IVCOMC1_D2),
                                    local(cost_phys_visit_mont,env=IVCOMC1_D2),
                                    local(initial_treatment_duration,env=IVCOMC1_D2),
                                    local(total_treatment_duration,env=IVCOMC1_D2),
                                    waste,
                                    avg_weight,
                                    avg_BSA)

###New drug inputs environment###
IVCOMC2_D1 <- new.env()
##IVCOMC2_D1-Vial optimisation inputs## MINE IVCOMC2_D1
local(DrugNumber <- "1",env=IVCOMC2_D1)
local(vial_cost_1 <- 40,env=IVCOMC2_D1)
local(vial_cost_2 <- 20,env=IVCOMC2_D1)
local(vial_cost_3 <- 10,env=IVCOMC2_D1)
local(vial_cost_4 <- 0,env=IVCOMC2_D1)
local(vial_size<-c(50,18,10,0),env=IVCOMC2_D1)
local(initial_dose_amount<-3,env=IVCOMC2_D1)
local(initial_dose_unit<-"mg/kg",env=IVCOMC2_D1)
local(maintenance_dose_amount<-10,env=IVCOMC2_D1)
local(maintenance_dose_unit<-"mg",env=IVCOMC2_D1)
local(cycle_length <- 3.00 ,env=IVCOMC2_D1)
local(init_Admin_per_cycle <- 1.00 ,env=IVCOMC2_D1)
local(subs_Admin_per_cycle <- 3.00 ,env=IVCOMC2_D1)
local(phys_vis_cycle <- 0.00 ,env=IVCOMC2_D1)
local(admin_cost_per_dose <- 160.56 ,env=IVCOMC2_D1)
local(rebate <- 0.0 ,env=IVCOMC2_D1)
local(cost_phys_visit_mont <- 147.60 ,env=IVCOMC2_D1)
local(total_treatment_duration <- 37.47 ,env=IVCOMC2_D1)
local(initial_treatment_duration <- 4.00 ,env=IVCOMC2_D1)

##IVCOMC2_D1-Vial optimisation outputs## MINE IVCOMC2
Vial_optimisation_Cost_calculations("IVCOMC2",
                                    local(DrugNumber,env=IVCOMC2_D1),
                                    local(vial_cost_1,env=IVCOMC2_D1),
                                    local(vial_cost_2,env=IVCOMC2_D1),
                                    local(vial_cost_3,env=IVCOMC2_D1),
                                    local(vial_cost_4,env=IVCOMC2_D1),
                                    local(vial_size,env=IVCOMC2_D1),
                                    local(initial_dose_amount,env=IVCOMC2_D1),
                                    local(initial_dose_unit,env=IVCOMC2_D1),
                                    local(maintenance_dose_amount,env=IVCOMC2_D1),
                                    local(maintenance_dose_unit,env=IVCOMC2_D1),
                                    local(cycle_length,env=IVCOMC2_D1),
                                    local(init_Admin_per_cycle,env=IVCOMC2_D1),
                                    local(subs_Admin_per_cycle,env=IVCOMC2_D1),
                                    local(phys_vis_cycle,env=IVCOMC2_D1),
                                    local(admin_cost_per_dose,env=IVCOMC2_D1),
                                    local(rebate,env=IVCOMC2_D1),
                                    local(cost_phys_visit_mont,env=IVCOMC2_D1),
                                    local(initial_treatment_duration,env=IVCOMC2_D1),
                                    local(total_treatment_duration,env=IVCOMC2_D1),
                                    waste,
                                    avg_weight,
                                    avg_BSA)

###New drug inputs environment###
IVCOMC2_D2 <- new.env()
##IVCOMC2_D2-Vial optimisation inputs## MINE IVCOMC2_D2
local(DrugNumber <- "2",env=IVCOMC2_D2)
local(vial_cost_1 <- 3,env=IVCOMC2_D2)
local(vial_cost_2 <- 2,env=IVCOMC2_D2)
local(vial_cost_3 <- 1.5,env=IVCOMC2_D2)
local(vial_cost_4 <- 1,env=IVCOMC2_D2)
local(vial_size<-c(9,6,4.5,3),env=IVCOMC2_D2)
local(initial_dose_amount<-1,env=IVCOMC2_D2)
local(initial_dose_unit<-"mg/kg",env=IVCOMC2_D2)
local(maintenance_dose_amount<-3,env=IVCOMC2_D2)
local(maintenance_dose_unit<-"mg",env=IVCOMC2_D2)
local(cycle_length <- 3.00 ,env=IVCOMC2_D2)
local(init_Admin_per_cycle <- 1.00 ,env=IVCOMC2_D2)
local(subs_Admin_per_cycle <- 3.00 ,env=IVCOMC2_D2)
local(phys_vis_cycle <- 0.23 ,env=IVCOMC2_D2)
local(admin_cost_per_dose <- 34.74 ,env=IVCOMC2_D2)
local(rebate <- 0.0 ,env=IVCOMC2_D2)
local(cost_phys_visit_mont <- 147.60 ,env=IVCOMC2_D2)
local(total_treatment_duration <- 44.61 ,env=IVCOMC2_D2)
local(initial_treatment_duration <- 6.66 ,env=IVCOMC2_D2)


##IVCOMC2_D2-Vial optimisation outputs## MINE IVCOMC2_D2
Vial_optimisation_Cost_calculations("IVCOMC2",
                                    local(DrugNumber,env=IVCOMC2_D2),
                                    local(vial_cost_1,env=IVCOMC2_D2),
                                    local(vial_cost_2,env=IVCOMC2_D2),
                                    local(vial_cost_3,env=IVCOMC2_D2),
                                    local(vial_cost_4,env=IVCOMC2_D2),
                                    local(vial_size,env=IVCOMC2_D2),
                                    local(initial_dose_amount,env=IVCOMC2_D2),
                                    local(initial_dose_unit,env=IVCOMC2_D2),
                                    local(maintenance_dose_amount,env=IVCOMC2_D2),
                                    local(maintenance_dose_unit,env=IVCOMC2_D2),
                                    local(cycle_length,env=IVCOMC2_D2),
                                    local(init_Admin_per_cycle,env=IVCOMC2_D2),
                                    local(subs_Admin_per_cycle,env=IVCOMC2_D2),
                                    local(phys_vis_cycle,env=IVCOMC2_D2),
                                    local(admin_cost_per_dose,env=IVCOMC2_D2),
                                    local(rebate,env=IVCOMC2_D2),
                                    local(cost_phys_visit_mont,env=IVCOMC2_D2),
                                    local(initial_treatment_duration,env=IVCOMC2_D2),
                                    local(total_treatment_duration,env=IVCOMC2_D2),
                                    waste,
                                    avg_weight,
                                    avg_BSA)

###New drug inputs environment###
ORAMONC1 <- new.env()
##ORAMONC1-Vial optimisation inputs## MINE ORAMONC1
local(DrugNumber <- "1",env=ORAMONC1)
local(Pack_cost<-c(10782.10,3019.95,0,0),env=ORAMONC1)
local(Tablet_size<-c(2,0.5,0,0),env=ORAMONC1)
local(Pack_size<-c(30,30,0,0),env=ORAMONC1)
local(initial_dose_amount<-6,env=ORAMONC1)
local(initial_dose_unit<-"mg",env=ORAMONC1)
local(maintenance_dose_amount<-3,env=ORAMONC1)
local(maintenance_dose_unit<-"mg",env=ORAMONC1)
local(cycle_length <- 1.00 ,env=ORAMONC1)
local(init_Admin_per_cycle <- 1.00 ,env=ORAMONC1)
local(subs_Admin_per_cycle <- 1.00 ,env=ORAMONC1)
local(phys_vis_cycle <- 91.00 ,env=ORAMONC1)
local(admin_cost_per_dose <- 0.00 ,env=ORAMONC1)
local(rebate <- 0.0 ,env=ORAMONC1)
local(cost_phys_visit_mont <- 147.60 ,env=ORAMONC1)
local(total_treatment_duration <- 50.77 ,env=ORAMONC1)
local(initial_treatment_duration <- 20.00 ,env=ORAMONC1)

##ORAMONC1-Vial optimisation outputs## MINE ORAMONC1
Tablet_optimisation_Cost_calculations(Name="ORMONC1",
                                      local(DrugNumber,env=ORAMONC1),
                                      local(Pack_cost,env=ORAMONC1),
                                      local(Tablet_size,env=ORAMONC1),
                                      local(Pack_size,env=ORAMONC1),
                                      local(initial_dose_amount,env=ORAMONC1),
                                      local(initial_dose_unit,env=ORAMONC1),
                                      local(maintenance_dose_amount,env=ORAMONC1),
                                      local(maintenance_dose_unit,env=ORAMONC1),
                                      local(cycle_length,env=ORAMONC1),
                                      local(init_Admin_per_cycle,env=ORAMONC1),
                                      local(subs_Admin_per_cycle,env=ORAMONC1),
                                      local(phys_vis_cycle,env=ORAMONC1),
                                      local(admin_cost_per_dose,env=ORAMONC1),
                                      local(rebate,env=ORAMONC1),
                                      local(cost_phys_visit_mont,env=ORAMONC1),
                                      local(initial_treatment_duration,env=ORAMONC1),
                                      local(total_treatment_duration,env=ORAMONC1),
                                      waste,
                                      avg_weight,
                                      avg_BSA)

###New drug inputs environment###
ORAMONC2 <- new.env()
##ORAMONC2-Vial optimisation inputs## MINE ORAMONC2
local(DrugNumber <- "1",env=ORAMONC2)
local(Pack_cost<-c(10782.10,3019.95,0,0),env=ORAMONC2)
local(Tablet_size<-c(2,0.5,0,0),env=ORAMONC2)
local(Pack_size<-c(30,30,0,0),env=ORAMONC2)
local(initial_dose_amount<-20,env=ORAMONC2)
local(initial_dose_unit<-"mg",env=ORAMONC2)
local(maintenance_dose_amount<-10,env=ORAMONC2)
local(maintenance_dose_unit<-"mg",env=ORAMONC2)
local(cycle_length <- 1.00 ,env=ORAMONC2)
local(init_Admin_per_cycle <- 1.00 ,env=ORAMONC2)
local(subs_Admin_per_cycle <- 3.00 ,env=ORAMONC2)
local(phys_vis_cycle <- 91.00 ,env=ORAMONC2)
local(admin_cost_per_dose <- 0.00 ,env=ORAMONC2)
local(rebate <- 0.0 ,env=ORAMONC2)
local(cost_phys_visit_mont <- 147.60 ,env=ORAMONC2)
local(total_treatment_duration <- 50.77 ,env=ORAMONC2)
local(initial_treatment_duration <- 4.00 ,env=ORAMONC2)

##ORAMONC2-Vial optimisation outputs## MINE ORAMONC2
Tablet_optimisation_Cost_calculations(Name="ORMONC2",
                                      local(DrugNumber,env=ORAMONC2),
                                      local(Pack_cost,env=ORAMONC2),
                                      local(Tablet_size,env=ORAMONC2),
                                      local(Pack_size,env=ORAMONC2),
                                      local(initial_dose_amount,env=ORAMONC2),
                                      local(initial_dose_unit,env=ORAMONC2),
                                      local(maintenance_dose_amount,env=ORAMONC2),
                                      local(maintenance_dose_unit,env=ORAMONC2),
                                      local(cycle_length,env=ORAMONC2),
                                      local(init_Admin_per_cycle,env=ORAMONC2),
                                      local(subs_Admin_per_cycle,env=ORAMONC2),
                                      local(phys_vis_cycle,env=ORAMONC2),
                                      local(admin_cost_per_dose,env=ORAMONC2),
                                      local(rebate,env=ORAMONC2),
                                      local(cost_phys_visit_mont,env=ORAMONC2),
                                      local(initial_treatment_duration,env=ORAMONC2),
                                      local(total_treatment_duration,env=ORAMONC2),
                                      waste,
                                      avg_weight,
                                      avg_BSA)

###New drug inputs environment###
ORAMONC3 <- new.env()
##ORAMONC3-Vial optimisation inputs## MINE ORAMONC3
local(DrugNumber <- "1",env=ORAMONC3)
local(Pack_cost<-c(10782.10,3019.95,0,0),env=ORAMONC3)
local(Tablet_size<-c(2,0.5,0,0),env=ORAMONC3)
local(Pack_size<-c(30,30,0,0),env=ORAMONC3)
local(initial_dose_amount<-3,env=ORAMONC3)
local(initial_dose_unit<-"mg",env=ORAMONC3)
local(maintenance_dose_amount<-3,env=ORAMONC3)
local(maintenance_dose_unit<-"mg",env=ORAMONC3)
local(cycle_length <- 1.00 ,env=ORAMONC3)
local(init_Admin_per_cycle <- 1.00 ,env=ORAMONC3)
local(subs_Admin_per_cycle <- 3.00 ,env=ORAMONC3)
local(phys_vis_cycle <- 91.00 ,env=ORAMONC3)
local(admin_cost_per_dose <- 0.00 ,env=ORAMONC3)
local(rebate <- 0.0 ,env=ORAMONC3)
local(cost_phys_visit_mont <- 147.60 ,env=ORAMONC3)
local(total_treatment_duration <- 50.77 ,env=ORAMONC3)
local(initial_treatment_duration <- 6.66 ,env=ORAMONC3)

##ORAMONC3-Vial optimisation outputs## MINE ORAMONC3
Tablet_optimisation_Cost_calculations(Name="ORMONC3",
                                      local(DrugNumber,env=ORAMONC3),
                                      local(Pack_cost,env=ORAMONC3),
                                      local(Tablet_size,env=ORAMONC3),
                                      local(Pack_size,env=ORAMONC3),
                                      local(initial_dose_amount,env=ORAMONC3),
                                      local(initial_dose_unit,env=ORAMONC3),
                                      local(maintenance_dose_amount,env=ORAMONC3),
                                      local(maintenance_dose_unit,env=ORAMONC3),
                                      local(cycle_length,env=ORAMONC3),
                                      local(init_Admin_per_cycle,env=ORAMONC3),
                                      local(subs_Admin_per_cycle,env=ORAMONC3),
                                      local(phys_vis_cycle,env=ORAMONC3),
                                      local(admin_cost_per_dose,env=ORAMONC3),
                                      local(rebate,env=ORAMONC3),
                                      local(cost_phys_visit_mont,env=ORAMONC3),
                                      local(initial_treatment_duration,env=ORAMONC3),
                                      local(total_treatment_duration,env=ORAMONC3),
                                      waste,
                                      avg_weight,
                                      avg_BSA)

###New drug inputs environment###
ORACOMC1_D1 <- new.env()
##ORACOMC1_D1-Vial optimisation inputs## MINE ORACOMC1_D1
local(DrugNumber <- "1",env=ORACOMC1_D1)
local(Pack_cost<-c(9930.73,7345.80,0,0),env=ORACOMC1_D1)
local(Tablet_size<-c(75,50,0,0),env=ORACOMC1_D1)
local(Pack_size<-c(120,120,0,0),env=ORACOMC1_D1)
local(initial_dose_amount<-3,env=ORACOMC1_D1)
local(initial_dose_unit<-"mg/kg",env=ORACOMC1_D1)
local(maintenance_dose_amount<-10,env=ORACOMC1_D1)
local(maintenance_dose_unit<-"mg",env=ORACOMC1_D1)
local(cycle_length <- 1.00 ,env=ORACOMC1_D1)
local(init_Admin_per_cycle <- 2.00 ,env=ORACOMC1_D1)
local(subs_Admin_per_cycle <- 3.00 ,env=ORACOMC1_D1)
local(phys_vis_cycle <- 0.00,env=ORACOMC1_D1)
local(admin_cost_per_dose <- 0.00 ,env=ORACOMC1_D1)
local(rebate <- 0.0 ,env=ORACOMC1_D1)
local(cost_phys_visit_mont <- 147.60,env=ORACOMC1_D1)
local(total_treatment_duration <- 50.77 ,env=ORACOMC1_D1)
local(initial_treatment_duration <- 4.00 ,env=ORACOMC1_D1)


##ORACOMC1_D1-Vial optimisation outputs## MINE ORACOMC1_D1
Tablet_optimisation_Cost_calculations(Name="ORCOMC1",
                                      local(DrugNumber,env=ORACOMC1_D1),
                                      local(Pack_cost,env=ORACOMC1_D1),
                                      local(Tablet_size,env=ORACOMC1_D1),
                                      local(Pack_size,env=ORACOMC1_D1),
                                      local(initial_dose_amount,env=ORACOMC1_D1),
                                      local(initial_dose_unit,env=ORACOMC1_D1),
                                      local(maintenance_dose_amount,env=ORACOMC1_D1),
                                      local(maintenance_dose_unit,env=ORACOMC1_D1),
                                      local(cycle_length,env=ORACOMC1_D1),
                                      local(init_Admin_per_cycle,env=ORACOMC1_D1),
                                      local(subs_Admin_per_cycle,env=ORACOMC1_D1),
                                      local(phys_vis_cycle,env=ORACOMC1_D1),
                                      local(admin_cost_per_dose,env=ORACOMC1_D1),
                                      local(rebate,env=ORACOMC1_D1),
                                      local(cost_phys_visit_mont,env=ORACOMC1_D1),
                                      local(initial_treatment_duration,env=ORACOMC1_D1),
                                      local(total_treatment_duration,env=ORACOMC1_D1),
                                      waste,
                                      avg_weight,
                                      avg_BSA)


###New drug inputs environment###
ORACOMC1_D2 <- new.env()
##ORACOMC1_D2-Vial optimisation inputs## MINE ORACOMC1_D2
local(DrugNumber <- "2",env=ORACOMC1_D2)
local(Pack_cost<-c(10782.10,3019.95,0,0),env=ORACOMC1_D2)
local(Tablet_size<-c(2,0.5,0,0),env=ORACOMC1_D2)
local(Pack_size<-c(30,30,0,0),env=ORACOMC1_D2)
local(initial_dose_amount<-1,env=ORACOMC1_D2)
local(initial_dose_unit<-"mg/kg",env=ORACOMC1_D2)
local(maintenance_dose_amount<-3,env=ORACOMC1_D2)
local(maintenance_dose_unit<-"mg",env=ORACOMC1_D2)
local(cycle_length <- 1.00 ,env=ORACOMC1_D2)
local(init_Admin_per_cycle <- 1.00 ,env=ORACOMC1_D2)
local(subs_Admin_per_cycle <- 3.00 ,env=ORACOMC1_D2)
local(phys_vis_cycle <- 91.0 ,env=ORACOMC1_D2)
local(admin_cost_per_dose <- 0.00 ,env=ORACOMC1_D2)
local(rebate <- 0.0 ,env=ORACOMC1_D2)
local(cost_phys_visit_mont <- 147.60 ,env=ORACOMC1_D2)
local(total_treatment_duration <- 50.77 ,env=ORACOMC1_D2)
local(initial_treatment_duration <-  6.66,env=ORACOMC1_D2)

##ORACOMC1_D2-Vial optimisation outputs## MINE ORACOMC1_D2
Tablet_optimisation_Cost_calculations(Name="ORCOMC1",
                                      local(DrugNumber,env=ORACOMC1_D2),
                                      local(Pack_cost,env=ORACOMC1_D2),
                                      local(Tablet_size,env=ORACOMC1_D2),
                                      local(Pack_size,env=ORACOMC1_D2),
                                      local(initial_dose_amount,env=ORACOMC1_D2),
                                      local(initial_dose_unit,env=ORACOMC1_D2),
                                      local(maintenance_dose_amount,env=ORACOMC1_D2),
                                      local(maintenance_dose_unit,env=ORACOMC1_D2),
                                      local(cycle_length,env=ORACOMC1_D2),
                                      local(init_Admin_per_cycle,env=ORACOMC1_D2),
                                      local(subs_Admin_per_cycle,env=ORACOMC1_D2),
                                      local(phys_vis_cycle,env=ORACOMC1_D2),
                                      local(admin_cost_per_dose,env=ORACOMC1_D2),
                                      local(rebate,env=ORACOMC1_D2),
                                      local(cost_phys_visit_mont,env=ORACOMC1_D2),
                                      local(initial_treatment_duration,env=ORACOMC1_D2),
                                      local(total_treatment_duration,env=ORACOMC1_D2),
                                      waste,
                                      avg_weight,
                                      avg_BSA)

###New drug inputs environment###
ORACOMC2_D1 <- new.env()
##ORACOMC2_D1-Vial optimisation inputs## MINE ORACOMC2_D1
local(DrugNumber <- "1",env=ORACOMC2_D1)
local(Pack_cost<-c(9930.73,7345.80,0,0),env=ORACOMC2_D1)
local(Tablet_size<-c(75,50,0,0),env=ORACOMC2_D1)
local(Pack_size<-c(120,120,0,0),env=ORACOMC2_D1)
local(initial_dose_amount<-3,env=ORACOMC2_D1)
local(initial_dose_unit<-"mg",env=ORACOMC2_D1)
local(maintenance_dose_amount<-10,env=ORACOMC2_D1)
local(maintenance_dose_unit<-"mg",env=ORACOMC2_D1)
local(cycle_length <- 1.00 ,env=ORACOMC2_D1)
local(init_Admin_per_cycle <- 2.00 ,env=ORACOMC2_D1)
local(subs_Admin_per_cycle <- 3.00 ,env=ORACOMC2_D1)
local(phys_vis_cycle <- 0.00 ,env=ORACOMC2_D1)
local(admin_cost_per_dose <- 0.00 ,env=ORACOMC2_D1)
local(rebate <- 0.0 ,env=ORACOMC2_D1)
local(cost_phys_visit_mont <- 147.60 ,env=ORACOMC2_D1)
local(total_treatment_duration <- 50.77 ,env=ORACOMC2_D1)
local(initial_treatment_duration <- 4.00 ,env=ORACOMC2_D1)


##ORACOMC2_D1-Vial optimisation outputs## MINE ORACOMC2_D1
Tablet_optimisation_Cost_calculations(Name="ORCOMC2",
                                      local(DrugNumber,env=ORACOMC2_D1),
                                      local(Pack_cost,env=ORACOMC2_D1),
                                      local(Tablet_size,env=ORACOMC2_D1),
                                      local(Pack_size,env=ORACOMC2_D1),
                                      local(initial_dose_amount,env=ORACOMC2_D1),
                                      local(initial_dose_unit,env=ORACOMC2_D1),
                                      local(maintenance_dose_amount,env=ORACOMC2_D1),
                                      local(maintenance_dose_unit,env=ORACOMC2_D1),
                                      local(cycle_length,env=ORACOMC2_D1),
                                      local(init_Admin_per_cycle,env=ORACOMC2_D1),
                                      local(subs_Admin_per_cycle,env=ORACOMC2_D1),
                                      local(phys_vis_cycle,env=ORACOMC2_D1),
                                      local(admin_cost_per_dose,env=ORACOMC2_D1),
                                      local(rebate,env=ORACOMC2_D1),
                                      local(cost_phys_visit_mont,env=ORACOMC2_D1),
                                      local(initial_treatment_duration,env=ORACOMC2_D1),
                                      local(total_treatment_duration,env=ORACOMC2_D1),
                                      waste,
                                      avg_weight,
                                      avg_BSA)

###New drug inputs environment###
ORACOMC2_D2 <- new.env()
##ORACOMC2_D2-Vial optimisation inputs## MINE ORACOMC2_D2
local(DrugNumber <- "2",env=ORACOMC2_D2)
local(Pack_cost<-c(10782.10,3019.95,0,0),env=ORACOMC2_D2)
local(Tablet_size<-c(2,0.5,0,0),env=ORACOMC2_D2)
local(Pack_size<-c(30,30,0,0),env=ORACOMC2_D2)
local(initial_dose_amount<-1,env=ORACOMC2_D2)
local(initial_dose_unit<-"mg",env=ORACOMC2_D2)
local(maintenance_dose_amount<-3,env=ORACOMC2_D2)
local(maintenance_dose_unit<-"mg",env=ORACOMC2_D2)
local(cycle_length <- 1.00 ,env=ORACOMC2_D2)
local(init_Admin_per_cycle <- 1.00 ,env=ORACOMC2_D2)
local(subs_Admin_per_cycle <- 3.00 ,env=ORACOMC2_D2)
local(phys_vis_cycle <- 91.0 ,env=ORACOMC2_D2)
local(admin_cost_per_dose <- 0.00 ,env=ORACOMC2_D2)
local(rebate <- 0.0 ,env=ORACOMC2_D2)
local(cost_phys_visit_mont <- 147.60 ,env=ORACOMC2_D2)
local(total_treatment_duration <- 50.77 ,env=ORACOMC2_D2)
local(initial_treatment_duration <- 6.66 ,env=ORACOMC2_D2)

##ORACOMC2_D2-Vial optimisation outputs## MINE ORACOMC2_D2
Tablet_optimisation_Cost_calculations(Name="ORCOMC2",
                                      local(DrugNumber,env=ORACOMC2_D2),
                                      local(Pack_cost,env=ORACOMC2_D2),
                                      local(Tablet_size,env=ORACOMC2_D2),
                                      local(Pack_size,env=ORACOMC2_D2),
                                      local(initial_dose_amount,env=ORACOMC2_D2),
                                      local(initial_dose_unit,env=ORACOMC2_D2),
                                      local(maintenance_dose_amount,env=ORACOMC2_D2),
                                      local(maintenance_dose_unit,env=ORACOMC2_D2),
                                      local(cycle_length,env=ORACOMC2_D2),
                                      local(init_Admin_per_cycle,env=ORACOMC2_D2),
                                      local(subs_Admin_per_cycle,env=ORACOMC2_D2),
                                      local(phys_vis_cycle,env=ORACOMC2_D2),
                                      local(admin_cost_per_dose,env=ORACOMC2_D2),
                                      local(rebate,env=ORACOMC2_D2),
                                      local(cost_phys_visit_mont,env=ORACOMC2_D2),
                                      local(initial_treatment_duration,env=ORACOMC2_D2),
                                      local(total_treatment_duration,env=ORACOMC2_D2),
                                      waste,
                                      avg_weight,
                                      avg_BSA)

######################
#####Market Share#####
######################
##Market shares-Outputs##
#Calling the macros#
#source(paste(Filepath,"market_share v0_2.R",sep = ""))

###Market share-Inputs###
Market_share <- new.env()

##Subgroup 1-market share inputs##
#Reference scenario
local(IV_Mono_C1_current_S_1<-c(10,0,0),env=Market_share)
local(IV_Mono_C2_current_S_1<-c(70,75,75),env=Market_share)
local(IV_Mono_C3_current_S_1<-c(5,5,5),env=Market_share)
local(IV_Mono_C4_current_S_1<-c(0,0,0),env=Market_share)
local(IV_Mono_C5_current_S_1<-c(0,0,0),env=Market_share)
local(IV_Combi_C1_current_S_1<-c(0,0,0),env=Market_share)
local(IV_Combi_C2_current_S_1<-c(15,20,20),env=Market_share)
local(Oral_Mono_C1_current_S_1<-c(0,0,0),env=Market_share)
local(Oral_Mono_C2_current_S_1<-c(0,0,0),env=Market_share)
local(Oral_Mono_C3_current_S_1<-c(0,0,0),env=Market_share)
local(Oral_Combi_C1_current_S_1<-c(0,0,0),env=Market_share)
local(Oral_Combi_C2_current_S_1<-c(0,0,0),env=Market_share)
#New scenario
local(IVND_new_S_1<-c(17.5,26.25,26.25),env=Market_share)
local(IV_Mono_C1_new_S_1<-c(10,0,0),env=Market_share)
local(IV_Mono_C2_new_S_1<-c(52.5,48.75,48.75),env=Market_share)
local(IV_Mono_C3_new_S_1<-c(5,5,5),env=Market_share)
local(IV_Mono_C4_new_S_1<-c(0,0,0),env=Market_share)
local(IV_Mono_C5_new_S_1<-c(0,0,0),env=Market_share)
local(IV_Combi_C1_new_S_1<-c(0,0,0),env=Market_share)
local(IV_Combi_C2_new_S_1<-c(15,20,20),env=Market_share)
local(Oral_Mono_C1_new_S_1<-c(0,0,0),env=Market_share)
local(Oral_Mono_C2_new_S_1<-c(0,0,0),env=Market_share)
local(Oral_Mono_C3_new_S_1<-c(0,0,0),env=Market_share)
local(Oral_Combi_C1_new_S_1<-c(0,0,0),env=Market_share)
local(Oral_Combi_C2_new_S_1<-c(0,0,0),env=Market_share)
##Subgroup 1- market share outputs##
MarketShares_Subgroup1(Y,
                       local(IV_Mono_C1_current_S_1,env=Market_share),
                       local(IV_Mono_C2_current_S_1,env=Market_share),
                       local(IV_Mono_C3_current_S_1,env=Market_share),
                       local(IV_Mono_C4_current_S_1,env=Market_share),
                       local(IV_Mono_C5_current_S_1,env=Market_share),
                       local(IV_Combi_C1_current_S_1,env=Market_share),
                       local(IV_Combi_C2_current_S_1,env=Market_share),
                       local(Oral_Mono_C1_current_S_1,env=Market_share),
                       local(Oral_Mono_C2_current_S_1,env=Market_share),
                       local(Oral_Mono_C3_current_S_1,env=Market_share),
                       local(Oral_Combi_C1_current_S_1,env=Market_share),
                       local(Oral_Combi_C2_current_S_1,env=Market_share),
                       local(IVND_new_S_1,env=Market_share),
                       local(IV_Mono_C1_new_S_1,env=Market_share),
                       local(IV_Mono_C2_new_S_1,env=Market_share),
                       local(IV_Mono_C3_new_S_1,env=Market_share),
                       local(IV_Mono_C4_new_S_1,env=Market_share),
                       local(IV_Mono_C5_new_S_1,env=Market_share),
                       local(IV_Combi_C1_new_S_1,env=Market_share),
                       local(IV_Combi_C2_new_S_1,env=Market_share),
                       local(Oral_Mono_C1_new_S_1,env=Market_share),
                       local(Oral_Mono_C2_new_S_1,env=Market_share),
                       local(Oral_Mono_C3_new_S_1,env=Market_share),
                       local(Oral_Combi_C1_new_S_1,env=Market_share),
                       local(Oral_Combi_C2_new_S_1,env=Market_share))

##Subgroup 2-market share inputs##
#Reference scenario
local(IV_Mono_C1_current_S_2<-c(14.29,4.76,0),env=Market_share)
local(IV_Mono_C2_current_S_2<-c(71.43,80.96,80.95),env=Market_share)
local(IV_Mono_C3_current_S_2<-c(9.52,9.52,14.29),env=Market_share)
local(IV_Mono_C4_current_S_2<-c(0,0,0),env=Market_share)
local(IV_Mono_C5_current_S_2<-c(0,0,0),env=Market_share)
local(IV_Combi_C1_current_S_2<-c(4.76,4.76,4.76),env=Market_share)
local(IV_Combi_C2_current_S_2<-c(0,0,0),env=Market_share)
local(Oral_Mono_C1_current_S_2<-c(0,0,0),env=Market_share)
local(Oral_Mono_C2_current_S_2<-c(0,0,0),env=Market_share)
local(Oral_Mono_C3_current_S_2<-c(0,0,0),env=Market_share)
local(Oral_Combi_C1_current_S_2<-c(0,0,0),env=Market_share)
local(Oral_Combi_C2_current_S_2<-c(0,0,0),env=Market_share)
#New scenario
local(X_new_S_2<-c(17.86,28.33,28.33),env=Market_share)
local(IV_Mono_C1_new_S_2<-c(14.29,4.76,0),env=Market_share)
local(IV_Mono_C2_new_S_2<-c(53.57,52.63,52.62),env=Market_share)
local(IV_Mono_C3_new_S_2<-c(9.52,9.52,14.29),env=Market_share)
local(IV_Mono_C4_new_S_2<-c(0,0,0),env=Market_share)
local(IV_Mono_C5_new_S_2<-c(0,0,0),env=Market_share)
local(IV_Combi_C1_new_S_2<-c(4.76,4.76,4.76),env=Market_share)
local(IV_Combi_C2_new_S_2<-c(0,0,0),env=Market_share)
local(Oral_Mono_C1_new_S_2<-c(0,0,0),env=Market_share)
local(Oral_Mono_C2_new_S_2<-c(0,0,0),env=Market_share)
local(Oral_Mono_C3_new_S_2<-c(0,0,0),env=Market_share)
local(Oral_Combi_C1_new_S_2<-c(0,0,0),env=Market_share)
local(Oral_Combi_C2_new_S_2<-c(0,0,0),env=Market_share)
##Subgroup 2-market share outputs##
MarketShares_Subgroup2 (Y,
                        local(IV_Mono_C1_current_S_2,env=Market_share),
                        local(IV_Mono_C2_current_S_2,env=Market_share),
                        local(IV_Mono_C3_current_S_2,env=Market_share),
                        local(IV_Mono_C4_current_S_2,env=Market_share),
                        local(IV_Mono_C5_current_S_2,env=Market_share),
                        local(IV_Combi_C1_current_S_2,env=Market_share),
                        local(IV_Combi_C2_current_S_2,env=Market_share),
                        local(Oral_Mono_C1_current_S_2,env=Market_share),
                        local(Oral_Mono_C2_current_S_2,env=Market_share),
                        local(Oral_Mono_C3_current_S_2,env=Market_share),
                        local(Oral_Combi_C1_current_S_2,env=Market_share),
                        local(Oral_Combi_C2_current_S_2,env=Market_share),
                        local(X_new_S_2,env=Market_share),
                        local(IV_Mono_C1_new_S_2,env=Market_share),
                        local(IV_Mono_C2_new_S_2,env=Market_share),
                        local(IV_Mono_C3_new_S_2,env=Market_share),
                        local(IV_Mono_C4_new_S_2,env=Market_share),
                        local(IV_Mono_C5_new_S_2,env=Market_share),
                        local(IV_Combi_C1_new_S_2,env=Market_share),
                        local(IV_Combi_C2_new_S_2,env=Market_share),
                        local(Oral_Mono_C1_new_S_2,env=Market_share),
                        local(Oral_Mono_C2_new_S_2,env=Market_share),
                        local(Oral_Mono_C3_new_S_2,env=Market_share),
                        local(Oral_Combi_C1_new_S_2,env=Market_share),
                        local(Oral_Combi_C2_new_S_2,env=Market_share))



#########################
#####Adverse Eventes#####
#########################
###Market share-Inputs###
AEs <- new.env()

##Market shares-Outputs##
#Calling the macros#
#source(paste(Filepath,"adverse_events_v0_6.R",sep = ""))

###General Inputs###
##Cost of AE Input##
local(COS_AB_P <- 4461.00,env=AEs)
local(COS_ARTH <- 2355.17,env=AEs)
local(COS_BP <- 477.91,env=AEs)
local(COS_CHIL <- 4345.08,env=AEs)
local(COS_COLI <- 9600.00,env=AEs)
local(COS_CUTA_SSC <- 671.22,env=AEs)
local(COS_DIAR <- 869.00,env=AEs)
local(COS_FATUG <- 2320.00,env=AEs)
local(COS_HEAM <- 6185.88,env=AEs)
local(COS_AMI_TRANS_LEV <- 4345.08,env=AEs)
local(COS_ALAN_TRANS_LEV <- 4345.08,env=AEs)
local(COS_NAUS <- 1617.00,env=AEs)
local(COS_RASH <- 5137.62,env=AEs)
local(COS_PHOT_SEN <- 4151.73,env=AEs)
local(COS_PYREXIA <- 3704.00,env=AEs)
local(COS_RET_DET <- 5454.20,env=AEs)
local(COS_RENAL_FAI <- 6122.16,env=AEs)
local(COS_VOM <- 1617.00,env=AEs)
##Percent Hospitalised Due to AE Input##
local(PER_AB_P <- 100.00,env=AEs)
local(PER_ARTH <- 33.30,env=AEs)
local(PER_BP <- 39.60,env=AEs)
local(PER_CHIL <- 39.60,env=AEs)
local(PER_COLI <- 57.14,env=AEs)
local(PER_CUTA_SSC <- 39.60,env=AEs)
local(PER_DIAR <- 14.30,env=AEs)
local(PER_FATUG <- 16.70,env=AEs)
local(PER_HEAM <- 39.60,env=AEs)
local(PER_AMI_TRANS_LEV <- 0.00,env=AEs)
local(PER_ALAN_TRANS_LEV <- 0.00,env=AEs)
local(PER_NAUS <- 39.60,env=AEs)
local(PER_RASH <- 00.00,env=AEs)
local(PER_PHOT_SEN <- 39.6,env=AEs)
local(PER_PYREXIA <- 00.00,env=AEs)
local(PER_RET_DET <- 39.6,env=AEs)
local(PER_RENAL_FAI <- 39.60,env=AEs)
local(PER_VOM <- 39.60,env=AEs)

###########################

##Treatment X AE Input##
local(IVND_AE_AB_P <- 0.20,env=AEs)
local(IVND_AE_ARTH <- 0.60,env=AEs)
local(IVND_AE_BP <- 0.00,env=AEs)
local(IVND_AE_CHIL <- 0.00,env=AEs)
local(IVND_AE_COLI <- 2.00,env=AEs)
local(IVND_AE_CUTA_SSC <- 0.00,env=AEs)
local(IVND_AE_DIAR <- 0.80,env=AEs)
local(IVND_AE_FATUG <- 0.80,env=AEs)
local(IVND_AE_HEAM <- 0.00,env=AEs)
local(IVND_AE_AMI_TRANS_LEV <- 0.20,env=AEs)
local(IVND_AE_ALAN_TRANS_LEV <- 0.60,env=AEs)
local(IVND_AE_NAUS <- 0.00,env=AEs)
local(IVND_AE_RASH <- 0.20,env=AEs)
local(IVND_AE_PHOT_SEN <- 0.00,env=AEs)
local(IVND_AE_PYREXIA <- 0.20,env=AEs)
local(IVND_AE_RET_DET <- 0.00,env=AEs)
local(IVND_AE_RENAL_FAI <- 0.00,env=AEs)
local(IVND_AE_VOM<- 0.00,env=AEs)
##Treatment X AE Output##
Cost_of_grade_3_AE("IVND",
                   local(COS_AB_P,env=AEs),local(COS_ARTH,env=AEs),local(COS_BP,env=AEs),local(COS_CHIL,env=AEs),local(COS_COLI,env=AEs),local(COS_CUTA_SSC,env=AEs),local(COS_DIAR,env=AEs),local(COS_FATUG,env=AEs),local(COS_HEAM,env=AEs),local(COS_AMI_TRANS_LEV,env=AEs),
                   local(COS_ALAN_TRANS_LEV,env=AEs),local(COS_NAUS,env=AEs),local(COS_RASH,env=AEs),local(COS_PHOT_SEN,env=AEs),local(COS_PYREXIA,env=AEs),local(COS_RET_DET,env=AEs),local(COS_RENAL_FAI,env=AEs),local(COS_VOM,env=AEs),
                   local(PER_AB_P,env=AEs),local(PER_ARTH,env=AEs),local(PER_BP,env=AEs),local(PER_CHIL,env=AEs),local(PER_COLI,env=AEs),local(PER_CUTA_SSC,env=AEs),local(PER_DIAR,env=AEs),local(PER_FATUG,env=AEs),local(PER_HEAM,env=AEs),local(PER_AMI_TRANS_LEV,env=AEs),
                   local(PER_ALAN_TRANS_LEV,env=AEs),local(PER_NAUS,env=AEs),local(PER_RASH,env=AEs),local(PER_PHOT_SEN,env=AEs),local(PER_PYREXIA,env=AEs),local(PER_RET_DET,env=AEs),local(PER_RENAL_FAI,env=AEs),local(PER_VOM,env=AEs),
                   local(IVND_AE_AB_P,env=AEs),
                   local(IVND_AE_ARTH,env=AEs),
                   local(IVND_AE_BP,env=AEs),
                   local(IVND_AE_CHIL,env=AEs),
                   local(IVND_AE_COLI,env=AEs),
                   local(IVND_AE_CUTA_SSC,env=AEs),
                   local(IVND_AE_DIAR,env=AEs),
                   local(IVND_AE_FATUG,env=AEs),
                   local(IVND_AE_HEAM,env=AEs),
                   local(IVND_AE_AMI_TRANS_LEV,env=AEs),
                   local(IVND_AE_ALAN_TRANS_LEV,env=AEs),
                   local(IVND_AE_NAUS,env=AEs),
                   local(IVND_AE_RASH,env=AEs),
                   local(IVND_AE_PHOT_SEN,env=AEs),
                   local(IVND_AE_PYREXIA,env=AEs),
                   local(IVND_AE_RET_DET,env=AEs),
                   local(IVND_AE_RENAL_FAI,env=AEs),
                   local(IVND_AE_VOM,env=AEs))

###########################
##Treatment local(IVMONC1 AE Input##
local(IVMONC1_AE_AB_P <- 0.00,env=AEs)
local(IVMONC1_AE_ARTH <- 0.00,env=AEs)
local(IVMONC1_AE_BP <- 0.00,env=AEs)
local(IVMONC1_AE_CHIL <- 0.00,env=AEs)
local(IVMONC1_AE_COLI <- 5.00,env=AEs)
local(IVMONC1_AE_CUTA_SSC <- 0.00,env=AEs)
local(IVMONC1_AE_DIAR <- 5.00,env=AEs)
local(IVMONC1_AE_FATUG <- 7.00,env=AEs)
local(IVMONC1_AE_HEAM <- 0.00,env=AEs)
local(IVMONC1_AE_AMI_TRANS_LEV <- 0.00,env=AEs)
local(IVMONC1_AE_ALAN_TRANS_LEV <- 0.00,env=AEs)
local(IVMONC1_AE_NAUS <- 0.00,env=AEs)
local(IVMONC1_AE_RASH <- 0.00,env=AEs)
local(IVMONC1_AE_PHOT_SEN <- 0.00,env=AEs)
local(IVMONC1_AE_PYREXIA <- 0.00,env=AEs)
local(IVMONC1_AE_RET_DET <- 0.00,env=AEs)
local(IVMONC1_AE_RENAL_FAI <- 0.00,env=AEs)
local(IVMONC1_AE_VOM <- 0.00,env=AEs)
##Treatment IVMONC1 AE Output##
Cost_of_grade_3_AE("IVMONC1",
                   local(COS_AB_P,env=AEs),local(COS_ARTH,env=AEs),local(COS_BP,env=AEs),local(COS_CHIL,env=AEs),local(COS_COLI,env=AEs),local(COS_CUTA_SSC,env=AEs),local(COS_DIAR,env=AEs),local(COS_FATUG,env=AEs),local(COS_HEAM,env=AEs),local(COS_AMI_TRANS_LEV,env=AEs),
                   local(COS_ALAN_TRANS_LEV,env=AEs),local(COS_NAUS,env=AEs),local(COS_RASH,env=AEs),local(COS_PHOT_SEN,env=AEs),local(COS_PYREXIA,env=AEs),local(COS_RET_DET,env=AEs),local(COS_RENAL_FAI,env=AEs),local(COS_VOM,env=AEs),
                   local(PER_AB_P,env=AEs),local(PER_ARTH,env=AEs),local(PER_BP,env=AEs),local(PER_CHIL,env=AEs),local(PER_COLI,env=AEs),local(PER_CUTA_SSC,env=AEs),local(PER_DIAR,env=AEs),local(PER_FATUG,env=AEs),local(PER_HEAM,env=AEs),local(PER_AMI_TRANS_LEV,env=AEs),
                   local(PER_ALAN_TRANS_LEV,env=AEs),local(PER_NAUS,env=AEs),local(PER_RASH,env=AEs),local(PER_PHOT_SEN,env=AEs),local(PER_PYREXIA,env=AEs),local(PER_RET_DET,env=AEs),local(PER_RENAL_FAI,env=AEs),local(PER_VOM,env=AEs),
                   local(IVMONC1_AE_AB_P,env=AEs),
                   local(IVMONC1_AE_ARTH,env=AEs),
                   local(IVMONC1_AE_BP,env=AEs),
                   local(IVMONC1_AE_CHIL,env=AEs),
                   local(IVMONC1_AE_COLI,env=AEs),
                   local(IVMONC1_AE_CUTA_SSC,env=AEs),
                   local(IVMONC1_AE_DIAR,env=AEs),
                   local(IVMONC1_AE_FATUG,env=AEs),
                   local(IVMONC1_AE_HEAM,env=AEs),
                   local(IVMONC1_AE_AMI_TRANS_LEV,env=AEs),
                   local(IVMONC1_AE_ALAN_TRANS_LEV,env=AEs),
                   local(IVMONC1_AE_NAUS,env=AEs),
                   local(IVMONC1_AE_RASH,env=AEs),
                   local(IVMONC1_AE_PHOT_SEN,env=AEs),
                   local(IVMONC1_AE_PYREXIA,env=AEs),
                   local(IVMONC1_AE_RET_DET,env=AEs),
                   local(IVMONC1_AE_RENAL_FAI,env=AEs),
                   local(IVMONC1_AE_VOM,env=AEs))
###########################
##Treatment IVMONC2 AE Input##
local(IVMONC2_AE_AB_P <- 0.00,env=AEs)
local(IVMONC2_AE_ARTH <- 0.00,env=AEs)
local(IVMONC2_AE_BP <- 0.00,env=AEs)
local(IVMONC2_AE_CHIL <- 0.00,env=AEs)
local(IVMONC2_AE_COLI <- 0.60,env=AEs)
local(IVMONC2_AE_CUTA_SSC <- 0.00,env=AEs)
local(IVMONC2_AE_DIAR <- 2.20,env=AEs)
local(IVMONC2_AE_FATUG <- 1.30,env=AEs)
local(IVMONC2_AE_HEAM <- 0.00,env=AEs)
local(IVMONC2_AE_AMI_TRANS_LEV <- 1.00,env=AEs)
local(IVMONC2_AE_ALAN_TRANS_LEV <- 1.30,env=AEs)
local(IVMONC2_AE_NAUS <- 0.00,env=AEs)
local(IVMONC2_AE_RASH <- 0.60,env=AEs)
local(IVMONC2_AE_PHOT_SEN <- 0.00,env=AEs)
local(IVMONC2_AE_PYREXIA <- 0.00,env=AEs)
local(IVMONC2_AE_RET_DET <- 0.00,env=AEs)
local(IVMONC2_AE_RENAL_FAI <- 0.00,env=AEs)
local(IVMONC2_AE_VOM <- 0.30,env=AEs)
##Treatment IVMONC2 AE Output##
Cost_of_grade_3_AE("IVMONC2",
                   local(COS_AB_P,env=AEs),local(COS_ARTH,env=AEs),local(COS_BP,env=AEs),local(COS_CHIL,env=AEs),local(COS_COLI,env=AEs),local(COS_CUTA_SSC,env=AEs),local(COS_DIAR,env=AEs),local(COS_FATUG,env=AEs),local(COS_HEAM,env=AEs),local(COS_AMI_TRANS_LEV,env=AEs),
                   local(COS_ALAN_TRANS_LEV,env=AEs),local(COS_NAUS,env=AEs),local(COS_RASH,env=AEs),local(COS_PHOT_SEN,env=AEs),local(COS_PYREXIA,env=AEs),local(COS_RET_DET,env=AEs),local(COS_RENAL_FAI,env=AEs),local(COS_VOM,env=AEs),
                   local(PER_AB_P,env=AEs),local(PER_ARTH,env=AEs),local(PER_BP,env=AEs),local(PER_CHIL,env=AEs),local(PER_COLI,env=AEs),local(PER_CUTA_SSC,env=AEs),local(PER_DIAR,env=AEs),local(PER_FATUG,env=AEs),local(PER_HEAM,env=AEs),local(PER_AMI_TRANS_LEV,env=AEs),
                   local(PER_ALAN_TRANS_LEV,env=AEs),local(PER_NAUS,env=AEs),local(PER_RASH,env=AEs),local(PER_PHOT_SEN,env=AEs),local(PER_PYREXIA,env=AEs),local(PER_RET_DET,env=AEs),local(PER_RENAL_FAI,env=AEs),local(PER_VOM,env=AEs),
                   local(IVMONC2_AE_AB_P,env=AEs),
                   local(IVMONC2_AE_ARTH,env=AEs),
                   local(IVMONC2_AE_BP,env=AEs),
                   local(IVMONC2_AE_CHIL,env=AEs),
                   local(IVMONC2_AE_COLI,env=AEs),
                   local(IVMONC2_AE_CUTA_SSC,env=AEs),
                   local(IVMONC2_AE_DIAR,env=AEs),
                   local(IVMONC2_AE_FATUG,env=AEs),
                   local(IVMONC2_AE_HEAM,env=AEs),
                   local(IVMONC2_AE_AMI_TRANS_LEV,env=AEs),
                   local(IVMONC2_AE_ALAN_TRANS_LEV,env=AEs),
                   local(IVMONC2_AE_NAUS,env=AEs),
                   local(IVMONC2_AE_RASH,env=AEs),
                   local(IVMONC2_AE_PHOT_SEN,env=AEs),
                   local(IVMONC2_AE_PYREXIA,env=AEs),
                   local(IVMONC2_AE_RET_DET,env=AEs),
                   local(IVMONC2_AE_RENAL_FAI,env=AEs),
                   local(IVMONC2_AE_VOM,env=AEs))
###########################
##Treatment local(IVMONC3 AE Input##
local(IVMONC3_AE_AB_P <- 0.00,env=AEs)
local(IVMONC3_AE_ARTH <- 0.30,env=AEs)
local(IVMONC3_AE_BP <- 0.00,env=AEs)
local(IVMONC3_AE_CHIL <- 0.00,env=AEs)
local(IVMONC3_AE_COLI <- 7.70,env=AEs)
local(IVMONC3_AE_CUTA_SSC <- 0.00,env=AEs)
local(IVMONC3_AE_DIAR <- 9.30,env=AEs)
local(IVMONC3_AE_FATUG <- 4.20,env=AEs)
local(IVMONC3_AE_HEAM <- 0.00,env=AEs)
local(IVMONC3_AE_AMI_TRANS_LEV <- 6.10,env=AEs)
local(IVMONC3_AE_ALAN_TRANS_LEV <- 8.30,env=AEs)
local(IVMONC3_AE_NAUS <- 2.20,env=AEs)
local(IVMONC3_AE_RASH <- 4.80,env=AEs)
local(IVMONC3_AE_PHOT_SEN <- 0.00,env=AEs)
local(IVMONC3_AE_PYREXIA <- 0.60,env=AEs)
local(IVMONC3_AE_RET_DET <- 0.00,env=AEs)
local(IVMONC3_AE_RENAL_FAI <- 0.00,env=AEs)
local(IVMONC3_AE_VOM <- 2.60,env=AEs)
##Treatment IVMONC3 AE Output##
Cost_of_grade_3_AE("IVMONC3",
                   local(COS_AB_P,env=AEs),local(COS_ARTH,env=AEs),local(COS_BP,env=AEs),local(COS_CHIL,env=AEs),local(COS_COLI,env=AEs),local(COS_CUTA_SSC,env=AEs),local(COS_DIAR,env=AEs),local(COS_FATUG,env=AEs),local(COS_HEAM,env=AEs),local(COS_AMI_TRANS_LEV,env=AEs),
                   local(COS_ALAN_TRANS_LEV,env=AEs),local(COS_NAUS,env=AEs),local(COS_RASH,env=AEs),local(COS_PHOT_SEN,env=AEs),local(COS_PYREXIA,env=AEs),local(COS_RET_DET,env=AEs),local(COS_RENAL_FAI,env=AEs),local(COS_VOM,env=AEs),
                   local(PER_AB_P,env=AEs),local(PER_ARTH,env=AEs),local(PER_BP,env=AEs),local(PER_CHIL,env=AEs),local(PER_COLI,env=AEs),local(PER_CUTA_SSC,env=AEs),local(PER_DIAR,env=AEs),local(PER_FATUG,env=AEs),local(PER_HEAM,env=AEs),local(PER_AMI_TRANS_LEV,env=AEs),
                   local(PER_ALAN_TRANS_LEV,env=AEs),local(PER_NAUS,env=AEs),local(PER_RASH,env=AEs),local(PER_PHOT_SEN,env=AEs),local(PER_PYREXIA,env=AEs),local(PER_RET_DET,env=AEs),local(PER_RENAL_FAI,env=AEs),local(PER_VOM,env=AEs),
                   local(IVMONC3_AE_AB_P,env=AEs),
                   local(IVMONC3_AE_ARTH,env=AEs),
                   local(IVMONC3_AE_BP,env=AEs),
                   local(IVMONC3_AE_CHIL,env=AEs),
                   local(IVMONC3_AE_COLI,env=AEs),
                   local(IVMONC3_AE_CUTA_SSC,env=AEs),
                   local(IVMONC3_AE_DIAR,env=AEs),
                   local(IVMONC3_AE_FATUG,env=AEs),
                   local(IVMONC3_AE_HEAM,env=AEs),
                   local(IVMONC3_AE_AMI_TRANS_LEV,env=AEs),
                   local(IVMONC3_AE_ALAN_TRANS_LEV,env=AEs),
                   local(IVMONC3_AE_NAUS,env=AEs),
                   local(IVMONC3_AE_RASH,env=AEs),
                   local(IVMONC3_AE_PHOT_SEN,env=AEs),
                   local(IVMONC3_AE_PYREXIA,env=AEs),
                   local(IVMONC3_AE_RET_DET,env=AEs),
                   local(IVMONC3_AE_RENAL_FAI,env=AEs),
                   local(IVMONC3_AE_VOM,env=AEs))
###########################
##Treatment IVMONC4 AE Input##
local(IVMONC4_AE_AB_P <- 0.00,env=AEs)
local(IVMONC4_AE_ARTH <- 0.00,env=AEs)
local(IVMONC4_AE_BP <- 0.00,env=AEs)
local(IVMONC4_AE_CHIL <- 16.00,env=AEs)
local(IVMONC4_AE_COLI <- 0.00,env=AEs)
local(IVMONC4_AE_CUTA_SSC <- 0.00,env=AEs)
local(IVMONC4_AE_DIAR <- 0.00,env=AEs)
local(IVMONC4_AE_FATUG <- 23.00,env=AEs)
local(IVMONC4_AE_HEAM <- 0.00,env=AEs)
local(IVMONC4_AE_AMI_TRANS_LEV <- 0.00,env=AEs)
local(IVMONC4_AE_ALAN_TRANS_LEV <- 0.00,env=AEs)
local(IVMONC4_AE_NAUS <- 0.00,env=AEs)
local(IVMONC4_AE_RASH <- 0.00,env=AEs)
local(IVMONC4_AE_PHOT_SEN <- 0.00,env=AEs)
local(IVMONC4_AE_PYREXIA <- 0.00,env=AEs)
local(IVMONC4_AE_RET_DET <- 0.00,env=AEs)
local(IVMONC4_AE_RENAL_FAI <- 0.00,env=AEs)
local(IVMONC4_AE_VOM <- 0.00,env=AEs)
##Treatment IVMONC4 AE Output##
Cost_of_grade_3_AE("IVMONC4",
                   local(COS_AB_P,env=AEs),local(COS_ARTH,env=AEs),local(COS_BP,env=AEs),local(COS_CHIL,env=AEs),local(COS_COLI,env=AEs),local(COS_CUTA_SSC,env=AEs),local(COS_DIAR,env=AEs),local(COS_FATUG,env=AEs),local(COS_HEAM,env=AEs),local(COS_AMI_TRANS_LEV,env=AEs),
                   local(COS_ALAN_TRANS_LEV,env=AEs),local(COS_NAUS,env=AEs),local(COS_RASH,env=AEs),local(COS_PHOT_SEN,env=AEs),local(COS_PYREXIA,env=AEs),local(COS_RET_DET,env=AEs),local(COS_RENAL_FAI,env=AEs),local(COS_VOM,env=AEs),
                   local(PER_AB_P,env=AEs),local(PER_ARTH,env=AEs),local(PER_BP,env=AEs),local(PER_CHIL,env=AEs),local(PER_COLI,env=AEs),local(PER_CUTA_SSC,env=AEs),local(PER_DIAR,env=AEs),local(PER_FATUG,env=AEs),local(PER_HEAM,env=AEs),local(PER_AMI_TRANS_LEV,env=AEs),
                   local(PER_ALAN_TRANS_LEV,env=AEs),local(PER_NAUS,env=AEs),local(PER_RASH,env=AEs),local(PER_PHOT_SEN,env=AEs),local(PER_PYREXIA,env=AEs),local(PER_RET_DET,env=AEs),local(PER_RENAL_FAI,env=AEs),local(PER_VOM,env=AEs),
                   local(IVMONC4_AE_AB_P,env=AEs),
                   local(IVMONC4_AE_ARTH,env=AEs),
                   local(IVMONC4_AE_BP,env=AEs),
                   local(IVMONC4_AE_CHIL,env=AEs),
                   local(IVMONC4_AE_COLI,env=AEs),
                   local(IVMONC4_AE_CUTA_SSC,env=AEs),
                   local(IVMONC4_AE_DIAR,env=AEs),
                   local(IVMONC4_AE_FATUG,env=AEs),
                   local(IVMONC4_AE_HEAM,env=AEs),
                   local(IVMONC4_AE_AMI_TRANS_LEV,env=AEs),
                   local(IVMONC4_AE_ALAN_TRANS_LEV,env=AEs),
                   local(IVMONC4_AE_NAUS,env=AEs),
                   local(IVMONC4_AE_RASH,env=AEs),
                   local(IVMONC4_AE_PHOT_SEN,env=AEs),
                   local(IVMONC4_AE_PYREXIA,env=AEs),
                   local(IVMONC4_AE_RET_DET,env=AEs),
                   local(IVMONC4_AE_RENAL_FAI,env=AEs),
                   local(IVMONC4_AE_VOM,env=AEs))
###########################
##Treatment IVMONC5 AE Input##
local(IVMONC5_AE_AB_P <- 0.00,env=AEs)
local(IVMONC5_AE_ARTH <- 3.00,env=AEs)
local(IVMONC5_AE_BP <- 0.00,env=AEs)
local(IVMONC5_AE_CHIL <- 1.00,env=AEs)
local(IVMONC5_AE_COLI <- 0.00,env=AEs)
local(IVMONC5_AE_CUTA_SSC <- 0.00,env=AEs)
local(IVMONC5_AE_DIAR <- 1.00,env=AEs)
local(IVMONC5_AE_FATUG <- 16.00,env=AEs)
local(IVMONC5_AE_HEAM <- 0.00,env=AEs)
local(IVMONC5_AE_AMI_TRANS_LEV <- 0.00,env=AEs)
local(IVMONC5_AE_ALAN_TRANS_LEV <- 11.00,env=AEs)
local(IVMONC5_AE_NAUS <- 3.00,env=AEs)
local(IVMONC5_AE_RASH <- 1.00,env=AEs)
local(IVMONC5_AE_PHOT_SEN <- 0.00,env=AEs)
local(IVMONC5_AE_PYREXIA <- 4.00,env=AEs)
local(IVMONC5_AE_RET_DET <- 0.00,env=AEs)
local(IVMONC5_AE_RENAL_FAI <- 0.00,env=AEs)
local(IVMONC5_AE_VOM <- 1.00,env=AEs)
##Treatment IVMONC5 AE Output##
Cost_of_grade_3_AE("IVMONC5",
                   local(COS_AB_P,env=AEs),local(COS_ARTH,env=AEs),local(COS_BP,env=AEs),local(COS_CHIL,env=AEs),local(COS_COLI,env=AEs),local(COS_CUTA_SSC,env=AEs),local(COS_DIAR,env=AEs),local(COS_FATUG,env=AEs),local(COS_HEAM,env=AEs),local(COS_AMI_TRANS_LEV,env=AEs),
                   local(COS_ALAN_TRANS_LEV,env=AEs),local(COS_NAUS,env=AEs),local(COS_RASH,env=AEs),local(COS_PHOT_SEN,env=AEs),local(COS_PYREXIA,env=AEs),local(COS_RET_DET,env=AEs),local(COS_RENAL_FAI,env=AEs),local(COS_VOM,env=AEs),
                   local(PER_AB_P,env=AEs),local(PER_ARTH,env=AEs),local(PER_BP,env=AEs),local(PER_CHIL,env=AEs),local(PER_COLI,env=AEs),local(PER_CUTA_SSC,env=AEs),local(PER_DIAR,env=AEs),local(PER_FATUG,env=AEs),local(PER_HEAM,env=AEs),local(PER_AMI_TRANS_LEV,env=AEs),
                   local(PER_ALAN_TRANS_LEV,env=AEs),local(PER_NAUS,env=AEs),local(PER_RASH,env=AEs),local(PER_PHOT_SEN,env=AEs),local(PER_PYREXIA,env=AEs),local(PER_RET_DET,env=AEs),local(PER_RENAL_FAI,env=AEs),local(PER_VOM,env=AEs),
                   local(IVMONC5_AE_AB_P,env=AEs),
                   local(IVMONC5_AE_ARTH,env=AEs),
                   local(IVMONC5_AE_BP,env=AEs),
                   local(IVMONC5_AE_CHIL,env=AEs),
                   local(IVMONC5_AE_COLI,env=AEs),
                   local(IVMONC5_AE_CUTA_SSC,env=AEs),
                   local(IVMONC5_AE_DIAR,env=AEs),
                   local(IVMONC5_AE_FATUG,env=AEs),
                   local(IVMONC5_AE_HEAM,env=AEs),
                   local(IVMONC5_AE_AMI_TRANS_LEV,env=AEs),
                   local(IVMONC5_AE_ALAN_TRANS_LEV,env=AEs),
                   local(IVMONC5_AE_NAUS,env=AEs),
                   local(IVMONC5_AE_RASH,env=AEs),
                   local(IVMONC5_AE_PHOT_SEN,env=AEs),
                   local(IVMONC5_AE_PYREXIA,env=AEs),
                   local(IVMONC5_AE_RET_DET,env=AEs),
                   local(IVMONC5_AE_RENAL_FAI,env=AEs),
                   local(IVMONC5_AE_VOM,env=AEs))
###########################
##Treatment IVCOMC1 AE Input##
local(IVCOMC1_AE_AB_P <- 0.00,env=AEs)
local(IVCOMC1_AE_ARTH <- 0.00,env=AEs)
local(IVCOMC1_AE_BP <- 15.00,env=AEs)
local(IVCOMC1_AE_CHIL <- 20.00,env=AEs)
local(IVCOMC1_AE_COLI <- 0.00,env=AEs)
local(IVCOMC1_AE_CUTA_SSC <- 0.00,env=AEs)
local(IVCOMC1_AE_DIAR <- 11.00,env=AEs)
local(IVCOMC1_AE_FATUG <- 27.00,env=AEs)
local(IVCOMC1_AE_HEAM <- 0.00,env=AEs)
local(IVCOMC1_AE_AMI_TRANS_LEV <- 0.00,env=AEs)
local(IVCOMC1_AE_ALAN_TRANS_LEV <- 0.00,env=AEs)
local(IVCOMC1_AE_NAUS <- 11.00,env=AEs)
local(IVCOMC1_AE_RASH <- 6.00,env=AEs)
local(IVCOMC1_AE_PHOT_SEN <- 0.00,env=AEs)
local(IVCOMC1_AE_PYREXIA <- 0.00,env=AEs)
local(IVCOMC1_AE_RET_DET <- 0.00,env=AEs)
local(IVCOMC1_AE_RENAL_FAI <- 0.00,env=AEs)
local(IVCOMC1_AE_VOM <- 0.00,env=AEs)
##Treatment IVCOMC1 AE Output##
Cost_of_grade_3_AE("IVCOMC1",
                   local(COS_AB_P,env=AEs),local(COS_ARTH,env=AEs),local(COS_BP,env=AEs),local(COS_CHIL,env=AEs),local(COS_COLI,env=AEs),local(COS_CUTA_SSC,env=AEs),local(COS_DIAR,env=AEs),local(COS_FATUG,env=AEs),local(COS_HEAM,env=AEs),local(COS_AMI_TRANS_LEV,env=AEs),
                   local(COS_ALAN_TRANS_LEV,env=AEs),local(COS_NAUS,env=AEs),local(COS_RASH,env=AEs),local(COS_PHOT_SEN,env=AEs),local(COS_PYREXIA,env=AEs),local(COS_RET_DET,env=AEs),local(COS_RENAL_FAI,env=AEs),local(COS_VOM,env=AEs),
                   local(PER_AB_P,env=AEs),local(PER_ARTH,env=AEs),local(PER_BP,env=AEs),local(PER_CHIL,env=AEs),local(PER_COLI,env=AEs),local(PER_CUTA_SSC,env=AEs),local(PER_DIAR,env=AEs),local(PER_FATUG,env=AEs),local(PER_HEAM,env=AEs),local(PER_AMI_TRANS_LEV,env=AEs),
                   local(PER_ALAN_TRANS_LEV,env=AEs),local(PER_NAUS,env=AEs),local(PER_RASH,env=AEs),local(PER_PHOT_SEN,env=AEs),local(PER_PYREXIA,env=AEs),local(PER_RET_DET,env=AEs),local(PER_RENAL_FAI,env=AEs),local(PER_VOM,env=AEs),
                   local(IVCOMC1_AE_AB_P,env=AEs),
                   local(IVCOMC1_AE_ARTH,env=AEs),
                   local(IVCOMC1_AE_BP,env=AEs),
                   local(IVCOMC1_AE_CHIL,env=AEs),
                   local(IVCOMC1_AE_COLI,env=AEs),
                   local(IVCOMC1_AE_CUTA_SSC,env=AEs),
                   local(IVCOMC1_AE_DIAR,env=AEs),
                   local(IVCOMC1_AE_FATUG,env=AEs),
                   local(IVCOMC1_AE_HEAM,env=AEs),
                   local(IVCOMC1_AE_AMI_TRANS_LEV,env=AEs),
                   local(IVCOMC1_AE_ALAN_TRANS_LEV,env=AEs),
                   local(IVCOMC1_AE_NAUS,env=AEs),
                   local(IVCOMC1_AE_RASH,env=AEs),
                   local(IVCOMC1_AE_PHOT_SEN,env=AEs),
                   local(IVCOMC1_AE_PYREXIA,env=AEs),
                   local(IVCOMC1_AE_RET_DET,env=AEs),
                   local(IVCOMC1_AE_RENAL_FAI,env=AEs),
                   local(IVCOMC1_AE_VOM,env=AEs))
###########################
##Treatment IVCOMC2 AE Input##
local(IVCOMC2_AE_AB_P <- 2.00,env=AEs)
local(IVCOMC2_AE_ARTH <- 0.00,env=AEs)
local(IVCOMC2_AE_BP <- 2.52,env=AEs)
local(IVCOMC2_AE_CHIL <- 2.00,env=AEs)
local(IVCOMC2_AE_COLI <- 0.00,env=AEs)
local(IVCOMC2_AE_CUTA_SSC <- 0.00,env=AEs)
local(IVCOMC2_AE_DIAR <- 1.01,env=AEs)
local(IVCOMC2_AE_FATUG <- 3.01,env=AEs)
local(IVCOMC2_AE_HEAM <- 2.48,env=AEs)
local(IVCOMC2_AE_AMI_TRANS_LEV <- 0.00,env=AEs)
local(IVCOMC2_AE_ALAN_TRANS_LEV <- 0.00,env=AEs)
local(IVCOMC2_AE_NAUS <- 3.98,env=AEs)
local(IVCOMC2_AE_RASH <- 0.99,env=AEs)
local(IVCOMC2_AE_PHOT_SEN <- 0.00,env=AEs)
local(IVCOMC2_AE_PYREXIA <- 6.98,env=AEs)
local(IVCOMC2_AE_RET_DET <- 0.00,env=AEs)
local(IVCOMC2_AE_RENAL_FAI <- 3.53,env=AEs)
local(IVCOMC2_AE_VOM <- 2.99,env=AEs)
##Treatment IVCOMC2 AE Output##
Cost_of_grade_3_AE("IVCOMC2",
                   local(COS_AB_P,env=AEs),local(COS_ARTH,env=AEs),local(COS_BP,env=AEs),local(COS_CHIL,env=AEs),local(COS_COLI,env=AEs),local(COS_CUTA_SSC,env=AEs),local(COS_DIAR,env=AEs),local(COS_FATUG,env=AEs),local(COS_HEAM,env=AEs),local(COS_AMI_TRANS_LEV,env=AEs),
                   local(COS_ALAN_TRANS_LEV,env=AEs),local(COS_NAUS,env=AEs),local(COS_RASH,env=AEs),local(COS_PHOT_SEN,env=AEs),local(COS_PYREXIA,env=AEs),local(COS_RET_DET,env=AEs),local(COS_RENAL_FAI,env=AEs),local(COS_VOM,env=AEs),
                   local(PER_AB_P,env=AEs),local(PER_ARTH,env=AEs),local(PER_BP,env=AEs),local(PER_CHIL,env=AEs),local(PER_COLI,env=AEs),local(PER_CUTA_SSC,env=AEs),local(PER_DIAR,env=AEs),local(PER_FATUG,env=AEs),local(PER_HEAM,env=AEs),local(PER_AMI_TRANS_LEV,env=AEs),
                   local(PER_ALAN_TRANS_LEV,env=AEs),local(PER_NAUS,env=AEs),local(PER_RASH,env=AEs),local(PER_PHOT_SEN,env=AEs),local(PER_PYREXIA,env=AEs),local(PER_RET_DET,env=AEs),local(PER_RENAL_FAI,env=AEs),local(PER_VOM,env=AEs),
                   local(IVCOMC2_AE_AB_P,env=AEs),
                   local(IVCOMC2_AE_ARTH,env=AEs),
                   local(IVCOMC2_AE_BP,env=AEs),
                   local(IVCOMC2_AE_CHIL,env=AEs),
                   local(IVCOMC2_AE_COLI,env=AEs),
                   local(IVCOMC2_AE_CUTA_SSC,env=AEs),
                   local(IVCOMC2_AE_DIAR,env=AEs),
                   local(IVCOMC2_AE_FATUG,env=AEs),
                   local(IVCOMC2_AE_HEAM,env=AEs),
                   local(IVCOMC2_AE_AMI_TRANS_LEV,env=AEs),
                   local(IVCOMC2_AE_ALAN_TRANS_LEV,env=AEs),
                   local(IVCOMC2_AE_NAUS,env=AEs),
                   local(IVCOMC2_AE_RASH,env=AEs),
                   local(IVCOMC2_AE_PHOT_SEN,env=AEs),
                   local(IVCOMC2_AE_PYREXIA,env=AEs),
                   local(IVCOMC2_AE_RET_DET,env=AEs),
                   local(IVCOMC2_AE_RENAL_FAI,env=AEs),
                   local(IVCOMC2_AE_VOM,env=AEs))
###########################
##Treatment ORMONC1 AE Input##
local(ORMONC1_AE_AB_P <- 0.00,env=AEs)
local(ORMONC1_AE_ARTH <- 2.36,env=AEs)
local(ORMONC1_AE_BP <- 0.00,env=AEs)
local(ORMONC1_AE_CHIL <- 0.00,env=AEs)
local(ORMONC1_AE_COLI <- 0.00,env=AEs)
local(ORMONC1_AE_CUTA_SSC <- 2.36,env=AEs)
local(ORMONC1_AE_DIAR <- 6.30,env=AEs)
local(ORMONC1_AE_FATUG <- 3.54,env=AEs)
local(ORMONC1_AE_HEAM <- 0.00,env=AEs)
local(ORMONC1_AE_AMI_TRANS_LEV <- 8.27,env=AEs)
local(ORMONC1_AE_ALAN_TRANS_LEV <- 11.42,env=AEs)
local(ORMONC1_AE_NAUS <- 0.79,env=AEs)
local(ORMONC1_AE_RASH <- 5.91,env=AEs)
local(ORMONC1_AE_PHOT_SEN <- 2.36,env=AEs)
local(ORMONC1_AE_PYREXIA <- 1.57,env=AEs)
local(ORMONC1_AE_RET_DET <- 2.36,env=AEs)
local(ORMONC1_AE_RENAL_FAI <- 0.00,env=AEs)
local(ORMONC1_AE_VOM <- 1.18,env=AEs)
##Treatment ORMONC1 AE Output##
Cost_of_grade_3_AE("ORMONC1",
                   local(COS_AB_P,env=AEs),local(COS_ARTH,env=AEs),local(COS_BP,env=AEs),local(COS_CHIL,env=AEs),local(COS_COLI,env=AEs),local(COS_CUTA_SSC,env=AEs),local(COS_DIAR,env=AEs),local(COS_FATUG,env=AEs),local(COS_HEAM,env=AEs),local(COS_AMI_TRANS_LEV,env=AEs),
                   local(COS_ALAN_TRANS_LEV,env=AEs),local(COS_NAUS,env=AEs),local(COS_RASH,env=AEs),local(COS_PHOT_SEN,env=AEs),local(COS_PYREXIA,env=AEs),local(COS_RET_DET,env=AEs),local(COS_RENAL_FAI,env=AEs),local(COS_VOM,env=AEs),
                   local(PER_AB_P,env=AEs),local(PER_ARTH,env=AEs),local(PER_BP,env=AEs),local(PER_CHIL,env=AEs),local(PER_COLI,env=AEs),local(PER_CUTA_SSC,env=AEs),local(PER_DIAR,env=AEs),local(PER_FATUG,env=AEs),local(PER_HEAM,env=AEs),local(PER_AMI_TRANS_LEV,env=AEs),
                   local(PER_ALAN_TRANS_LEV,env=AEs),local(PER_NAUS,env=AEs),local(PER_RASH,env=AEs),local(PER_PHOT_SEN,env=AEs),local(PER_PYREXIA,env=AEs),local(PER_RET_DET,env=AEs),local(PER_RENAL_FAI,env=AEs),local(PER_VOM,env=AEs),
                   local(ORMONC1_AE_AB_P,env=AEs),
                   local(ORMONC1_AE_ARTH,env=AEs),
                   local(ORMONC1_AE_BP,env=AEs),
                   local(ORMONC1_AE_CHIL,env=AEs),
                   local(ORMONC1_AE_COLI,env=AEs),
                   local(ORMONC1_AE_CUTA_SSC,env=AEs),
                   local(ORMONC1_AE_DIAR,env=AEs),
                   local(ORMONC1_AE_FATUG,env=AEs),
                   local(ORMONC1_AE_HEAM,env=AEs),
                   local(ORMONC1_AE_AMI_TRANS_LEV,env=AEs),
                   local(ORMONC1_AE_ALAN_TRANS_LEV,env=AEs),
                   local(ORMONC1_AE_NAUS,env=AEs),
                   local(ORMONC1_AE_RASH,env=AEs),
                   local(ORMONC1_AE_PHOT_SEN,env=AEs),
                   local(ORMONC1_AE_PYREXIA,env=AEs),
                   local(ORMONC1_AE_RET_DET,env=AEs),
                   local(ORMONC1_AE_RENAL_FAI,env=AEs),
                   local(ORMONC1_AE_VOM,env=AEs))
###########################
##Treatment ORMONC2 AE Input##
local(ORMONC2_AE_AB_P <- 0.00,env=AEs)
local(ORMONC2_AE_ARTH <- 2.36,env=AEs)
local(ORMONC2_AE_BP <- 0.00,env=AEs)
local(ORMONC2_AE_CHIL <- 0.00,env=AEs)
local(ORMONC2_AE_COLI <- 0.00,env=AEs)
local(ORMONC2_AE_CUTA_SSC <- 2.36,env=AEs)
local(ORMONC2_AE_DIAR <- 6.30,env=AEs)
local(ORMONC2_AE_FATUG <- 3.54,env=AEs)
local(ORMONC2_AE_HEAM <- 0.00,env=AEs)
local(ORMONC2_AE_AMI_TRANS_LEV <- 8.27,env=AEs)
local(ORMONC2_AE_ALAN_TRANS_LEV <- 11.42,env=AEs)
local(ORMONC2_AE_NAUS <- 0.79,env=AEs)
local(ORMONC2_AE_RASH <- 5.91,env=AEs)
local(ORMONC2_AE_PHOT_SEN <- 2.36,env=AEs)
local(ORMONC2_AE_PYREXIA <- 1.57,env=AEs)
local(ORMONC2_AE_RET_DET <- 2.36,env=AEs)
local(ORMONC2_AE_RENAL_FAI <- 0.00,env=AEs)
local(ORMONC2_AE_VOM <- 1.18,env=AEs)
##Treatment ORMONC2 AE Output##
Cost_of_grade_3_AE("ORMONC2",
                   local(COS_AB_P,env=AEs),local(COS_ARTH,env=AEs),local(COS_BP,env=AEs),local(COS_CHIL,env=AEs),local(COS_COLI,env=AEs),local(COS_CUTA_SSC,env=AEs),local(COS_DIAR,env=AEs),local(COS_FATUG,env=AEs),local(COS_HEAM,env=AEs),local(COS_AMI_TRANS_LEV,env=AEs),
                   local(COS_ALAN_TRANS_LEV,env=AEs),local(COS_NAUS,env=AEs),local(COS_RASH,env=AEs),local(COS_PHOT_SEN,env=AEs),local(COS_PYREXIA,env=AEs),local(COS_RET_DET,env=AEs),local(COS_RENAL_FAI,env=AEs),local(COS_VOM,env=AEs),
                   local(PER_AB_P,env=AEs),local(PER_ARTH,env=AEs),local(PER_BP,env=AEs),local(PER_CHIL,env=AEs),local(PER_COLI,env=AEs),local(PER_CUTA_SSC,env=AEs),local(PER_DIAR,env=AEs),local(PER_FATUG,env=AEs),local(PER_HEAM,env=AEs),local(PER_AMI_TRANS_LEV,env=AEs),
                   local(PER_ALAN_TRANS_LEV,env=AEs),local(PER_NAUS,env=AEs),local(PER_RASH,env=AEs),local(PER_PHOT_SEN,env=AEs),local(PER_PYREXIA,env=AEs),local(PER_RET_DET,env=AEs),local(PER_RENAL_FAI,env=AEs),local(PER_VOM,env=AEs),
                   local(ORMONC2_AE_AB_P,env=AEs),
                   local(ORMONC2_AE_ARTH,env=AEs),
                   local(ORMONC2_AE_BP,env=AEs),
                   local(ORMONC2_AE_CHIL,env=AEs),
                   local(ORMONC2_AE_COLI,env=AEs),
                   local(ORMONC2_AE_CUTA_SSC,env=AEs),
                   local(ORMONC2_AE_DIAR,env=AEs),
                   local(ORMONC2_AE_FATUG,env=AEs),
                   local(ORMONC2_AE_HEAM,env=AEs),
                   local(ORMONC2_AE_AMI_TRANS_LEV,env=AEs),
                   local(ORMONC2_AE_ALAN_TRANS_LEV,env=AEs),
                   local(ORMONC2_AE_NAUS,env=AEs),
                   local(ORMONC2_AE_RASH,env=AEs),
                   local(ORMONC2_AE_PHOT_SEN,env=AEs),
                   local(ORMONC2_AE_PYREXIA,env=AEs),
                   local(ORMONC2_AE_RET_DET,env=AEs),
                   local(ORMONC2_AE_RENAL_FAI,env=AEs),
                   local(ORMONC2_AE_VOM,env=AEs))
###########################
##Treatment ORMONC3 AE Input##
local(ORMONC3_AE_AB_P <- 0.00,env=AEs)
local(ORMONC3_AE_ARTH <- 0.00,env=AEs)
local(ORMONC3_AE_BP <- 0.00,env=AEs)
local(ORMONC3_AE_CHIL <- 0.00,env=AEs)
local(ORMONC3_AE_COLI <- 0.00,env=AEs)
local(ORMONC3_AE_CUTA_SSC <- 0.00,env=AEs)
local(ORMONC3_AE_DIAR <- 0.00,env=AEs)
local(ORMONC3_AE_FATUG <- 0.00,env=AEs)
local(ORMONC3_AE_HEAM <- 0.00,env=AEs)
local(ORMONC3_AE_AMI_TRANS_LEV <- 0.00,env=AEs)
local(ORMONC3_AE_ALAN_TRANS_LEV <- 0.00,env=AEs)
local(ORMONC3_AE_NAUS <- 0.00,env=AEs)
local(ORMONC3_AE_RASH <- 0.00,env=AEs)
local(ORMONC3_AE_PHOT_SEN <- 0.00,env=AEs)
local(ORMONC3_AE_PYREXIA <- 0.00,env=AEs)
local(ORMONC3_AE_RET_DET <- 0.00,env=AEs)
local(ORMONC3_AE_RENAL_FAI <- 0.00,env=AEs)
local(ORMONC3_AE_VOM <- 0.00,env=AEs)
##Treatment ORMONC3 AE Output##
Cost_of_grade_3_AE("ORMONC3",
                   local(COS_AB_P,env=AEs),local(COS_ARTH,env=AEs),local(COS_BP,env=AEs),local(COS_CHIL,env=AEs),local(COS_COLI,env=AEs),local(COS_CUTA_SSC,env=AEs),local(COS_DIAR,env=AEs),local(COS_FATUG,env=AEs),local(COS_HEAM,env=AEs),local(COS_AMI_TRANS_LEV,env=AEs),
                   local(COS_ALAN_TRANS_LEV,env=AEs),local(COS_NAUS,env=AEs),local(COS_RASH,env=AEs),local(COS_PHOT_SEN,env=AEs),local(COS_PYREXIA,env=AEs),local(COS_RET_DET,env=AEs),local(COS_RENAL_FAI,env=AEs),local(COS_VOM,env=AEs),
                   local(PER_AB_P,env=AEs),local(PER_ARTH,env=AEs),local(PER_BP,env=AEs),local(PER_CHIL,env=AEs),local(PER_COLI,env=AEs),local(PER_CUTA_SSC,env=AEs),local(PER_DIAR,env=AEs),local(PER_FATUG,env=AEs),local(PER_HEAM,env=AEs),local(PER_AMI_TRANS_LEV,env=AEs),
                   local(PER_ALAN_TRANS_LEV,env=AEs),local(PER_NAUS,env=AEs),local(PER_RASH,env=AEs),local(PER_PHOT_SEN,env=AEs),local(PER_PYREXIA,env=AEs),local(PER_RET_DET,env=AEs),local(PER_RENAL_FAI,env=AEs),local(PER_VOM,env=AEs),
                   local(ORMONC3_AE_AB_P,env=AEs),
                   local(ORMONC3_AE_ARTH,env=AEs),
                   local(ORMONC3_AE_BP,env=AEs),
                   local(ORMONC3_AE_CHIL,env=AEs),
                   local(ORMONC3_AE_COLI,env=AEs),
                   local(ORMONC3_AE_CUTA_SSC,env=AEs),
                   local(ORMONC3_AE_DIAR,env=AEs),
                   local(ORMONC3_AE_FATUG,env=AEs),
                   local(ORMONC3_AE_HEAM,env=AEs),
                   local(ORMONC3_AE_AMI_TRANS_LEV,env=AEs),
                   local(ORMONC3_AE_ALAN_TRANS_LEV,env=AEs),
                   local(ORMONC3_AE_NAUS,env=AEs),
                   local(ORMONC3_AE_RASH,env=AEs),
                   local(ORMONC3_AE_PHOT_SEN,env=AEs),
                   local(ORMONC3_AE_PYREXIA,env=AEs),
                   local(ORMONC3_AE_RET_DET,env=AEs),
                   local(ORMONC3_AE_RENAL_FAI,env=AEs),
                   local(ORMONC3_AE_VOM,env=AEs))
###########################
##Treatment ORCOMC1 AE Input##
local(ORCOMC1_AE_AB_P <- 0.00,env=AEs)
local(ORCOMC1_AE_ARTH <- 0.00,env=AEs)
local(ORCOMC1_AE_BP <- 0.00,env=AEs)
local(ORCOMC1_AE_CHIL <- 0.00,env=AEs)
local(ORCOMC1_AE_COLI <- 0.00,env=AEs)
local(ORCOMC1_AE_CUTA_SSC <- 0.00,env=AEs)
local(ORCOMC1_AE_DIAR <- 0.00,env=AEs)
local(ORCOMC1_AE_FATUG <- 0.00,env=AEs)
local(ORCOMC1_AE_HEAM <- 0.00,env=AEs)
local(ORCOMC1_AE_AMI_TRANS_LEV <- 0.00,env=AEs)
local(ORCOMC1_AE_ALAN_TRANS_LEV <- 0.00,env=AEs)
local(ORCOMC1_AE_NAUS <- 0.00,env=AEs)
local(ORCOMC1_AE_RASH <- 0.00,env=AEs)
local(ORCOMC1_AE_PHOT_SEN <- 0.00,env=AEs)
local(ORCOMC1_AE_PYREXIA <- 0.00,env=AEs)
local(ORCOMC1_AE_RET_DET <- 0.00,env=AEs)
local(ORCOMC1_AE_RENAL_FAI <- 0.00,env=AEs)
local(ORCOMC1_AE_VOM <- 0.00,env=AEs)
##Treatment ORCOMC1 AE Output##
Cost_of_grade_3_AE("ORCOMC1",
                   local(COS_AB_P,env=AEs),local(COS_ARTH,env=AEs),local(COS_BP,env=AEs),local(COS_CHIL,env=AEs),local(COS_COLI,env=AEs),local(COS_CUTA_SSC,env=AEs),local(COS_DIAR,env=AEs),local(COS_FATUG,env=AEs),local(COS_HEAM,env=AEs),local(COS_AMI_TRANS_LEV,env=AEs),
                   local(COS_ALAN_TRANS_LEV,env=AEs),local(COS_NAUS,env=AEs),local(COS_RASH,env=AEs),local(COS_PHOT_SEN,env=AEs),local(COS_PYREXIA,env=AEs),local(COS_RET_DET,env=AEs),local(COS_RENAL_FAI,env=AEs),local(COS_VOM,env=AEs),
                   local(PER_AB_P,env=AEs),local(PER_ARTH,env=AEs),local(PER_BP,env=AEs),local(PER_CHIL,env=AEs),local(PER_COLI,env=AEs),local(PER_CUTA_SSC,env=AEs),local(PER_DIAR,env=AEs),local(PER_FATUG,env=AEs),local(PER_HEAM,env=AEs),local(PER_AMI_TRANS_LEV,env=AEs),
                   local(PER_ALAN_TRANS_LEV,env=AEs),local(PER_NAUS,env=AEs),local(PER_RASH,env=AEs),local(PER_PHOT_SEN,env=AEs),local(PER_PYREXIA,env=AEs),local(PER_RET_DET,env=AEs),local(PER_RENAL_FAI,env=AEs),local(PER_VOM,env=AEs),
                   local(ORCOMC1_AE_AB_P,env=AEs),
                   local(ORCOMC1_AE_ARTH,env=AEs),
                   local(ORCOMC1_AE_BP,env=AEs),
                   local(ORCOMC1_AE_CHIL,env=AEs),
                   local(ORCOMC1_AE_COLI,env=AEs),
                   local(ORCOMC1_AE_CUTA_SSC,env=AEs),
                   local(ORCOMC1_AE_DIAR,env=AEs),
                   local(ORCOMC1_AE_FATUG,env=AEs),
                   local(ORCOMC1_AE_HEAM,env=AEs),
                   local(ORCOMC1_AE_AMI_TRANS_LEV,env=AEs),
                   local(ORCOMC1_AE_ALAN_TRANS_LEV,env=AEs),
                   local(ORCOMC1_AE_NAUS,env=AEs),
                   local(ORCOMC1_AE_RASH,env=AEs),
                   local(ORCOMC1_AE_PHOT_SEN,env=AEs),
                   local(ORCOMC1_AE_PYREXIA,env=AEs),
                   local(ORCOMC1_AE_RET_DET,env=AEs),
                   local(ORCOMC1_AE_RENAL_FAI,env=AEs),
                   local(ORCOMC1_AE_VOM,env=AEs))
###########################
##Treatment ORCOMC2 AE Input##
local(ORCOMC2_AE_AB_P <- 0.00,env=AEs)
local(ORCOMC2_AE_ARTH <- 0.00,env=AEs)
local(ORCOMC2_AE_BP <- 0.00,env=AEs)
local(ORCOMC2_AE_CHIL <- 0.00,env=AEs)
local(ORCOMC2_AE_COLI <- 0.00,env=AEs)
local(ORCOMC2_AE_CUTA_SSC <- 0.00,env=AEs)
local(ORCOMC2_AE_DIAR <- 0.00,env=AEs)
local(ORCOMC2_AE_FATUG <- 0.00,env=AEs)
local(ORCOMC2_AE_HEAM <- 0.00,env=AEs)
local(ORCOMC2_AE_AMI_TRANS_LEV <- 0.00,env=AEs)
local(ORCOMC2_AE_ALAN_TRANS_LEV <- 0.00,env=AEs)
local(ORCOMC2_AE_NAUS <- 0.00,env=AEs)
local(ORCOMC2_AE_RASH <- 0.00,env=AEs)
local(ORCOMC2_AE_PHOT_SEN <- 0.00,env=AEs)
local(ORCOMC2_AE_PYREXIA <- 0.00,env=AEs)
local(ORCOMC2_AE_RET_DET <- 0.00,env=AEs)
local(ORCOMC2_AE_RENAL_FAI <- 0.00,env=AEs)
local(ORCOMC2_AE_VOM <- 0.00,env=AEs)
##Treatment ORCOMC2 AE Output##
Cost_of_grade_3_AE("ORCOMC2",
                   local(COS_AB_P,env=AEs),local(COS_ARTH,env=AEs),local(COS_BP,env=AEs),local(COS_CHIL,env=AEs),local(COS_COLI,env=AEs),local(COS_CUTA_SSC,env=AEs),local(COS_DIAR,env=AEs),local(COS_FATUG,env=AEs),local(COS_HEAM,env=AEs),local(COS_AMI_TRANS_LEV,env=AEs),
                   local(COS_ALAN_TRANS_LEV,env=AEs),local(COS_NAUS,env=AEs),local(COS_RASH,env=AEs),local(COS_PHOT_SEN,env=AEs),local(COS_PYREXIA,env=AEs),local(COS_RET_DET,env=AEs),local(COS_RENAL_FAI,env=AEs),local(COS_VOM,env=AEs),
                   local(PER_AB_P,env=AEs),local(PER_ARTH,env=AEs),local(PER_BP,env=AEs),local(PER_CHIL,env=AEs),local(PER_COLI,env=AEs),local(PER_CUTA_SSC,env=AEs),local(PER_DIAR,env=AEs),local(PER_FATUG,env=AEs),local(PER_HEAM,env=AEs),local(PER_AMI_TRANS_LEV,env=AEs),
                   local(PER_ALAN_TRANS_LEV,env=AEs),local(PER_NAUS,env=AEs),local(PER_RASH,env=AEs),local(PER_PHOT_SEN,env=AEs),local(PER_PYREXIA,env=AEs),local(PER_RET_DET,env=AEs),local(PER_RENAL_FAI,env=AEs),local(PER_VOM,env=AEs),
                   local(ORCOMC2_AE_AB_P,env=AEs),
                   local(ORCOMC2_AE_ARTH,env=AEs),
                   local(ORCOMC2_AE_BP,env=AEs),
                   local(ORCOMC2_AE_CHIL,env=AEs),
                   local(ORCOMC2_AE_COLI,env=AEs),
                   local(ORCOMC2_AE_CUTA_SSC,env=AEs),
                   local(ORCOMC2_AE_DIAR,env=AEs),
                   local(ORCOMC2_AE_FATUG,env=AEs),
                   local(ORCOMC2_AE_HEAM,env=AEs),
                   local(ORCOMC2_AE_AMI_TRANS_LEV,env=AEs),
                   local(ORCOMC2_AE_ALAN_TRANS_LEV,env=AEs),
                   local(ORCOMC2_AE_NAUS,env=AEs),
                   local(ORCOMC2_AE_RASH,env=AEs),
                   local(ORCOMC2_AE_PHOT_SEN,env=AEs),
                   local(ORCOMC2_AE_PYREXIA,env=AEs),
                   local(ORCOMC2_AE_RET_DET,env=AEs),
                   local(ORCOMC2_AE_RENAL_FAI,env=AEs),
                   local(ORCOMC2_AE_VOM,env=AEs))


#############
###RESULTS###
#############

##################
####POPULATION####
##################
#Subgroup 1 patient numbers, by treatment
Current_patients_by_treatment_subgroup_1 <- t(patients_treated_in_subgroup_1*t(Current_ms_S_1))
New_patients_by_treatment_subgroup_1 <- t(patients_treated_in_subgroup_1*t(New_ms_S_1))
#Subgroup 2 patient numbers, by treatment
Current_patients_by_treatment_subgroup_2 <- t(patients_treated_in_subgroup_2*t(Current_ms_S_2))
New_patients_by_treatment_subgroup_2 <- t(patients_treated_in_subgroup_2*t(New_ms_S_2))


##############################
###Acquisition Cost Results###
##############################
#Total acquisition cost, by treatment and year
Acquisition_Y1 <- c(IVND_D1_Y1_acquisition_cost,
                    IVMONC1_D1_Y1_acquisition_cost,
                    IVMONC2_D1_Y1_acquisition_cost,
                    IVMONC3_D1_Y1_acquisition_cost,
                    IVMONC4_D1_Y1_acquisition_cost,
                    IVMONC5_D1_Y1_acquisition_cost,
                    IVCOMC1_D1_Y1_acquisition_cost+
                      IVCOMC1_D2_Y1_acquisition_cost,
                    IVCOMC2_D1_Y1_acquisition_cost+
                      IVCOMC2_D2_Y1_acquisition_cost,
                    ORMONC1_D1_Y1_acquisition_cost,
                    ORMONC2_D1_Y1_acquisition_cost,
                    ORMONC3_D1_Y1_acquisition_cost,
                    ORCOMC1_D1_Y1_acquisition_cost+
                      ORCOMC1_D2_Y1_acquisition_cost,
                    ORCOMC2_D1_Y1_acquisition_cost+
                      ORCOMC2_D2_Y1_acquisition_cost)
#Total acquisition cost calculations, including popoulations costs
#Subgroup 1
Current_acquisition_subgroup_1_Y1 <- Acquisition_Y1*Current_patients_by_treatment_subgroup_1[,1]
New_acquisition_subgroup_1_Y1 <- Acquisition_Y1*New_patients_by_treatment_subgroup_1[,1]
Acquisition_BI_subgroup_1_Y1 <- New_acquisition_subgroup_1_Y1-Current_acquisition_subgroup_1_Y1
sum(Acquisition_BI_subgroup_1_Y1)
#Subgroup 2
Current_acquisition_subgroup_2_Y1 <- Acquisition_Y1*Current_patients_by_treatment_subgroup_2[,1]
New_acquisition_subgroup_2_Y1 <- Acquisition_Y1*New_patients_by_treatment_subgroup_2[,1]
Acquisition_BI_subgroup_2_Y1 <- New_acquisition_subgroup_2_Y1-Current_acquisition_subgroup_2_Y1
sum(Acquisition_BI_subgroup_2_Y1)

Acquisition_Y2 <- c(IVND_D1_Y2_acquisition_cost,
                    IVMONC1_D1_Y2_acquisition_cost,
                    IVMONC2_D1_Y2_acquisition_cost,
                    IVMONC3_D1_Y2_acquisition_cost,
                    IVMONC4_D1_Y2_acquisition_cost,
                    IVMONC5_D1_Y2_acquisition_cost,
                    IVCOMC1_D1_Y2_acquisition_cost+
                      IVCOMC1_D2_Y2_acquisition_cost,
                    IVCOMC2_D1_Y2_acquisition_cost+
                      IVCOMC2_D2_Y2_acquisition_cost,
                    ORMONC1_D1_Y2_acquisition_cost,
                    ORMONC2_D1_Y2_acquisition_cost,
                    ORMONC3_D1_Y2_acquisition_cost,
                    ORCOMC1_D1_Y2_acquisition_cost+
                      ORCOMC1_D2_Y2_acquisition_cost,
                    ORCOMC2_D1_Y2_acquisition_cost+
                      ORCOMC2_D2_Y2_acquisition_cost)
#Total acquisition cost calculations, including popoulations costs
#Subgroup 1
Current_acquisition_subgroup_1_Y2 <- Acquisition_Y1*Current_patients_by_treatment_subgroup_1[,2]+
  Acquisition_Y2*Current_patients_by_treatment_subgroup_1[,1]
New_acquisition_subgroup_1_Y2 <- Acquisition_Y1*New_patients_by_treatment_subgroup_1[,2]+
  Acquisition_Y2*New_patients_by_treatment_subgroup_1[,1]
Acquisition_BI_subgroup_1_Y2 <- New_acquisition_subgroup_1_Y2-Current_acquisition_subgroup_1_Y2
sum(Acquisition_BI_subgroup_1_Y2)
#Subgroup 2
Current_acquisition_subgroup_2_Y2 <- Acquisition_Y1*Current_patients_by_treatment_subgroup_2[,2]+
  Acquisition_Y2*Current_patients_by_treatment_subgroup_2[,1]
New_acquisition_subgroup_2_Y2 <- Acquisition_Y1*New_patients_by_treatment_subgroup_2[,2]+
  Acquisition_Y2*New_patients_by_treatment_subgroup_2[,1]
Acquisition_BI_subgroup_2_Y2 <- New_acquisition_subgroup_2_Y2-Current_acquisition_subgroup_2_Y2
sum(Acquisition_BI_subgroup_2_Y2)

Acquisition_Y3 <- c(IVND_D1_Y3_acquisition_cost,
                    IVMONC1_D1_Y3_acquisition_cost,
                    IVMONC2_D1_Y3_acquisition_cost,
                    IVMONC3_D1_Y3_acquisition_cost,
                    IVMONC4_D1_Y3_acquisition_cost,
                    IVMONC5_D1_Y3_acquisition_cost,
                    IVCOMC1_D1_Y3_acquisition_cost+
                      IVCOMC1_D2_Y3_acquisition_cost,
                    IVCOMC2_D1_Y3_acquisition_cost+
                      IVCOMC2_D2_Y3_acquisition_cost,
                    ORMONC1_D1_Y3_acquisition_cost,
                    ORMONC2_D1_Y3_acquisition_cost,
                    ORMONC3_D1_Y3_acquisition_cost,
                    ORCOMC1_D1_Y3_acquisition_cost+
                      ORCOMC1_D2_Y3_acquisition_cost,
                    ORCOMC2_D1_Y3_acquisition_cost+
                      ORCOMC2_D2_Y3_acquisition_cost)
#Total acquisition cost calculations, including popoulations costs
#Subgroup 1
Current_acquisition_subgroup_1_Y3 <- Acquisition_Y1*Current_patients_by_treatment_subgroup_1[,3]+
  Acquisition_Y2*Current_patients_by_treatment_subgroup_1[,2]+
  Acquisition_Y3*Current_patients_by_treatment_subgroup_1[,1]
New_acquisition_subgroup_1_Y3 <- Acquisition_Y1*New_patients_by_treatment_subgroup_1[,3]+
  Acquisition_Y2*New_patients_by_treatment_subgroup_1[,2]+
  Acquisition_Y3*New_patients_by_treatment_subgroup_1[,1]
Acquisition_BI_subgroup_1_Y3 <- New_acquisition_subgroup_1_Y3-Current_acquisition_subgroup_1_Y3
sum(Acquisition_BI_subgroup_1_Y3)
#Subgroup 2
Current_acquisition_subgroup_2_Y3 <- Acquisition_Y1*Current_patients_by_treatment_subgroup_2[,3]+
  Acquisition_Y2*Current_patients_by_treatment_subgroup_2[,2]+
  Acquisition_Y3*Current_patients_by_treatment_subgroup_2[,1]
New_acquisition_subgroup_2_Y3 <- Acquisition_Y1*New_patients_by_treatment_subgroup_2[,3]+
  Acquisition_Y2*New_patients_by_treatment_subgroup_2[,2]+
  Acquisition_Y3*New_patients_by_treatment_subgroup_2[,1]
Acquisition_BI_subgroup_2_Y3 <- New_acquisition_subgroup_2_Y3-Current_acquisition_subgroup_2_Y3
sum(Acquisition_BI_subgroup_2_Y3)

#Total acquisition cost
Acquisition <- c(Acquisition_Y1,Acquisition_Y2,Acquisition_Y3)

#################################
###Administration Cost Results###
#################################
#Administration cost, by year and treatment
#Total acquisition cost, by treatment and year
Admin_Y1 <- c(IVND_D1_Y1_admin_cost,
              IVMONC1_D1_Y1_admin_cost,
              IVMONC2_D1_Y1_admin_cost,
              IVMONC3_D1_Y1_admin_cost,
              IVMONC4_D1_Y1_admin_cost,
              IVMONC5_D1_Y1_admin_cost,
              IVCOMC1_D1_Y1_admin_cost+
                IVCOMC1_D2_Y1_admin_cost,
              IVCOMC2_D1_Y1_admin_cost+
                IVCOMC2_D2_Y1_admin_cost,
              ORMONC1_D1_Y1_admin_cost,
              ORMONC2_D1_Y1_admin_cost,
              ORMONC3_D1_Y1_admin_cost,
              ORCOMC1_D1_Y1_admin_cost+
                ORCOMC1_D2_Y1_admin_cost,
              ORCOMC2_D1_Y1_admin_cost+
                ORCOMC2_D2_Y1_admin_cost)
#Total admin cost calculations, including popoulations costs
#Subgroup 1
Current_admin_subgroup_1_Y1 <- Admin_Y1*Current_patients_by_treatment_subgroup_1[,1]
New_admin_subgroup_1_Y1 <- Admin_Y1*New_patients_by_treatment_subgroup_1[,1]
Admin_BI_subgroup_1_Y1 <- New_admin_subgroup_1_Y1-Current_admin_subgroup_1_Y1
sum(Admin_BI_subgroup_1_Y1)
#Subgroup 2
Current_admin_subgroup_2_Y1 <- Admin_Y1*Current_patients_by_treatment_subgroup_2[,1]
New_admin_subgroup_2_Y1 <- Admin_Y1*New_patients_by_treatment_subgroup_2[,1]
Admin_BI_subgroup_2_Y1 <- New_admin_subgroup_2_Y1-Current_admin_subgroup_2_Y1
sum(Admin_BI_subgroup_2_Y1)

Admin_Y2 <- c(IVND_D1_Y2_admin_cost,
              IVMONC1_D1_Y2_admin_cost,
              IVMONC2_D1_Y2_admin_cost,
              IVMONC3_D1_Y2_admin_cost,
              IVMONC4_D1_Y2_admin_cost,
              IVMONC5_D1_Y2_admin_cost,
              IVCOMC1_D1_Y2_admin_cost+
                IVCOMC1_D2_Y2_admin_cost,
              IVCOMC2_D1_Y2_admin_cost+
                IVCOMC2_D2_Y2_admin_cost,
              ORMONC1_D1_Y2_admin_cost,
              ORMONC2_D1_Y2_admin_cost,
              ORMONC3_D1_Y2_admin_cost,
              ORCOMC1_D1_Y2_admin_cost+
                ORCOMC1_D2_Y2_admin_cost,
              ORCOMC2_D1_Y2_admin_cost+
                ORCOMC2_D2_Y2_admin_cost)
#Total admin cost calculations, including popoulations costs
#Subgroup 1
Current_admin_subgroup_1_Y2 <- Admin_Y1*Current_patients_by_treatment_subgroup_1[,2]+
  Admin_Y2*Current_patients_by_treatment_subgroup_1[,1]
New_admin_subgroup_1_Y2 <- Admin_Y1*New_patients_by_treatment_subgroup_1[,2]+
  Admin_Y2*New_patients_by_treatment_subgroup_1[,1]
Admin_BI_subgroup_1_Y2 <- New_admin_subgroup_1_Y2-Current_admin_subgroup_1_Y2
sum(Admin_BI_subgroup_1_Y2)
#Subgroup 2
Current_admin_subgroup_2_Y2 <- Admin_Y1*Current_patients_by_treatment_subgroup_2[,2]+
  Admin_Y2*Current_patients_by_treatment_subgroup_2[,1]
New_admin_subgroup_2_Y2 <- Admin_Y1*New_patients_by_treatment_subgroup_2[,2]+
  Admin_Y2*New_patients_by_treatment_subgroup_2[,1]
Admin_BI_subgroup_2_Y2 <- New_admin_subgroup_2_Y2-Current_admin_subgroup_2_Y2
sum(Admin_BI_subgroup_2_Y2)

Admin_Y3 <- c(IVND_D1_Y3_admin_cost,
              IVMONC1_D1_Y3_admin_cost,
              IVMONC2_D1_Y3_admin_cost,
              IVMONC3_D1_Y3_admin_cost,
              IVMONC4_D1_Y3_admin_cost,
              IVMONC5_D1_Y3_admin_cost,
              IVCOMC1_D1_Y3_admin_cost+
                IVCOMC1_D2_Y3_admin_cost,
              IVCOMC2_D1_Y3_admin_cost+
                IVCOMC2_D2_Y3_admin_cost,
              ORMONC1_D1_Y3_admin_cost,
              ORMONC2_D1_Y3_admin_cost,
              ORMONC3_D1_Y3_admin_cost,
              ORCOMC1_D1_Y3_admin_cost+
                ORCOMC1_D2_Y3_admin_cost,
              ORCOMC2_D1_Y3_admin_cost+
                ORCOMC2_D2_Y3_admin_cost)
#Total admin cost calculations, including popoulations costs
#Subgroup 1
Current_admin_subgroup_1_Y3 <- Admin_Y1*Current_patients_by_treatment_subgroup_1[,3]+
  Admin_Y2*Current_patients_by_treatment_subgroup_1[,2]+
  Admin_Y3*Current_patients_by_treatment_subgroup_1[,1]
New_admin_subgroup_1_Y3 <- Admin_Y1*New_patients_by_treatment_subgroup_1[,3]+
  Admin_Y2*New_patients_by_treatment_subgroup_1[,2]+
  Admin_Y3*New_patients_by_treatment_subgroup_1[,1]
Admin_BI_subgroup_1_Y3 <- New_admin_subgroup_1_Y3-Current_admin_subgroup_1_Y3
sum(Admin_BI_subgroup_1_Y3)
#Subgroup 2
Current_admin_subgroup_2_Y3 <- Admin_Y1*Current_patients_by_treatment_subgroup_2[,3]+
  Admin_Y2*Current_patients_by_treatment_subgroup_2[,2]+
  Admin_Y3*Current_patients_by_treatment_subgroup_2[,1]
New_admin_subgroup_2_Y3 <- Admin_Y1*New_patients_by_treatment_subgroup_2[,3]+
  Admin_Y2*New_patients_by_treatment_subgroup_2[,2]+
  Admin_Y3*New_patients_by_treatment_subgroup_2[,1]
Admin_BI_subgroup_2_Y3 <- New_admin_subgroup_2_Y3-Current_admin_subgroup_2_Y3
sum(Admin_BI_subgroup_2_Y3)

#Total administration cost
Admin <- c(Admin_Y1,Admin_Y2,Admin_Y3)

#############################
###Monitoring Cost Results###
#############################
#Monitoringistration cost, by year and treatment
#Total acquisition cost, by treatment and year
Monitoring_Y1 <- c(IVND_D1_Y1_monitoring_cost,
                   IVMONC1_D1_Y1_monitoring_cost,
                   IVMONC2_D1_Y1_monitoring_cost,
                   IVMONC3_D1_Y1_monitoring_cost,
                   IVMONC4_D1_Y1_monitoring_cost,
                   IVMONC5_D1_Y1_monitoring_cost,
                   IVCOMC1_D1_Y1_monitoring_cost+
                     IVCOMC1_D2_Y1_monitoring_cost,
                   IVCOMC2_D1_Y1_monitoring_cost+
                     IVCOMC2_D2_Y1_monitoring_cost,
                   ORMONC1_D1_Y1_monitoring_cost,
                   ORMONC2_D1_Y1_monitoring_cost,
                   ORMONC3_D1_Y1_monitoring_cost,
                   ORCOMC1_D1_Y1_monitoring_cost+
                     ORCOMC1_D2_Y1_monitoring_cost,
                   ORCOMC2_D1_Y1_monitoring_cost+
                     ORCOMC2_D2_Y1_monitoring_cost)
#Total monitoring cost calculations, including popoulations costs
#Subgroup 1
Current_monitoring_subgroup_1_Y1 <- Monitoring_Y1*Current_patients_by_treatment_subgroup_1[,1]
New_monitoring_subgroup_1_Y1 <- Monitoring_Y1*New_patients_by_treatment_subgroup_1[,1]
Monitoring_BI_subgroup_1_Y1 <- New_monitoring_subgroup_1_Y1-Current_monitoring_subgroup_1_Y1
sum(Monitoring_BI_subgroup_1_Y1)
#Subgroup 2
Current_monitoring_subgroup_2_Y1 <- Monitoring_Y1*Current_patients_by_treatment_subgroup_2[,1]
New_monitoring_subgroup_2_Y1 <- Monitoring_Y1*New_patients_by_treatment_subgroup_2[,1]
Monitoring_BI_subgroup_2_Y1 <- New_monitoring_subgroup_2_Y1-Current_monitoring_subgroup_2_Y1
sum(Monitoring_BI_subgroup_2_Y1)

Monitoring_Y2 <- c(IVND_D1_Y2_monitoring_cost,
                   IVMONC1_D1_Y2_monitoring_cost,
                   IVMONC2_D1_Y2_monitoring_cost,
                   IVMONC3_D1_Y2_monitoring_cost,
                   IVMONC4_D1_Y2_monitoring_cost,
                   IVMONC5_D1_Y2_monitoring_cost,
                   IVCOMC1_D1_Y2_monitoring_cost+
                     IVCOMC1_D2_Y2_monitoring_cost,
                   IVCOMC2_D1_Y2_monitoring_cost+
                     IVCOMC2_D2_Y2_monitoring_cost,
                   ORMONC1_D1_Y2_monitoring_cost,
                   ORMONC2_D1_Y2_monitoring_cost,
                   ORMONC3_D1_Y2_monitoring_cost,
                   ORCOMC1_D1_Y2_monitoring_cost+
                     ORCOMC1_D2_Y2_monitoring_cost,
                   ORCOMC2_D1_Y2_monitoring_cost+
                     ORCOMC2_D2_Y2_monitoring_cost)
#Total monitoring cost calculations, including popoulations costs
#Subgroup 1
Current_monitoring_subgroup_1_Y2 <- Monitoring_Y1*Current_patients_by_treatment_subgroup_1[,2]+
  Monitoring_Y2*Current_patients_by_treatment_subgroup_1[,1]
New_monitoring_subgroup_1_Y2 <- Monitoring_Y1*New_patients_by_treatment_subgroup_1[,2]+
  Monitoring_Y2*New_patients_by_treatment_subgroup_1[,1]
Monitoring_BI_subgroup_1_Y2 <- New_monitoring_subgroup_1_Y2-Current_monitoring_subgroup_1_Y2
sum(Monitoring_BI_subgroup_1_Y2)
#Subgroup 2
Current_monitoring_subgroup_2_Y2 <- Monitoring_Y1*Current_patients_by_treatment_subgroup_2[,2]+
  Monitoring_Y2*Current_patients_by_treatment_subgroup_2[,1]
New_monitoring_subgroup_2_Y2 <- Monitoring_Y1*New_patients_by_treatment_subgroup_2[,2]+
  Monitoring_Y2*New_patients_by_treatment_subgroup_2[,1]
Monitoring_BI_subgroup_2_Y2 <- New_monitoring_subgroup_2_Y2-Current_monitoring_subgroup_2_Y2
sum(Monitoring_BI_subgroup_2_Y2)

Monitoring_Y3 <- c(IVND_D1_Y3_monitoring_cost,
                   IVMONC1_D1_Y3_monitoring_cost,
                   IVMONC2_D1_Y3_monitoring_cost,
                   IVMONC3_D1_Y3_monitoring_cost,
                   IVMONC4_D1_Y3_monitoring_cost,
                   IVMONC5_D1_Y3_monitoring_cost,
                   IVCOMC1_D1_Y3_monitoring_cost+
                     IVCOMC1_D2_Y3_monitoring_cost,
                   IVCOMC2_D1_Y3_monitoring_cost+
                     IVCOMC2_D2_Y3_monitoring_cost,
                   ORMONC1_D1_Y3_monitoring_cost,
                   ORMONC2_D1_Y3_monitoring_cost,
                   ORMONC3_D1_Y3_monitoring_cost,
                   ORCOMC1_D1_Y3_monitoring_cost+
                     ORCOMC1_D2_Y3_monitoring_cost,
                   ORCOMC2_D1_Y3_monitoring_cost+
                     ORCOMC2_D2_Y3_monitoring_cost)
#Total monitoring cost calculations, including popoulations costs
#Subgroup 1
Current_monitoring_subgroup_1_Y3 <- Monitoring_Y1*Current_patients_by_treatment_subgroup_1[,3]+
  Monitoring_Y2*Current_patients_by_treatment_subgroup_1[,2]+
  Monitoring_Y3*Current_patients_by_treatment_subgroup_1[,1]
New_monitoring_subgroup_1_Y3 <- Monitoring_Y1*New_patients_by_treatment_subgroup_1[,3]+
  Monitoring_Y2*New_patients_by_treatment_subgroup_1[,2]+
  Monitoring_Y3*New_patients_by_treatment_subgroup_1[,1]
Monitoring_BI_subgroup_1_Y3 <- New_monitoring_subgroup_1_Y3-Current_monitoring_subgroup_1_Y3
sum(Monitoring_BI_subgroup_1_Y3)
#Subgroup 2
Current_monitoring_subgroup_2_Y3 <- Monitoring_Y1*Current_patients_by_treatment_subgroup_2[,3]+
  Monitoring_Y2*Current_patients_by_treatment_subgroup_2[,2]+
  Monitoring_Y3*Current_patients_by_treatment_subgroup_2[,1]
New_monitoring_subgroup_2_Y3 <- Monitoring_Y1*New_patients_by_treatment_subgroup_2[,3]+
  Monitoring_Y2*New_patients_by_treatment_subgroup_2[,2]+
  Monitoring_Y3*New_patients_by_treatment_subgroup_2[,1]
Monitoring_BI_subgroup_2_Y3 <- New_monitoring_subgroup_2_Y3-Current_monitoring_subgroup_2_Y3
sum(Monitoring_BI_subgroup_2_Y3)

#Total monitoringistration cost
Monitoring <- c(Monitoring_Y1,Monitoring_Y2,Monitoring_Y3)

############################
###Adverse Events Results###
############################
#AE cost, by year and treatment
#Total acquisition cost, by treatment and year
AE <- c(IVND_AE_cost,
        IVMONC1_AE_cost,
        IVMONC2_AE_cost,
        IVMONC3_AE_cost,
        IVMONC4_AE_cost,
        IVMONC5_AE_cost,
        IVCOMC1_AE_cost+
          IVCOMC1_AE_cost,
        IVCOMC2_AE_cost+
          IVCOMC2_AE_cost,
        ORMONC1_AE_cost,
        ORMONC2_AE_cost,
        ORMONC3_AE_cost,
        ORCOMC1_AE_cost+
          ORCOMC1_AE_cost,
        ORCOMC2_AE_cost+
          ORCOMC2_AE_cost)
#Total AE cost calculations, including popoulations costs
#Subgroup 1
Current_AE_subgroup_1_Y1 <- AE*Current_patients_by_treatment_subgroup_1[,1]
New_AE_subgroup_1_Y1 <- AE*New_patients_by_treatment_subgroup_1[,1]
AE_BI_subgroup_1_Y1 <- New_AE_subgroup_1_Y1-Current_AE_subgroup_1_Y1
sum(AE_BI_subgroup_1_Y1)
#Subgroup 2
Current_AE_subgroup_2_Y1 <- AE*Current_patients_by_treatment_subgroup_2[,1]
New_AE_subgroup_2_Y1 <- AE*New_patients_by_treatment_subgroup_2[,1]
AE_BI_subgroup_2_Y1 <- New_AE_subgroup_2_Y1-Current_AE_subgroup_2_Y1
sum(AE_BI_subgroup_2_Y1)

#Total AE cost calculations, including popoulations costs
#Subgroup 1
Current_AE_subgroup_1_Y2 <-   AE*Current_patients_by_treatment_subgroup_1[,2]
New_AE_subgroup_1_Y2 <- AE*New_patients_by_treatment_subgroup_1[,2]
AE_BI_subgroup_1_Y2 <- New_AE_subgroup_1_Y2-Current_AE_subgroup_1_Y2
sum(AE_BI_subgroup_1_Y2)
#Subgroup 2
Current_AE_subgroup_2_Y2 <- AE*Current_patients_by_treatment_subgroup_2[,2]
New_AE_subgroup_2_Y2 <- AE*New_patients_by_treatment_subgroup_2[,2]
AE_BI_subgroup_2_Y2 <- New_AE_subgroup_2_Y2-Current_AE_subgroup_2_Y2
sum(AE_BI_subgroup_2_Y2)

#Total AE cost calculations, including popoulations costs
#Subgroup 1
Current_AE_subgroup_1_Y3 <- AE*Current_patients_by_treatment_subgroup_1[,3]
New_AE_subgroup_1_Y3 <- AE*New_patients_by_treatment_subgroup_1[,3]
AE_BI_subgroup_1_Y3 <- New_AE_subgroup_1_Y3-Current_AE_subgroup_1_Y3
sum(AE_BI_subgroup_1_Y3)
#Subgroup 2
Current_AE_subgroup_2_Y3 <- AE*Current_patients_by_treatment_subgroup_2[,3]
New_AE_subgroup_2_Y3 <- AE*New_patients_by_treatment_subgroup_2[,3]
AE_BI_subgroup_2_Y3 <- New_AE_subgroup_2_Y3-Current_AE_subgroup_2_Y3
sum(AE_BI_subgroup_2_Y3)

Total_cost_per_year_of_treatment_course <<- Acquisition+Admin+Monitoring+AE

########################
###Total Cost Results###
########################
#TOTAL cost, by year and treatment
#Subgroup 1, year 1
Total_Current_BI_subgroup_1_Y1 <- Current_acquisition_subgroup_1_Y1+
  Current_admin_subgroup_1_Y1+
  Current_monitoring_subgroup_1_Y1+
  Current_AE_subgroup_1_Y1
Total_New_BI_subgroup_1_Y1 <- New_acquisition_subgroup_1_Y1+
  New_admin_subgroup_1_Y1+
  New_monitoring_subgroup_1_Y1+
  New_AE_subgroup_1_Y1
Total_BI_subgroup_1_Y1 <- Total_New_BI_subgroup_1_Y1-Total_Current_BI_subgroup_1_Y1
#Subgroup 2, year 1
Total_Current_BI_subgroup_2_Y1 <- Current_acquisition_subgroup_2_Y1+
  Current_admin_subgroup_2_Y1+
  Current_monitoring_subgroup_2_Y1+
  Current_AE_subgroup_2_Y1
Total_New_BI_subgroup_2_Y1 <- New_acquisition_subgroup_2_Y1+
  New_admin_subgroup_2_Y1+
  New_monitoring_subgroup_2_Y1+
  New_AE_subgroup_2_Y1
Total_BI_subgroup_2_Y1 <- Total_New_BI_subgroup_2_Y1-Total_Current_BI_subgroup_2_Y1

#Subgroup 1, year 2
Total_Current_BI_subgroup_1_Y2 <- Current_acquisition_subgroup_1_Y2+
  Current_admin_subgroup_1_Y2+
  Current_monitoring_subgroup_1_Y2+
  Current_AE_subgroup_1_Y2
Total_New_BI_subgroup_1_Y2 <- New_acquisition_subgroup_1_Y2+
  New_admin_subgroup_1_Y2+
  New_monitoring_subgroup_1_Y2+
  New_AE_subgroup_1_Y2
Total_BI_subgroup_1_Y2 <- Total_New_BI_subgroup_1_Y2-Total_Current_BI_subgroup_1_Y2
#Subgroup 2, year 2
Total_Current_BI_subgroup_2_Y2 <- Current_acquisition_subgroup_2_Y2+
  Current_admin_subgroup_2_Y2+
  Current_monitoring_subgroup_2_Y2+
  Current_AE_subgroup_2_Y2
Total_New_BI_subgroup_2_Y2 <- New_acquisition_subgroup_2_Y2+
  New_admin_subgroup_2_Y2+
  New_monitoring_subgroup_2_Y2+
  New_AE_subgroup_2_Y2
Total_BI_subgroup_2_Y2 <- Total_New_BI_subgroup_2_Y2-Total_Current_BI_subgroup_2_Y2


#Subgroup 1, year 3
Total_Current_BI_subgroup_1_Y3 <- Current_acquisition_subgroup_1_Y3+
  Current_admin_subgroup_1_Y3+
  Current_monitoring_subgroup_1_Y3+
  Current_AE_subgroup_1_Y3
Total_New_BI_subgroup_1_Y3 <- New_acquisition_subgroup_1_Y3+
  New_admin_subgroup_1_Y3+
  New_monitoring_subgroup_1_Y3+
  New_AE_subgroup_1_Y3
Total_BI_subgroup_1_Y3 <- Total_New_BI_subgroup_1_Y3-Total_Current_BI_subgroup_1_Y3
#Subgroup 2, year 3
Total_Current_BI_subgroup_2_Y3 <- Current_acquisition_subgroup_2_Y3+
  Current_admin_subgroup_2_Y3+
  Current_monitoring_subgroup_2_Y3+
  Current_AE_subgroup_2_Y3
Total_New_BI_subgroup_2_Y3 <- New_acquisition_subgroup_2_Y3+
  New_admin_subgroup_2_Y3+
  New_monitoring_subgroup_2_Y3+
  New_AE_subgroup_2_Y3
Total_BI_subgroup_2_Y3 <- Total_New_BI_subgroup_2_Y3-Total_Current_BI_subgroup_2_Y3


Total_Current_BI_subgroup_1 <<- cbind(sum(Total_Current_BI_subgroup_1_Y1),sum(Total_Current_BI_subgroup_1_Y2),sum(Total_Current_BI_subgroup_1_Y3))
colnames(Total_Current_BI_subgroup_1)<-c("Year 1","Year 2","Year 3")
Total_Current_BI_subgroup_1<<-cbind(Total_Current_BI_subgroup_1, Total=rowSums(Total_Current_BI_subgroup_1))
Total_Current_BI_subgroup_1<<-format(Total_Current_BI_subgroup_1, digits=2, nsmall=0,big.mark=",")

Total_Current_BI_subgroup_2 <<- cbind(sum(Total_Current_BI_subgroup_2_Y1),sum(Total_Current_BI_subgroup_2_Y2),sum(Total_Current_BI_subgroup_2_Y3))
colnames(Total_Current_BI_subgroup_2)<-c("Year 1","Year 2","Year 3")
Total_Current_BI_subgroup_2<<-cbind(Total_Current_BI_subgroup_2, Total=rowSums(Total_Current_BI_subgroup_2))
Total_Current_BI_subgroup_2<<-format(Total_Current_BI_subgroup_2, digits=2, nsmall=0,big.mark=",")

Total_New_BI_subgroup_1 <<- cbind(sum(Total_New_BI_subgroup_1_Y1),sum(Total_New_BI_subgroup_1_Y2),sum(Total_New_BI_subgroup_1_Y3))
colnames(Total_New_BI_subgroup_1)<-c("Year 1","Year 2","Year 3")
Total_New_BI_subgroup_1<<-cbind(Total_New_BI_subgroup_1, Total=rowSums(Total_New_BI_subgroup_1))
Total_New_BI_subgroup_1<<-format(Total_New_BI_subgroup_1, digits=2, nsmall=0,big.mark=",")

Total_New_BI_subgroup_2 <<- cbind(sum(Total_New_BI_subgroup_2_Y1),sum(Total_New_BI_subgroup_2_Y2),sum(Total_New_BI_subgroup_2_Y3))
colnames(Total_New_BI_subgroup_2)<-c("Year 1","Year 2","Year 3")
Total_New_BI_subgroup_2<<-cbind(Total_New_BI_subgroup_2, Total=rowSums(Total_New_BI_subgroup_2))
Total_New_BI_subgroup_2<<-format(Total_New_BI_subgroup_2, digits=2, nsmall=0,big.mark=",")

Total_BI_subgroup_1 <<- cbind(sum(Total_BI_subgroup_1_Y1),sum(Total_BI_subgroup_1_Y2),sum(Total_BI_subgroup_1_Y3))
Total_BI_subgroup_1_chart <<- cbind(sum(Total_BI_subgroup_1_Y1),sum(Total_BI_subgroup_1_Y2),sum(Total_BI_subgroup_1_Y3))
colnames(Total_BI_subgroup_1)<-c("Year 1","Year 2","Year 3")
Total_BI_subgroup_1<<-cbind(Total_BI_subgroup_1, Total=rowSums(Total_BI_subgroup_1))
Total_BI_subgroup_1<<-format(Total_BI_subgroup_1, digits=2, nsmall=0,big.mark=",")

Total_BI_subgroup_2 <<- cbind(sum(Total_BI_subgroup_2_Y1),sum(Total_BI_subgroup_2_Y2),sum(Total_BI_subgroup_2_Y3))
Total_BI_subgroup_2_chart <<- cbind(sum(Total_BI_subgroup_2_Y1),sum(Total_BI_subgroup_2_Y2),sum(Total_BI_subgroup_2_Y3))
colnames(Total_BI_subgroup_2)<-c("Year 1","Year 2","Year 3")
Total_BI_subgroup_2<<-cbind(Total_BI_subgroup_2, Total=rowSums(Total_BI_subgroup_2))
Total_BI_subgroup_2<<-format(Total_BI_subgroup_2, digits=2, nsmall=0,big.mark=",")


}
#############END############
