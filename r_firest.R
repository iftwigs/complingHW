2+2
57-43
31*2
27/3
55**2
55^2
sum(93, 39, 291, 29)
prod(2, 3, 4)
28%%3
choose(6,2)

var <- 57
var = 57
var_2 <- 34
my.var <- 99
MyVar <- 33
var + 2

var <- var + 2
rm(var_2)
ls()

-54.9
'??????????????'
32 + 5i
TRUE
FALSE
NA

5:20
c(46, 34, 28)
my_vector <- c(46, 34, 28)
my_vector + 2
my_vector ** 2
my_vector_2 <- c('4628', '????????')
my_vector_3 <- c(4628, '????????')
my_vector_3 <- month.name
my_vector_3[5]
my_vector_3[5:7]
my_vector_3[c(5, 7, 11)]
my_index <- c(5, 7, 11)
my_vector_3[my_index]
month.name[-5]
month.name[-c(5, 9)]

2 > 8
2 < 8
c(2, 3) > 5
c(2, 9) > c(5, 1)
c(2, 3) >= 5
c(2, 3) <= 5
c(2, 3) == 5
c(2, 3) != 5

b <- 1:14
b[b > 6]
b[b %% 3 == 0]

df <- data.frame(
  abc = c('a', 'b', 'c'),
  numbers = 3:1)

df <- data.frame(
  abc = c('a', 'b', 'c'),
  numbers = 3:1,
  stringsAsFactors = FALSE)

df$numbers
df$abc
df[3, 2]
df[, 2]
df[2, ]
View(mtcars)
mtcars[,5]

df <- read.csv("https://raw.githubusercontent.com/agricolamz/2018_data_analysis_for_linguists/master/data/students/Lera-Z/hw1_agreement/hw1_1_zilo_class.csv")
df <- read.csv("/home/agricolamz/work/materials/2018_I_HSE_Data_Analysis_for_linguists/data/students/akv17/hw1_agreement/hw1_1_zilo_class.csv")
getwd()
setwd("/home/agricolamz/work/materials/2018_I_HSE_Data_Analysis_for_linguists/data/students/akv17/hw1_agreement")
df <- read.csv("hw1_2_verbs.csv")

a <- c('????????', '????????')
a
a_factor <- factor(a)
nchar(a)
length(month.name)
nchar(month.name)
length(month.name[1])
nchar(month.name[1])

install.packages('lingtypology')
library('lingtypology')
map.feature(c('Adyghe', 'Russian'))
install.packages('tidyverse')
library(tidyverse)

my_sqrt <- function(i){
  i^2
}
my_sqrt(43)
my_sqrt(c(4, 23))
my_sqrt2 <- function(x, y){
  x^y
}
my_sqrt2(4, 12)
my_sqrt3 <- function(x, y) x^2
my_sqrt3(4, 12)
my_sqrt4 <- function(x, y = 12){
  x^y
}
my_sqrt4(4,12)
my_sqrt4((4))
my_sqrt4(4:7)

seq(from = 1, to = 4, by = 0.1)
rep(5, 10)
rep(c(5, 9), each = 10)
sample(letters, 3, replace = TRUE)
set.seed(42)
sample(1:190, 3, replace = TRUE)

rnorm(100, mean = 100, sd = 20)
set.seed(42)
rnorm(100, mean = 100, sd = 20)
rt(100, 2)
rbinom(100, 75, 0.23)

x <- 7
if(x > 5){
  TRUE
} else {
  FALSE
}
if(x == 5){
  'equal'
} else if(x > 5){
  'greater'
} else {
  'less'
}
i <- 2
while(i < 5){
  print('wow')
  i <- i + 1
}
ifelse(x > 24, 'greater', 'less')
