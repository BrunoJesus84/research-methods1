# Set working diretory
setwd("C:/Users/macruz/workspace-doctorate/db")

# Loading dataset
farmer <- read.table(
  file = "dataSet1000countAllProcess.csv",
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

plot(density(farmer$count))
