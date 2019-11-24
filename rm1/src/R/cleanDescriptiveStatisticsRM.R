# Set working diretory
setwd("C:/Users/macruz/workspace-doctorate/RM/research-methods1/rm1/out")

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

# DATASET EPS=0.0001
data00001 <- subset(data10, eps == 0.0001, select = c("id", "algo","max","count_err"))
summary(data00001)

M <- cor(data00001$max,data00001$count_err)
round(M, 2)

pdf('plotEPS00001x10mil.pdf')
plot(data00001$count_err,data00001$max, col = data00001$id, main = "EPS=0.0001 and LEN=10000", xlab = "Quant. Errors", ylab = "Max Subarray Sorted")
text(data00001$count_err,data00001$max, labels = data00001$id, cex= 0.7, pos = 4)
dev.off()

# DATASET EPS=0.001
data0001 <- subset(data10, eps == 0.001, select = c("id", "algo","max","count_err"))
summary(data0001)

M <- cor(data0001$max,data0001$count_err)
round(M, 2)

pdf('plotEPS0001x10mil.pdf')
plot(data0001$count_err,data0001$max, col = data0001$id, main = "EPS=0.001 and LEN=10000", xlab = "Quant. Errors", ylab = "Max Subarray Sorted")
text(data0001$count_err,data0001$max, labels = data0001$id, cex= 0.7, pos = 4)
dev.off()

# DATASET EPS=0.01
data001 <- subset(data10, eps == 0.01, select = c("id", "algo","max","count_err"))
summary(data001)

M <- cor(data001$max,data001$count_err)
round(M, 2)

pdf('plotEPS001x10mil.pdf')
plot(data001$count_err,data001$max, col = data001$id, main = "EPS=0.01 and LEN=10000", xlab = "Quant. Errors", ylab = "Max Subarray Sorted")
#abline(lm(data001x100$count_err ~ data001x100$max))
text(data001$count_err,data001$max, labels = data001$id, cex= 0.7, pos = 4)
dev.off()


library(ggcorrplot)

dataCorr2 <- dataAll[,c(3,4,5,6,7)]
summary(dataCorr2)
#data(data001)
corr <- round(cor(dataCorr2), 1)
head(corr)

ggcorrplot(corr, hc.order = TRUE, type = "lower",
           outline.col = "white")

# Loading dataset
dataAll <- read.csv(
  file = "data.csv",
  header = TRUE,
  sep = ";",
  dec = ".",
  stringsAsFactor = TRUE,
  quote = "\""
)

levels(data00001$algo)

install.packages("dplyr")

library(dplyr)

