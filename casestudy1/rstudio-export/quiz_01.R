## Quiz 1: Explore Case Study 1 data

## Load the data
library(tidyverse)
gormsey <- read_csv("casestudy1/gormsey.csv")

## How many results does the Gormsey data contain?
nrow(gormsey)

## How many E. coli results were recorded in the Gormsey system? 
e.coli <- filter(gormsey, Measure == "E. coli")
nrow(e.coli)

## What is the data type of the Town field?
glimpse(gormsey)

## How many E Coli results breached the regulations? The limit for E Coli is 0 org/100ml.
filter(e.coli, Result > 0)

# What is the highest level of turbidity measured in these towns?
turbidity <- filter(gormsey, Measure == "Turbidity")
max(turbidity$Result)

max(gormsey$Result)
