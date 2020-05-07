# Introduction to the R Language {#basics}

Just like learning a human language, studying a computer language means that you need to memorise the vocabulary and grammar (syntax). While mastering the syntax of R might seem daunting, the RStudio development environment helps you with writing code.




## Libraries in R
One of the most powerful features of the R language is that developers can write extensions, the so-called libraries. R has a large community of users who develop code and make it freely available to other users in the form of packages.

Thousands of specialised packages undertake a vast range of specialised tasks. You can, for example, use R as a GIS and analyse spatial data or implement machine learning. Other packages help you to access data from various sources, such as SQL databases.

The majority of R packages are available on [CRAN](https://cran.r-project.org/), the *Comprehensive R Archive Network*. You can install packages within RStudio using the *Tools*>*Install Packages* menu option.

### Libraries for water management
The CRAN library contains many packages with functions to analyse water. This workshop does not cover any of these packages. The list below gives some examples:

* [baytrends](https://cran.r-project.org/web/packages/baytrends/index.html): Long Term Water Quality Trend Analysis.
* [biotic](https://cran.r-project.org/web/packages/biotic/index.html): Calculation of Freshwater Biotic Indices.
* [CityWaterBalance](https://cran.r-project.org/web/packages/CityWaterBalance/index.html): Track Flows of Water Through an Urban System.
* [driftR](https://cran.r-project.org/web/packages/driftR/index.html): Drift Correcting Water Quality Data.
* [EmiStatR](https://cran.r-project.org/web/packages/EmiStatR/index.html): Emissions and Statistics in R for Wastewater and Pollutants in Combined Sewer Systems.

### The Tidyverse
One of the most popular series of packages is the [Tidyverse](https://www.tidyverse.org/), developed by R guru Hadley Wickham and many others.

The Tidyverse packages provide additional functionality to extract, transform, visualise and analyse data. The features offered by these packages are easier to use and understand than the base R code.

This case study discusses cleaning and visualising customer data. The next case study uses Tidyverse to analyse smart metering data.

You can install packages in R with the `install.packages()` function. Within RStudio you can install packages in the *Tools* menu. Before you can start using a library, you need to initiate it with the `library()` command.

T> Install the Tidyverse collection of packages using `install.packages(tidyverse)`. When completed, initiate it with `library(tidyverse)`.

Installing the complete Tidyverse can take a little while, depending on your computer and the operating system. If you have problems installing, make sure that you are connected to the internet.

When you load the Tidyverse, the following packages are loaded by default:
* [dplyr](https://dplyr.tidyverse.org/): Data manipulation.
* [ggplot2](https://ggplot2.tidyverse.org/): Visualise data.
* [forcats](https://forcats.tidyverse.org/): Working with factor variables.
* [purrr](https://purrr.tidyverse.org/): Functional programming. 
* [readr](https://readr.tidyverse.org/): Read and write CSV files.
* [stringr](https://stringr.tidyverse.org/): Manipulate text.
* [tibble](https://tibble.tidyverse.org/): Replacement for data frames.
* [tidyr](https://tidyr.tidyverse.org/): Data transformation.

Some data scientists prefer not to load the complete set of packages and choose to load each one separately to spare computer memory. This course does not discuss the *purrr*, *stringr* or *forcats* libraries. Many other packages are available that follow the principles of the Tidyverse. 

Doing 'tidy' data science has a strong following. Tidy data science relates to cleaning data in a specific way and writing code that is easy to read.

The startup message also shows some warnings about conflicts with some of the base functionality, which we can ignore for now.

The Tidyverse developers frequently update the software. You can see if updates are available, and optionally install them, by running `tidyverse_update()`. You can also upgrade packages in the *Tools > Check for Package Updates* in RStudio.

The [next chapter](#casestudy1) details the first case study, which deals with a water quality problem. The remainder of the course uses the Tidyverse functionality to read, clean, analyse and present data.
