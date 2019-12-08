## Percentiles example

## Create data
sample <- c(1:17, 63, 170, 300)

## Set parameters
n <- length(sample)
p <- 0.95

## Visualise
plot(sample, type = "b", 
     main = "Percentile example", 
     sub = "Weibull (red) and Excel (blue)")

## Calculate rank
r_weibull <- p * (n + 1)
r_excel <- 1 + p * (n - 1)

## Interpolate percentiles
x_weibull <- (1 - (r_weibull - floor(r_weibull))) * sample[floor(r_weibull)] + (r_weibull - floor(r_weibull)) * sample[ceiling(r_weibull)]
x_excel <- (1 - (r_excel - floor(r_excel))) * sample[floor(r_excel)] + (r_excel - floor(r_excel)) * sample[ceiling(r_excel)]

## Visualise
abline(v = r_weibull, col = "red")
abline(v = r_excel, col = "blue")

## R
x_r <- sapply(1:9, function(t) quantile(sample, 0.95, type = t))
weibull <- which(x_r == x_weibull)
excel <- which(x_r == x_excel)
