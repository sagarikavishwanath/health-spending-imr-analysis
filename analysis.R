# Set working directory
setwd("C:/Users/sagar/Desktop")
# Load packages
library(tidyverse)
# Load datasets (skip metadata rows)
imr <- read.csv("API_SP.DYN.IMRT.IN_DS2_en_csv_v2_214928.csv", skip = 4)
gdp <- read.csv("API_NY.GDP.PCAP.CD_DS2_en_csv_v2_207559.csv", skip = 4)
health <- read.csv("C:/Users/sagar/Desktop/API_SH.XPD.CHEX.GD.ZS_DS2_en_csv_v2_558.csv", skip = 4)
# IMR
imr_long <- imr %>%
  pivot_longer(cols = starts_with("X"),
               names_to = "Year",
               values_to = "IMR")

imr_long$Year <- as.numeric(gsub("X", "", imr_long$Year))
# GDP
gdp_long <- gdp %>%
  pivot_longer(cols = starts_with("X"),
               names_to = "Year",
               values_to = "GDP")

gdp_long$Year <- as.numeric(gsub("X", "", gdp_long$Year))
health_long <- health %>%
  pivot_longer(cols = starts_with("X"),
               names_to = "Year",
               values_to = "Health")

health_long$Year <- as.numeric(gsub("X", "", health_long$Year))
imr_long <- imr_long %>% drop_na(IMR)
gdp_long <- gdp_long %>% drop_na(GDP)
health_long <- health_long %>% drop_na(Health)
merged_data <- imr_long %>%
  inner_join(gdp_long, by = c("Country.Name", "Year")) %>%
  inner_join(health_long, by = c("Country.Name", "Year"))
clean_data <- merged_data %>%
  select(Country.Name, Year, IMR, GDP, Health)
# Model 1
model1 <- lm(IMR ~ Health, data = clean_data)
summary(model1)
# Model 2
model2 <- lm(IMR ~ Health + GDP, data = clean_data)
summary(model2)
ggplot(clean_data, aes(x = Health, y = IMR)) +
  geom_point(alpha = 0.3) +
  geom_smooth(method = "lm") +
  labs(title = "Health Spending vs Infant Mortality",
       x = "Health Expenditure (% of GDP)",
       y = "Infant Mortality Rate")
