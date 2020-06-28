
df<-read.csv(file.choose(),T)
str(df)
df$rank <- as.factor(df$rank)
df$admit <- as.factor(df$admit)

logit <- glm(admit ~ gre+gpa+rank,data=df,family="binomial")
summary(logit)
testdata <- data.frame(gre=790,gpa=3.8,rank=as.factor(1))
predictdata <- predict(logit,testdata)
predictdata

## optional to split data in train & test
install.packages('caTools')
library(caTools)
set.seed(88)
split <- sample.split(df, SplitRatio = 0.9999)
traindata <- subset(df, split == TRUE)
testdata <- subset(df, split == FALSE)
logit <- glm(admit ~ gre+gpa+rank,data=traindata,family="binomial")
summary(logit)
predictdata <- predict(logit,testdata)
predictdata
##optional split ends


## Code for discriminant analysis
library("MASS")
ldamodel <- lda(admit ~ gre+gpa+rank,data=df)
summary(ldamodel)
testdata <- data.frame(gre=790,gpa=3.8,rank=as.factor(1))
predictdata <- predict(ldamodel,testdata)
predictdata

## With train & test split
install.packages('caTools')
library(caTools)
set.seed(88)
split <- sample.split(df, SplitRatio = 0.9999)
traindata <- subset(df, split == TRUE)
testdata <- subset(df, split == FALSE)
ldamodel <- lda(admit ~ gre+gpa+rank,data=df)
summary(ldamodel)
predictdata <- predict(ldamodel,testdata)
predictdata
