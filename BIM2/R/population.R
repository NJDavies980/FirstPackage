#' This calculation of the population data which will be used to inform the BIM.
#'
#'@param Y = Time-horizon of model, years
#'@param P = population_size
#'@param G = population growth
#'@param C = incident of cancer X (per 100,000 people)
#'@param c_1= % of cancer X patients with condition 1
#'@param C1_2 = % of condition 1 patients with condition 2
#'@param C2_3 = % of condition 2 patients with condition 3
#'@param E = % condition meeting patients eligable for treatment with pembrolizumab
#'@param S_1 = % of patients that are in subgroup 1
#'@param S_2 = % of patients that are in subgroup 2
#'@param Treat_rate = % of patients actively treated
#'@return
#'@export Eligible_total
#'@examples


Eligibility_total <- function(Y,P,G,C,C_1,C1_2,C2_3,E,S_1,S_2,Treat_rate){
  # All variables will be presented below pre-assigment to eligability total table.
  Year <<- c(1:Y)
  Plan_population <<- P*((1+(G/100))^(Year-1))
  Incidence_of_cancer_X <<- Plan_population*(C/100000)
  Patients_with_condition_1 <<- Incidence_of_cancer_X*(C_1/100)
  Patients_with_condition_2 <<- Patients_with_condition_1*(C1_2/100)
  Patients_with_condition_3 <<- Patients_with_condition_2*(C2_3/100)
  condition_meeting_patients_eligable_for_treatment_with_pembrolizumab <<- Patients_with_condition_3*(E/100)
  patients_in_subgroup_1 <<- condition_meeting_patients_eligable_for_treatment_with_pembrolizumab*(S_1/100)
  patients_in_subgroup_2 <<- condition_meeting_patients_eligable_for_treatment_with_pembrolizumab*(S_2/100)

  patients_treated<<- condition_meeting_patients_eligable_for_treatment_with_pembrolizumab*(Treat_rate/100)
  patients_treated_in_subgroup_1 <<- patients_in_subgroup_1*(Treat_rate/100)
  patients_treated_in_subgroup_2 <<- patients_in_subgroup_2*(Treat_rate/100)
  }
