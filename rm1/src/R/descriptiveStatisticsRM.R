install.packages("moments")

# Set working diretory
setwd("C:/Users/macruz/workspace-doctorate/RM/research-methods1/rm1/out")

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
  file = "data.csv",
  header = TRUE,
  sep = ";",
  dec = ".",
  stringsAsFactor = TRUE,
  quote = "\""
)
summary(data)

data1 <- data[,c(2,3,4,5)]

head(data1)

# Correlation Coefficient
M <- cor(data$max,data$count_err)
round(M, 2)

# 
MV <- cov(data$max,data$count_err)
round(MV, 2)

install.packages("Hmisc")

library(Hmisc)

# ALL
pdf('plotAll_.pdf')
plot(data$count_err,data$max, col = data$algo, xlab = "Quant. Errors", ylab = "Max Subarray Sorted")
dev.off()

# DATASET 100
data100 <- subset(data, tam == 100 & recursive == "FALSE", select = c("algo","max","count_err"))
summary(data100)

M <- cor(data100$max,data100$count_err)
round(M, 2)

pdf('plot100.pdf')
plot(data100$count_err,data100$max, col = data100$algo, xlab = "Quant. Errors", ylab = "Max Subarray Sorted")
dev.off()

# DATASET 1000
data1000 <- subset(data, tam == 1000 & recursive == "FALSE", select = c("algo","max","count_err"))
summary(data1000)

M <- cor(data1000$max,data1000$count_err)
round(M, 2)

pdf('plot1000___.pdf')
plot(data1000$count_err,data1000$max, col = data1000$algo, xlab = "Quant. Errors", ylab = "Max Subarray Sorted")
dev.off()

# DATASET 10000
data10000 <- subset(data, tam == 10000, select = c("algo","max","count_err"))
summary(data10000)

M <- cor(data10000$max,data10000$count_err)
round(M, 2)

pdf('plot10000.pdf')
plot(data10000$count_err,data10000$max, col = data10000$algo, xlab = "Quant. Errors", ylab = "Max Subarray Sorted")
dev.off()


