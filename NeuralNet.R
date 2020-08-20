df <- read.csv("c:/BhaskarCode/winequalitydecision.csv")
df <- read.csv("c:/BhaskarCode/admission.csv")
df <- scale(df)
head(df)
str(df)

##split between train & test data
##library(caTools)
set.seed(88)
split <- sample.split(df, SplitRatio = 0.99)
traindata <- subset(df, split == TRUE)
testdata <- subset(df, split == FALSE)
str(testdata)
str(traindata)
## train - test split end

##start with Neural Network 
##install.packages("neuralnet")
##library(neuralnet)
nnmodel <- neuralnet(admit ~.,data = traindata, 
                     hidden = 3,linear.output = FALSE)
plot(nnmodel)
nnpred <- compute(nnmodel, testdata[,-1])   ## remove y variable from test
nnpred$net.result
str(nnpred$net.result)
head (nnpred$net.result)                    ##array of array 
head(testdata)

##compare acuracy of result
dfcomp <- data.frame(testdata$admit ,round(nnpred$net.result))
head(dfcomp)
table(testdata$admit,round(nnpred$net.result))
table(testdata$quality,ifelse(nnpred$net.result > .5, 1,0))


      