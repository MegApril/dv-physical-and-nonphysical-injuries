# Domestic Violence Injury Type Trends Analysis (CO, 2020–2024)


install.packages("ggrepel") 
# Load required libraries
library(tidyverse)
library(janitor)
library(forcats)  # for factor reordering
library(ggrepel)

# Load and inspect a single year (for structure understanding)
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

# Quick data exploration
glimpse(injury_long)
count(injury_long, year)
count(injury_long, injury_type)

# Bar Chart: Total Injuries by Type (2020–2024)

# Clean + summarize injury counts across all years (excluding aggregate)
injury_summary <- injury_long %>%
  filter(str_to_lower(injury_type) != "all types of injury") %>%
  group_by(injury_type) %>%
  summarize(total_injuries = sum(injury_count, na.rm = TRUE)) %>%
  mutate(percent = total_injuries / sum(total_injuries) * 100) %>%
  arrange(desc(total_injuries))

# Capture total injuries
total_injuries_all <- sum(injury_summary$total_injuries)

# Plot bar chart
ggplot(injury_summary, aes(x = reorder(injury_type, -total_injuries), y = total_injuries)) +
  geom_col(fill = "steelblue") +
  geom_text(aes(label = paste0(format(total_injuries, big.mark = ","), 
                               " (", round(percent, 1), "%)")),
            vjust = -0.3, size = 3) +
  labs(title = "Injuries by Type (Excluding Aggregate Category)",
       subtitle = paste("Total Injuries Recorded:", format(total_injuries_all, big.mark = ",")),
       x = "Injury Type",
       y = "Total Injuries") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

# Line Chart: Trends for Top 5 Injury Types Over Time

# Recalculate top 5 injury types from full dataset (cleaned)
top5 <- injury_summary %>%
  slice_max(total_injuries, n = 5, with_ties = FALSE) %>%
  pull(injury_type)

# Filter and summarize by year for top 5 only
injury_trend_top5 <- injury_long %>%
  filter(injury_type %in% top5) %>%
  group_by(year, injury_type) %>%
  summarize(total_injuries = sum(injury_count, na.rm = TRUE), .groups = "drop") %>%
  mutate(year = as.numeric(year)) %>%
  group_by(injury_type) %>%
  mutate(total_all_years = sum(total_injuries)) %>%
  ungroup() %>%
  mutate(injury_type = fct_reorder(injury_type, -total_all_years))

# Plot with linetype and color for accessibility
ggplot(injury_trend_top5, aes(x = year, y = total_injuries, 
                              color = injury_type, 
                              linetype = injury_type)) +
  geom_line(linewidth = 1) +
  geom_point(size = 2) +
  labs(title = "Top 5 Injury Types: Trends Over Time (2020–2024)",
       subtitle = "Each line represents one of the most reported injury types in Colorado",
       x = "Year",
       y = "Total Injuries",
       color = "Injury Type",
       linetype = "Injury Type") +
  theme_minimal() +
  scale_color_brewer(palette = "Set1") +
  scale_x_continuous(breaks = 2020:2024, expand = expansion(mult = c(0.01, 0.1))) +
  theme(legend.position = "bottom",
        legend.title = element_text(size = 10),
        legend.text = element_text(size = 9))

# Faceted Line Charts: One Panel per Top Five Injury Type


# Ensure all year-injury combinations exist
injury_trend_top5_filled <- injury_trend_top5 %>%
  complete(
    injury_type,
    year = 2020:2024,
    fill = list(total_injuries = 0)
  )

# Facet-wrapped line plot with y-axis starting at 0
ggplot(injury_trend_top5_filled, aes(x = year, y = total_injuries)) +
  geom_line(aes(color = injury_type, linetype = injury_type), linewidth = 1) +
  geom_point(aes(color = injury_type), size = 2) +
  facet_wrap(~ injury_type, scales = "free_y") +  # Allows different max heights
  scale_y_continuous(expand = expansion(mult = c(0, 0.05)), limits = c(0, NA)) +  # Force y-axis to start at 0
  scale_color_brewer(palette = "Set1") +
  scale_x_continuous(breaks = 2020:2024, expand = expansion(mult = c(0.01, 0.1))) +
  labs(title = "Trends in Top 5 Injury Types by Year (Faceted)",
       subtitle = "Each panel shows the trend for one injury type",
       x = "Year",
       y = "Total Injuries",
       color = "Injury Type",
       linetype = "Injury Type") +
  theme_minimal(base_size = 13) +
  theme(
    legend.position = "none",
    strip.text = element_text(face = "bold")
  )
