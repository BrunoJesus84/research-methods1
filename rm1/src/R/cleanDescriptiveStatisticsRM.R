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
round(M, 1)

pdf('plotEPS001x10mil.pdf')
plot(data001$count_err,data001$max, col = data001$id, main = "EPS=0.01 and LEN=10000", xlab = "Quant. Errors", ylab = "Max Subarray Sorted")
#abline(lm(data001x100$count_err ~ data001x100$max))
text(data001$count_err,data001$max, labels = data001$id, cex= 0.7, pos = 4)
dev.off()

# ANOVA
library(dplyr)
group_by(data10, algo) %>%
  summarise(
    count = n(),
    mean = mean(max, na.rm = TRUE),
    sd = sd(max, na.rm = TRUE)
  )

install.packages("ggpubr")
install.packages("magrittr")
library(magrittr)
library(ggplot2)
library(ggpubr)

ggboxplot(data10, x = "algo", y = "max", 
          color = "algo", palette = c("#00DDDD", "#00AFBB", "#E7B800", "#FC4E07"),
          order = c("bubble", "merge", "quick", "insertion"),
          ylab = "Length Array", xlab = "Algorithm")

ggboxplot(data10, x = "algo", y = "count_err", 
          color = "algo", palette = c("#00DDDD", "#00AFBB", "#E7B800", "#FC4E07"),
          order = c("bubble", "merge", "quick", "insertion"),
          ylab = "Quant. Errors", xlab = "Algorithm")

# Mean plots
# ++++++++++++++++++++
# Plot weight by group
# Add error bars: mean_se
# (other values include: mean_sd, mean_ci, median_iqr, ....)
library("ggpubr")
ggline(data10, x = "algo", y = "max", 
       add = c("mean_se", "jitter"), 
       order = c("bubble", "merge", "quick", "insertion"),
       ylab = "Length Array", xlab = "Algoritm")

# Compute the analysis of variance
res.aov <- aov(max ~ algo, data = data001)
# Summary of the analysis
summary(res.aov)

TukeyHSD(res.aov)

# Compute the analysis of variance
res.aov <- aov(count_err ~ algo, data = data001)
# Summary of the analysis
summary(res.aov)

TukeyHSD(res.aov)


#TWO-WAY ANOVA
library(dplyr)

library(ggplot2)
library(magrittr)
library("ggpubr")

pdf('plotAll10.pdf')
ggdotplot(data10, x = "max", y = "count_err",
          fill="algo", color = "algo", merge = "flip",
       palette = c("#000000", "#00FF00", "#0000FF", "#FF0000"),
       xlab = "EPS", ylab = "Quant. Errors", binwidth = 10)
dev.off()

pdf("test.pdf")
ggboxplot(data10, x = "eps", y = "count_err", color = "algo",
          palette = c("#000000", "#00FF00", "#0000FF", "#FF0000"),
          xlab = "EPS", ylab = "Quant. Errors")
dev.off()

pdf("plotBoxTwoWayMaxEps.pdf")
ggboxplot(data10, x = "eps", y = "max", color = "algo",
          palette = c("#0055BB", "#E75500", "#E7AF00", "#00B8BB"))
dev.off()

pdf("test.pdf")
ggline(data10, x = "eps", y = "max", color = "algo", 
       add = c("mean_se"),
       palette = c("#0055BB", "#E75500", "#E7AF00", "#00B8BB"))
dev.off()


pdf("test.pdf")
ggline(data10, x = "eps", y = "count_err", color = "algo",
       add = c("mean_se"),
       palette = c("#0055BB", "#E75500", "#E7AF00", "#00B8BB"),
       xlab = "EPS", ylab = "Quant. Errors")
dev.off()

pdf("test.pdf")
ggboxplot(data001, x = "id", y = "count_err", color = "algo",
       add = c("mean_se"),
       palette = c("#0055BB", "#E75500", "#E7AF00", "#00B8BB"),
       xlab = "EPS", ylab = "Quant. Errors")
dev.off()

pdf("plotBoxTwoWayCountError10000.pdf")
boxplot(count_err ~ algo, data = data001, 
        xlab = "Algorithm",
        ylab = "Quant. Errors", 
        main = "Boxplot - Amount of Errors",
        notch = TRUE, 
        varwidth = TRUE, 
        col = c("blue", "red", "yellow","green"),
        names = c("b","i","m","q")
)
dev.off()

pdf("plotBoxTwoWayMax10000.pdf")
boxplot(max ~ algo, data = data001, 
        xlab = "Algorithm",
        ylab = "Length Array", 
        main = "Boxplot - Max. Sorted Array",
        notch = TRUE, 
        varwidth = TRUE, 
        col = c("blue", "red", "yellow","green"),
        names = c("b","i","m","q")
)
dev.off()

pdf("plotBoxOneWayCountErr10000.pdf")
ggline(data001, x = "algo", y = "count_err", 
       add = c("jitter"), 
       xlab = "Algorithm",
       ylab = "Quant. Errors", 
       palette = c("#0000FF", "#FF0000", "#00FFFF","#00FF00"),  
       order = c("bubble", "insertion", "merge", "quick"),
       color = "algo")
dev.off()

library("ggpubr")

pdf("plotBoxOneWayMax10000.pdf")
ggboxplot(data001, x = "algo", y = "max", 
       add = c("jitter"), 
       xlab = "Algorithm",
       ylab = "Length Array", 
       palette = c("#0000FF", "#FF0000", "#00FFFF","#00FF00"),  
       order = c("bubble", "insertion", "merge", "quick"),
       color = "algo")
dev.off()

rlang::last_error()
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

