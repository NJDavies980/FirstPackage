#' This calculation of the population data which will be used to inform the BIM. 
#'
#'@param Y= Time-horizon of model, years
#Subgroup 1
#'@param IV_Mono_C1_current_S_1= Current market share of IV monotherapy 1 for subgroup1
#'@param IV_Mono_C2_current_S_1= Current market share of IV monotherapy 2 for subgroup1
#'@param IV_Mono_C3_current_S_1= Current market share of IV monotherapy 3 for subgroup1
#'@param IV_Mono_C4_current_S_1= Current market share of IV monotherapy 4 for subgroup1
#'@param IV_Mono_C5_current_S_1= Current market share of IV monotherapy 5 for subgroup1
#'@param IV_Combi_C1_current_S_1= Current market share of IV combination 1 for subgroup1
#'@param IV_Combi_C2_current_S_1= Current market share of IV combination 2 for subgroup1
#'@param Oral_Mono_C1_current_S_1= Current market share of Oral monotherapy 1 for subgroup1
#'@param Oral_Mono_C2_current_S_1= Current market share of Oral monotherapy 2 for subgroup1
#'@param Oral_Mono_C3_current_S_1= Current market share of Oral monotherapy 3 for subgroup1
#'@param Oral_Combi_C1_current_S_1= Current market share of Oral combination 1 for subgroup1
#'@param Oral_Combi_C2_current_S_1= Current market share of Oral combination 2 for subgroup1
#'@param X_new_S_1= New market share of treatment X for subgroup1
#'@param IV_Mono_C1_new_S_1= New market share of IV monotherapy 1 for subgroup1
#'@param IV_Mono_C2_new_S_1= New market share of IV monotherapy 2 for subgroup1
#'@param IV_Mono_C3_new_S_1= New market share of IV monotherapy 3 for subgroup1
#'@param IV_Mono_C4_new_S_1= New market share of IV monotherapy 4 for subgroup1
#'@param IV_Mono_C5_new_S_1= New market share of IV monotherapy 5 for subgroup1
#'@param IV_Combi_C1_new_S_1= New market share of IV combination 1 for subgroup1
#'@param IV_Combi_C2_new_S_1= New market share of IV combination 2 for subgroup1
#'@param Oral_Mono_C1_new_S_1= New market share of Oral monotherapy 1 for subgroup1
#'@param Oral_Mono_C2_new_S_1= New market share of Oral monotherapy 2 for subgroup1
#'@param Oral_Mono_C3_new_S_1= New market share of Oral monotherapy 3 for subgroup1
#'@param Oral_Combi_C1_new_S_1= New market share of Oral combination 1 for subgroup1
#'@param Oral_Combi_C2_new_S_1= New market share of Oral combination 2 for subgroup1
#Subgroup 2
#'@param IV_Mono_C1_current_S_2= Current market share of IV monotherapy 1 for subgroup2
#'@param IV_Mono_C2_current_S_2= Current market share of IV monotherapy 2 for subgroup2
#'@param IV_Mono_C3_current_S_2= Current market share of IV monotherapy 3 for subgroup2
#'@param IV_Mono_C4_current_S_2= Current market share of IV monotherapy 4 for subgroup2
#'@param IV_Mono_C5_current_S_2= Current market share of IV monotherapy 5 for subgroup2
#'@param IV_Combi_C1_current_S_2= Current market share of IV combination 1 for subgroup2
#'@param IV_Combi_C2_current_S_2= Current market share of IV combination 2 for subgroup2
#'@param Oral_Mono_C1_current_S_2= Current market share of Oral monotherapy 1 for subgroup2
#'@param Oral_Mono_C2_current_S_2= Current market share of Oral monotherapy 2 for subgroup2
#'@param Oral_Mono_C3_current_S_2= Current market share of Oral monotherapy 3 for subgroup2
#'@param Oral_Combi_C1_current_S_2= Current market share of Oral combination 1 for subgroup2
#'@param Oral_Combi_C2_current_S_2= Current market share of Oral combination 2 for subgroup2
#'@param X_new_S_2= New market share of treatment X for subgroup2
#'@param IV_Mono_C1_new_S_2= New market share of IV monotherapy 1 for subgroup2
#'@param IV_Mono_C2_new_S_2= New market share of IV monotherapy 2 for subgroup2
#'@param IV_Mono_C3_new_S_2= New market share of IV monotherapy 3 for subgroup2
#'@param IV_Mono_C4_new_S_2= New market share of IV monotherapy 4 for subgroup2
#'@param IV_Mono_C5_new_S_2= New market share of IV monotherapy 5 for subgroup2
#'@param IV_Combi_C1_new_S_2= New market share of IV combination 1 for subgroup2
#'@param IV_Combi_C2_new_S_2= New market share of IV combination 2 for subgroup2
#'@param Oral_Mono_C1_new_S_2= New market share of Oral monotherapy 1 for subgroup2
#'@param Oral_Mono_C2_new_S_2= New market share of Oral monotherapy 2 for subgroup2
#'@param Oral_Mono_C3_new_S_2= New market share of Oral monotherapy 3 for subgroup2
#'@param Oral_Combi_C1_new_S_2= New market share of Oral combination 1 for subgroup2
#'@param Oral_Combi_C2_new_S_2= New market share of Oral combination 2 for subgroup2
#'@return 
#'@export MarketShares
#'@examples

