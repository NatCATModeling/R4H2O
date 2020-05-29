# Grouping example

library(tibble)

df <- tibble(group = rep(c(1, 2), 3),
             val = c(12, 34, 43, 76, 5, 12))
df

df_grouped <- group_by(df, group)

df_grouped

summarise(df_grouped, mean_val = mean(val))

