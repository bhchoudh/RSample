##df<-read.csv(file.choose(),T)
df <- read.csv("c:/BhaskarCode/winequalitydecision.csv")
df <- read.csv("c:/BhaskarCode/iris.csv")
df <- read.csv("c:/BhaskarCode/admission.csv")
str(df)
df$rank <- as.factor(df$rank)
df$admit <- as.factor(df$admit)

##split between train & test data
##install.packages('caTools')
##library(caTools)
set.seed(88)
split <- sample.split(df, SplitRatio = 0.99)
traindata <- subset(df, split == TRUE)
testdata <- subset(df, split == FALSE)
str(traindata)
str(testdata)

##testdata <- data.frame(gre=790,gpa=3.8,rank=as.factor(1))

## Logistic Regression for 2 class classification
logit <- glm(admit ~ .,data=df,family="binomial")
summary(logit)
predictdata <- predict(logit,testdata)
predictdata
summary (predictdata)
head(predictdata)
dfcomp <- data.frame(testdata$admit,predictdata)
head(dfcomp)
dfcomp
table(testdata$admit,ifelse(predictdata > .4, 1,0))

## Discriminant analysis - multi class classification
##library("MASS")
ldamodel <- lda(admit ~ .,data=df)
ldamodel
summary(ldamodel)
predictdata <- predict(ldamodel,testdata)
predictdata
dfcomp <- data.frame(testdata$admit ,predictdata$class)
head(dfcomp)
dfcomp
table(testdata$admit,predictdata$class)

## Simple regression 
dftrain <- read.csv("c:/BhaskarCode/RegBMITrain.csv",header = T)
dftrain$id <-NULL
cor(dftrain)
regmodel <- lm(dftrain$BMI ~., data = dftrain)
summary(regmodel)
dftest <- read.csv("c:/BhaskarCode/RegBMITest.csv",header = T)
dftest$id = NULL
regpredict <- predict(regmodel,dftest )
regpredict
