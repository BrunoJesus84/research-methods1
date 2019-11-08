install.packages("moments")

# Set working diretory
setwd("C:/Users/macruz/workspace-doctorate/db")

# Loading dataset
farmer <- read.table(
  file = "dataSetCountProcessWithDateLong1000.csv",
  header = TRUE,
  sep = ",",
  quote = "\""
)

# Peek at data
head(farmer)

# Look at column names
names(farmer)

# Rename variables (i.e column 2)
names(farmer)[2] <- "sample"

summary(farmer$count)

plot(density(farmer$count))

summary(farmer$current_average)

# SAMPLES QUANTITAVIVE
table(farmer$id)

# SAMPLES X STAGE
table(farmer$id, farmer$battery_stage)

# install.packages("corrplot")

cov(farmer$id, farmer$battery_level)

plot(farmer)