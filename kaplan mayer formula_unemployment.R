library(survival)

read.table(
  '/Users/bqdesy/Desktop/unemployment1.csv',
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
fit<-survfit(my.survival.object ~ 1) #krzywa przezycia
plot(fit, xlab = "Weeks", ylab="Survival")
summary(fit)
summary(fit)$surv     # returns the Kaplan-Meier estimate at each t_i
summary(fit)$time     # {t_i}
summary(fit)$n.risk   # {Y_i}
summary(fit)$n.event  # {d_i}
summary(fit)$std.err  # standard error of the K-M estimate at {t_i}
summary(fit)$lower    # lower pointwise estimates (alternatively, $upper)
str(fit)              # full summary of the fit object
str(summary(fit))     # full summary of the fit object
plot(fit, main="Kaplan-Meier estimate with 95% confidence bounds",
     xlab="time", ylab="survival function")

#graph
plot(survfit(my.survival.object ~ 1), xlim=c(0, 6), xlab="weeks",
     ylab="Estimated Survival Function",
     main="Reproducing Confidence Bands for S(x)")


