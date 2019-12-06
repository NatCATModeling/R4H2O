## Channel flow

## Measurements
b <- 0.6 # Width

## Constant
Cd <- 0.6 # approximation

## Question 1
h <- 100 / 1000 # Height in m
q <- (2/3) * Cd * sqrt(2 * 9.81) * b * h^(3/2)  # m3 / s
q * 3600 * 24 / 1E3  # ML / day

## Question 2
h <- c(150, 136, 75) / 1000
q <- (2/3) * Cd * sqrt(2 * 9.81) * b * h^(3/2)
mean(q) * 1000 # l/s

## Question 3
h <- (50:500) / 1000
q <- (2/3) * Cd * sqrt(2 * 9.81) * b * h^(3/2)
q

## Enhanced code
plot(h, q, type = "l")

## Fancy version using a function
kindsvater_carter <- function(b, h, Cd = 0.6) {
    (2/3) * Cd * sqrt(2 * 9.81) * b * h^(3/2)
}

kindsvater_carter(0.6, 0.1)
