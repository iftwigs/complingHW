length(1:12)
length(month.name)
a <- "abcdefghijklmnopqrstuvwxyz"
length(a)
nchar(a)
a <- c('blue','red','green','yellow')
is.character(a)
a <- c('blue',42,'green',91)
is.character(a)
nchar(a)
x <- 2:5
y <- 7:4
x > y
x <- letters[2:5]
y <- letters[7:4]
x > y
x <- 2:5
y <- 7:6
x + y
q <- c(4,1,3,2)
prod(q[q>2])
q[c(1,4,4)]
x <- c(22, 88, 11, 99)
(x+3)[x > 50]
q[-2]
q[-c(2, 4)]
l <- c(FALSE, TRUE, FALSE)
m <- c(FALSE, TRUE, TRUE)
l & m
l | m
j <- c(1, 3, 6, 7, 3, 7, 8, 9, 3, 7, 2)
sum(j == 3 | j == 7)

mtcars[mtcars$cyl == 4,]
cars <- mtcars[mtcars$cyl == 4,]
cars[cars$hp > 100,]
cars_2 <- cars[cars$carb == 2,]
length(mtcars[mtcars$carb == 2,])
b <- mtcars[mtcars$cyl > 4,]
sum(b['carb'])
TRUE & FALSE
nrow(mtcars[mtcars$cyl > 4 & mtcars$cyl < 8,])

TRUE|FALSE
nrow(mtcars[mtcars$cyl == 4 | mtcars$carb == 2,])

mtcars %>%
  filter(cyl == 4)

mtcars %>%
  filter(hp > 100)

mtcars %>%
  filter(carb == 2, cyl > 4)


