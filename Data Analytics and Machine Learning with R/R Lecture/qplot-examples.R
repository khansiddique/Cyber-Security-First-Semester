## Install ggplot2
install.packages("ggplot2")

## Load the package
library(ggplot2)

## Structure Diamonds data set
help(diamonds)
str(diamonds)

## Structure Economics data set
help(economics)
str(economics)

## Scatterplot
qplot(diamonds$carat, diamonds$price)

qplot(carat, price, data=diamonds, geom="point") # ? geom

qplot(carat, price, data=diamonds)

## Transforming variables
qplot(log(carat), log(price), data=diamonds)

qplot(carat, price, data=diamonds, log="x") # ? log

qplot(carat, price, data=diamonds, log="xy")

qplot(carat, x * y * z, data=diamonds, log="xy")

## Simple layout modifications
qplot(carat, price, data=diamonds,
      main="Diamonds (Carat X Price)",
      xlab="Carat", ylab="Price")

qplot(carat, price, data=diamonds,
      main="Diamonds (Carat X Price)", xlab="Carat", ylab="Price",
      xlim=c(1,3), ylim=c(0,10000), asp=0.5) # ? asp

## Changes on Color, Shape and Size
qplot(carat, price, data=diamonds, color=color)

qplot(carat, price, data=diamonds[sample(nrow(diamonds), 100),], # sample() function?
      shape=cut)

qplot(carat, price, data=diamonds[sample(nrow(diamonds), 100),],
      shape=cut, size=I(5)) + #? Size
  scale_shape_manual(values = c(0, 5, 6, 15, 1))

qplot(carat, price, data=diamonds[sample(nrow(diamonds), 100),], 
      color=color, size=I(3)) +
  scale_color_manual(values = c("black", "orange", "blue", "green", "yellow", "red", "purple"))

## Transparency
qplot(carat, price, data=diamonds, alpha=1/10)

qplot(carat, price, data=diamonds, alpha=I(1/10))

qplot(carat, price, data=diamonds, alpha=I(1/100))

## Smooth
qplot(carat, price, data=diamonds, geom=c("point", "smooth")) # geom ??

qplot(carat, price, data=diamonds) + stat_smooth(se=TRUE, level=0.5)

library(splines)
qplot(carat, price, data=diamonds) + stat_smooth(method="lm", formula=y ~ ns(x,5))

## Boxplot and Jitter
qplot(color, carat, data=diamonds, geom="boxplot")

qplot(reorder(color, price), carat, data=diamonds, geom="boxplot")

qplot(color, carat, data = diamonds, geom="boxplot", fill=color)

qplot(color, carat, data = diamonds, geom="boxplot", size=I(0.1))

qplot(color, carat, data = diamonds, geom="boxplot", fill=color, size=I(0.1)) +
  scale_fill_manual(values = c("black", "orange", "blue", "green", "yellow", "red", "purple"))

qplot(color, carat, data=diamonds, geom="jitter")

qplot(color, carat, data=diamonds, geom="jitter", alpha=I(1/5))
qplot(color, carat, data=diamonds, geom="jitter", alpha=I(1/50))
qplot(color, carat, data=diamonds, geom="jitter", alpha=I(1/100))

## Histograms and Densities
qplot(carat, data=diamonds, geom="histogram")

qplot(carat, data=diamonds, geom="density")

qplot(carat, data=diamonds, geom="histogram", binwidth=0.1)

qplot(carat, data=diamonds, geom="density", adjust=0.5)

qplot(carat, data=diamonds, geom="histogram", binwidth=0.1, fill=color)

## Bar chart
qplot(color, data=diamonds, geom="bar")

qplot(color, data=diamonds, geom="bar", weight=carat)

qplot(clarity, data=diamonds, geom="bar", fill=cut)

qplot(clarity, data=diamonds, geom="bar") +
  geom_bar(aes(fill=cut), data=diamonds, position="dodge")

## Line and Path
qplot(date, unemploy / pop, data=economics, geom="line")

qplot(date, uempmed, data=economics, geom="line")

year <- function(x){
  as.POSIXlt(x)$year + 1900
}

qplot(unemploy / pop, uempmed, data=economics, geom="path", color=year(date)) +
  scale_y_discrete()

qplot(unemploy / pop, uempmed, data=economics, geom="path",
      color=as.factor(year(date))) + scale_y_discrete()

## Facets
qplot(carat, data=diamonds, facets=cut ~ color,
      geom="histogram", binwidth=0.1, xlim=c(0,3))

g <- qplot(carat, data=diamonds, geom="histogram", binwidth=0.1,xlim=c(0,3))

g + facet_wrap(~color)
g + facet_wrap(~color, ncol=2)
g + facet_wrap(~color, scales="free")
g + facet_wrap(~color, scales="free_x")

g + facet_grid(cut~color)
g + facet_grid(~color+cut)
g + facet_grid(cut~color, scales="free")
g + facet_wrap(~color, scales="free_x")

## Other functions
save(g, file="rawG.data")

rm(g)

load("rawG.data")

summary(g)

ggsave(file="test.pdf", plot=g)

ggsave(file="test.jpeg", dpi=72, plot=g)

ggsave(file="test.png", plot=g, width=10, height=5)
