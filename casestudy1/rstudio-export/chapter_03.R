## Case Study 1: Water Quality Regulations

## Initialise the Tidyverse libraries
library(tidyverse)

## LOAD
gormsey <- read_csv("casestudy1/gormsey.csv")

## INSPECT
names(gormsey) ## Variable names

dim(gormsey) ## Dimensions

nrow(gormsey) ## Number of rows (observations)

ncol(gormsey) ## Number of columns (variables)

gormsey # View the data

glimpse(gormsey) ## Show the structure of the data frame

View(gormsey) ## View the results in a separate window

## EXPLORE
gormsey$Result ## All results in a vector

gormsey$Result[1:10] ## First ten results in a vector

gormsey[, 4:5] # Show column 4 and 5
gormsey[12:18, ] # Show rows 12 to 18

gormsey[nrow(gormsey), ] # Show the last row

# Show only turbidiy results
gormsey[gormsey$Measure == "Turbidity", ]
filter(gormsey, Measure == "Turbidity")

# Show turbidity results greater than 1 in Stratehmore
filter(gormsey, Town == "Strathmore" & Measure == "Turbidity" & Result > 1)

# How many turbidity results in all Towns, except Strathmore, are lower than 0.1 NTU?
nrow(filter(gormsey, Town != "Strathmore" & Result < 0.1))

# Counting results
table(gormsey$Town)

## What is the result of the last sample taken in the gormsey?
gormsey$Result[nrow(gormsey)]

turbidity <- filter(gormsey, Measure == "Turbidity")
turbidity_count <- count(turbidity, Town)
turbidity_count

# Length and unqiue values in a vector
length(gormsey$Measure)
unique(gormsey$Measure)

