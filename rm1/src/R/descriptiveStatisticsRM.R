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
dataAll <- read.csv(
  file = "data.csv",
  header = TRUE,
  sep = ";",
  dec = ".",
  stringsAsFactor = TRUE,
  quote = "\""
)
# with error data
summary(dataAll)

# without error data
dataClean <- subset(dataAll, recursive == "FALSE", select = c("id","algo", "eps", "tam","max","count_err"))

head(dataClean)

summary(dataClean)

data <- dataClean

# Correlation Coefficient
M <- cor(data$max,data$count_err)
round(M, 2)

# install.packages("Hmisc")

# library(Hmisc)

# ALL
pdf('plotAll.pdf')
plot(data$count_err,data$max, col = data$id, main = "ALL DATA", xlab = "Quant. Errors", ylab = "Max Subarray Sorted")
dev.off()

# DATASET 100
data100 <- subset(data, tam == 100, select = c("algo","max","count_err"))
summary(data100)

M <- cor(data100$max,data100$count_err)
round(M, 2)

pdf('plot100.pdf')
plot(data100$count_err,data100$max, col = data100$algo, main = "DATA 100", xlab = "Quant. Errors", ylab = "Max Subarray Sorted")
dev.off()

# DATASET 1000
data1000 <- subset(data, tam == 1000, select = c("algo","max","count_err"))
summary(data1000)

M <- cor(data1000$max,data1000$count_err)
round(M, 2)

pdf('plot1000.pdf')
plot(data1000$count_err,data1000$max, col = data1000$algo, main = "DATA 1000", xlab = "Quant. Errors", ylab = "Max Subarray Sorted")
dev.off()

# DATASET 10000
data10000 <- subset(data, tam == 10000, select = c("algo","max","count_err"))
summary(data10000)

M <- cor(data10000$max,data10000$count_err)
round(M, 2)

pdf('plot10000.pdf')
plot(data10000$count_err,data10000$max, col = data10000$algo, main = "DATA 10000", xlab = "Quant. Errors", ylab = "Max Subarray Sorted")
dev.off()

# DATASET EPS=0.01
data001 <- subset(data, eps == 0.01, select = c("id","max","count_err"))
summary(data001)

M <- cor(data001$max,data001$count_err)
round(M, 2)

pdf('plotEPS001.pdf')
plot(data001$count_err,data001$max, col = data001$id, main = "EPS 0.01", xlab = "Quant. Errors", ylab = "Max Subarray Sorted")
dev.off()

# DATASET EPS=0.001
data0001 <- subset(data, eps == 0.001, select = c("id","max","count_err"))
summary(data0001)

M <- cor(data0001$max,data0001$count_err)
round(M, 2)

pdf('plotEPS0001.pdf')
plot(data0001$count_err,data0001$max, col = data0001$id, main = "EPS 0.001", xlab = "Quant. Errors", ylab = "Max Subarray Sorted")
dev.off()

# DATASET EPS=0.0001
data00001 <- subset(data, eps == 0.0001, select = c("id","max","count_err"))
summary(data00001)

M <- cor(data00001$max,data00001$count_err)
round(M, 2)

pdf('plotEPS00001.pdf')
plot(data00001$count_err,data00001$max, col = data00001$id, main = "EPS 0.0001", xlab = "Quant. Errors", ylab = "Max Subarray Sorted")
dev.off()

# DATASET EPS=0.0001 AND 10000
data00001x10000 <- subset(data, eps == 0.0001 & tam == 10000, select = c("id", "algo","max","count_err"))
summary(data00001x10000)

M <- cor(data00001x10000$max,data00001x10000$count_err)
round(M, 2)

pdf('plotEPS00001x10000.pdf')
plot(data00001x10000$count_err,data00001x10000$max, col = data00001x10000$id, main = "EPS=0.0001 and LEN=10000", xlab = "Quant. Errors", ylab = "Max Subarray Sorted")
text(data00001x10000$count_err,data00001x10000$max, labels = data00001x10000$id, cex= 0.7, pos = 4)
dev.off()

# DATASET EPS=0.0001 AND 10000
data00001x10000 <- subset(data, eps == 0.0001 & tam == 10000, select = c("id", "algo","max","count_err"))
summary(data00001x10000)

M <- cor(data00001x10000$max,data00001x10000$count_err)
round(M, 2)

pdf('plotEPS00001x10000.pdf')
plot(data00001x10000$count_err,data00001x10000$max, col = data00001x10000$id, main = "EPS=0.0001 and LEN=10000", xlab = "Quant. Errors", ylab = "Max Subarray Sorted")
text(data00001x10000$count_err,data00001x10000$max, labels = data00001x10000$id, cex= 0.7, pos = 4)
dev.off()

# DATASET EPS=0.001 AND 10000
data0001x10000 <- subset(data, eps == 0.001 & tam == 10000, select = c("id", "algo","max","count_err"))
summary(data0001x10000)

M <- cor(data0001x10000$max,data0001x10000$count_err)
round(M, 2)

pdf('plotEPS0001x10000.pdf')
plot(data0001x10000$count_err,data0001x10000$max, col = data0001x10000$id, main = "EPS=0.001 and LEN=10000", xlab = "Quant. Errors", ylab = "Max Subarray Sorted")
text(data0001x10000$count_err,data0001x10000$max, labels = data0001x10000$id, cex= 0.7, pos = 4)
dev.off()

# DATASET EPS=0.01 AND 10000
data001x10000 <- subset(data, eps == 0.01 & tam == 10000, select = c("id", "algo","max","count_err"))
summary(data001x10000)

M <- cor(data001x10000$max,data001x10000$count_err)
round(M, 2)

