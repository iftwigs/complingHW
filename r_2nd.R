library(tidyverse)
dplyr::add_count()

head(iris)
as_tibble(iris)
data_frame(id = 1:12,
           letters = month.name)

df <- data_frame(id = 1:12,
           letters = month.name,
           new = id + 5)

df$id[df$id > 4]

df <- read_csv('https://goo.gl/v7nvho')
head(df)

df <- read_delim('https://goo.gl/v7nvho', delim = '\t')
head(df)

library(readxl)
xlsx_example <- readxl_example("datasets.xlsx")
df <- read_excel(xlsx_example)
head(df)

homo <- read_csv("/Users/macbookpro/Downloads/Chi.kuk.2007.csv")
homo

homo %>%
  filter(age > 28, s.duration.ms < 60)

sum(sort(exp(sin(100:43^2)), decreasing = TRUE))

100:43^2  %>%
  sin()  %>%
  exp()  %>%
  sort(., decreasing = TRUE)  %>%
  sum()

homo %>% 
  slice(3:7)

mtcars %>% 
  slice(c(4,7,23))

homo %>% 
  select(speaker:average.f0.Hz)

homo %>% 
  select(speaker, age, s.duration.ms)

homo %>% 
  arrange(orientation, desc(age))

homo %>% 
  distinct(orientation)

homo %>% 
  mutate(f0.mn = average.f0.Hz - f0.range.Hz/2,
         f0.mx = (average.f0.Hz + f0.range.Hz/2))

mtcars %>% 
  mutate(n = 1:n(),
         mpg_diff = mpg - mean(mpg))

mean(mtcars$mpg)
min(mtcars$mpg)
max(mtcars$mpg)
sd(mtcars$mpg)
median(mtcars$mpg)
summary(mtcars$mpg)
colSums(mtcars)

mtcars %>% 
  summarise(min = min(mpg),
            mean = mean(carb))

mtcars %>% 
  group_by(cyl) %>% 
  summarise(min = mean(mpg))

df.short <- data.frame(
  consonant = c('stops', 'fricatives', 'affricates', 'nasals'),
  initial = c(123, 87, 73, 7),
  intervocal = c(57, 77, 82, 78),
  final = c(30, 69, 12, 104)
)

df.short

df.long %>% 
  spread(position, number) ->
  df.short
df.short

table(mtcars$cyl, mtcars$carb) %>% 
  as.data.frame() %>% 
  rename(cyl = Var1,
         carb = Var2) 
  spread(carb, Freq) %>% 
  gather(carb, freq, '1','8')

df.short <- data.frame(mtcars) 

df.short %>% 
  gather(key = position, value = value, initial:final) ->
  df.long

df.long %>% 
  spread(key = position, value = value)

languages <- data_frame(
  languages = c('Selkup', 'French', 'Chukchi', 'Kashubian'),
  countries = c('Russia', 'France', 'Russia', 'Poland'),
  iso = c('sel', 'fra', 'ckt', 'pol')
)

country_population <- data_frame(
  countries = c('Russia', 'Poland', 'Finland'),
  population_mln = c(143, 38, 5)
)

country_population

inner_join(languages, country_population)
left_join(languages, country_population)
right_join(languages, country_population)
anti_join(languages, country_population)
full_join(languages, country_population)

mtcars %>% 
  as.tibble()
  group_by(cyl, carb) %>% 
  summarise(mean = mean(mpg))


