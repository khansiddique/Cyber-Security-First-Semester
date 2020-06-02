#To setting up the directory

setwd("C:\\Users\\HP\\Documents\\R Lecture\\")

#read the data with the CSV command.
read.csv('bp.txt')

#read the data with the table command.
DF1=read.table('bp.txt',sep = ',', header = TRUE)
#Check the structure of the data table loaded
str(DF1)
#Summarize the data table content
summary(DF1)

#average all columns
colMeans(DF1)

#Include a new record to the data frame
DF1<-rbind( DF1,list(168,76,85,84,122.2,75.0))
DF1

#Ratio of Waist and Hip

Ratio<-DF1[,3]/DF1[,4]
Ratio

Ratio1=DF1$WAIST/DF1$HIP
Ratio1

#Filter records with BPSYS greater than 120 and BPDIA greater than 80

comp <- (DF1[DF1$BPSYS>120&DF1$BPDIA>80,])
comp


DF1[7,]$BPDIA<-81
DF1

comp <- (DF1[DF1$BPSYS>120&DF1$BPDIA>80,])
comp

#DF1[DF$BPDIA<80,]$BPSYS<-130


