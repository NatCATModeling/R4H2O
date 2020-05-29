# Quiz 3

library(tidyverse)
gormsey <- read_csv("casestudy1/gormsey.csv")

# What is the median THM value for all towns in Gormsey?
thm <- filter(gormsey, Measure == "THMs")
median(thm$Result)

# Which zone has breached the Victorian regulations for THM? The limit is 0.25 mg/l.
thm_town <- group_by(thm, Town)
thm_mean <- summarise(thm_town, mean_thm = max(Result))
filter(thm_mean, mean_thm > 0.25)

# Which zone in the Gormsey system shows the highest level of turbidity?
turb_town <- filter(group_by(gormsey, Town), Measure == "Turbidity")
turb_max <- summarise(turb_town, max_turb = max(Result))
filter(turb_max, max_turb == max(max_turb))

# What is the lowest level of turbidity measured in the Gormsey?
turbidity <- filter(gormsey, Measure == "Turbidity")
min(turbidity$Result)

# What is the highest 95^th^ percentile of the turbidity for each zone in the Gormsey system, using the Weibull method?
turbidity_town <- group_by(turbidity, Town)
turbidity_town_p95 <- summarise(turbidity_town, p95 = quantile(Result, 0.95, method = 6))
filter(turbidity_town_p95, p95 == max(p95))