###############################################
#########Sub-group 1 market shares#############
###############################################
MarketShares_Subgroup1 <- function(Y,
                                   IV_Mono_C1_current_S_1,
                                   IV_Mono_C2_current_S_1,
                                   IV_Mono_C3_current_S_1,
                                   IV_Mono_C4_current_S_1,
                                   IV_Mono_C5_current_S_1,
                                   IV_Combi_C1_current_S_1,
                                   IV_Combi_C2_current_S_1,
                                   Oral_Mono_C1_current_S_1,
                                   Oral_Mono_C2_current_S_1,
                                   Oral_Mono_C3_current_S_1,
                                   Oral_Combi_C1_current_S_1,
                                   Oral_Combi_C2_current_S_1,
                                   X_new_S_1,
                                   IV_Mono_C1_new_S_1,
                                   IV_Mono_C2_new_S_1,
                                   IV_Mono_C3_new_S_1,
                                   IV_Mono_C4_new_S_1,
                                   IV_Mono_C5_new_S_1,
                                   IV_Combi_C1_new_S_1,
                                   IV_Combi_C2_new_S_1,
                                   Oral_Mono_C1_new_S_1,
                                   Oral_Mono_C2_new_S_1,
                                   Oral_Mono_C3_new_S_1,
                                   Oral_Combi_C1_new_S_1,
                                   Oral_Combi_C2_new_S_1){

  byRow <- TRUE
  
  #current scenario-Subgroup 1-individual treatment market shares
  Current_ms_X_S_1 <- matrix(data=0/100, ncol=Y, byrow=byRow)
  Current_ms_IV_Mono_C1_S_1 <- matrix(data=IV_Mono_C1_current_S_1/100, ncol=Y, byrow=byRow)
  Current_ms_IV_Mono_C2_S_1 <- matrix(data=IV_Mono_C2_current_S_1/100, ncol=Y, byrow=byRow)
  Current_ms_IV_Mono_C3_S_1 <- matrix(data=IV_Mono_C3_current_S_1/100, ncol=Y, byrow=byRow)
  Current_ms_IV_Mono_C4_S_1 <- matrix(data=IV_Mono_C4_current_S_1/100, ncol=Y, byrow=byRow)
  Current_ms_IV_Mono_C5_S_1 <- matrix(data=IV_Mono_C5_current_S_1/100, ncol=Y, byrow=byRow)
  Current_ms_IV_Combi_C1_S_1 <- matrix(data=IV_Combi_C1_current_S_1/100, ncol=Y, byrow=byRow)
  Current_ms_IV_Combi_C2_S_1 <- matrix(data=IV_Combi_C2_current_S_1/100, ncol=Y, byrow=byRow)
  Current_ms_Oral_Mono_C1_S_1 <- matrix(data=Oral_Mono_C1_current_S_1/100, ncol=Y, byrow=byRow)
  Current_ms_Oral_Mono_C2_S_1 <- matrix(data=Oral_Mono_C2_current_S_1/100, ncol=Y, byrow=byRow)
  Current_ms_Oral_Mono_C3_S_1 <- matrix(data=Oral_Mono_C3_current_S_1/100, ncol=Y, byrow=byRow)
  Current_ms_Oral_Combi_C1_S_1 <- matrix(data=Oral_Combi_C1_current_S_1/100, ncol=Y, byrow=byRow)
  Current_ms_Oral_Combi_C2_S_1 <- matrix(data=Oral_Combi_C2_current_S_1/100, ncol=Y, byrow=byRow)
  
  #Joins all the indivdual treatment market share vectors into one matrix
  Current_ms_S_1 <<- matrix(c(Current_ms_X_S_1,  
                              Current_ms_IV_Mono_C1_S_1,
                              Current_ms_IV_Mono_C2_S_1,
                              Current_ms_IV_Mono_C3_S_1,
                              Current_ms_IV_Mono_C4_S_1,
                              Current_ms_IV_Mono_C5_S_1,
                              Current_ms_IV_Combi_C1_S_1,
                              Current_ms_IV_Combi_C2_S_1,
                              Current_ms_Oral_Mono_C1_S_1,
                              Current_ms_Oral_Mono_C2_S_1,
                              Current_ms_Oral_Mono_C3_S_1,
                              Current_ms_Oral_Combi_C1_S_1,
                              Current_ms_Oral_Combi_C2_S_1)
                            ,ncol=Y,byrow=byRow)
  #Checks all columns of the matrix add up to 100%
  check_Current_ms_S_1<-colSums(Current_ms_S_1)
  stopifnot(sum(check_Current_ms_S_1) == Y)   
  
  #new scenario-Subgroup 1-individual treatment market shares
  New_ms_X_S_1 <-matrix(data=X_new_S_1/100, ncol=Y, byrow=byRow)
  New_ms_IV_Mono_C1_S_1 <- matrix(data=IV_Mono_C1_new_S_1/100, ncol=Y, byrow=byRow)
  New_ms_IV_Mono_C2_S_1 <- matrix(data=IV_Mono_C2_new_S_1/100, ncol=Y, byrow=byRow)
  New_ms_IV_Mono_C3_S_1 <- matrix(data=IV_Mono_C3_new_S_1/100, ncol=Y, byrow=byRow)
  New_ms_IV_Mono_C4_S_1 <- matrix(data=IV_Mono_C4_new_S_1/100, ncol=Y, byrow=byRow)
  New_ms_IV_Mono_C5_S_1 <- matrix(data=IV_Mono_C5_new_S_1/100, ncol=Y, byrow=byRow)
  New_ms_IV_Combi_C1_S_1 <- matrix(data=IV_Combi_C1_new_S_1/100, ncol=Y, byrow=byRow)
  New_ms_IV_Combi_C2_S_1 <- matrix(data=IV_Combi_C2_new_S_1/100, ncol=Y, byrow=byRow)
  New_ms_Oral_Mono_C1_S_1 <- matrix(data=Oral_Mono_C1_new_S_1/100, ncol=Y, byrow=byRow)
  New_ms_Oral_Mono_C2_S_1 <- matrix(data=Oral_Mono_C2_new_S_1/100, ncol=Y, byrow=byRow)
  New_ms_Oral_Mono_C3_S_1 <- matrix(data=Oral_Mono_C3_new_S_1/100, ncol=Y, byrow=byRow)
  New_ms_Oral_Combi_C1_S_1 <- matrix(data=Oral_Combi_C1_new_S_1/100, ncol=Y, byrow=byRow)
  New_ms_Oral_Combi_C2_S_1 <- matrix(data=Oral_Combi_C2_new_S_1/100, ncol=Y, byrow=byRow)

  #Joins all the indivdual treatment market share vectors into one matrix
  New_ms_S_1 <<- matrix(c(New_ms_X_S_1,  
                          New_ms_IV_Mono_C1_S_1,
                            New_ms_IV_Mono_C2_S_1,
                            New_ms_IV_Mono_C3_S_1,
                            New_ms_IV_Mono_C4_S_1,
                            New_ms_IV_Mono_C5_S_1,
                            New_ms_IV_Combi_C1_S_1,
                            New_ms_IV_Combi_C2_S_1,
                            New_ms_Oral_Mono_C1_S_1,
                            New_ms_Oral_Mono_C2_S_1,
                            New_ms_Oral_Mono_C3_S_1,
                            New_ms_Oral_Combi_C1_S_1,
                            New_ms_Oral_Combi_C2_S_1)
                            ,ncol=Y,byrow=byRow)
  #Checks all columns of the matrix add up to 100%
  check_New_ms_S_1<-colSums(New_ms_S_1)
  stopifnot(sum(check_New_ms_S_1) == Y)                        
}

