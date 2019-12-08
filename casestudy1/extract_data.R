## Data extracted from Coliban Water data warehouse for session 2 case study

## Libraries
library(RODBC)
library(tidyverse)

## Extract from Data Warehouse
dwh <- odbcDriverConnect("driver={SQL Server};server=DWH;DATABASE=CW_DataWarehouse;trusted_connection=true")
labdata <- sqlQuery(dwh, "SELECT Sample_No, Date_Sampled, Subsite_Code AS Sample_Point, 
                                System, Zone, Measure, Result, Units  
                                FROM WSL_retic_Sample_results 
                                WHERE Subsite_Type='Customer Tap' AND
                                    Measure IN ('Turbidity', 'THMs', 'E Coli') AND
                                    Date_sampled>='2017-01-01' AND 
                                    Date_sampled<='2018-12-31' AND
                                    System IN ('Laanecoorie', 'Bendigo')")
odbcCloseAll()
labdata$Date_Sampled <- as.Date(labdata$Date_Sampled)
write_csv(labdata, "session2/labdata_dwh.csv")

labdata <- read_csv("casestudy1/labdata_dwh.csv")
## Save laanecoorie data
filter(labdata, System == "Laanecoorie" & Measure == "Turbidity") %>%
    select(-System, -Measure) %>%
    write_csv("casestudy1/turbidity_laanecoorie.csv")

## Create fake data
sample_points <- labdata %>%
    filter(System == "Bendigo") %>%
    distinct(Sample_Point, .keep_all = TRUE) %>%
    select(Zone, Sample_Point)

g_zones <- tibble(Zone = unique(sample_points$Zone),
                  Zone_new = c("Southwold",
                               "Wakefield",
                               "Tarnstead",
                               "Blancathey",
                               "Swadlincote",
                               "Merton",
                               "Snake's Canyon",
                               "Bellmoral",
                               "Paethsmouth",
                               "Pontybridge",
                               "Strathmore"))

g_sample_points <- tibble(Sample_Point = unique(sample_points$Sample_Point),
                          Sample_Point_new = paste0("S", 
                                                    sample(1E4:2E4, 
                                                           length(unique(sample_points$Sample_Point)), 
                                                           replace = FALSE)))

gormsey <- sample_points %>% 
    left_join(g_zones) %>% 
    left_join(g_sample_points) %>%
    select(Sample_Point, Zone_new, Sample_Point_new) %>%
    right_join(filter(labdata, System == "Bendigo")) %>%
    select(Sample_No, Date_Sampled, Sample_Point = Sample_Point_new, Zone = Zone_new,
           Measure, Result, Units)

# Modify data
set.seed(1969)

e.coli <- which(gormsey$Measure == "E Coli")
gormsey$Result[sample(e.coli, 2)] <- sample(1:5, 2)
summary(gormsey$Result[gormsey$Measure == "E Coli"])

thms <- which(gormsey$Measure == "THMs" & gormsey$Zone == "Merton")
gormsey$Result[sample(thms, 2)] <- round(runif(2, 0.21, 0.50), 2)
summary(gormsey$Result[gormsey$Measure == "THMs"])

turbidity <- which(gormsey$Measure == "Turbidity" & gormsey$Zone == "Strathmore")
gormsey$Result[sample(turbidity, 7)] <- round(runif(7, 5, 9), 2)
summary(gormsey$Result[gormsey$Measure == "Turbidity"])

# Remove extreme
gormsey$Result[gormsey$Result > 500] <- 5

#write_csv(gormsey, "casestudy1/gormsey.csv")















