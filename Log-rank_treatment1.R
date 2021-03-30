library(survival)

read.table(
  '/Users/bqdesy/Desktop/treatment1.csv',
  sep=';',
  dec=',',
  header=TRUE
) -> data
data
attach(data)

#survival object Surv(time,event) lub Surv(time1,time2,event,type)
my.survival.object<-Surv(duration,failure)
my.survival.object

#kaplan-meier estimator
fit<-survfit(my.survival.object ~ 1)
plot(fit, main="Kaplan-Meier estimate with 95% confidence bounds", xlab = "Weeks", ylab="Survival")
summary(fit)

my.fit1<-survfit(my.survival.object ~ treatment)
plot(my.fit1, xlab = "Weeks", ylab="Survival", main="Kaplan-Meier estimator by treatment")
summary(my.fit1)
legend(12,.95, legend=c("treatment"))
legend(.3,.55, legend=c("placebo"))

#Log-Rank test
survdiff(Surv(duration, failure) ~ treatment, rho=0) #log-rank or Mantel-Haenszel test
survdiff(Surv(duration, failure) ~ treatment, rho=1) #Peto&Peto modification of the Gehan-Wilcoxon test

