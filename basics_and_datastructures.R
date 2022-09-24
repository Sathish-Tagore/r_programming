### Variables
x <- 2
x
y = 5
y
3 -> z
a <- b <- 7
a
b
assign("j",4)
j

### Remove variable
rm(j)
j


theVariable <- 17
theVariable
### case sensitive
THEVARIABLE


### Data types

class(x)

is.numeric(x)

i <- 5L
i

is.integer(i)
is.numeric(i)

class(4L)

class(2.8)

class(4L * 2.8)

class(5L)

### Character

x <- "data"
x

y <- factor("data")
y

nchar(x)

nchar("hello")

nchar(3)

nchar(452)

nchar(y)

### Dates
date1 <- as.Date("2012-06-28")
date1

class(date1)

as.numeric(date1)

date2 <- as.POSIXct("2012-06-28 17:42")
date2

class(date2)

as.numeric(date2)

class(as.numeric(date2))

### Logical

TRUE * 5
FALSE * 5

k <- TRUE
class(k)

is.logical(k)

TRUE
T

class(T)

2 == 3

2 != 3

2 < 3

2 <= 3

3 >= 3

2 > 3

"data" == "stats"

"data" < "stats"

### Vectors

x <- c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10)
x

x * 3

x + 2

x > y

x < y


x <- 10:1
x

y <- -4:5
y

any(x < y)

all(x < y)


q <- c("Hockey","Football","Baseball","Curling","Rugby",
       "Lacrosse","Basketball","Tennis","Cricket","Soccer")
nchar(q)

nchar(y)

x[1]

x[1:2]

x[c(1,4)]

c(One = 'a', Two = 'b', Last = 'r')

w <- 1:3
names(w) <- c('a','b','c')
w

### Factor vectors

q2 <- c(q, "Hockey", "Lacrosse", "Hockey", "Water Polo", "Hockey", "Lacrosse")

q2Factor <- as.factor(q2)
q2Factor

as.numeric(q2Factor)

levels(q2Factor)


### Ordered factor

factor(x=c("High School","College","Masters","Doctorate"),
       levels = c("High School","College","Masters","Doctorate"),
       ordered = T)


### Calling Function
mean(x)

### Function documentation
?mean

### Find functions using a hint
apropos("mea")

### Missing Data

z <- c(1,2,NA,8,3,NA,3)
z

is.na(z)

zchar <- c("Hockey", NA, "Lacrosse")
zchar
is.na(zchar)

mean(z)

mean(z, na.rm = T)

###NUll

z <- c(1,NULL,3)
z

d <- NULL
is.null(d)

is.null(7)

###pipes
library(magrittr)
x <- 1:10
mean(x)
x %>% mean

z <- c(1,2,NA,8,3,NA,3)
sum(is.na(z))

z %>% is.na %>% sum



### data.frames

x
y
q
theDf <- data.frame(x,y,q)
theDf

theDf <- data.frame(First = x, Second = y, Sport = q)
theDf

nrow(theDf)
ncol(theDf)
dim(theDf)

names(theDf)

names(theDf)[3]

rownames(theDf)

rownames(theDf) <- c("one","two","three","four","five","six","seven","eight","nine","ten")
theDf

rownames(theDf) <- NULL
theDf

head(theDf)

head(theDf, n = 8)

tail(theDf)

class(theDf)

theDf$Sport

#third row and second column value
theDf[3,2]

theDf[c(3,5), 2]

#rows 3 and 5, columns 2 through 3
theDf[c(3,5), 2:3]

#all of column 3
theDf[,3]

#columns 2 and 3
theDf[,2:3]

#all of row 2
theDf[2,]
theDf[2:4,]
theDf[, c("First","Sport")]

#just the sport column
#since it is one column it returns as a vector
theDf[, "Sport"]

class(theDf[, "Sport"])

theDf["Sport"]
class(theDf["Sport"])

theDf[["Sport"]]

#to ensure a dataframe is returned
theDf[, "Sport", drop=F]
theDf[, 3, drop=F]


#model.matrix, how factor operate in data frame
#one column for each level of a factor, with a 1 if a row contains that level or 0 otherwise
newFactor <- factor(c("Pennyslavania","New York", "New Jersey", "New York", "Tennessee","Massachusetts",
                      "Pennyslavania","New York"))
model.matrix(~ newFactor -1)


### Lists
#create three element list
list(1,2,3)

#Create a single element list
list(1)
list(c(1,2,3))

#two element list
#first is three element vector
#second is five element vector

(list3 <- list(c(1,2,3),3:7))

list(theDf, 1:10)

list5 <- list(theDf, 1:10, list3)
list5

names(list5)
names(list5) <- c("data.frame","vector","list")
names(list5)

list5

list6 <- list(TheDataFrame = theDf, TheVector=1:10, TheList=list3)
list6

list5[[1]]

length(list5)

list5[[4]] <- 2
length(list5)

names(list5)

### Matrices

A <- matrix(1:10, nrow = 5)
B <- matrix(21:30, nrow = 5)
C <- matrix(21:40, nrow = 2)
A
B
C


nrow(A)
ncol(A)

dim(A)

A + B

A * B

A == B

A %*% t(B)

colnames(A)

rownames(A)


colnames(B) <- c("First","Second")
B
rownames(B) <- c("One","Two","Three","Four","Five")

B
LETTERS


#Array is multidimensional vector
theArray <- array(1:12,dim=c(2,3,2))
theArray

theArray[1,,]
theArray[,,1]

