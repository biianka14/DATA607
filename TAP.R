# Tuition Assistance Program (TAP)

setwd("C:/Users/BFigueroa/OneDrive - City University of New York/SPS/DATA MANAGEMENT/Projects/Project 2")

### Read the .CSV file for Tuition Assistance Program into R
require(dplyr)
require(tidyr)

TAP <- read.csv("TAP_NY.csv")
head(TAP)

### I want to analyze and compare the headcount of Tuition Assistance Program given to students in Private vs Public schools with 4 year level of study across the years

### Rename & selecting columns needed

TAP_ny <- TAP %>%
  rename(Year = Academic.Year,
         Study_level = TAP.Level.of.Study,
         Sector = Sector.Type, 
         Fall_headcount = TAP.Fall.Headcount) %>%
  select(Year, Study_level, Sector, Fall_headcount)
head(TAP_ny)
       
### Public 4 year vs. Private 4 year

public <- TAP_ny %>%
  filter(Study_level == "4 yr Undergrad", Sector == "PUBLIC") %>%
  group_by(Year) %>%
  summarise(Fall_headcount = mean(Fall_headcount))
head(public)

private <- TAP_ny %>%
  filter(Study_level == "4 yr Undergrad", Sector == "PRIVATE") %>%
  group_by(Year) %>%
  summarise(Fall_headcount = mean(Fall_headcount))
head(private)

TAP_ny_summ <- TAP_ny %>%
  filter(Study_level == "4 yr Undergrad") %>%
  group_by(Year) %>%
  summarise(Fall_headcount = mean(Fall_headcount))
head(TAP_ny_summ)

### Graphing 
#install.packages("tidyverse")
#install.packages("ggplot2")
require(ggplot2)

public <- as.data.frame(public)

public_graph <- ggplot(public, aes(x = Year, y = Fall_headcount)) + 
  geom_point(col = "red", size = 1) +
  geom_smooth(method = "lm", col = "blue") +
  labs(title = "Scatterplot: Linear Relationship", 
       subtitle = "NY TAP Fall Headcount ~ Year",
       y = "NY TAP Fall Headcount", 
       x = "Year")

plot(public_graph)

### Looking at the graph for public 4 year level of study colleges, we see that across the years the number of students receiving TAP increases.

private <- as.data.frame(private)

private_graph <- ggplot(private, aes(x = Year, y = Fall_headcount)) + 
  geom_point(col = "red", size = 1) +
  geom_smooth(method = "lm", col = "blue") +
  labs(title = "Scatterplot: Linear Relationship", 
       subtitle = "NY TAP Fall Headcount ~ Year",
       y = "NY TAP Fall Headcount", 
       x = "Year")

plot(private_graph)

### In contrast, the graph for private 4 year level of study colleges, shows that across the years, the number of students receiving TAP decreases.


