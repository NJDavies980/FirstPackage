## install.packages(lpSolve)
library("lpSolve")

#Population script must be run first in order to get the "avg_BSA" and "avg_weight" variables required for dose calculations.
#Filepath <- "//gb-man-fsvr/PROVE/Innovation/HE and Data Analysis/Innovations/R modelling/BIM template development/"
#source(paste0(Filepath,"population v0_1.R"))

##Optimisation for vial treatments.
Vial_optimisation_Cost_calculations<- function(NameD,
                                               DrugNumber,
                                               vial_cost_1,
                                               vial_cost_2,
                                               vial_cost_3,
                                               vial_cost_4,
                                                vial_size,
                                                initial_dose_amount,
                                                initial_dose_unit,
                                                maintenance_dose_amount,
                                                maintenance_dose_unit,
                                                cycle_length,
                                                init_Admin_per_cycle,
                                                subs_Admin_per_cycle,
                                                phys_vis_cycle,
                                                admin_cost_per_dose,
                                                rebate,
                                                cost_phys_visit_mont,
                                                initial_treatment_duration,
                                                total_treatment_duration,
                                                waste,
                                               avg_weight,
                                               avg_BSA){

  Name <- paste0(NameD,"_D",DrugNumber)

  #To calculate size of initial dose per cycle
  initial_required_dose <- if (initial_dose_unit=="mg"){initial_dose_amount
  } else if (initial_dose_unit=="mg/kg"){initial_dose_amount*avg_weight
  } else if (initial_dose_unit=="mg/kg^2"){initial_dose_amount*avg_BSA
  }

  #To calculate size of maintenance dose per cycle
  maintenance_required_dose <-  if (maintenance_dose_unit=="mg"){maintenance_dose_amount}
  else if (maintenance_dose_unit=="mg/kg"){maintenance_dose_amount*avg_weight}
  else if (maintenance_dose_unit=="mg/kg^2"){maintenance_dose_amount*avg_BSA
  }

  vial_cost <- c(vial_cost_1,vial_cost_2,vial_cost_3,vial_cost_4)

  #Constrained optimisation to minimise cost across different vial sizes whilst ensuring minimum dose required is reached
  f.obj <- vial_cost
  f.con <- matrix(vial_size,nrow=1,byrow = TRUE)
  f.dir <- c(">=")
  f.rhs.initial <- initial_required_dose
  f.rhs.maintenance <- maintenance_required_dose

  ##For calculation of no waste costs##
  #Calculates the average cost per vial for each of the vial sizes
  avg_cost_per_mg <- ifelse(vial_size != 0, vial_cost/vial_size, 0)

  ## need to add all the cost cALCULATIONS to this sheet.
  int_total_cost_without_waste <- min(avg_cost_per_mg[avg_cost_per_mg>0])*initial_required_dose
  int_total_cost_with_waste <- sum(lp("min",f.obj,f.con,f.dir,f.rhs.initial,all.int=TRUE)$solution*f.obj)
  sub_total_cost_without_waste <- min(avg_cost_per_mg[avg_cost_per_mg>0])*maintenance_required_dose
  sub_total_cost_with_waste <- sum(lp("min",f.obj,f.con,f.dir,f.rhs.maintenance,all.int=TRUE)$solution*f.obj)
  int_cost_of_waste <- int_total_cost_with_waste-int_total_cost_without_waste
  sub_cost_of_waste <- (sum(lp("min",f.obj,f.con,f.dir,f.rhs.maintenance,all.int=TRUE)$solution*f.obj))-(min(avg_cost_per_mg[avg_cost_per_mg>0])*maintenance_dose_amount)

  ## PER_CYCLE_COST ##
  ##acquisition
  if(waste=="YES"){assign(paste0(Name,"_acquisition_cost"),(int_total_cost_with_waste*init_Admin_per_cycle*(1-rebate)),envir = .GlobalEnv)}
  else if (waste == "NO") {assign(paste0(Name,"_acquisition_cost"),(int_total_cost_without_waste*init_Admin_per_cycle*(1-rebate)),envir = .GlobalEnv)}
  acquisition_cost <- get(paste0(Name,"_acquisition_cost"))

  #subsequent acquisition
  if(waste=="YES"){assign(paste0(Name,"_sub_acquisition_cost"),(sub_total_cost_with_waste*subs_Admin_per_cycle*(1-rebate)),envir = .GlobalEnv)}
  else if(waste == "NO"){assign(paste0(Name,"_sub_acquisition_cost"),(sub_total_cost_without_waste*subs_Admin_per_cycle*(1-rebate)),envir = .GlobalEnv)}
  sub_acquisition_cost <- get(paste0(Name,"_sub_acquisition_cost"))

  #initial dose admin cost
  assign(paste0(Name,"_int_dose_admin_cost"),admin_cost_per_dose*init_Admin_per_cycle,envir = .GlobalEnv)
  int_dose_admin_cost <- get(paste0(Name,"_int_dose_admin_cost"))

  ##subsequent dose admin cost
  assign(paste0(Name,"_sub_dose_admin_cost"),admin_cost_per_dose*subs_Admin_per_cycle,envir = .GlobalEnv)
  sub_dose_admin_cost <- get(paste0(Name,"_sub_dose_admin_cost"))

  #monitoring cost
  assign(paste0(Name,"_monitoring_cost"),phys_vis_cycle*cost_phys_visit_mont,envir = .GlobalEnv)
  monitoring_cost <- get(paste0(Name,"_monitoring_cost"))

  #total
  assign(paste0(Name,"_total_cost"),sum(acquisition_cost,
                                        sub_acquisition_cost,
                                        int_dose_admin_cost,
                                        sub_dose_admin_cost,
                                        monitoring_cost))

  ## TREATMENT SCHEDUEL ##
  ## data need to be added to the imputs sheets for cost calcualtions
  ##Year 1##
  Initial_dose_cycles_Y1 <- if (initial_treatment_duration*cycle_length>52){52/cycle_length
  }else if (cycle_length*initial_treatment_duration<52){initial_treatment_duration}

  Subsequent_dose_cycles_Y1 <- if(initial_treatment_duration*cycle_length>52){0
  }else if(total_treatment_duration*cycle_length<=52){total_treatment_duration-Initial_dose_cycles_Y1
  }else {Subsequent_dose_cycles_Y1<- trunc(52/cycle_length)-Initial_dose_cycles_Y1}

  ##Year 2##
  Initial_dose_cycles_Y2 <- if(initial_treatment_duration*cycle_length<=52){0
  }else if (cycle_length*(initial_treatment_duration-trunc(52/cycle_length))<=52){initial_treatment_duration-trunc(52/cycle_length)
  }else {trunc(104/cycle_length)-sum(c(Initial_dose_cycles_Y1,
                                       Subsequent_dose_cycles_Y1))}

  Subsequent_dose_cycles_Y2 <- if(total_treatment_duration*cycle_length<=52){0
  }else if (cycle_length*(total_treatment_duration-trunc(52/cycle_length))<=52){total_treatment_duration-trunc(52/cycle_length)
  }else {trunc(104/cycle_length)-sum(c(Initial_dose_cycles_Y2,
                                       Initial_dose_cycles_Y1,
                                       Subsequent_dose_cycles_Y1))}
  ##Year 3##
  Initial_dose_cycles_Y3 <- if(initial_treatment_duration*cycle_length<=104){0
  }else if (cycle_length*(initial_treatment_duration-trunc(104/cycle_length))<=52){initial_treatment_duration-trunc(104/cycle_length)
  }else {trunc(156/cycle_length)-sum(c(Subsequent_dose_cycles_Y2,
                                       Initial_dose_cycles_Y2,
                                       Subsequent_dose_cycles_Y1,
                                       Initial_dose_cycles_Y1))}

  Subsequent_dose_cycles_Y3 <- if(total_treatment_duration*cycle_length<=104){0
  }else if (cycle_length*(total_treatment_duration-trunc(104/cycle_length))<=52){total_treatment_duration-trunc(104/cycle_length)
  }else {trunc(156/cycle_length)-sum(c(Initial_dose_cycles_Y3,
                                       Subsequent_dose_cycles_Y2,
                                       Initial_dose_cycles_Y2,
                                       Subsequent_dose_cycles_Y1,
                                       Initial_dose_cycles_Y1))}
  ##Year 4##
  Initial_dose_cycles_Y4 <- if(initial_treatment_duration*cycle_length<=156){0
  }else if (cycle_length*(initial_treatment_duration-trunc(156/cycle_length))<=52){initial_treatment_duration-trunc(156/cycle_length)
  }else {trunc(208/cycle_length)-sum(c(Initial_dose_cycles_Y3,
                                       Subsequent_dose_cycles_Y3,
                                       Subsequent_dose_cycles_Y2,
                                       Initial_dose_cycles_Y2,
                                       Subsequent_dose_cycles_Y1,
                                       Initial_dose_cycles_Y1))}

  Subsequent_dose_cycles_Y4 <- if(total_treatment_duration*cycle_length<=156){0
  }else if (cycle_length*(total_treatment_duration-trunc(156/cycle_length))<=52){total_treatment_duration-trunc(156/cycle_length)
  }else {trunc(208/cycle_length)-sum(c(Initial_dose_cycles_Y4,
                                       Initial_dose_cycles_Y3,
                                       Subsequent_dose_cycles_Y3,
                                       Subsequent_dose_cycles_Y2,
                                       Initial_dose_cycles_Y2,
                                       Subsequent_dose_cycles_Y1,
                                       Initial_dose_cycles_Y1))}
  ##Year 5##
  Initial_dose_cycles_Y5 <<- if(initial_treatment_duration*cycle_length<=208){0
  }else if (cycle_length*(initial_treatment_duration-trunc(208/cycle_length))<=52){initial_treatment_duration-trunc(208/cycle_length)
  }else {trunc(260/cycle_length)-sum(c(Subsequent_dose_cycles_Y4,
                                       Initial_dose_cycles_Y4,
                                       Initial_dose_cycles_Y3,
                                       Subsequent_dose_cycles_Y3,
                                       Subsequent_dose_cycles_Y2,
                                       Initial_dose_cycles_Y2,
                                       Subsequent_dose_cycles_Y1,
                                       Initial_dose_cycles_Y1))}

  Subsequent_dose_cycles_Y5 <- if(total_treatment_duration*cycle_length<=208){0
  }else if (cycle_length*(total_treatment_duration-trunc(208/cycle_length))<=52){total_treatment_duration-trunc(208/cycle_length)
  }else {trunc(260/cycle_length)-sum(c(Initial_dose_cycles_Y5,
                                       Subsequent_dose_cycles_Y4,
                                       Initial_dose_cycles_Y4,
                                       Initial_dose_cycles_Y3,
                                       Subsequent_dose_cycles_Y3,
                                       Subsequent_dose_cycles_Y2,
                                       Initial_dose_cycles_Y2,
                                       Subsequent_dose_cycles_Y1,
                                       Initial_dose_cycles_Y1))}


  Cycles_in_5_Years <- sum(Initial_dose_cycles_Y1,
                            Subsequent_dose_cycles_Y1,
                            Initial_dose_cycles_Y2,
                            Subsequent_dose_cycles_Y2,
                            Initial_dose_cycles_Y3,
                            Subsequent_dose_cycles_Y3,
                            Initial_dose_cycles_Y4,
                            Subsequent_dose_cycles_Y4,
                            Initial_dose_cycles_Y5,
                            Subsequent_dose_cycles_Y5)

  ## ANNUAL COST PER DRUG ##
  ## data need to be added to the imputs sheets for cost calcualtions
  ## Names of the comparitors need to be changed to aligne with DO

  ## YEAR 1 ##
  ## Acquisition ##
  {assign(paste0(Name,"_Y1_acquisition_cost"),acquisition_cost*Initial_dose_cycles_Y1+Subsequent_dose_cycles_Y1*sub_acquisition_cost,envir = .GlobalEnv)}
  y1_acquisition_cost <- get(paste0(Name,"_Y1_acquisition_cost"))

  ## Admin cost	##
  {assign(paste0(Name,"_Y1_admin_cost"), sub_dose_admin_cost*Subsequent_dose_cycles_Y1+int_dose_admin_cost*Initial_dose_cycles_Y1,envir = .GlobalEnv)}
  y1_admin_cost <-get(paste0(Name,"_Y1_admin_cost"))

  ## Monitoring ##
  {assign(paste0(Name,"_Y1_monitoring_cost"),monitoring_cost*(Subsequent_dose_cycles_Y1+Initial_dose_cycles_Y1),envir = .GlobalEnv)}
  y1_monitoring_cost <- get(paste0(Name,"_Y1_monitoring_cost"))

  ## cost	Total ##
  assign(paste0(Name,"_Y1_total_cost"),sum(y1_acquisition_cost,
                                           y1_admin_cost,
                                           y1_monitoring_cost),envir = .GlobalEnv)
  ## YEAR 2 ##
  ## Acquisition ##
  {assign(paste0(Name,"_Y2_acquisition_cost"),acquisition_cost*Initial_dose_cycles_Y2+Subsequent_dose_cycles_Y2*sub_acquisition_cost,envir = .GlobalEnv)}
  y2_acquisition_cost <- get(paste0(Name,"_Y2_acquisition_cost"))

  ## Admin cost	##
  {assign(paste0(Name,"_Y2_admin_cost"), sub_dose_admin_cost*Subsequent_dose_cycles_Y2+int_dose_admin_cost*Initial_dose_cycles_Y2,envir = .GlobalEnv)}
  y2_admin_cost <-get(paste0(Name,"_Y2_admin_cost"))

  ## Monitoring ##
  {assign(paste0(Name,"_Y2_monitoring_cost"),monitoring_cost*(Subsequent_dose_cycles_Y2+Initial_dose_cycles_Y2),envir = .GlobalEnv)}
  y2_monitoring_cost <- get(paste0(Name,"_Y2_monitoring_cost"))

  ## cost	Total ##
  {assign(paste0(Name,"_Y2_total_cost"),sum(y2_acquisition_cost,
                                            y2_admin_cost,
                                            y2_monitoring_cost),envir = .GlobalEnv)}

  ## YEAR 3 ##
  ## Acquisition ##
  {assign(paste0(Name,"_Y3_acquisition_cost"),acquisition_cost*Initial_dose_cycles_Y3+Subsequent_dose_cycles_Y3*sub_acquisition_cost,envir = .GlobalEnv)}
  y3_acquisition_cost <- get(paste0(Name,"_Y3_acquisition_cost"))

  ## Admin cost	##
  {assign(paste0(Name,"_Y3_admin_cost"), sub_dose_admin_cost*Subsequent_dose_cycles_Y3+int_dose_admin_cost*Initial_dose_cycles_Y3,envir = .GlobalEnv)}
  y3_admin_cost <-get(paste0(Name,"_Y3_admin_cost"))

  ## Monitoring ##
  {assign(paste0(Name,"_Y3_monitoring_cost"),monitoring_cost*(Subsequent_dose_cycles_Y3+Initial_dose_cycles_Y3),envir = .GlobalEnv)}
  y3_monitoring_cost <- get(paste0(Name,"_Y3_monitoring_cost"))

  ## cost	Total ##
  {assign(paste0(Name,"_Y3_total_cost"),sum(y3_acquisition_cost,
                                            y3_admin_cost,
                                            y3_monitoring_cost),envir = .GlobalEnv)}

  ## YEAR 4 ##
  ## Acquisition ##
  {assign(paste0(Name,"_Y4_acquisition_cost"),acquisition_cost*Initial_dose_cycles_Y4+Subsequent_dose_cycles_Y4*sub_acquisition_cost,envir = .GlobalEnv)}
  y4_acquisition_cost <- get(paste0(Name,"_Y4_acquisition_cost"))

  ## Admin cost	##
  {assign(paste0(Name,"_Y4_admin_cost"), sub_dose_admin_cost*Subsequent_dose_cycles_Y4+int_dose_admin_cost*Initial_dose_cycles_Y4,envir = .GlobalEnv)}
  y4_admin_cost <-get(paste0(Name,"_Y4_admin_cost"))

  ## Monitoring ##
  {assign(paste0(Name,"_Y4_monitoring_cost"),monitoring_cost*(Subsequent_dose_cycles_Y4+Initial_dose_cycles_Y4),envir = .GlobalEnv)}
  y4_monitoring_cost <- get(paste0(Name,"_Y4_monitoring_cost"))

  ## cost	Total ##
  {assign(paste0(Name,"_Y4_total_cost"),sum(y4_acquisition_cost,
                                            y4_admin_cost,
                                            y4_monitoring_cost),envir = .GlobalEnv)}


  ## YEAR 5 ##
  ## Acquisition ##
  {assign(paste0(Name,"_Y5_acquisition_cost"),acquisition_cost*Initial_dose_cycles_Y5+Subsequent_dose_cycles_Y5*sub_acquisition_cost,envir = .GlobalEnv)}
  y5_acquisition_cost <- get(paste0(Name,"_Y5_acquisition_cost"))

  ## Admin cost	##
  {assign(paste0(Name,"_Y5_admin_cost"), sub_dose_admin_cost*Subsequent_dose_cycles_Y5+int_dose_admin_cost*Initial_dose_cycles_Y5,envir = .GlobalEnv)}
  y5_admin_cost <-get(paste0(Name,"_Y5_admin_cost"))

  ## Monitoring ##
  {assign(paste0(Name,"_Y5_monitoring_cost"),monitoring_cost*(Subsequent_dose_cycles_Y5+Initial_dose_cycles_Y5),envir = .GlobalEnv)}
  y5_monitoring_cost <- get(paste0(Name,"_Y5_monitoring_cost"))

  ## cost	Total ##
  {assign(paste0(Name,"_Y5_total_cost"),sum(y5_acquisition_cost,
                                            y5_admin_cost,
                                            y5_monitoring_cost),envir = .GlobalEnv)}

  ## ADVERSE EVENENTS ##
  ## THE TABLE IS A DATA LOOKUP ##

  ## waste ##
  ## year 1 waste total of each compara
  {assign(paste0(Name,"_Y1_waste"),(Subsequent_dose_cycles_Y1*int_cost_of_waste),envir = .GlobalEnv)}

  ## year 2 waste total of each compara
  {assign(paste0(Name,"_Y2_waste"),(Subsequent_dose_cycles_Y2*int_cost_of_waste),envir = .GlobalEnv)}

  ## year 3 waste total of each compara
  {assign(paste0(Name,"_Y3_waste"),(Subsequent_dose_cycles_Y3*int_cost_of_waste),envir = .GlobalEnv)}

  ## year 4 waste total of each compara
  {assign(paste0(Name,"_Y4_waste"),(Subsequent_dose_cycles_Y4*int_cost_of_waste),envir = .GlobalEnv)}

  ## year 5 waste total of each compara
  {assign(paste0(Name,"_Y5_waste"),(Subsequent_dose_cycles_Y5*int_cost_of_waste),envir = .GlobalEnv)}

  ## year 1 sum of waste if combination therapy
  assign(paste0(Name,"_Y1_waste_total"),if(grepl("_D2",Name,fixed=TRUE)==TRUE){get(paste0(Name,"_Y1_waste"))+get(paste0(sub("_D2", "_D1", Name),"_Y1_waste"))
  }else{get(paste0(Name,"_Y1_waste"))} ,envir = .GlobalEnv)

  ## year 2 sum of waste if combination therapy
  assign(paste0(Name,"_Y2_waste_total"),if(grepl("_D2",Name,fixed=TRUE)==TRUE){get(paste0(Name,"_Y2_waste"))+get(paste0(sub("_D2", "_D1", Name),"_Y2_waste"))
  }else{get(paste0(Name,"_Y2_waste"))},envir = .GlobalEnv)

  ## year 3 sum of waste if combination therapy
  assign(paste0(Name,"_Y3_waste_total"),if(grepl("_D2",Name,fixed=TRUE)==TRUE){get(paste0(Name,"_Y3_waste"))+get(paste0(sub("_D2", "_D1", Name),"_Y3_waste"))
  }else{get(paste0(Name,"_Y3_waste"))},envir = .GlobalEnv)

  ## year 4 sum of waste if combination therapy
  assign(paste0(Name,"_Y4_waste_total"),if(grepl("_D2",Name,fixed=TRUE)==TRUE){get(paste0(Name,"_Y4_waste"))+get(paste0(sub("_D2", "_D1", Name),"_Y4_waste"))
  }else{get(paste0(Name,"_Y4_waste"))},envir = .GlobalEnv)

  ## year 5 sum of waste if combination therapy
  assign(paste0(Name,"_Y5_waste_total"),if(grepl("_D2",Name,fixed=TRUE)==TRUE){get(paste0(Name,"_Y5_waste"))+get(paste0(sub("_D2", "_D1", Name),"_Y5_waste"))
  }else{get(paste0(Name,"_Y5_waste"))},envir = .GlobalEnv)

  ##sum of the cost included in the BIM
}



