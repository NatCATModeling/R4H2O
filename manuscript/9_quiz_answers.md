# Quiz Answers {#answers}
## Quiz 2: Channel Flows
### Question 1: What is the flow in the channel in megalitres per day when the height `h = 100mm`$?
We need to covert the level from millimetres to metres and enter this into the formula. The result will be in m^3/s and needs to be converted to megalitres per day.

{format: r, line-numbers: false}
```
b <- 0.6
Cd <- 0.6
h <- 100 / 1000
q <- (2/3) * Cd * sqrt(2 * 9.81) * b * h^(3/2)  # m3 / s
q * 3600 * 24 / 1E3  # ML / day
```

### Question 2: What is the average flow for these multiple heights?
The heights are 150mm, 136mm, 75mm in litres per second? We can use vector operations to use the formula only once. Because we are in the console, you can recall the formula by using the up arrow a few times. The result will also be a vector and we can calculate the average with the `mean()` function.

{format: r, line-numbers: false}
```
h <- c(150, 136, 75) / 1000 # Heights in meters
q <- (2/3) * Cd * sqrt(2 * 9.81) * b * h^(3/2)
mean(q) * 1000
```

### Question 3: Which of these expressions calculates the flow in cubic meters per second for all heights (`h`$) between 50mm and 500mm? 
We can store all the heights in a vector using the semi-colon. The result will be a large vector with flows. 

The first option is incorrect because the colon can only be use with integers.

The second option is correct.

The third option is a silly suggestion as we need to repeat the formula 451 times.

a) `(2/3) * Cd * sqrt(2 * 9.81) * b * (0.05:0.50)^(3/2)`
B) `(2/3) * Cd * sqrt(2 * 9.81) * b * ((50:500)/1000)^(3/2)`
c) Repeat for each value of `h`$: `(2/3) * Cd * sqrt(2 * 9.81) * b * h^(3/2)`

## Quiz 2: Water Quality Regulations
The first step is to load the Gormsey data:

{format: r, line-numbers: false}
```
gormsey <- read.csv("session2/gormsey.csv")
```
### Question 1: How many results does the Gormsey data contain?
The `dim()` or `nrow()` function gives the number of rows in the data frame. This function indicates that the Gormsey data has 2879 rows.

This solutin assumes that all values are indeed available, which is the case in this data. The next case study discusses missing data.

{format: r, line-numbers: false}
```
dim(gormsey)
nrow(gormsey)
```

### Question2: How many E Coli results were recorded?
We can compare each of the entries of the `measure` variable with "E Coli". This comparison results in a vector of boolean values. The `sum()` function results in the number of TRUE values because they count as 1 and FALSE counts as 0. The Gormsey data has 1470 E Coli results.

{format: r, line-numbers: false}
```
sum(gormsey$Measure == "E Coli")
```

### Question 3: What is the data type of the Zone field?
Look at the structure of the data frame with the `str()` function. The data type is shown after the colon. The Zone field is a factor variable.

{format: r, line-numbers: false}
```
str(gormsey)
```

### Question 4: How many E Coli results breached the regulations?
To answer this question we eed to find all E COli results with a value larger than zero and count them. There are two such results.

{format: r, line-numbers: false}
```
nrow(gormsey[gormsey$Measure == "E Coli" & gormsey$Result > 0, ])
```

### Question 5: What is the median THM value for the Gormsey system?
The `median()` function provides the answer. All we need to do next is to subset the result vector for THM data.

{format: r, line-numbers: false}
```
median(gormsey$Result[gormsey$Measure == "THMs"])
```

### Question 6: Which zone has breached the Victorian regulations for THM?
We can visualise the data to have a quick look. The red line inddicates the maximum. 
The subset function filters the Gormsey data for all THM results that breach the regultions. The numeric result confirms that the Merton water quality zone has two values larger than 0.25 mg/l.

{format: r, line-numbers: false}
```
boxplot(Result ~ Zone, data = subset(gormsey, Measure == "THMs"))
abline(h = 0.25, col = "red")
subset(gormsey, Measure == "THMs" & Result > 0.25)
```

### Question 7: How many sample points have been used in the Pontybridge zone?
The `length()` function counts the nuber of elements in a vector. The `unique()` function shows each element of the vector only once.removes all duplicates from the vector.

{format: r, line-numbers: false}
```
length(unique(gormsey$Sample_Point[gormsey$Zone == "Pontybridge"]))
```

### Question 8: Which zone shows the highest level of turbidity?
turbidity <- subset(gormsey, Measure == "Turbidity")
boxplot(Result ~ Zone, data = turbidity)
turbidity[turbidity$Result == max(turbidity$Result), ]

### Question 9: What is the lowest level of turbidity measured in the system?
min(turbidity$Result)

### Question 10: What is the 95^th^ percentile of the turbidity for each zone in the Gormsey system, using the Weibull method?
aggregate(turbidity$Result, list(turbidity$Zone), quantile, 0.95, method = 6)



