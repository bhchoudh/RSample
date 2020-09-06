library(stats)
library(cluster)

## K-means Clustering
## Example 1 - creating new DF with specific columns
df <- read.csv("c:/BhaskarCode/admission.csv")
df1 <- data.frame(df$gre,df$gpa)
km <- kmeans(df1, 5)
plot(df.gpa~df.gre,clusterdf, col=km$cluster)

## Example 2 - removing redundant column from existing DF
df <- read.csv("c:/BhaskarCode/winequalitydecision.csv")
df <- read.csv("c:/BhaskarCode/Universities_Clustering.csv")
df$Univ <- NULL
df$quality <- NULL   
head(df)
df <- scale(df)           
km <- kmeans(df, 5)
km
km$cluster
plot(density~alcohol,df, col=km$cluster)
plot(GradRate~Accept,df, col=km$cluster)
plot(df,col=km$cluster)
clusplot(df, km$cluster, frame=TRUE , color = TRUE, shade = TRUE)


## Agglomerate Hierarchial Clustering
df <- read.csv("c:/BhaskarCode/iris.csv")
df$Species <- NULL      
df$Id <- NULL
df <- scale(df) 
distance <- dist(df, method = 'euclidian')
clust <- hclust(distance,method = "complete")
plot(clust)
clustgroup <-cutree (clust,5)
plot(clustgroup)

