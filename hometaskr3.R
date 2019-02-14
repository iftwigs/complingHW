library(tidyverse)
Sys.setlocale("LC_CTYPE", "UTF-8")
elision <- read_csv('https://raw.githubusercontent.com/agricolamz/2019_FE_R_statistics/master/data/Sveshnikova.2016.v.elision.csv')

cor(v.elision, position)

cor <- round(cor(elision),2)
head(cor)

elision %>% 
  group_by(v.elision) %>% 
  summarise(cor(v.elision, group)) %>% 
  round(., 2)

nihon <- read_csv('https://raw.githubusercontent.com/agricolamz/2019_FE_R_statistics/master/data/data.japanese.vocal.tract.length.csv')

clean <- gsub(",", "", elision) 
clean <- as.numeric(clean) 
clean %>% 
  cor(v.elision, position)

elision %>% 
  cor(elision$v.elision, elision$position, na.rm = TRUE)

elision %>% 
  filter(position == 'strong',
         group == 'second') %>% 
  ggplot(aes(v.elision, fill = word)) +
  geom_bar(position = 'dodge')

elision %>% 
  ggplot(aes(v.elision, position, fill = word)) +
  geom_bar(position = 'dodge')

diamonds %>% 
  ggplot(aes(depth, price)) +
  geom_point(alpha = 0.1, shape = '-')

elision %>% 
  ggplot(aes(v.elision, fill = position)) +
  geom_bar(position = 'dodge')

elision %>% 
  mutate(newvar = v.elision == 'yes',
         newvar_2 = position == 'strong',
         newvar_3 = v.elision == 'no',
         newvar_4 = position == 'weak') %>% 
  group_by(newvar, newvar_2, newvar_3, newvar_4) %>% 
  summarise(number = n()) %>% 
  ggplot(aes(newvar, newvar_2, newvar_3, newvar_4, label = number))+
  geom_point(aes(size = number, color = newvar))+
  geom_text()+
  scale_size(range = c(10, 30))+
  guides(size = F)

View(starwars)

summary(elision$v.elision)

elision %>% 
  ggplot(aes(group, fill = v.elision)) + 
  geom_density(alpha = 0.5)

elision %>% 
  filter(v.elision == 'yes') %>% 
  filter(position == 'strong') %>% 
  summary(v.elision)


nihon %>% 
  gather(key = vowels, value = vtl, 'a.vtl': 'u.vtl') %>% 
  ggplot(aes(vowels, vtl)) + 
  geom_boxplot()


gather(key = speaker_id, value = class, '1':'16') %>% 
  group_by(stimulus_source, class)