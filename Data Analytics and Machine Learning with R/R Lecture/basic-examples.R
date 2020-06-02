## Structure mtcars data set
help(mtcars)
str(mtcars)

## Scatterplot Chart
attach(mtcars)
plot(wt, mpg, main="Scatterplot Example", xlab="Car Weight ", ylab="Miles Per Gallon ", pch=19)

## Bar Chart
counts <- table(mtcars$gear)
barplot(counts, main="Car Distribution" , xlab="Number of Gears")

## Line Chart
attach(mtcars)
plot(wt, mpg, main="Scatterplot Example", xlab="Car Weight ", ylab="Miles Per Gallon ", pch=19)
lines(lowess(wt,mpg), col="blue") # lowess function ?

## Pie Chart
slices <- c(10, 12,4, 16, 8)
lbls <- c("US", "UK" , "Australia" , "Germany" , "France" )
pie(slices, labels=lbls, main="Pie Chart of Countries" )

## Boxplot Chart
boxplot(mpg~cyl,data=mtcars, main="Car Milage Data", xlab="Number of Cylinders", ylab="Miles Per Gallon")