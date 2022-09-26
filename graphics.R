#GGPLOT2

library(ggplot2)
data("diamonds")
head(diamonds)

#Histogram

hist(diamonds$carat, main = "Carat Histogram", xlab = "carat")

#Scatterplot

plot(price~carat, data = diamonds)

plot(diamonds$carat, diamonds$price)

#box plot

boxplot(diamonds$carat)

##ggplot histogram and densities

ggplot(data = diamonds) + geom_histogram(aes(x=carat))

ggplot(data = diamonds) + geom_density(aes(x=carat), fill='grey50')


## Scatter

ggplot(diamonds, aes(x=carat, y=price)) + geom_point()


# save basics of ggplot object to a variable

g <- ggplot(diamonds, aes(x=carat, y=price))
