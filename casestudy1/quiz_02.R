# Quiz 2

library(tidyverse)
gormsey <- read_csv("casestudy1/gormsey.csv")

# How many results does the Gormsey data contain?
nrow(gormsey)
  
# How many E. coli results were recorded in Gormsey? 
nrow(filter(gormsey, Measure == "E. coli"))

# What is the data type of the Town field?
glimpse(gormsey)  

# How many E Coli results breached the regulations? The limit for E Coli is 0 org/100ml.
filter(gormsey, Measure == "E. coli" & Result > 0)

# How many distinct measures are present in the data?
unique(gormsey$Measure)  
