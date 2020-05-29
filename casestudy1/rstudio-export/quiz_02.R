## Quiz 2: Water Quality Regulations

library(tidyverse)

## Read data
gormsey <- read_csv("casestudy1/gormsey.csv")

## Question 1: How many results does the Gormsey data contain?
nrow(gormsey)

## Question2: How many E Coli results were recorded in Gormsey?
ecoli <- filter(gormsey, Measure == "E Coli") # Create a new data frame
nrow(ecoli) # How many entries?

## Question 3: What is the data type of the Zone field?
glimpse(gormsey)
class(gormsey$Town) ## Aditional function to extract the data type

## Question 4: How many E Coli results breached the regulations?
nrow(filter(ecoli, Result > 0))

## Question 5: How many different measures are present in the data?
length(unique(gormsey$Measure))
table(gormsey$Measure)

