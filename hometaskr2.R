library(tidyverse)
head(diamonds)
library(ggplot2)

Sys.setlocale("LC_CTYPE", "UTF-8")

d <- diamonds %>% 
  select(carat, cut, color, price) %>% 
  filter(carat > 2.5) %>% 
  filter(cut == 'Premium'|cut == 'Fair') %>% 
  arrange(-price) 

d2 <- d %>% 
  filter(cut == 'Premium') %>% 
  filter(color == 'F')

mean(d2$price)

library(readr)
options(stringsAsFactors = FALSE)

df <- read_csv(
  'https://raw.githubusercontent.com/agricolamz/2019_FE_R_statistics/master/zilo.csv',
  locale=locale(encoding="UTF-8")
)
head(df)

library(tidyr)
library(dplyr)

df %>% 
  gather(key = speaker_id, value = class, '1':'16') %>% 
  nrow()

df %>% 
  gather(key = speaker_id, value = class, '1':'16') %>% 
  group_by(stimulus_source, class) %>% 
  summarise(n = n())

starwars %>% 
  filter(skin_color == 'grey') %>% 
  filter(height > 200)
