library(arules)
library(arulesViz)

## Load file as transaction not dataframe
ts <- read.transactions("c:/BhaskarCode/groceries.csv")
rules <- apriori(ts,parameter = list(conf =.5, supp=.01))
rules<-sort(rules,by = "lift")
inspect(rules)
summary(rules)
plot(rules)


## rules involving a specific items in basket
rules <- apriori(ts,parameter = list(conf =.5, supp=.001), 
                 appearance = list(lhs="citrus"))
rules<-sort(rules,by = "lift")
inspect(rules)
