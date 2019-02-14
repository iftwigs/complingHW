library(tidyverse)
read.csv('/Users/macbookpro/Downloads/orly.csv') %>% 
  ggplot(aes(V1, V2))+
  geom_point(shape = ".")+
  labs(x = "", y = "")+
  theme_bw()

library(tidyverse)
df <- read_csv("https://raw.githubusercontent.com/agricolamz/2019_BayesDan_winter/master/datasets/weather.csv")
df %>% 
  select(city, events) %>% 
  count(city, events) %>% 
  group_by(city) %>% 
  mutate(sum = sum(n),
         prop = n/sum) %>% 
  filter(events == "Rain" | 
           events == "Rain , Thunderstorm")

tibble(prior = 1/3,
       city = c("Auckland", "Chicago", "San Diego"),
       rain = c(0.484, 0.161, 0.290),
       rain_thunderstorm = c(0.0323, 0, 0.0645),
       likelihood = rain * rain_thunderstorm,
       product = prior*likelihood,
       posterior = product/sum(product))

tibble(prior = 1/3,
       city = c("Auckland", "Chicago", "San Diego"),
       rain = c(0.484, 0.161, 0.290),
       rain_thunderstorm = c(0.0323, 0, 0.0645),
       likelihood1 = rain,
       product_1 = prior*likelihood1,
       posterior1 = product_1/sum(product_1),
       prior2 = posterior1,
       likelihood2 = rain_thunderstorm,
       product_2 = prior2*likelihood2,
       posterior2 = product_2/sum(product_2)) %>% 
  select(posterior2)

install.packages('markovchain')
library(markovchain)
fit <- markovchain::markovchainFit(df$events)
plot(fit$estimate)
sum(round(seq(0,1,0.001), 3) == 0.94)

tibble(p = seq(0, 1, by == 0.01),
       prod = p ^ (8 - 1) * (1 - p) ^ (42 - 1),
       sum(prod)) %>% 
  ggplot(aes(p, prod)) +
  geom_point()

data_frame(x = 0:50,
           density = dbinom(x = x, size = 50, prob = 0.16)) %>% 
  ggplot(aes(x, density))+
  geom_point()+
  geom_line()+
  labs(title = "???????????????????????? ?????????????????????????? p = 0.16, n = 50")

data_frame(x = seq(0, 1, length.out = 100),
           density = dbeta(x = x, shape1 = 8, shape2 = 42)) %>% 
  ggplot(aes(x, density))+
  geom_point()+
  geom_line()+
  labs(title = "???????? ?????????????????????????? ?? = 8, ?? = 42")

install.packages('shiny')

tibble(p = seq(0,1, by = 0.01),
       density = dbeta(p, 20, 30)) %>% 
  mutate(scale = scale(density),
         to_one = density/max(density)) %>% 
  ggplot(aes(p, to_one)) + 
  geom_point()

data_frame(x = rep(seq(0, 1, length.out = 100), 6),
           density = c(dbeta(unique(x), shape1 = 8, shape2 = 42),
                       dbeta(unique(x), shape1 = 16, shape2 = 34),
                       dbeta(unique(x), shape1 = 24, shape2 = 26),
                       dbeta(unique(x), shape1 = 8+4, shape2 = 42+16),
                       dbeta(unique(x), shape1 = 16+4, shape2 = 34+16),
                       dbeta(unique(x), shape1 = 24+4, shape2 = 26+16)),
           type = rep(c("prior", "prior", "prior", "posterior", "posterior", "posterior"), each = 100),
           dataset = rep(c("prior: 8, 42", "prior: 16, 34", "prior: 24, 26",
                           "prior: 8, 42", "prior: 16, 34", "prior: 24, 26"), each = 100)) %>% 
  ggplot(aes(x, density, color = type))+
  geom_line()+
  facet_wrap(~dataset)+
  labs(title = "data = 4, 16")
