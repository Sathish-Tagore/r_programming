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

#apply colors based on some variable categories
g + geom_point(aes(color=color))

#split just on categories
g + geom_point(aes(color=color)) + facet_wrap(~color)

#categories split with different scale
g + geom_point(aes(color=color)) + facet_grid(cut~color)

ggplot(diamonds, aes(x=carat)) + geom_histogram() + facet_wrap(~color)

#Box and violin plots

ggplot(diamonds, aes(y=carat, x=1)) + geom_boxplot()


ggplot(diamonds, aes(y=carat, x=cut)) + geom_boxplot()


ggplot(diamonds, aes(y=carat, x=cut)) + geom_violin()



ggplot(diamonds, aes(y=carat, x=cut)) + geom_point() + geom_violin()


ggplot(diamonds, aes(y=carat, x=cut)) + geom_violin() + geom_point()


##Line plots

ggplot(economics, aes(x=date, y=pop)) + geom_line()

library(lubridate)

##create year and month variables
economics$year <- year(economics$date)

# the label argument to month means that the result should be the names of the months instead of the number
economics$month <- month(economics$date, label = TRUE)

#subset the data the which function returns the indices of observations where the tested condition was true
econ2000 <- economics[which(economics$year >= 2000), ]

#scales package for better axis formatting
library(scales)

#build the foundation of the plot
g <- ggplot(econ2000, aes(x=month, y= pop))
#add lines color coded and grouped by year
#the group aesthetic breaks the data into seperate groups
g <- g + geom_line(aes(color=factor(year), group=year))
#name the legend year
g <- g + scale_color_discrete(name = "Year")
#format the y axis
g <- g + scale_y_continuous(labels = comma)
#add a title and axis labels
g <- g + labs(title = "Population growth", x="Month", y = "Population")

g

#Themes
library(ggthemes)
g2 <- ggplot(diamonds, aes(x=carat, y=price)) + geom_point(aes(color=color))

g2 + theme_economist() + scale_colour_economist()

g2 + theme_excel() + scale_colour_excel()

g2 + theme_tufte()

g2 + theme_wsj()


















