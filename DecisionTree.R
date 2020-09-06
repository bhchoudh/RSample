## Decision tree , CART, Random Forest
##Read CSV file & Split data into train & test
##install.packages('caTools')
library(caTools)
df <- read.csv("c:/BhaskarCode/winequalitydecision.csv")
set.seed(88)
split <- sample.split(df, SplitRatio = 0.99)
traindata <- subset(df, split == TRUE)
testdata <- subset(df, split == FALSE)
str(traindata)
str(testdata)


## Decision tree using RPART package
##install.packages("rpart")
##install.packages("rpart.plot")
library(party)
library(rpart.plot)
treefit<- rpart(quality ~ chlorides+pH+sulphates+alcohol,data = traindata, method = "class", minbucket = 10)
prp(treefit)
rpart.plot(treefit,extra=3)
predTree<-predict(treefit,testdata,type="class")
predTree
str(predTree)
summary(predTree)
table(testdata$quality,predTree)
plot(predTree)

## Decision tree using party package (not preferred)
##install.packages("party")
##library(party)
##mytree<- ctree(quality ~ chlorides+pH+sulphates+alcohol,data = traindata)
##plot(mytree)
##pred <- predict(mytree,testdata,type="class")
##pred
##table(testdata$quality,pred) ## compare observed vs predicted


## Decision tree using random foest 
install.packages("randomForest")
library(randomForest)
traindata$quality <- as.factor(traindata$quality)
testdata$quality <- as.factor(testdata$quality)
myForest <- randomForest(quality ~ chlorides+pH+sulphates+alcohol,data = traindata,ndesize =20, ntree =20)
predForest<-predict(myForest,testdata)
predForest
str(predForest)
summary(predForest)
table(testdata$quality,predForest)



