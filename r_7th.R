library('tidyverse')

data_frame(x = 1:100,
           PDF = dnorm(x = x, mean = 50, sd = 10)) %>% 
  ggplot(aes(x, PDF))+
  geom_point()+
  labs(title = "PDF нормального распределения (μ = 50, sd = 10)")

pnorm(30, mean = 50, sd = 10)

data_frame(x = 1:100,
           CDF = pnorm(x, mean = 50, sd = 10)) %>% 
  ggplot(aes(x, CDF))+
  geom_point()+
  labs(title = "CDF нормального распределения (μ = 50, sd = 10)")

qnorm(0.4, mean = 50, sd = 10)

data_frame(quantiles = seq(0, 1, by = 0.01),
           value = qnorm(quantiles, mean = 50, sd = 10)) %>% 
  ggplot(aes(quantiles, value))+
  geom_point()+
  labs(title = "inverse CDF нормального распределения (μ = 50, sd = 10)")

data_frame(sample = rnorm(100, mean = 50, sd = 10)) %>% 
  ggplot(aes(sample))+
  geom_histogram()+
  labs(title = "выборка нормально распределенных чисел (μ = 50, sd = 10)")

qnorm(0.25, mean = 20, sd = 90)
qnorm(0.97)