##Optimisation for oral treatments. This also accounts for different package sizes
Tablet_optimisation_Cost_calculations<- function(NameD,
                                                  DrugNumber,
                                                  Pack_cost,
                                                  Tablet_size,
                                                  Pack_size,
                                                  initial_dose_amount,
                                                  initial_dose_unit,
                                                  maintenance_dose_amount,
                                                  maintenance_dose_unit,
                                                  cycle_length,
                                                  init_Admin_per_cycle,
                                                  subs_Admin_per_cycle,
                                                  phys_vis_cycle,
                                                  admin_cost_per_dose,
                                                  rebate,
                                                  cost_phys_visit_mont,
                                                  initial_treatment_duration,
                                                  total_treatment_duration,
                                                  waste,
                                                 avg_weight,
                                                 avg_BSA){
  Name <- paste0(NameD,"_D",DrugNumber)

  #To calculate size of initial dose per cycle
  initial_required_dose <- if (initial_dose_unit=="mg"){initial_dose_amount
  } else if (initial_dose_unit=="mg/kg"){initial_dose_amount*avg_weight
  } else if (initial_dose_unit=="mg/kg^2"){initial_dose_amount*avg_BSA
  }

  #To calculate size of maintenance dose per cycle
  maintenance_required_dose <-  if (maintenance_dose_unit=="mg"){maintenance_dose_amount}
  else if (maintenance_dose_unit=="mg/kg"){maintenance_dose_amount*avg_weight}
  else if (maintenance_dose_unit=="mg/kg^2"){maintenance_dose_amount*avg_BSA
  }

  #Constrained optimisation to minimise cost across different vial sizes whilst ensuring minimum dose required is reached
  f.obj <- ifelse(Pack_size != 0, Pack_cost/Pack_size, 0)
  f.con <- matrix(Tablet_size,nrow=1,byrow = TRUE)
  f.dir <- c(">=")
  f.rhs.initial <- initial_required_dose
  f.rhs.maintenance <- maintenance_required_dose

  ##For calculation of no waste costs##
  #Calculates the average cost per tablet for each of the Tablet sizes
  avg_cost_per_mg <- ifelse(Pack_size != 0|Tablet_size !=0, ((Pack_cost/Pack_size)/Tablet_size), 0)
  ## need to add all the cost cALCULATIONS to this sheet.
  int_total_cost_without_waste <<- min(avg_cost_per_mg[avg_cost_per_mg>0])*initial_required_dose
  int_total_cost_with_waste <<- sum(lp("min",f.obj,f.con,f.dir,f.rhs.initial,all.int=TRUE)$solution*f.obj)
  sub_total_cost_without_waste <- min(avg_cost_per_mg[avg_cost_per_mg>0])*maintenance_required_dose
  sub_total_cost_with_waste <- sum(lp("min",f.obj,f.con,f.dir,f.rhs.maintenance,all.int=TRUE)$solution*f.obj)
  int_cost_of_waste <- (sum(lp("min",f.obj,f.con,f.dir,f.rhs.initial,all.int=TRUE)$solution*f.obj))-(min(avg_cost_per_mg[avg_cost_per_mg>0])*initial_dose_amount)
  sub_cost_of_waste <- (sum(lp("min",f.obj,f.con,f.dir,f.rhs.maintenance,all.int=TRUE)$solution*f.obj))-(min(avg_cost_per_mg[avg_cost_per_mg>0])*maintenance_dose_amount)

  ## PER_CYCLE_COST ##
  ##acquisition
  if(waste=="YES"){assign(paste0(Name,"_acquisition_cost"),(int_total_cost_with_waste*init_Admin_per_cycle*(1-rebate)),envir = .GlobalEnv)}
  else if (waste == "NO") {assign(paste0(Name,"_acquisition_cost"),(int_total_cost_without_waste*init_Admin_per_cycle*(1-rebate)),envir = .GlobalEnv)}
  acquisition_cost <- get(paste0(Name,"_acquisition_cost"))

  #subsequent acquisition
  if(waste=="YES"){assign(paste0(Name,"_sub_acquisition_cost"),(sub_total_cost_with_waste*subs_Admin_per_cycle*(1-rebate)),envir = .GlobalEnv)}
  else if(waste == "NO"){assign(paste0(Name,"_sub_acquisition_cost"),(sub_total_cost_without_waste*subs_Admin_per_cycle*(1-rebate)),envir = .GlobalEnv)}
  sub_acquisition_cost <- get(paste0(Name,"_sub_acquisition_cost"))

  #initial dose admin cost
  assign(paste0(Name,"_int_dose_admin_cost"),admin_cost_per_dose*init_Admin_per_cycle,envir = .GlobalEnv)
  int_dose_admin_cost <- get(paste0(Name,"_int_dose_admin_cost"))

  ##subsequent dose admin cost
  assign(paste0(Name,"_sub_dose_admin_cost"),admin_cost_per_dose*subs_Admin_per_cycle,envir = .GlobalEnv)
  sub_dose_admin_cost <- get(paste0(Name,"_sub_dose_admin_cost"))

  assign(paste0(Name,"_monitoring_cost"),cost_phys_visit_mont/phys_vis_cycle,envir = .GlobalEnv)
  monitoring_cost <- get(paste0(Name,"_monitoring_cost"))
  monitoring_cost[is.infinite(monitoring_cost)] <- 0
  monitoring_cost[is.nan(monitoring_cost)] <- 0

  #total
  assign(paste0(Name,"_total_cost"),sum(acquisition_cost,
                                        sub_acquisition_cost,
                                        int_dose_admin_cost,
                                        sub_dose_admin_cost,
                                        monitoring_cost))

  ## TREATMENT SCHEDUEL ##
  ## data need to be added to the imputs sheets for cost calcualtions
  ##Year 1##
  Initial_dose_cycles_Y1 <- if (initial_treatment_duration*cycle_length>52){52/cycle_length
  }else if (cycle_length*initial_treatment_duration<52){initial_treatment_duration}

  Subsequent_dose_cycles_Y1 <- if(initial_treatment_duration*cycle_length>52){0
  }else if(total_treatment_duration*cycle_length<=52){total_treatment_duration-Initial_dose_cycles_Y1
  }else {Subsequent_dose_cycles_Y1<<- trunc(52/cycle_length)-Initial_dose_cycles_Y1}

  ##Year 2##
  Initial_dose_cycles_Y2 <- if(initial_treatment_duration*cycle_length<=52){0
  }else if (cycle_length*(initial_treatment_duration-trunc(52/cycle_length))<=52){initial_treatment_duration-trunc(52/cycle_length)
  }else {trunc(104/cycle_length)-sum(c(Initial_dose_cycles_Y1,
                                       Subsequent_dose_cycles_Y1))}

  Subsequent_dose_cycles_Y2 <- if(total_treatment_duration*cycle_length<=52){0
  }else if (cycle_length*(total_treatment_duration-trunc(52/cycle_length))<=52){total_treatment_duration-trunc(52/cycle_length)
  }else {trunc(104/cycle_length)-sum(c(Initial_dose_cycles_Y2,
                                       Initial_dose_cycles_Y1,
                                       Subsequent_dose_cycles_Y1))}
  ##Year 3##
  Initial_dose_cycles_Y3 <- if(initial_treatment_duration*cycle_length<=104){0
  }else if (cycle_length*(initial_treatment_duration-trunc(104/cycle_length))<=52){initial_treatment_duration-trunc(104/cycle_length)
  }else {trunc(156/cycle_length)-sum(c(Subsequent_dose_cycles_Y2,
                                       Initial_dose_cycles_Y2,
                                       Subsequent_dose_cycles_Y1,
                                       Initial_dose_cycles_Y1))}

  Subsequent_dose_cycles_Y3 <- if(total_treatment_duration*cycle_length<=104){0
  }else if (cycle_length*(total_treatment_duration-trunc(104/cycle_length))<=52){total_treatment_duration-trunc(104/cycle_length)
  }else {trunc(156/cycle_length)-sum(c(Initial_dose_cycles_Y3,
                                       Subsequent_dose_cycles_Y2,
                                       Initial_dose_cycles_Y2,
                                       Subsequent_dose_cycles_Y1,
                                       Initial_dose_cycles_Y1))}
  ##Year 4##
  Initial_dose_cycles_Y4 <- if(initial_treatment_duration*cycle_length<=156){0
  }else if (cycle_length*(initial_treatment_duration-trunc(156/cycle_length))<=52){initial_treatment_duration-trunc(156/cycle_length)
  }else {trunc(208/cycle_length)-sum(c(Initial_dose_cycles_Y3,
                                       Subsequent_dose_cycles_Y3,
                                       Subsequent_dose_cycles_Y2,
                                       Initial_dose_cycles_Y2,
                                       Subsequent_dose_cycles_Y1,
                                       Initial_dose_cycles_Y1))}

  Subsequent_dose_cycles_Y4 <- if(total_treatment_duration*cycle_length<=156){0
  }else if (cycle_length*(total_treatment_duration-trunc(156/cycle_length))<=52){total_treatment_duration-trunc(156/cycle_length)
  }else {trunc(208/cycle_length)-sum(c(Initial_dose_cycles_Y4,
                                       Initial_dose_cycles_Y3,
                                       Subsequent_dose_cycles_Y3,
                                       Subsequent_dose_cycles_Y2,
                                       Initial_dose_cycles_Y2,
                                       Subsequent_dose_cycles_Y1,
                                       Initial_dose_cycles_Y1))}
  ##Year 5##
  Initial_dose_cycles_Y5 <- if(initial_treatment_duration*cycle_length<=208){0
  }else if (cycle_length*(initial_treatment_duration-trunc(208/cycle_length))<=52){initial_treatment_duration-trunc(208/cycle_length)
  }else {trunc(260/cycle_length)-sum(c(Subsequent_dose_cycles_Y4,
                                       Initial_dose_cycles_Y4,
                                       Initial_dose_cycles_Y3,
                                       Subsequent_dose_cycles_Y3,
                                       Subsequent_dose_cycles_Y2,
                                       Initial_dose_cycles_Y2,
                                       Subsequent_dose_cycles_Y1,
                                       Initial_dose_cycles_Y1))}

  Subsequent_dose_cycles_Y5 <- if(total_treatment_duration*cycle_length<=208){0
  }else if (cycle_length*(total_treatment_duration-trunc(208/cycle_length))<=52){total_treatment_duration-trunc(208/cycle_length)
  }else {trunc(260/cycle_length)-sum(c(Initial_dose_cycles_Y5,
                                       Subsequent_dose_cycles_Y4,
                                       Initial_dose_cycles_Y4,
                                       Initial_dose_cycles_Y3,
                                       Subsequent_dose_cycles_Y3,
                                       Subsequent_dose_cycles_Y2,
                                       Initial_dose_cycles_Y2,
                                       Subsequent_dose_cycles_Y1,
                                       Initial_dose_cycles_Y1))}


  Cycles_in_5_Years <- sum(Initial_dose_cycles_Y1,
                            Subsequent_dose_cycles_Y1,
                            Initial_dose_cycles_Y2,
                            Subsequent_dose_cycles_Y2,
                            Initial_dose_cycles_Y3,
                            Subsequent_dose_cycles_Y3,
                            Initial_dose_cycles_Y4,
                            Subsequent_dose_cycles_Y4,
                            Initial_dose_cycles_Y5,
                            Subsequent_dose_cycles_Y5)

  ## ANNUAL COST PER DRUG ##
  ## data need to be added to the imputs sheets for cost calcualtions
  ## Names of the comparitors need to be changed to aligne with DO

  ## YEAR 1 ##
  ## Acquisition ##
  {assign(paste0(Name,"_Y1_acquisition_cost"),acquisition_cost*Initial_dose_cycles_Y1+Subsequent_dose_cycles_Y1*sub_acquisition_cost,envir = .GlobalEnv)}
  y1_acquisition_cost <- get(paste0(Name,"_Y1_acquisition_cost"))

  ## Admin cost	##
  {assign(paste0(Name,"_Y1_admin_cost"), sub_dose_admin_cost*Subsequent_dose_cycles_Y1+int_dose_admin_cost*Initial_dose_cycles_Y1,envir = .GlobalEnv)}
  y1_admin_cost <-get(paste0(Name,"_Y1_admin_cost"))

  ## Monitoring ##
  {assign(paste0(Name,"_Y1_monitoring_cost"),monitoring_cost*(Subsequent_dose_cycles_Y1+Initial_dose_cycles_Y1),envir = .GlobalEnv)}
  y1_monitoring_cost <- get(paste0(Name,"_Y1_monitoring_cost"))

  ## cost	Total ##
  {assign(paste0(Name,"_Y1_total_cost"),sum(y1_acquisition_cost,
                                            y1_admin_cost,
                                            y1_monitoring_cost),envir = .GlobalEnv)}
  ## YEAR 2 ##
  ## Acquisition ##
  {assign(paste0(Name,"_Y2_acquisition_cost"),acquisition_cost*Initial_dose_cycles_Y2+Subsequent_dose_cycles_Y2*sub_acquisition_cost,envir = .GlobalEnv)}
  y2_acquisition_cost <- get(paste0(Name,"_Y2_acquisition_cost"))

  ## Admin cost	##
  {assign(paste0(Name,"_Y2_admin_cost"), sub_dose_admin_cost*Subsequent_dose_cycles_Y2+int_dose_admin_cost*Initial_dose_cycles_Y2,envir = .GlobalEnv)}
  y2_admin_cost <-get(paste0(Name,"_Y2_admin_cost"))

  ## Monitoring ##
  {assign(paste0(Name,"_Y2_monitoring_cost"),monitoring_cost*(Subsequent_dose_cycles_Y2+Initial_dose_cycles_Y2),envir = .GlobalEnv)}
  y2_monitoring_cost <- get(paste0(Name,"_Y2_monitoring_cost"))

  ## cost	Total ##
  {assign(paste0(Name,"_Y2_total_cost"),sum(y2_acquisition_cost,
                                            y2_admin_cost,
                                            y2_monitoring_cost),envir = .GlobalEnv)}

  ## YEAR 3 ##
  ## Acquisition ##
  {assign(paste0(Name,"_Y3_acquisition_cost"),acquisition_cost*Initial_dose_cycles_Y3+Subsequent_dose_cycles_Y3*sub_acquisition_cost,envir = .GlobalEnv)}
  y3_acquisition_cost <- get(paste0(Name,"_Y3_acquisition_cost"))

  ## Admin cost	##
  {assign(paste0(Name,"_Y3_admin_cost"), sub_dose_admin_cost*Subsequent_dose_cycles_Y3+int_dose_admin_cost*Initial_dose_cycles_Y3,envir = .GlobalEnv)}
  y3_admin_cost <-get(paste0(Name,"_Y3_admin_cost"))

  ## Monitoring ##
  {assign(paste0(Name,"_Y3_monitoring_cost"),monitoring_cost*(Subsequent_dose_cycles_Y3+Initial_dose_cycles_Y3),envir = .GlobalEnv)}
  y3_monitoring_cost <- get(paste0(Name,"_Y3_monitoring_cost"))

  ## cost	Total ##
  {assign(paste0(Name,"_Y3_total_cost"),sum(y3_acquisition_cost,
                                            y3_admin_cost,
                                            y3_monitoring_cost),envir = .GlobalEnv)}

  ## YEAR 4 ##
  ## Acquisition ##
  {assign(paste0(Name,"_Y4_acquisition_cost"),acquisition_cost*Initial_dose_cycles_Y4+Subsequent_dose_cycles_Y4*sub_acquisition_cost,envir = .GlobalEnv)}
  y4_acquisition_cost <- get(paste0(Name,"_Y4_acquisition_cost"))

  ## Admin cost	##
  {assign(paste0(Name,"_Y4_admin_cost"), sub_dose_admin_cost*Subsequent_dose_cycles_Y4+int_dose_admin_cost*Initial_dose_cycles_Y4,envir = .GlobalEnv)}
  y4_admin_cost <-get(paste0(Name,"_Y4_admin_cost"))

  ## Monitoring ##
  {assign(paste0(Name,"_Y4_monitoring_cost"),monitoring_cost*(Subsequent_dose_cycles_Y4+Initial_dose_cycles_Y4),envir = .GlobalEnv)}
  y4_monitoring_cost <- get(paste0(Name,"_Y4_monitoring_cost"))

  ## cost	Total ##
  {assign(paste0(Name,"_Y4_total_cost"),sum(y4_acquisition_cost,
                                            y4_admin_cost,
                                            y4_monitoring_cost),envir = .GlobalEnv)}


  ## YEAR 5 ##
  ## Acquisition ##
  {assign(paste0(Name,"_Y5_acquisition_cost"),acquisition_cost*Initial_dose_cycles_Y5+Subsequent_dose_cycles_Y5*sub_acquisition_cost,envir = .GlobalEnv)}
  y5_acquisition_cost <- get(paste0(Name,"_Y5_acquisition_cost"))

  ## Admin cost	##
  {assign(paste0(Name,"_Y5_admin_cost"), sub_dose_admin_cost*Subsequent_dose_cycles_Y5+int_dose_admin_cost*Initial_dose_cycles_Y5,envir = .GlobalEnv)}
  y5_admin_cost <-get(paste0(Name,"_Y5_admin_cost"))

  ## Monitoring ##
  {assign(paste0(Name,"_Y5_monitoring_cost"),monitoring_cost*(Subsequent_dose_cycles_Y5+Initial_dose_cycles_Y5),envir = .GlobalEnv)}
  y5_monitoring_cost <- get(paste0(Name,"_Y5_monitoring_cost"))

  ## cost	Total ##
  {assign(paste0(Name,"_Y5_total_cost"),sum(y5_acquisition_cost,
                                            y5_admin_cost,
                                            y5_monitoring_cost),envir = .GlobalEnv)}


  ## waste ##
  ## year 1 waste total of each compara
  {assign(paste0(Name,"_Y1_waste"),(Subsequent_dose_cycles_Y1*int_cost_of_waste),envir = .GlobalEnv)}

  ## year 2 waste total of each compara
  {assign(paste0(Name,"_Y2_waste"),(Subsequent_dose_cycles_Y2*int_cost_of_waste),envir = .GlobalEnv)}

  ## year 3 waste total of each compara
  {assign(paste0(Name,"_Y3_waste"),(Subsequent_dose_cycles_Y3*int_cost_of_waste),envir = .GlobalEnv)}

  ## year 4 waste total of each compara
  {assign(paste0(Name,"_Y4_waste"),(Subsequent_dose_cycles_Y4*int_cost_of_waste),envir = .GlobalEnv)}

  ## year 5 waste total of each compara
  {assign(paste0(Name,"_Y5_waste"),(Subsequent_dose_cycles_Y5*int_cost_of_waste),envir = .GlobalEnv)}

  ## year 1 sum of waste if combination therapy
  assign(paste0(Name,"_Y1_waste_total"),if(grepl("_D2",Name,fixed=TRUE)==TRUE){get(paste0(Name,"_Y1_waste"))+get(paste0(sub("_D2", "_D1", Name),"_Y1_waste"))
  }else{get(paste0(Name,"_Y1_waste"))},envir = .GlobalEnv)

  ## year 2 sum of waste if combination therapy
  assign(paste0(Name,"_Y2_waste_total"),if(grepl("_D2",Name,fixed=TRUE)==TRUE){get(paste0(Name,"_Y2_waste"))+get(paste0(sub("_D2", "_D1", Name),"_Y2_waste"))
  }else{get(paste0(Name,"_Y2_waste"))},envir = .GlobalEnv)

  ## year 3 sum of waste if combination therapy
  assign(paste0(Name,"_Y3_waste_total"),if(grepl("_D2",Name,fixed=TRUE)==TRUE){get(paste0(Name,"_Y3_waste"))+get(paste0(sub("_D2", "_D1", Name),"_Y3_waste"))
  }else{get(paste0(Name,"_Y3_waste"))},envir = .GlobalEnv)

  ## year 4 sum of waste if combination therapy
  assign(paste0(Name,"_Y4_waste_total"),if(grepl("_D2",Name,fixed=TRUE)==TRUE){get(paste0(Name,"_Y4_waste"))+get(paste0(sub("_D2", "_D1", Name),"_Y4_waste"))
  }else{get(paste0(Name,"_Y4_waste"))},envir = .GlobalEnv)

  ## year 5 sum of waste if combination therapy
  assign(paste0(Name,"_Y5_waste_total"),if(grepl("_D2",Name,fixed=TRUE)==TRUE){get(paste0(Name,"_Y5_waste"))+get(paste0(sub("_D2", "_D1", Name),"_Y5_waste"))
  }else{get(paste0(Name,"_Y5_waste"))},envir = .GlobalEnv)

  ##sum of the costs included in the BIM
}
