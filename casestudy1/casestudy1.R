## Case Study 1: Water Quality Regulations

## Initialise the Tidyverse libraries
library(tidyverse)

## LOAD
turbidity <- read_csv("casestudy1/turbidity_laanecoorie.csv")

## INSPECT
turbidity

names(turbidity) ## Variable names

dim(turbidity) ## Dimensions

nrow(turbidity) ## Number of rows (observations)

ncol(turbidity) ## Number of columns (variables)

glimpse(turbidity) ## Show the structure of the data frame

View(turbidity) ## View the results in a separate window

## EXPLORE
turbidity$Result ## All results in a vector

length(turbidity$Result)

turbidity$Result[1:10] ## First ten results in a vector

unique(turbidity$Zone)

table(turbidity$Zone)

## What is the result of the last sample taken in the turbidity?
turbidity$Result[nrow(turbidity)]

## Filter a data frame
filter(turbidity, Zone == "Bealiba") ## All results for Bealiba

filter(turbidity, Zone == "Laanecoorie" & Result > 1)

## How many turbidity results, except for  Bealiba, are lower than to 0.1 NTU?
nrow(filter(turbidity, Zone != "Bealiba" & Result < 0.1))

## ANALYSE

## Summary statistics
summary(turbidity$Result)

## What is the mean turbidity value for the samples in Bealiba?
turbidity_bealiba <- filter(turbidity, Result, Zone == "Bealiba")
mean(turbidity_bealiba$Result)

## What is the third quartile for the turbidity of sample point 090A01?
p090a01 <- filter(turbidity, Sample_Point == "090A01")
quantile(p090a01$Result, 0.75)

## What is the 95th percentile, using the Weibull method?
quantile(turbidity$Result, 0.95, type = 6) ## Weibull method

## GROUPING
turb_zones <- group_by(turbidity, Zone)
summarise(turb_zones, p95 = quantile(Result, 0.95, type = 6),
          Maximum = max(Result))

## Visualise
ggplot(turbidity, aes(Zone))
ggsave("manuscript/resources/session4/zones_canvas.png", width = 4, height = 3)

ggplot(turbidity, aes(Zone)) + 
    geom_bar()
ggsave("manuscript/resources/session4/zones_bars.png", width = 4, height = 3)

ggplot(turbidity, aes(Date_Sampled, Result, col = Zone)) + 
    geom_line()
ggsave("manuscript/resources/session4/time_series.png", width = 5, height = 3)


ggplot(turbidity, aes(Zone, Result, fill = Zone)) + 
    geom_boxplot()
ggsave("manuscript/resources/session4/boxplot.png", width = 5, height = 3)


ggplot(turbidity, aes(Date_Sampled, Result)) + 
    geom_line(col = "blue") + 
    facet_wrap(~Zone, ncol = 1)
ggsave("manuscript/resources/session4/facets.png", width = 5, height = 3)


ggplot(turbidity, aes(Date_Sampled, Result)) + 
    geom_smooth() + 
    geom_line() + 
    geom_hline(yintercept = 1, col = "Red") + 
    facet_wrap(~Zone, ncol = 1)
ggsave("manuscript/resources/session4/stats.png", width = 6, height = 4)


ggplot(turbidity, aes(Date_Sampled, Result)) + 
    geom_line() + 
    facet_wrap(~Zone, ncol = 1) + 
    theme_void()
ggsave("manuscript/resources/session4/sparklets.png", width = 4, height = 3)

ggplot(filter(turbidity, Zone == "Bealiba"), aes(Date_Sampled, Result)) + 
    geom_line() +
    labs(title = "Turbidity Results", 
         subtitle = "Bealiba customer taps",
         x = "Date sampled", y = "NTU") + 
    theme_bw()
ggsave("manuscript/resources/session4/labels.png", width = 4, height = 3)











