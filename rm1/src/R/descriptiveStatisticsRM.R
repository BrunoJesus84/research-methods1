install.packages("moments")

# Set working diretory
setwd("C:/Users/macruz/workspace-doctorate/RM/research-methods1/rm1/out/1000")

# Loading dataset
dataset <- read.table(
  file = "1000data.csv",
  header = TRUE,
  sep = ";",
  quote = "\""
)

# Peek at data
head(dataset)

# Look at column names
names(dataset)

# Rename variables (i.e column 1)
names(dataset)[1] <- "algorithm"

# Rename variables (i.e column 4)
names(dataset)[4] <- "max_sorted"

# Summary of Amount of Classification Errors
summary(dataset$count_err)

x <- dataset$count_err

# Summary of Amount of Classification Errors
summary(dataset$max_sorted)

y <- dataset$max_sorted

# Graph of the density function of the Amount of Classification Errors
plot(density(dataset$count_err))

# Graph of the density function of the maximum ordered quantity attribute
plot(density(dataset$max_sorted))

# SAMPLES QUANTITAVIVE BY ALGORITHM
table(dataset$algorithm)

# max_sorted X tam
plot(dataset$max_sorted, dataset$tam, type = "p")

# x = count_err
mean(x)	# Mean of the numbers in vector x.
median(x)	# Median of the numbers in vector x
var(x)	# Estimated variance of the population from which the numbers in vector x are sampled
sd(x)	# Estimated standard deviation of the population from which the numbers in vector x are sampled
scale(x)	# Standard scores (z-scores) for the numbers in vector x

# y = max_sorted
mean(y)	# Mean of the numbers in vector x.
median(y)	# Median of the numbers in vector x
var(y)	# Estimated variance of the population from which the numbers in vector x are sampled
sd(y)	# Estimated standard deviation of the population from which the numbers in vector x are sampled
scale(y)	# Standard scores (z-scores) for the numbers in vector x

dataset

install.packages("corrplot")

library(corrplot)

# Loading dataset
data <- read.csv(
  file = "1000data.csv",
  header = TRUE,
  sep = ";",
  dec = ".",
  stringsAsFactor = TRUE,
  quote = "\""
)
summary(data)

data <- data[,c(2,3,4,5)]

head(data)

M <- cor(data$max,data$count_err)
round(M, 2)

install.packages("Hmisc")

library(Hmisc)

res2 <- rcorr(as.matrix(data), type = c("pearson","spearman"))
res2
corrplot(as.matrix(data), method="circle")
