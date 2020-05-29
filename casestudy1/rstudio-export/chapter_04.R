## Chapter 4: Descriptive Statistics

# Load data
library(tidyverse)
gormsey <- read_csv("casestudy1/gormsey.csv")

# Summarise a vector
summary(gormsey$Result)

# What is the mean turbidity result in Pontybridge?
turbidity_pontybridge <- filter(gormsey, Town == "Pontybridge" & Measure == "Turbidity")
mean(turbidity_pontybridge$Result)

# Other descriptive statistics
median(turbidity_pontybridge$Result)
sd(turbidity_pontybridge$Result)
min((turbidity_pontybridge$Result))
max(turbidity_pontybridge$Result)
range((turbidity_pontybridge$Result))

# Percentiles (quantiles)
quantile(turbidity_pontybridge$Result, 0.95)
quantile(turbidity_pontybridge$Result, c(0.50, 0.95))

# What is the 33rd percentile for the THM in Paethsmouth?
thm_pathsmouth <- filter(gormsey, Town == "Paethsmouth", Measure == "THMs")
quantile(thm_pathsmouth$Result, 0.33)

# Grouped analysis
gormsey_grouped <- group_by(gormsey, Town, Measure)
summarise(gormsey_grouped, mean = mean(Result))



