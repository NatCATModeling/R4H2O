# Functions


## Lexical Scoping

y <- 12

f <- function(x) {
    y <- x^2
    y
}

f(10)
y

f <- function(x) {
    y <<- x^2
    y
}

f(10)
y

