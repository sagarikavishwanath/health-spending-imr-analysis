# Health Spending and Infant Mortality Analysis

## Overview
This project analyzes the relationship between government health expenditure and infant mortality rates using cross-country data from the World Bank.

## Research Question
Does higher government health spending lead to lower infant mortality rates?

## Data
The analysis uses data from the World Bank, including:
- Infant mortality rate
- Health expenditure (% of GDP)
- GDP per capita

## Methodology
The study uses Ordinary Least Squares (OLS) regression to estimate the relationship between health spending and infant mortality.

Two models are estimated:
1. IMR ~ Health
2. IMR ~ Health + GDP

## Key Findings
- Health expenditure is negatively associated with infant mortality
- The effect decreases after controlling for GDP, indicating omitted variable bias
- GDP per capita is also significant in explaining health outcomes

## Limitations
The analysis shows correlation, not causation. More advanced methods would be needed to establish causal effects.

## Files
- `analysis.R` → R code
- `report.pdf` → Full report
- `graph.png` → Visualization

## Author
Sagarika Vishwanath
