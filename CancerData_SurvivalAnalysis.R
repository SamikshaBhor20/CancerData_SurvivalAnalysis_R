#Basic tool to find biomarkers 

install.packages("survminer")
install.packages("survival")


setwd("E:/Samiksha/M.Sc_Bioinformatics/SEM_3/Cancer_Genomics")
input_file<-read.table("CGGA.mRNAseq_693_clinical.20200506.txt",header = T, sep = '\t',row.names = 1)
input_file

fit<-survfit(Surv(Age)~ Gender, data=input_file)
fit

#From the above command the output we get tell us that
#n=no. of patients
#events=how many pateints die
#median=survival rate in days
#



#plotiting
library(survival)
library(survminer)
ggsurvplot(fit, data=input_file)

#Gives median line
ggsurvplot(fit, data=input_file, surv.median.line='hv')

#P-value tells that is the significant or not
ggsurvplot(fit, data=input_file, surv.median.line='hv',pval=T)

#Risk level:- tells no. of patient alive after eacj time interval
ggsurvplot(fit, data=input_file, surv.median.line='hv',pval=T, risk.table=T)




