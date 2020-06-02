#Excercise 3

attach(diamonds)

typeof(diamonds)

str(diamonds)
summary(diamonds)

#mean() ,median() ,sd() ,min() ,max()
sd(diamonds$carat)


diamonds[diamonds$price>10000&diamonds$carat>=3,]

qplot(color,price, data=diamonds, geom="boxplot")

str(diamonds)
qplot(clarity,price, data=diamonds, geom="boxplot")
