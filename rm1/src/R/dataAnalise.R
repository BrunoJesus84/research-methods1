install.packages("moments")

# Set working diretory
setwd("C:\Users\macruz\workspace-doctorate\RM\research-methods1\rm1\src\C")

# Loading dataset
farmer <- read.table(
  file = "data1000.out",
  sep = " ",
  nrows = 1000
)
#data1 <- read.table("messydata.txt", header=FALSE,sep=",", nrows=2, col.names=paste0("C", 1:16) )

summary(farmer)

plot(density(farmer))

# SAMPLES QUANTITAVIVE
table(farmer)
