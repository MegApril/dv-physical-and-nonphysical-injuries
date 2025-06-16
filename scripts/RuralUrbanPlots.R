
# ------------------------------------------------------------------
# Domestic Violence Injury Type Trends Analysis (CO, 2020–2024)
# ------------------------------------------------------------------

# Load required libraries
library(tidyverse)
library(janitor)
library(forcats)
library(ggrepel)

# 1. Load and inspect a single year (for structure confirmation)
injury_2020 <- read_csv("metadataRemoved_DV_Injury_Type_2020_CO_Counties.csv") %>%
  clean_names()
glimpse(injury_2020)

# 2. Load and combine all 5 years of DV injury data (2020–2024)
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

# 3. Reshape data from wide to long format
injury_long <- injury_data %>%
  pivot_longer(
    cols = ends_with("_county"),
    names_to = "county",
    values_to = "injury_count"
  ) %>%
  rename(injury_type = x1) %>%
  mutate(injury_type = str_trim(str_to_title(injury_type)))  # Normalize casing & whitespace

# ------------------------------------------------------------------
# 4. Add County Classification (Urban vs Rural Variants)
# ------------------------------------------------------------------

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

# ------------------------------------------------------------------
# 5. Calculate Percent Composition of Injury Types Within Area Type
# ------------------------------------------------------------------

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


# ------------------------------------------------------------------
# 6. Plot: Percent Composition of Injury Types Within Area Type
# ------------------------------------------------------------------

# Filter out aggregate "All Types Of Injury" to focus on individual types
area_filtered <- area_percent_summary %>%
  filter(injury_type != "All Types Of Injury")

# Determine max % observed for each injury type across all area-years
# This will be used to order panels by prominence
injury_order <- area_filtered %>%
  group_by(injury_type) %>%
  summarise(max_percent = max(percent, na.rm = TRUE)) %>%
  arrange(desc(max_percent)) %>%
  pull(injury_type)

# Apply custom panel order by converting injury_type to an ordered factor
area_filtered <- area_filtered %>%
  mutate(injury_type = factor(injury_type, levels = injury_order))

# Create faceted line plot comparing Urban vs Rural composition trends
ggplot(area_filtered, aes(x = as.numeric(year), y = percent, group = area_type)) +
  geom_line(aes(color = area_type, linetype = area_type), linewidth = 1.2) +
  geom_point(size = 2) +
  facet_wrap(~ injury_type, scales = "free_y") +
  scale_color_brewer(palette = "Dark2") +
  scale_x_continuous(breaks = 2020:2024) +
  scale_y_continuous(limits = c(0, NA), expand = expansion(mult = c(0, 0.05))) +
  labs(
    title = "Percent of DV Injuries by Type Within Area Type (2020–2024)",
    subtitle = "Each panel shows Urban vs Rural trends; panels ordered by peak prevalence",
    x = "Year",
    y = "Percent of Rural or Urban Total Injuries",
    color = "Area Type",
    linetype = "Area Type"
  ) +
  theme_minimal(base_size = 12) +
  theme(legend.position = "bottom")
