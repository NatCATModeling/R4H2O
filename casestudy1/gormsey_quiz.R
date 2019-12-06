## Quiz 2: Water Quality Regulations

## Correct answer key
## This code randomly generates the order of correct answers
set.seed(1)
sample(LETTERS[1:4], 10, replace = TRUE)

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
boxplot(Result ~ Zone, data = subset(gormsey, Measure == "THMs"))
abline(h = 0.25, col = "red")
breach <- filter(thm, Result > 0.25)
unique(select(breach, Zone))

## Question 7: How many sample points have been used in the Pontybridge zone?
pontybridge <- filter(gormsey, Zone == "Pontybridge")
length(unique(pontybridge$Sample_Point))

## Question 8: Which zone shows the highest level of turbidity?
boxplot(Result ~ Zone, data = gormsey)
filter(gormsey, Measure == "Turbidity" & Result == max(Result))

## Question 9: What is the lowest level of turbidity measured in the system?
min(turbidity$Result)

## Question 10: What is the 95^th^ percentile of the turbidity for each zone in the Gormsey system, using the Weibull method?
turbidity_zones <- group_by(turbidity, Zone)
summarise(turbidity_zones, p95 = quantile(Result, 0.95, method = 6))
