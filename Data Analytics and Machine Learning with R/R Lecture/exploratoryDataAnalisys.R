attach(mtcars)
plot(wt,mpg, main="Scatter Plot Example", xlab = "Car Weight", 
     ylab = 'Miles per Gallon', pch=19)

counts<- table(mtcars$gear)

barplot(counts, main = 'Car Distribution', xlab = 'Number of Gears')

attach(mtcars)
plot(wt,mpg, main="Scatter Plot Example", xlab = "Car Weight", 
     ylab = 'Miles per Gallon', pch=19)
lines(lowess(wt,mpg), col = 'blue')

typeof(lowess(wt,mpg))

slices <-c(10,12,4,16,8)
#lbls= c('US','UK',')

boxplot(mpg~cyl,data=mtcars, main='Car Milage Data', xlab='Number of Cylinders',
        ylab='Miles per Gallon')

counts<- table(mtcars$cyl)

barplot(counts, main = 'Car Distribution', xlab = 'Number of Gears')

mean(mtcars[cyl==4,]$mpg)

library(ggplot2)
help(diamonds)

help("economics")


?qplot()


qplot(carat, price, data = diamonds)

qplot(log(carat), log(price), data = diamonds)

qplot(carat, price, data = diamonds, main = 'Carat X Price', 
      color=color)

str(diamonds)

qplot(carat, price, data = diamonds[sample(nrow(diamonds),100),], 
      main = 'Carat X Price', 
      shape=cut)

qplot(carat, price, data = diamonds[sample(nrow(diamonds),100),], 
      main = 'Carat X Price', size=I(5), color=color,
      shape=cut)+ scale_color_manual(values = c('balck', 'orange', 'blue', 
                                                'green', 'yellow', 'red', 'purple'))


qplot(carat, price, data = diamonds, geom = c('point', 'smooth'))

qplot(carat, price, data = diamonds) + stat_smooth(se=TRUE, level = 0.5) #, geom = c('point', 'smooth'))


table(diamonds$carat)
