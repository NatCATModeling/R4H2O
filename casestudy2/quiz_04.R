## R4H2O: Data Science for ater Professionals
## Quiz 4: Cleaning data

## 1. You receive a CSV file from a colleague. The first five rows of this data look like the table below. How do you read this CSV file into memory?

read_csv("casestudy2/quiz4.csv", skip = 1)

## 2. You want to write a single piece of code that reads a CSV file and removes the second column. What is the best way to achieve this?

df <- read_csv("casestudy2/quiz4.csv", skip = 1) %>% select(-2)

## Employee survey
rawdata <- read_csv("casestudy2/employee_suvey.csv")
dim(rawdata)
employees <- rawdata[-1,] %>%
    type_convert() %>%
    filter(consent == 1) %>%
    select(-2:-11) %>%
    rename(id = V1)

## 3. How many employees did not consent?
count(rawdata[-1, ], consent)
nrow(employees)

## 4. How many respondents have both engineering and marketing qualifications?
filter(employees, engineer == 1 & marketing == 1) %>%
    nrow()

## 5. You want to visualise the number of respondents by department
ggplot(employees, aes(department)) +
    geom_bar()

