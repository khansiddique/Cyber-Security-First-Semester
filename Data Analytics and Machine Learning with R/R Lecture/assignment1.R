#Problem No. 1
#----------------------------------------------------------------------------
#To setting up the directory

setwd("C:\\Users\\HP\\Documents\\R Lecture\\")

#read the data with the CSV command.
#read.csv('')

#read the data with the table command.

dataFile=read.csv('Book1.csv',sep=',', header = TRUE)
## Load the package
library(ggplot2)
library(splines)

dataFile
#Check the structure of the data table loaded
str(dataFile)
# general objective is to summarize the dataset 
summary(dataFile)


#FFP is focused on understanding and addressing issues of violent conflict, 
#state fragility, and security and human rights.
#dataFile[!is.na(dataFile)]
#na.omit(dataFile)
#str(head(dataFile, 10))

#library(sqldf)
#DF <- read.csv.sql("Book1.csv", sql = "select * from file order by random() limit 10")
#DF

#RowsInCSV = 2277 #Or however many rows there are

#List <- lapply(1:10, function(x) read.csv("YourFile.csv", nrows=1, skip = sample(1, RowsInCSV), header=F)
#DF = do.call(rbind, List)

#sampleyears <- sample(dataFile$Year,10)
#sampleyears
#newdata <- subset(dataFile, dataFile$sampleyears %in% dataFile)
#newdata


#Problem No. 2
#----------------------------------------------------------------------------
#sample(as.character(unique(dataFile$Country)), 10)
countries=sample(as.character(unique(dataFile$Country)), 10)
#as.character(dataFile$Country) %in% countries
countriesData=dataFile[dataFile$Country %in% countries,]
#countriesData
qplot(Year, Total, data=countriesData, color=Country, geom="line")

#---------------------------------------------------------------------------
#Reference: https://stackoverflow.com/questions/22261082/load-a-small-random-sample-from-a-large-csv-file-into-r-data-frame/22261345#22261345
#Load a small random sample from a large csv file into R data frame
#Install Sqldf package in R
#install.packages("sqldf")
library("sqldf")
require(sqldf)
DF <- read.csv.sql("Book1.csv", sql = "select * from file order by random() limit 10")
DF

qplot(Year, Total, data=DF, geom="line")




#Activities for #Problem No. 4
#----------------------------------------------------------------------------
#Generate a line plot of all of the indicators of a single country (NOTE: Use the function melt in package reshape2 to re-shape the dataset for a suitable form, see next slide). 
#https://stackoverflow.com/questions/9761192/r-could-not-find-function-melt
#R - could not find function 'melt()' [duplicate]
#install.packages("reshape2")
#install.packages("reshape")

library(reshape2)
#library(reshape)
data <- data.frame(country=c("Togo","Mauritania","Togo","Mauritania"),
                   year=c("2006","2006","2018","2018"),
                   c1=c(8.1,7.6),
                   c2=c(7.8,7.9))
data

melt(data, id.vars=c("country","year"), measure.vars=c("c1","c2"))

#Problem No. 4
library(reshape2)
DF4=melt(dataFile, id.vars=c("Country","Year"), measure.vars=c("C1..Security.Apparatus",
                                                               "C2..Factionalized.Elites",
                                                               "C3..Group.Grievance",
                                                               "E1..Economy",
                                                               "E2..Economic.Inequality",
                                                               "E3..Human.Flight.and.Brain.Drain",
                                                               "P1..State.Legitimacy",
                                                               "P2..Public.Services",
                                                               "P3..Human.Rights",
                                                               "S1..Demographic.Pressures",
                                                               "S2..Refugees.and.IDPs",
                                                               "X1..External.Intervention"))

selectCountry=sample(as.character(trimws(unique(DF4$Country))),1)
#selectCountry=sample(as.character(unique(DF4$Country)), 1)
selectCountry
newData=DF4[DF4$Country %in% selectCountry,]
newData
#str(DF4)
#DFCheck=DF4[1]
#DFCheck
qplot(Year,value, data=newData, geom="line", color=variable)

#04.12.2018
#Problem 3
#Generate a histogram of an indicator of your preference for 
#all countries showing with color the count of countries on 
#each bin per year
#----------------------------------------------------------------------------
NewDataforHist=dataFile[,c(1,2,5)]
yearFactor=as.factor(NewDataforHist$Year)
yearFactor
str(yearFactor)
str(NewDataforHist)
qplot(C1..Security.Apparatus, xlab="Security Apparatus", 
      data=NewDataforHist, geom="histogram",
      main = "Histogram for an indicator", 
      binwidth=1, color=yearFactor, ylab="Count", fill=I('white'))

qplot(C1..Security.Apparatus, xlab="Security Apparatus", 
      data=NewDataforHist, geom="histogram",
      main = "Histogram for an indicator", 
      binwidth=1, ylab="Count", fill=yearFactor)

qplot(C1..Security.Apparatus, xlab="Security Apparatus", 
      data=dataFile, geom="histogram",
      main = "Histogram for an indicator", 
      binwidth=1, ylab="Count", fill=as.factor(Year))
