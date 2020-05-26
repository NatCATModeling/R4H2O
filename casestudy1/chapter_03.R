# Chapter 3: Load and explore data

# attach libraries
library(tidyverse)

# Load data
gormsey <- read_csv("casestudy1/gormsey.csv")

# Whatis in the data?
gormsey
names(gormsey)
glimpse(gormsey)
View(gormsey)

# How much data?
dim(gormsey)
nrow(gormsey)
ncol(gormsey)

# Subsets of data
gormsey[, 4:5]  ## Show all rows with column four and five
gormsey[12:18, ] ## Show all variables for row 12 to 18

gormsey[nrow(gormsey), ] ## Last row

# Filter data
gormsey[gormsey$Measure == "Turbidity", ]

gormsey$Measure == "Turbidity" # Results in vector of TRUE and FALSE

filter(gormsey, Measure == "Turbidity")
filter(gormsey, Town == "Strathmore" & Measure == "Turbidity" & Result > 1)

# How many turbidity results in all Towns, except Strathmore, are lower than 0.1 NTU?
nrow(filter(gormsey, Town != "Strathmore" & Result < 0.1))

# Counting data
table(gormsey$Measure)

turbidity <- filter(gormsey, Measure == "Turbidity")
turbidity_count <- count(turbidity, Town)
turbidity_count

length(gormsey$Measure)
unique(gormsey$Measure)