###############################################
#########Sub-group 2 market shares#############
###############################################
MarketShares_Subgroup2 <- function(Y,
                                   IV_Mono_C1_current_S_2,
                                   IV_Mono_C2_current_S_2,
                                   IV_Mono_C3_current_S_2,
                                   IV_Mono_C4_current_S_2,
                                   IV_Mono_C5_current_S_2,
                                   IV_Combi_C1_current_S_2,
                                   IV_Combi_C2_current_S_2,
                                   Oral_Mono_C1_current_S_2,
                                   Oral_Mono_C2_current_S_2,
                                   Oral_Mono_C3_current_S_2,
                                   Oral_Combi_C1_current_S_2,
                                   Oral_Combi_C2_current_S_2,
                                   X_new_S_2,
                                   IV_Mono_C1_new_S_2,
                                   IV_Mono_C2_new_S_2,
                                   IV_Mono_C3_new_S_2,
                                   IV_Mono_C4_new_S_2,
                                   IV_Mono_C5_new_S_2,
                                   IV_Combi_C1_new_S_2,
                                   IV_Combi_C2_new_S_2,
                                   Oral_Mono_C1_new_S_2,
                                   Oral_Mono_C2_new_S_2,
                                   Oral_Mono_C3_new_S_2,
                                   Oral_Combi_C1_new_S_2,
                                   Oral_Combi_C2_new_S_2){
  
  byRow <- TRUE
  
  #current scenario-Subgroup 2-individual treatment market shares
  Current_ms_X_S_2 <- matrix(data=0/100, ncol=Y, byrow=byRow)
  Current_ms_IV_Mono_C1_S_2 <- matrix(data=IV_Mono_C1_current_S_2/100, ncol=Y, byrow=byRow)
  Current_ms_IV_Mono_C2_S_2 <- matrix(data=IV_Mono_C2_current_S_2/100, ncol=Y, byrow=byRow)
  Current_ms_IV_Mono_C3_S_2 <- matrix(data=IV_Mono_C3_current_S_2/100, ncol=Y, byrow=byRow)
  Current_ms_IV_Mono_C4_S_2 <- matrix(data=IV_Mono_C4_current_S_2/100, ncol=Y, byrow=byRow)
  Current_ms_IV_Mono_C5_S_2 <- matrix(data=IV_Mono_C5_current_S_2/100, ncol=Y, byrow=byRow)
  Current_ms_IV_Combi_C1_S_2 <- matrix(data=IV_Combi_C1_current_S_2/100, ncol=Y, byrow=byRow)
  Current_ms_IV_Combi_C2_S_2 <- matrix(data=IV_Combi_C2_current_S_2/100, ncol=Y, byrow=byRow)
  Current_ms_Oral_Mono_C1_S_2 <- matrix(data=Oral_Mono_C1_current_S_2/100, ncol=Y, byrow=byRow)
  Current_ms_Oral_Mono_C2_S_2 <- matrix(data=Oral_Mono_C2_current_S_2/100, ncol=Y, byrow=byRow)
  Current_ms_Oral_Mono_C3_S_2 <- matrix(data=Oral_Mono_C3_current_S_2/100, ncol=Y, byrow=byRow)
  Current_ms_Oral_Combi_C1_S_2 <- matrix(data=Oral_Combi_C1_current_S_2/100, ncol=Y, byrow=byRow)
  Current_ms_Oral_Combi_C2_S_2 <- matrix(data=Oral_Combi_C2_current_S_2/100, ncol=Y, byrow=byRow)
  
  #Joins all the indivdual treatment market share vectors into one matrix
  Current_ms_S_2 <<- matrix(c(Current_ms_X_S_2,  
                              Current_ms_IV_Mono_C1_S_2,
                              Current_ms_IV_Mono_C2_S_2,
                              Current_ms_IV_Mono_C3_S_2,
                              Current_ms_IV_Mono_C4_S_2,
                              Current_ms_IV_Mono_C5_S_2,
                              Current_ms_IV_Combi_C1_S_2,
                              Current_ms_IV_Combi_C2_S_2,
                              Current_ms_Oral_Mono_C1_S_2,
                              Current_ms_Oral_Mono_C2_S_2,
                              Current_ms_Oral_Mono_C3_S_2,
                              Current_ms_Oral_Combi_C1_S_2,
                              Current_ms_Oral_Combi_C2_S_2)
                            ,ncol=Y,byrow=byRow)
  
  #Checks all columns of the matrix add up to 100%
  check_Current_ms_S_2<-colSums(Current_ms_S_2)
  stopifnot(sum(check_Current_ms_S_2) == Y)   
  
  #new scenario-Subgroup 2-individual treatment market shares
  New_ms_X_S_2 <-matrix(data=X_new_S_2/100, ncol=Y, byrow=byRow)
  New_ms_IV_Mono_C1_S_2 <- matrix(data=IV_Mono_C1_new_S_2/100, ncol=Y, byrow=byRow)
  New_ms_IV_Mono_C2_S_2 <- matrix(data=IV_Mono_C2_new_S_2/100, ncol=Y, byrow=byRow)
  New_ms_IV_Mono_C3_S_2 <- matrix(data=IV_Mono_C3_new_S_2/100, ncol=Y, byrow=byRow)
  New_ms_IV_Mono_C4_S_2 <- matrix(data=IV_Mono_C4_new_S_2/100, ncol=Y, byrow=byRow)
  New_ms_IV_Mono_C5_S_2 <- matrix(data=IV_Mono_C5_new_S_2/100, ncol=Y, byrow=byRow)
  New_ms_IV_Combi_C1_S_2 <- matrix(data=IV_Combi_C1_new_S_2/100, ncol=Y, byrow=byRow)
  New_ms_IV_Combi_C2_S_2 <- matrix(data=IV_Combi_C2_new_S_2/100, ncol=Y, byrow=byRow)
  New_ms_Oral_Mono_C1_S_2 <- matrix(data=Oral_Mono_C1_new_S_2/100, ncol=Y, byrow=byRow)
  New_ms_Oral_Mono_C2_S_2 <- matrix(data=Oral_Mono_C2_new_S_2/100, ncol=Y, byrow=byRow)
  New_ms_Oral_Mono_C3_S_2 <- matrix(data=Oral_Mono_C3_new_S_2/100, ncol=Y, byrow=byRow)
  New_ms_Oral_Combi_C1_S_2 <- matrix(data=Oral_Combi_C1_new_S_2/100, ncol=Y, byrow=byRow)
  New_ms_Oral_Combi_C2_S_2 <- matrix(data=Oral_Combi_C2_new_S_2/100, ncol=Y, byrow=byRow)
  
  #Joins all the indivdual treatment market share vectors into one matrix
  New_ms_S_2 <<- matrix(c(New_ms_X_S_2,  
                          New_ms_IV_Mono_C1_S_2,
                          New_ms_IV_Mono_C2_S_2,
                          New_ms_IV_Mono_C3_S_2,
                          New_ms_IV_Mono_C4_S_2,
                          New_ms_IV_Mono_C5_S_2,
                          New_ms_IV_Combi_C1_S_2,
                          New_ms_IV_Combi_C2_S_2,
                          New_ms_Oral_Mono_C1_S_2,
                          New_ms_Oral_Mono_C2_S_2,
                          New_ms_Oral_Mono_C3_S_2,
                          New_ms_Oral_Combi_C1_S_2,
                          New_ms_Oral_Combi_C2_S_2)
                        ,ncol=Y,byrow=byRow)
  
  #Checks all columns of the matrix add up to 100%
  check_New_ms_S_2<-colSums(New_ms_S_2)
  stopifnot(sum(check_New_ms_S_2) == Y)                        
}