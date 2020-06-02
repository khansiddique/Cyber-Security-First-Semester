#To setting up the directory

setwd("C:\\Users\\HP\\Documents\\R Lecture\\")
#read the data with the table command.

dataFile=read.csv('moth-trap-experiment.csv',sep=',', header = TRUE)
## Load the package
library(ggplot2)
library(splines)

locationTop<- dataFile[dataFile$location=="Top",]

# Idea to learn filtering
mean(locationTop)

mean(locationTop$number.of.moths)

summary(dataFile)

summary(locationTop)

for (loc1 in unique(dataFile$location)){
  for (loc2 in unique(dataFile$location)){
    if(loc1!=loc2){
      v<-var.test(dataFile[dataFile$location==loc1,]$number.of.moths,dataFile[dataFile$location==loc2,]$number.of.moths)
      print(c(loc1,loc2, v$p.value))
    }
  }
}


for (lure1 in unique(dataFile$type.of.lure)){
  for (lure2 in unique(dataFile$type.of.lure)){
    if(lure1!=lure2){
      v<-var.test(dataFile[dataFile$type.of.lure==lure1,]$number.of.moths,
                  dataFile[dataFile$type.of.lure==lure2,]$number.of.moths)
      print(c(lure1,lure2, v$p.value))
    }
  }
}

wilcox.test(dataFile[dataFile$type.of.lure=="Chemical",]$number.of.moths,
            dataFile[dataFile$type.of.lure=="Sugar",]$number.of.moths,
            alternative = "greater")
wilcox.test(dataFile[dataFile$type.of.lure=="Chemical",]$number.of.moths,
            dataFile[dataFile$type.of.lure=="Scent",]$number.of.moths,
            alternative = "greater")
wilcox.test(dataFile[dataFile$type.of.lure=="Sugar",]$number.of.moths,
            dataFile[dataFile$type.of.lure=="Scent",]$number.of.moths,
            alternative = "greater")

qqplot(dataFile$location, dataFile$number.of.moths, data=dataFile)

qqplot(dataFile$type.of.lure, dataFile$number.of.moths, data=dataFile)
qqplot(dataFile$type.of.lure, dataFile$number.of.moths, data=dataFile)

m1<-aov(number.of.moths~location, data=dataFile)
summary.aov(m1)

m2<-aov(number.of.moths~location*type.of.lure, data=dataFile)
summary.aov(m2)

m3<-aov(number.of.moths~type.of.lure, data=dataFile)
summary.aov(m3)
AIC(m1)
AIC(m2)
AIC(m3)

BIC(m1)
BIC(m2)
BIC(m3)