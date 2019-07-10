#This came from Chris Mack on youtube--I added as many comments as possible for you to follow along
#Generalized Linear Model
#import data in a csv format

#sample data
y = c(4.26, 5.68, 7.24, 4.82, 6.95, 8.81, 8.04, 8.33, 10.84, 7.58, 9.96)

#x values spaced from 4-14
x = 4:14
x = seq(4,14,1)

#plot data
plot(y ~ x)

#linear regression model
model = lm(y ~ x)
summary (model)

#generalized linear model
model.glm = glm(y ~ x, family = gaussian(link = "identity"))
summary(model.glm)

#family             default link
#binomial           (link = "logit")
#gaussian           (link = "identity")
#gamma              (link = "inverse")
#inverse.gaussian   (link = "1/mu^2")
#poisson            (link = "log")
#quasi              (link = "identity", variance = "constant")
#quasibinomial      (link = "logit")
#quasipoisson       (link = "log")

#Example of logistic regression
#who survived the sinking of the Titanic
#https://www.r-bloggers.com/how-to-perform-a-logistic-regression-in-r/

install.packages("titanic")
library(titanic)

data.raw = titanic_train

#data has blanks....convert them to "NA"
data.raw[data.raw==""] <- NA

#check for missing values using the sapply() function
sapply(data.raw, function(x) sum(is.na(x)))
length(data.raw$Pclass) #Number of data points
levels(factor(data.raw$Sex)) #asks how and type of variables in a column

#drop columns we aren't going to use
data <- subset(data.raw, select = c(2,3,5,6,7,8,10,12))

#perform logistic regression
#we are just determining if someone survived or not, hence the use of binomial(0 or 1)
#If you use GLM and has a column with only 2 possible outcomes R will put the appropriate id(0 or 1) next to it.

model <- glm(Survived ~ Sex, family = binomial(link = 'logit'), data = data)
summary(model)
confint(model) #confidence intervals for the coefficients

#ratio for male and females
exp(model$coefficients) 

lines(x, m)

