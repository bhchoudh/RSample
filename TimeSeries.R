install.packages("forecast")
library(forecast)

df <- read.csv("c:/BhaskarCode/GDPTS.csv")
##df<-read.csv(file.choose(),T)
## Make the data as Time Series with time frequency & start
tsdata <-ts(df$GDP, frequency = 12, start = c(1984,1))
plot (tsdata)

## Make the model & use the model to forecast for a period h
arimafit <- auto.arima(tsdata)
arimafit
fcast <- forecast(arimafit, h=7)
plot(fcast)

##plot residuals to check autocorelation
plot(fcast$residuals)
accuracy(arimafit)
acf(fcast$residuals)
pacf(fcast$residuals)
qqnorm(fcast$residuals)
