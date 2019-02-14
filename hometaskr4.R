library(tidyverse)
shiny::runGitHub("agricolamz/bayes_for_binomial_app") 

df <- read_csv('https://raw.githubusercontent.com/agricolamz/2019_BayesDan_winter/master/datasets/phoible_n_consonants.csv')
df %>% 
  mutate(rate = consonants/phonemes,
         apost = consonants + 9.300246,
         bpost = phonemes - consonants + 4.4545,
         rate_post = apost/(apost/bpost),
         diff = abs(rate - rate_post)) 
