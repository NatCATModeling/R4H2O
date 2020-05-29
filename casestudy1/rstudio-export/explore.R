## Explore Case Study 1 data

## Load data
library(tidyverse)
gormsey <- read_csv("casestudy1/gormsey.csv")

## Display variable (column) names
names(gormsey)

## Size of the data frame
dim(gormsey)
nrow(gormsey)
ncol(gormsey)

## View the data
glimpse(gormsey)
View(gormsey)
head(gormsey)
tail(gormsey)

## Subset the data
gormsey[, 4:5]  ## Show all rows with column four and five
gormsey[12:18, ] ## Show all variables for row 12 to 18
gormsey[1:10, c("Town", "Result")]
gormsey[nrow(gormsey), ]

## Filter the data (two equivalent ways)
gormsey[gormsey$Measure == "Turbidity", ]
filter(gormsey, Measure == "Turbidity")

filter(gormsey, Town == "Strathmore" & Measure == "Turbidity" & Result > .2)
nrow(filter(gormsey, Town != "Strathmore" & Result < 0.1))

## Counting data
table(gormsey$Measure)

turbidity <- filter(gormsey, Measure == "Turbidity")
turbidity_count <- count(turbidity, Town)
turbidity_count

