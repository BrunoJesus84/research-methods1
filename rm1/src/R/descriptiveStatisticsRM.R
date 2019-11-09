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

# Summary of Amount of Classification Errors
summary(dataset$max_sorted)

plot(density(farmer$count))

summary(farmer$current_average)

# SAMPLES QUANTITAVIVE
table(farmer$id)

# SAMPLES X STAGE
table(farmer$id, farmer$battery_stage)

# install.packages("corrplot")

cov(farmer$id, farmer$battery_level)

plot(farmer)