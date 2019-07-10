#load Library
library(randomForest)
library(MASS)

#set seed so we get the same result
set.seed(123)

#storing the data set and help shows the 
dataframe <- birthwt
help("birthwt")

#check the structure of the data
str(dataframe)

#check dimension of the data
dim(dataframe)

#check first 3 rows
head(dataframe,3)

#check the summary
summary(dataframe)

#check the unique values
#not all data are numbers, some could be categorical data
apply(dataframe,2,function(x) length(unique(x)))

#convert the categorical variables into factor data
cols <- c("low", "race", "smoke", "ptl", "ht", "ui", "ftv")
for (i in cols){
  dataframe[,i] = as.factor(dataframe[,i])
  }
str(dataframe)

#create train and test data
library(caTools)

#target variable is low
ind <- sample.split(Y = dataframe$low,SplitRatio = 0.7) # 0.7 is the % of training data
trainDF <- dataframe [ind,]
testDF <- dataframe [!ind,]

#high strength of tree = low error rate in individual tree classifier

#random forest parameters
#mtry = number of variables selected at each split
  #default
      #regression = floor(number of variables = 3)
      #categorical = floor(square root of the number of independent variables)

#lower mtry means: less correlation between trees is good
  #mtry and sample needs to be less then the max number of independent variables and rows

#try to optimize between the good and bad 

#ntree = number of trees that grow
#nodesize = minimum size of terminal nodes

#larger numbers means smaller trees

#fitting the model
modelRandom <- randomForest(low ~., data = trainDF, mtry = 3, ntree = 20)
modelRandom

#Forest error rate 
    #OOB = out of bag error = Misclassification rate = smaller error the better
    #each tree is tested on 1/3 of the number of observations
    #not used in building the tree

#1. High strength of tree will have a lower error [depends on mtry]
#2. High correlation between trees increases the error [depends on mtry]

#Plotting the importance of each variable
#mean decrease accuracy = how much of the model accuracy decreases if we drop that variable
#high value of mean decrease accuracy or mean decrease gini score

importance(modelRandom)
varImpPlot(modelRandom)

#this tells us that bwt is the most important variable in this model

#predictions
predictwithclass <- predict(modelRandom, testDF, type = 'class')
predictwithclass
t <- table(predictions = predictwithclass, actual = testDF$low) #diagonal numbers will be high if it is accurate
t

#accuracy metric
sum (diag(t))/sum(t)

#plotting ROC curve and calculating AUC metric
#install pROC package
install.packages("pROC")
library(pROC)

predictwithprobs <- predict(modelRandom, testDF, type = 'prob')
predictwithprobs

auc <- auc(testDF$low, predictwithprobs[,2])
auc

plot(roc(testDF$low,predictwithprobs[,2]))
plot



#find best mtry
bestmtry <- tuneRF(trainDF, trainDF$low, ntree = 200, stepFactor = 1.2, improve = 0.01, trace = T, plot = T )
bestmtry


#short coming = if certain categorical variables have many levels then random forest is biased towards using this variable more in trees










