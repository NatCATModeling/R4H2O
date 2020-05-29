# Working with Dates and Times {#posix}

Digital Metering data is a time series as each data point is indexed by the time of the measurement. The data in this case study is an equally-spaced time series, which means that all time intervals are the same. In reality, most time-series data is irregular, which complicates the analysis.

Analysing a time series is a specialised task for which many packages exist in R. One of the necessary skills you need to analyse a time series is to work with time and data variables. The R language has extensive functionality to work with dates and times, and the Tidyverse contains the *lubridate* package to 'lubricate' working with these complex data types.

### Times and Dates
Computers store times and dates as a number of seconds from an origin, usually 1 January 1970. The underlying data for all time and date variables is thus a large integer from the starting point.

There are two fundamental units of time-based variables: dates and POSIX. POSIX is a standard for computer data that includes dates and times. A POSIX variable includes both a date and a time, e.g. "15 Jul 2019 13:41:36 AEST".

When you glimpse the flow data frame you see that the `TimeStamp` variable is a dttm (date and time) variable. If we, for example want to filter the data for only the month of May we can use:

{format: r, line-numbers: false}
```
filter(flow, TimeStamp >= as.Date("2069-05-01"), TimeStamp <= as.Date("2069-05-31"))
```

The `as.Date()` function converts the character string to a date. By defaults, dates are written in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format (YYY-MM-DD).

When a variable is registered as a date, you can also use arithmetic functions to calculate time differences.

Q> How many days has somebody who was born on 13 March 1977 lived? Use the `as.Date()` function to create two variables.

Please note that the results of a calculation with dates and times is of a special variable class. To use this result in further calculations you need to convert it to a numerical value by using the `as.numeric()` function.

T> Try to take the square root of the time difference and review the result. Then convert it with `as.numeric()` and try again.

{format: r, line-numbers: false}
```
sqrt(d)

sqrt(as.numeric(d))
```

Q> Filter the data for the first 14 days of June and group the consumption by date. Visualise the total consumption for all services. Note that you need to convert the date-time variable to a date to be able to group all flows by the date.

The R language has extensive functionality to create and manipulate time data, which are outside the scope of this course. In the following section we look at some functions in the Tidyverse to manage dates and times.


### Monthly consumption
The Tidyverse contains the *lubridate* package which makes working with dates and times a little easier. This next example groups the data in the data frame by month and adds the total flows.

The month function converts a date to the number of the month. For example,  `month(as.Date("2019-07-17"))` results in the number 7. The *lubridate* package has many functions to convert dates. In a similar way, you can extract the year and day from a date.

T> Use the `year()` and `day()` functions with a random date.

{format: r, line-numbers: false}
```
year(as.Date("2019-07-17"))
day(as.Date("2019-07-17"))
```

You can find out much more about this package on the [lubridate website](https://lubridate.tidyverse.org/), including a cheat sheet to help you navigate the myriad of functions.

{format: r, line-numbers: false}
```
library(lubridate)

flow %>%
    group_by(Month = month(TimeStamp, label = TRUE, abbr = TRUE)) %>%
    summarise(Consumption = sum(Flow) / 1000) %>%
    ggplot(aes(factor(Month), Consumption)) + 
    geom_col(fill = "dodgerblue4") + 
    labs(title = "Monthly consumption",
         x = "Month", y = "Consumption [kL]")
```

![Figure 7.5: Monthly flow]()

X> Reverse-engineer this code to understand how it functions.

## Leak Detection
One of the advantages of monitoring water consumption hourly is that we can quite easily find properties with suspected leaks. Water consumption is a direct reflection of consumer behaviour an with some simple assumptions we can identify anomalous consumption patterns, such as leaks.

The model diurnal curve for a residential property (Figure 7.1) has one or more periods without any water consumption. People sleep for at least one period per day and many houses are unoccupied during the day.

This assumption implies that for any property where the minimum flow rate in a day was not zero, the inhabitants either were using water over a very long period, or there was another reason for this flow unrelated to human behaviour, i.e. a leak.

Leak detection always occurs over a certain period. In this case study we use data from the whole year. In reality you would hope that leaks last a lot shorter than a whole year. 

The resolution of the data is five litres per hour. This means that we can only find substantial leaks. A dripping tap account for only about fiver litres per day, which is invisible at this resolution.

Q> Write a Tidyverse pipe that finds properties with a suspected leak and the extent of the leakage. Hint: group the data by service

D> If you analyse the data over a short period of time, what could be other reasons for continuous water flow?

