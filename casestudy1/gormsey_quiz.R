## Quiz 2: Water Quality Regulations

library(tidyverse)

## Read data
gormsey <- read_csv("casestudy1/gormsey.csv")

## Question 1: How many results does the Gormsey data contain?
dim(gormsey)
nrow(gormsey)

## Question2: How many E Coli results were recorded?
ecoli <- filter(gormsey, Measure == "E Coli") # Create a new data frame
nrow(ecoli) # How many entries?

## Question 3: What is the data type of the Zone field?
glimpse(gormsey)
class(gormsey$Zone) ## Aditional function to extract the data type

## Question 4: How many E Coli results breached the regulations?
nrow(filter(ecoli, Result > 0))

## Question 5: What is the median THM value for the Gormsey system?
thm <- filter(gormsey, Measure == "THMs")
median(thm$Result)

## Question 6: Which zone has breached the Victorian regulations for THM?
breach_thm <- filter(thm, Result > 0.25)
unique(breach_thm$Zone)

## Question 7: How many sample points have been used in the Pontybridge zone?
pontybridge <- filter(gormsey, Zone == "Pontybridge")
length(unique(pontybridge$Sample_Point))

## Question 8: Which zone shows the highest level of turbidity?
gormsey_turbidity_max <- filter(gormsey, Measure == "Turbidity" & Result == max(Result))
gormsey_turbidity_max$Zone

## Question 9: What is the lowest level of turbidity measured in the system?
gormsey_turbidity <- filter(gormsey, Measure == "Turbidity")
min(gormsey_turbidity$Result)

## Question 10: What is the highest 95^th^ percentile of the turbidity for each zone in the Gormsey system, using the Weibull method?
turbidity_zones <- group_by(gormsey_turbidity, Zone)
percentiles <- summarise(turbidity_zones, p95 = quantile(Result, 0.95, type = 6))
max(percentiles$p95)
