head(starwars)
df <- starwars %>% 
  filter(eye_color == 'blue')
mean(df$mass, na.rm = TRUE)  

starwars %>% 
  group_by(skin_color) %>% 
  summarise(mean = mean(mass, na.rm = TRUE))

library(tidyverse)
homo <- read_csv("https://raw.githubusercontent.com/agricolamz/2019_FE_R_statistics/master/data/Hau.2007.csv")
homo

quartet <- read.csv("https://raw.githubusercontent.com/agricolamz/2019_FE_R_statistics/master/data/anscombe.s.quartet.csv")
quartet

quartet %>% 
  group_by(dataset) %>% 
  summarise(mean_X = mean(x),
            mean_Y = mean(y),
            sd_X = sd(x),
            sd_Y = sd(y),
            cor = cor(x, y),
            n_obs = n()) %>% 
  select(-dataset) %>% 
  round(., 2)
