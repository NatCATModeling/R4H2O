## R4H2O: Data Science for Water Professionals
## Quiz 5

## Question 1
mean(c(100, 50, 25, NA, 25), na.rm = TRUE)

## Question 4
library(tidyverse)
customers <- read_csv("casestudy2/customer_survey_clean.csv")
names(customers)
customers %>%
    select(hardship, contact) %>%
    pivot_longer(1:2) %>%
    filter(is.na(value)) %>%
    count(name) %>%
    summarise(Missing = sum(n))
    

