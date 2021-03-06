# Functions {#functions}

In the chapter about the [basics](#basics) of the R language you had to repeatedly run the same expression to convert a level measurement to a flow. As a general rule, if you need to write the same code more than twice, then there must be a better way. Not only does it take time to write repetitive code, more importantly, duplicate code increases the risk of bugs. 

Functions are a way to reuse bits of code. You can use functions to make your own code easier to write and understand. You can also use functions to share methods you developed to analyse specific problems with other water professionals. R packages essentially consist of libraries of functions written in the R language itself.

This session introduces building functions to streamline your code. The learning objectives for this session are:
* Recognise instances where a function is useful
* Identify the basic elements of a function
* Develop functions in the R language

## Function basics
The R language is in essence a library of functions. A function is a section of code that we can evaluate. 

In the first coding chapter, you reused a bit a code to covert he water level in an open channel to a flow several times. The code below provides a function that calculates the flow in a channel with a given height `h`$, width `b`$ and discharge factor `C_d`$. This function implements the Kindsvater-Carter formula explained in [chapter 2](#bascis). 

After you run the code that defines the function, you can use it to easily convert levels to flow. The function definition contains several parts. You assign the function to a variable with the `function()` syntax. Between the brackets, you can identify the parameters that the function uses. In this case, the function uses three variables: `h`, `b` and `cd`. 

The actual code of the function is listed between curly braces. In this function, we first define the variable `q`. The last line the returns that value as the result of the function. The codes between curly braces can be as complex as you like. 

{format: r, line-numbers: false} 
```
channel_flow <- function(h, b, cd = 0.6){
    q <- (2/3) * cd * sqrt(2 * 9.81) * b * h^(3/2)
    return(q)
}

channel_flow(0.12, 0.6)
```

When you call the function, R expects you to either explicity assign the variables or keep them in the same order.



## 


## Lexical Scoping

{format: r, line-numbers: false} 
```
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
```




## Leak Detection
One of the advantages of monitoring water consumption hourly is that we can quite easily find properties with suspected leaks. Water consumption is a direct reflection of consumer behaviour an with some simple assumptions we can identify anomalous consumption patterns, such as leaks.

The model diurnal curve for a residential property (Figure 7.1) has one or more periods without any water consumption. People sleep for at least one period per day and many houses are unoccupied during the day.

This assumption implies that for any property where the minimum flow rate in a day was not zero, the inhabitants either were using water over a very long period, or there was another reason for this flow unrelated to human behaviour, i.e. a leak.

Leak detection always occurs over a certain period. In this case study we use data from the whole year. In reality you would hope that leaks last a lot shorter than a whole year. 

The resolution of the data is five litres per hour. This means that we can only find substantial leaks. A dripping tap account for only about fiver litres per day, which is invisible at this resolution.

Q> Write a Tidyverse pipe that finds properties with a suspected leak and the extent of the leakage. Hint: group the data by service

D> If you analyse the data over a short period of time, what could be other reasons for continuous water flow?

