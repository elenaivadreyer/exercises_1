# Set-up your script ------------------------------------------------------

# install.packages(c("tidyverse", "gapminder", "pacman")) # uncomment if already installed
pacman::p_load(tidyverse, gapminder)

# Load your Data into R ---------------------------------------------------

data(gapminder)
head(gapminder)

# Clean your Data ---------------------------------------------------------

gapminder_clean <- gapminder %>% 
  rename(life_exp = lifeExp, gdp_per_cap = gdpPercap) %>% 
  mutate(gdp = pop * gdp_per_cap)

# Using the tidyverse, subset our cleaned df to include only countries in the Americas.

gapminder_americas_only = filter(gapminder_clean, continent == "Americas")

# add a new categorical variable using mutate() that qualifies whether a country is 
# rich or poor! (Hint use the variable gdp_per_cap and ìf_else())

gapminder_americas_only <- gapminder_americas_only %>%
  mutate(rich_or_not = if_else(gdp_per_cap > 10000, "rich", "poor"))