pdf('plotEPS001x10000.pdf')
plot(data001x10000$count_err,data001x10000$max, col = data001x10000$id, main = "EPS=0.01 and LEN=10000", xlab = "Quant. Errors", ylab = "Max Subarray Sorted")
text(data001x10000$count_err,data001x10000$max, labels = data001x10000$id, cex= 0.7, pos = 4)
dev.off()

# DATASET EPS=0.0001 AND 10000
data00001x10000 <- subset(data, eps == 0.0001 & tam == 10000, select = c("id", "algo","max","count_err"))
summary(data00001x10000)

M <- cor(data00001x10000$max,data00001x10000$count_err)
round(M, 2)

pdf('plotEPS00001x10000.pdf')
plot(data00001x10000$count_err,data00001x10000$max, col = data00001x10000$id, main = "EPS=0.0001 and LEN=10000", xlab = "Quant. Errors", ylab = "Max Subarray Sorted")
text(data00001x10000$count_err,data00001x10000$max, labels = data00001x10000$id, cex= 0.7, pos = 4)
dev.off()

# DATASET EPS=0.0001 AND 1000
data00001x1000 <- subset(data, eps == 0.0001 & tam == 1000, select = c("id", "algo","max","count_err"))
summary(data00001x1000)

M <- cor(data00001x1000$max,data00001x1000$count_err)
round(M, 2)

pdf('plotEPS00001x1000.pdf')
plot(data00001x1000$count_err,data00001x1000$max, col = data00001x1000$id, main = "EPS=0.0001 and LEN=1000", xlab = "Quant. Errors", ylab = "Max Subarray Sorted")
text(data00001x1000$count_err,data00001x1000$max, labels = data00001x1000$id, cex= 0.7, pos = 4)
dev.off()

# DATASET EPS=0.001 AND 1000
data0001x1000 <- subset(data, eps == 0.001 & tam == 1000, select = c("id", "algo","max","count_err"))
summary(data0001x1000)

M <- cor(data0001x1000$max,data0001x1000$count_err)
round(M, 2)

pdf('plotEPS0001x1000.pdf')
plot(data0001x1000$count_err,data0001x1000$max, col = data0001x1000$id, main = "EPS=0.001 and LEN=1000", xlab = "Quant. Errors", ylab = "Max Subarray Sorted")
text(data0001x1000$count_err,data0001x1000$max, labels = data0001x1000$id, cex= 0.7, pos = 4)
dev.off()

# DATASET EPS=0.01 AND 1000
data001x1000 <- subset(data, eps == 0.01 & tam == 1000, select = c("id", "algo","max","count_err"))
summary(data001x1000)

M <- cor(data001x1000$max,data001x1000$count_err)
round(M, 2)

pdf('plotEPS001x1000.pdf')
plot(data001x1000$count_err,data001x1000$max, col = data001x1000$id, main = "EPS=0.01 and LEN=1000", xlab = "Quant. Errors", ylab = "Max Subarray Sorted")
text(data001x1000$count_err,data001x1000$max, labels = data001x1000$id, cex= 0.7, pos = 4)
dev.off()

# DATASET EPS=0.0001 AND 100
data00001x100 <- subset(data, eps == 0.0001 & tam == 100, select = c("id", "algo","max","count_err"))
summary(data00001x100)

M <- cor(data00001x100$max,data00001x100$count_err)
round(M, 2)

pdf('plotEPS00001x100.pdf')
plot(data00001x100$count_err,data00001x100$max, col = data00001x100$id, main = "EPS=0.0001 and LEN=100", xlab = "Quant. Errors", ylab = "Max Subarray Sorted")
text(data00001x100$count_err,data00001x100$max, labels = data00001x100$id, cex= 0.7, pos = 4)
dev.off()

# DATASET EPS=0.001 AND 100
data0001x100 <- subset(data, eps == 0.001 & tam == 100, select = c("id", "algo","max","count_err"))
summary(data0001x100)

M <- cor(data0001x100$max,data0001x100$count_err)
round(M, 2)

pdf('plotEPS0001x100.pdf')
plot(data0001x100$count_err,data0001x100$max, col = data0001x100$id, main = "EPS=0.001 and LEN=100", xlab = "Quant. Errors", ylab = "Max Subarray Sorted")
text(data0001x100$count_err,data0001x100$max, labels = data0001x100$id, cex= 0.7, pos = 4)
dev.off()

# DATASET EPS=0.01 AND 100
data001x100 <- subset(data, eps == 0.01 & tam == 100, select = c("id", "algo","max","count_err"))
summary(data001x100)

var(data001x100$max)
var(data001x100$count_err)

M <- cor(data001x100$max,data001x100$count_err)
round(M, 2)

pdf('plotEPS001x100.pdf')
plot(data001x100$count_err,data001x100$max, col = data001x100$id, main = "EPS=0.01 and LEN=100", xlab = "Quant. Errors", ylab = "Max Subarray Sorted")
text(data001x100$count_err,data001x100$max, labels = data001x100$id, cex= 0.7, pos = 4)
dev.off()


# Loading dataset
data10 <- read.csv(
  file = "data10000.csv",
  header = TRUE,
  sep = ";",
  dec = ".",
  stringsAsFactor = TRUE,
  quote = "\""
)
# with error data
summary(data10)


var(data10$max)
var(data10$count_err)

M <- cor(data10$max,data10$count_err)
round(M, 2)

pdf('plotEPS00001x100000_2.pdf')
plot(data10$count_err,data10$max, col = data10$id, main = "EPS=0.0001 and LEN=10000", xlab = "Quant. Errors", ylab = "Max Subarray Sorted")
text(data10$count_err,data10$max, labels = data10$id, cex= 0.7, pos = 4)
dev.off()
