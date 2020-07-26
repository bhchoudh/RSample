##Read CSV file & Split data into train & test
##install.packages('caTools')
##library(caTools)
df <- read.csv("c:/BhaskarCode/winequalitydecision.csv")
set.seed(88)
split <- sample.split(df, SplitRatio = 0.99)
traindata <- subset(df, split == TRUE)
testdata <- subset(df, split == FALSE)

## Decision tree using party package (not preferred)
##install.packages("party")
##library(party)
mytree<- ctree(quality ~ chlorides+pH+sulphates+alcohol,data = traindata)
plot(mytree)
pred <- predict(mytree,testdata,type="class")
pred
table(testdata$quality,pred) ## compare observed vs predicted

## Decision tree using RPART package
##install.packages("rpart")
##install.packages("rpart.plot")
##library(party)
##library(rpart.plot)
mytree1<- rpart(quality ~ chlorides+pH+sulphates+alcohol,data = traindata, method = "class")
rpart.plot(mytree1,extra=2)
pred<-predict(mytree1,testdata,type="prob")
pred
table(testdata$quality,pred)
