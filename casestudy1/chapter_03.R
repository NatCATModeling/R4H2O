## R4H2O: Data Science for Water Professionals
## Chapter 3: Exploring data

library(tidyverse)

# load data
gormsey <- read_csv("casestudy1/gormsey.csv")

View(gormsey)

gormsey

names(gormsey)

dim(gormsey)

nrow(gormsey)
ncol(gormsey)

# Subset
gormsey[, 4:5]
gormsey[12:18, ]

gormsey[nrow(gormsey), ]

# Filter
turbidity <- filter(gormsey, Measure == "Turbidity")

nrow(filter(turbidity, Town != "Strathmore" & Result > 0.1))

table(gormsey$Town)

table(gormsey$Measure)

turbidity_count <- count(turbidity, Sample_Point)
turbidity_count
