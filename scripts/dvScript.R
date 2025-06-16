# 1. Load required libraries
library(tidyverse)
library(janitor)
# Read in the 2020 file
injury_2020 <- read_csv("metadataRemoved_DV_Injury_Type_2020_CO_Counties.csv") %>%
  clean_names() 
glimpse(injury_2020)
# Load all 5 years of DV injury data
file_list <- list.files(
  path = ".",  # current folder
  pattern = "metadataRemoved_DV_Injury_Type_\\d{4}_CO_Counties\\.csv",
  full.names = TRUE
)

injury_data <- file_list %>%
  set_names() %>%
  map_dfr(~ read_csv(.x) %>%
            clean_names() %>%
            mutate(year = str_extract(.x, "\\d{4}"))
  )
# Data Exploration
names(injury_data)
count(injury_data, year, x1)
unique(injury_data$x1)

#Reshape to long format
injury_long <- injury_data %>%
  pivot_longer(
    cols = ends_with("_county"),      # Grab all county columns
    names_to = "county",              # Make a new column called 'county'
    values_to = "injury_count"        # Move values into a column called 'injury_count'
  ) %>%
  rename(injury_type = x1)            # Rename x1 to something meaningful

# View result
glimpse(injury_long)
count(injury_long, year)
count(injury_long, injury_type)

# Sanity Check Results
injury_long %>%
  count(year, injury_type) %>%
  print(n = Inf)
