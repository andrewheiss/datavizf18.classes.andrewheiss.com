library(tidyverse)
library(stringr)  # Do fancy things with strings

# Load data
isms_raw <- read_csv("data/isms_full.csv") %>%
  # Make nicer column names
  rename(word = `WORD/PHRASE`, 
         coldwar_count = `TOKENS 1`, today_count = `TOKENS 2`,
         coldwar_permil = `PM 1`, today_permil = `PM 2`) %>%
  # Recapitalize the word so that only the first letter is capitalized
  # This function comes from stringr
  mutate(word = str_to_title(word))

# Make tidy
isms_top <- isms_raw %>%
  # Don't need these columns
  select(-ID, -RATIO) %>%
  # Sort by the per million value
  arrange(desc(coldwar_permil)) %>%
  # Only look at rows 1-5
  slice(1:5) %>%
  # Gather the count and per million variables into one long column
  gather(key, value, contains("count"), contains("permil")) %>%
  # Split the key column into decade and vartype 
  separate(key, c("decade", "vartype")) %>%
  # Spread vartype across two columns
  spread(vartype, value)

write_csv(isms_top, "data/isms_top5.csv")
