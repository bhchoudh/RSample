## Handling Vector, list, Array & dataframe 
vct1 <- c(10, 14, 15, 17, 18, 20)
vct2 <- c("A","B","C", "D", "E", "F")
lst1 = list(vct1, vct2)
vct3 = merge(vct1, vct2)
aray1 = array(c(vct1, vct2), dim = c(6,2))
mtr = matrix(c(vct1,vct2),6,2)
df = data.frame(vct1, vct2)

pie (vct1, vct2)

## While & for loop & If/Else
i = 1
while (i < 6) {
  print (vct[i])
  i=i+1
}
  
i <- 1
for (i in  1:6) {
  print(vct2[i])
  i = i+1
}

n = 3 
if (n < 5) {
  print ("IF")
}else {
  print ("ELSE")
}
  

df= read.csv("Employee.csv",TRUE,",")
df1<-read.csv(file.choose(),T)
df
df[,"salary"]
df["salary"]
df[2,3]
df[2,]
df[,5]




