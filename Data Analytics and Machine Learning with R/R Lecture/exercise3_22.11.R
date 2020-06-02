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

#type of data
typeof(DF1)
#Add a column
Type=c("A","B","D", "B", "A", "A")
DF1<-cbind( DF1,Type)
DF1
#Name of the data Column.
names(DF1)
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

#Scatter Plot.

attach(DF1)
plot(WEIGHT,HEIGHT, main="Scatterplot Example", xlab="Weight", ylab="Height", pch=19)
#Generate a scatterplot of HEIGHT and WEIGHT
qplot(HEIGHT, WEIGHT, data=DF1,
      main="Plot Example",
      xlab="Height", ylab="Weight", shape=Type, size=5)+scale_shape_manual(values = c(11,12,13))
#Experiment with color, size, and shape aesthetics
qplot(HEIGHT, WEIGHT, data=DF1, color=Type,main="Plot Example",xlab="Height", ylab="Weight", 
      shape=Type, size=Type)+
      scale_shape_manual(values = c(11,12,13))+
      scale_size_manual(values = c(2,5,8))+
      scale_color_manual(values = c("green","red","blue"))

#Generate a boxplot of TYPE with BPSYS and BPDIA


qplot(Type, BPDIA, data=DF1, geom="boxplot")

qplot(Type, BPSYS, data=DF1, geom="boxplot")

newDF=cbind(DF1,NEWC= as.factor(c(1,2,3,2,4,1)))
str(newDF)
#attach(diamonds)
newDF=cbind(DF1,NEWC= as.factor(c(1,2,3,2,4,1)))
str(newDF)

qplot(HEIGHT, WEIGHT, data=newDF, color=NEWC,main="Plot Example",xlab="Height", ylab="Weight", 
      shape=NEWC, size=NEWC)+
  scale_shape_manual(values = c(11,12,13,14))+
  scale_size_manual(values = c(2,5,8,7))+
  scale_color_manual(values = c("green","red","blue",'yellow'))