# function
f <- function(x) {x+1}
f(11)

# array
v <- c(1, 2, 3, 4)
v

# sequence
s <- 1:6
s

# matrix
m <- matrix(data = 1:6, nrow =2, ncol = 3)
m

# Creating an array
a <- array(data = 1:8, dim = c(2,2,2))
a

# Creating a list
l <- list(TRUE, 1L, 2.34, "abc")

# Creating a set of factors
factors <- factor(c("Male", "Female", "Male", "Female", "Male"))
levels(factors)
unclass(factors)

# Creating a data table
dt <- data.frame(
  Name = c("Cat", "Dog", "Cow", "Pig"),
  HowMany = c(5, 10, 15, 20),
  IsPet = c(TRUE, TRUE, FALSE, FALSE)
)
dt

# Indexing data Row=1, Col=2
dt[1, 2]

# Indexing data Row=1
dt[1, ]

# Indexing data Col=2
dt[, 2]

# Indexing data by Column name
dt[["HowMany"]]
dt$HowMany

# Subsetting/Filtering data
dt[c(2,4),]
dt[2:4,]
dt[dt$IsPet == TRUE,]
dt[dt$HowMany > 10,]
dt[dt$Name %in% c("Cat", "Pig"),]

# Vectorized operations
c(1, 2, 3) + c(4, 5, 6)

# Named arguments X ordered arguments
m <- matrix(data = 1:6, nrow = 2, ncol = 3)
n <- matrix(1:6, 2, 3)
m == n
identical(m, n)

# Installing packages (command line)
install.packages("ggplot2")

# Loading libraries
library("ggplot2")
