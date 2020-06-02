#Excercise 4 on 05.12.2018
#------------------------------------------------------------
#use of the following function for Regration function.
# function: lm, summary, print, AIC, BIC

attach(diamonds)

typeof(diamonds)

str(diamonds)
summary(diamonds)

#mean() ,median() ,sd() ,min() ,max()
#sd(diamonds$carat)


#diamonds[diamonds$price>10000&diamonds$carat>=3,]

#qplot(color,price, data=diamonds, geom="boxplot")

#str(diamonds)
#qplot(clarity,price, data=diamonds, geom="boxplot")

lm1<-lm(price~carat,data=diamonds)
#lm1
summary(lm1)
print(lm1)

lm2<-lm(price~carat+table+depth+x+y+z,data=diamonds)
summary(lm2)
print(lm2)

lm3<-lm(price~carat+x+y+z+x*y*z,data=diamonds)
summary(lm3)
print(lm3)


lm4<-lm(price~x+y+z+x*y*z,data=diamonds)
summary(lm4)
print(lm4)

AIC(lm1)
AIC(lm2)
AIC(lm3)
AIC(lm4)

BIC(lm1)
BIC(lm2)
BIC(lm3)
BIC(lm4)