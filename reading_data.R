# Reading data into R

#Best way to read data from a CSV file is read.table, read.csv is same as read.table with argument sep=","

theUrl <- "http://www.jaredlander.com/data/TomatoFirst.csv"
tomato <- read.table(file = theUrl, header = TRUE, sep = "," )
head(tomato)


#data frame

x <- 10:1
y <- -4:5
q <- c("Hockey","Football","Baseball","Curling","Rugby","Lacrosse","Basketball","Tennis","Cricket","Soccer")

theDf <- data.frame(First=x, Second=y, Sport=q, stringsAsFactors = TRUE)

theDf$Sport

#stringAsFactors prevents characters column being converted to Factor or string
theDf <- data.frame(First=x, Second=y, Sport=q, stringsAsFactors = FALSE)

theDf$Sport

#readr package provides many functions for reading text files
#read_delim is faster than read.table, returns a Tibble extension of data frame
library(readr)
tomato2 <- read_delim(file = theUrl, delim = ",")
tomato2

#To read large data quicly, fread from data.table package is used
#faster than read.table, returns a data.table object another extension of data.frame
library(data.table)
tomato3 <- fread(input = theUrl, sep = ',', header = TRUE)
head(tomato3)

##Excel data
#package readxl
library(readxl)

download.file(url = 'https://www.jaredlander.com/data/ExcelExample.xlsx', 
              destfile = 'data/ExcelExample.xlsx', method = 'curl')
excel_sheets('data/ExcelExample.xlsx')

tomatoXL <- read_excel('data/ExcelExample.xlsx')
tomatoXL
#Excel sheet can be given by position or name

wineXL1 <- read_excel('data/ExcelExample.xlsx', sheet = 2)
head(wineXL1)

wineXL2 <- read_excel('data/ExcelExample.xlsx', sheet = "Wine")
head(wineXL2)


## reading from databases
#DBI 

download.file('https://www.jaredlander.com/data/diamonds.db', 
              destfile = 'data/diamonds.db', method = 'auto')
library(RSQLite)
drv <- dbDriver('SQLite')
class(drv)

con <- dbConnect(drv, 'data/diamonds.db')
class(con)

dbListTables(con)

dbListFields(con, name = 'diamonds')

dbListFields(con, name = "DiamondColors")

#Simple select query from one table
diamondsTable <- dbGetQuery(con, "SELECT * FROM diamonds", stringsAsFactors=FALSE)
head(diamondsTable)

colorTable <- dbGetQuery(con, "SELECT * FROM DiamondColors", stringsAsFactors=FALSE)
head(colorTable)

#Join between tables
longQuery <- "SELECT * FROM diamonds, DiamondColors 
              WHERE diamonds.color = DiamondColors.Color"
diamondsJoin <- dbGetQuery(con, longQuery, stringsAsFactors=FALSE)

head(diamondsJoin)


## Data from other Statistical tools

#foreign package
#read.spss      SPSS
#read.dta       Stata
#read.ssd       SAS # need license
#read.octave    Octave
#read.mtp       Minitab
#read.systat    Systat

#RevoScale R package, RxSasData 

## R binary files
#Create Rdata file
save(tomato, file = "data/tomato.rdata")
#remove tomato from memory
rm(tomato)
head(tomato)

load("data/tomato.rdata")
head(tomato)

#Create some objects
n <- 20
r <- 1:10
w <- data.frame(n, r)
n
r
w

save(n,r,w, file = "data/multiple.rdata")
rm(n,r,w)

load("data/multiple.rdata")
n
r
w

#saveRDS saves one object in a binary RDS file
smallVector <- c(1, 2, 3)

smallVector

saveRDS(smallVector, file="thisObject.rds")

thatVect <- readRDS('thisObject.rds')
thatVect

identical(thatVect, smallVector)


#loading r datasets
data(diamonds, package = 'ggplot2')
head(diamonds)


#Extracting data from websites
#Reading tables in html

library(XML)
theUrl <- "https://www.jaredlander.com/2012/02/another-kind-of-super-bowl-pool/"
bowlPool <- readHTMLTable(theUrl, which = 1, header = FALSE, stringsAsFactors = FALSE)
bowlPool

#Scrapping webdata

library(rvest)
ribalta <- read_html('https://www.jaredlander.com/data/ribalta.html')
class(ribalta)
ribalta %>% html_node('ul') %>% html_nodes('span')
#Html class denoted with . and ID with #
ribalta %>% html_nodes('.street')

ribalta %>% html_nodes('.street') %>% html_text()

ribalta %>% html_nodes('#longitude') %>% html_attr('value')

ribalta %>% html_nodes('table.food-items') %>% magrittr::extract2(5) %>% html_table()

# Reading JSON data

#rjson and jsonlite

library(jsonlite)
pizza <- fromJSON('https://www.jaredlander.com/data/PizzaFavorites.json')
pizza

class(pizza)


















