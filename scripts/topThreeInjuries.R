

# Domestic Violence Injury Type Trends Analysis (CO, 2020–2024)


# Load required libraries
library(tidyverse)
library(janitor)
library(forcats)
library(ggrepel)

# Load and inspect a single year (for structure confirmation)
injury_2020 <- read_csv("metadataRemoved_DV_Injury_Type_2020_CO_Counties.csv") %>%
  clean_names()
glimpse(injury_2020)

# Load and combine all 5 years of DV injury data (2020–2024)
file_list <- list.files(
  path = ".",
  pattern = "metadataRemoved_DV_Injury_Type_\\d{4}_CO_Counties\\.csv",
  full.names = TRUE
)

injury_data <- file_list %>%
  set_names() %>%
  map_dfr(~ read_csv(.x) %>%
            clean_names() %>%
            mutate(year = str_extract(.x, "\\d{4}")))

# Reshape data from wide to long format
injury_long <- injury_data %>%
  pivot_longer(
    cols = ends_with("_county"),
    names_to = "county",
    values_to = "injury_count"
  ) %>%
  rename(injury_type = x1) %>%
  mutate(injury_type = str_trim(str_to_title(injury_type)))  # Normalize casing & whitespace


# Add County Classification (Urban vs Rural Variants)


# Load classification and collapse rural-related categories
county_classification <- read_csv("county_classification.csv") %>%
  clean_names() %>%
  mutate(
    county = str_to_title(county),
    area_type = case_when(
      category == "urban" ~ "Urban",
      category %in% c("rural", "rural resort", "rural resort municipalities") ~ "Rural",
      TRUE ~ "Other"
    )
  ) %>%
  select(county, area_type)

# Prepare injury county names to align with classification table
injury_classified <- injury_long %>%
  mutate(
    county = str_replace(county, "_county$", ""),
    county = str_replace_all(county, "_", " "),
    county = str_to_title(county)
  ) %>%
  left_join(county_classification, by = "county")


# Calculate Percent Composition of Injury Types Within Area Type


area_percent_summary <- injury_classified %>%
  filter(!is.na(area_type)) %>%
  group_by(year, area_type, injury_type) %>%
  summarise(total_injuries = sum(injury_count, na.rm = TRUE), .groups = "drop") %>%
  group_by(year, area_type) %>%
  mutate(
    total_area_injuries = sum(total_injuries),
    percent = total_injuries / total_area_injuries * 100
  ) %>%
  ungroup()

print(area_percent_summary, n = 50)



# Top 5 Injury Types by Percent (Urban vs Rural)


top_5_injuries_by_percent <- area_percent_summary %>%
  filter(injury_type != "All Types Of Injury") %>%
  group_by(area_type, injury_type) %>%
  summarise(max_percent = max(percent, na.rm = TRUE), .groups = "drop") %>%
  group_by(area_type) %>%
  slice_max(order_by = max_percent, n = 3) %>%
  ungroup()

# Filter full data to only include top 5 injuries for each area type
area_top_filtered <- area_percent_summary %>%
  semi_join(top_5_injuries_by_percent, by = c("area_type", "injury_type"))

# Visual for Key Question #1: What are the top 5 injuries based on urban vs rural categorization
ggplot(area_top_filtered, aes(x = as.numeric(year), y = percent, group = injury_type)) +
  geom_line(aes(color = injury_type, linetype = injury_type), linewidth = 1.2) +
  geom_point(size = 2) +
  facet_wrap(~ area_type) +
  scale_color_brewer(palette = "Dark2") +
  scale_x_continuous(breaks = 2020:2024) +
  scale_y_continuous(limits = c(0, NA), expand = expansion(mult = c(0, 0.05))) +
  labs(
    title = "Top 3 DV Injuries by Percent Within Area Type",
    subtitle = "Urban and Rural panels show relative injury composition (2020–2024)",
    x = "Year",
    y = "Percent of Area Total Injuries",
    color = "Injury Type",
    linetype = "Injury Type"
  ) +
  theme_minimal(base_size = 12) +
  theme(legend.position = "bottom")

