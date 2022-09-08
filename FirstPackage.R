rm(list=ls())
#Load tools necessary for installing package
install.packages("cli")
install.packages("pkgbuild")
install.packages("devtools")
library("devtools")
library("pkgbuild")
library("roxygen2")
library ("data.table")


#Creates the "FirstPackage" project
create_package("BIM2")

###
#At this step the R scripts with the functions of interest (e.g. "BI_total" and "CEM_total") are saved into the "R" folder within the newly created "FirstPackage" folder above.
###

#Set the working directory to the new R package folder.
setwd("C:/Users/neil.davies/Desktop/")
#Uses the "roxygen2" package to convert the comments at the top of your function, saved in the R project folder, to documents so the function documents can be seen and used by R. I.e. you can do '?BI_total' to read the associated documents.
document()

#Installs the functions that are found in the package "FirstPackage". NOTE: This should only need running once, unless updates have been made to the individual functions, in which case the package will need to be re-installed.
install("BIM2",lib="C:/Users/neil.davies/Desktop/BIM2")
#Loads the package for use in folowing calculations.
library("BIM2")



#################
###BIM RESULTS###
#################
#Uses the function from the package "FirstPackage"
#Base case result
CM <-data.table(
  "Year 1"= c(0.01,0.99),
  "Year 2"=c(0.01,0.99),
  "Year 3"=c(0.01,0.99))

NM <- data.table(c(0.01,0.90,0.09),
                 c(0.01,0.90,0.09),
                 c(0.01,0.90,0.09))

BI_total(100000,
         10,
         25,
         30,
         0.25,
         c(0.01,0.01,0.01,
           0.99,0.99,0.99),
          c(0.10,0.20,0.30,
           0.00,0.00,0.00,
           0.90,0.80,0.70))

#Loads a database of inputs into a data.frame from an excel .csv file
#test_BIM <- read.csv("I:/SHARED/Props/UK/Merck/MO8301A - Structured Programing Approach to Multi-Indication Modelling in Oncology/Bkgrd/Input Database BIM.csv",header=T)

#Uses the database "test_BIM" as inputs into the BI_total function
ptm <- proc.time()
results_BIM <- mapply(BI_total,P=test_BIM[,2],X=test_BIM[,3],Y=test_BIM[,4],Z=test_BIM[,5],V=test_BIM[,6])
proc.time() - ptm

#converts results to data.frame and combines with input database ("test_BIM")
results_BIM <- t(data.frame(results_BIM))
results_BIM <- data.frame(test_BIM, results_BIM)


#names for final data.frame columns
names_BIM <- c(colnames(test_BIM),"Total_BI","DSA_P_HI","DSA_P_LOW")

#Adds row and column names to look neater
colnames(results_BIM) <- names_BIM


#################
###CEM RESULTS###
#################
#Base case result
CEM_total(20,0.035,0.035,0.60,0.40,0.0,c("Good", "Bad", "Dead"),0.90, 0.05, 0.05, 0.60, 0.30, 0.10, 0.00, 0.00, 1.00,0.87, 0.09, 0.04, 0.51, 0.40, 0.09, 0.00, 0.00, 1.00, 0.9, 0.3, 20, 50, 30, 400)

#Loads a database of inputs into a data.frame from an excel .csv file
#test_CEM <- read.csv("I:/SHARED/Props/UK/Merck/MO8301A - Structured Programing Approach to Multi-Indication Modelling in Oncology/Bkgrd/Input Database CEM.csv",header=T)

#Uses the database "test_CEM" as inputs into the CEM_total function
ptm <- proc.time()
results_CEM <- mapply(CEM_total,no_cycles=test_CEM[,2],dr_QALY=test_CEM[,3],dr_cost=test_CEM[,4],
                      tp_initial_g=c(test_CEM[,5]),tp_initial_b=c(test_CEM[,6]),tp_initial_d=c(test_CEM[,7]),
                      X_TP1=c(test_CEM[,8]),X_TP2=c(test_CEM[,9]),X_TP3=c(test_CEM[,10]),
                      X_TP4=c(test_CEM[,11]),X_TP5=c(test_CEM[,12]),X_TP6=c(test_CEM[,13]),
                      X_TP7=c(test_CEM[,14]),X_TP8=c(test_CEM[,15]),X_TP9=c(test_CEM[,16]),
                      Y_TP1=c(test_CEM[,17]),Y_TP2=c(test_CEM[,18]),Y_TP3=c(test_CEM[,19]),
                      Y_TP4=c(test_CEM[,20]),Y_TP5=c(test_CEM[,21]),Y_TP6=c(test_CEM[,22]),
                      Y_TP7=c(test_CEM[,23]),Y_TP8=c(test_CEM[,24]),Y_TP9=c(test_CEM[,25]),
                      uv_good=test_CEM[,26],uv_bad=test_CEM[,27],X=test_CEM[,28],c_Tx_Drug_Y=test_CEM[,29],ru_good=test_CEM[,30],ru_bad=test_CEM[,31])
proc.time() - ptm

#converts results to data.frame and combines with input database ("test_CEM")
results_CEM <- data.frame(test_CEM,results_CEM)

#names for final data.frame columns
names_CEM <- c(colnames(test_CEM),"ICER")

#Adds column names to look neater
colnames(results_CEM) <- names_CEM

