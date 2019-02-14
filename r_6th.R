Sys.setlocale("LC_CTYPE", "UTF-8")

library(tidyverse)
theme_set(theme_bw())

chekhov <- read_csv("https://raw.githubusercontent.com/agricolamz/2019_FE_R_statistics/master/data/chekhov.csv")
chekhov %>% 
  mutate(trunc_titles = str_trunc(titles, 25, side = "right"),
         average = n/n_words) ->
  chekhov

chekhov %>% 
  slice(1:30) %>%
  group_by(trunc_titles) %>% 
  mutate(beta_prior = n_words-n,
         alpha_post = n + 5.283022,
         beta_post = beta_prior + 231.6328,
         median_post = qbeta(0.5, alpha_post, beta_post),
         eq_t_int_min = qbeta(0.025, alpha_post, beta_post),
         eq_t_int_max = qbeta(0.975, alpha_post, beta_post)) %>% 
  ggplot(aes(x= trunc_titles))+
  geom_pointrange(aes(y = median_post, ymin = eq_t_int_min, ymax = eq_t_int_max), color = "tomato")+
  coord_flip()+
  labs(title = '?????????????????????????? ?????????????????? ???????????????????????? "????" ?? ?????????????????? ??. ????????????',
       x = "", y = "",
       caption = "?????????????????????? ???????????????????????? ?????????????????????????? ????????????????")

data_frame(x = seq(0, 1, length.out = 1000),
           density = dbeta(x = x, shape1 = 1, shape2 = 1)) %>% 
  ggplot(aes(x, density))+
  geom_line()+
  labs(title = "???????? ?????????????????????????? ?? = 1, ?? = 1")

data_frame(stats = c("mean", "sd", "80% credible interval min", "80% credible interval max"),
           values =  c(a_post/sum(a_post, b_post),
                       a_post*b_post/((a_post+b_post)^2*(a_post+b_post+1)),
                       qbeta(.1, shape1 = a_post, shape2 = b_post),
                       qbeta(.9, shape1 = a_post, shape2 = b_post)),
           x_pred = values*n_observation)

n_observation <- 15
a_post <-  0.5+11
b_post <- 0.5+4

n_observation <- 15
a_post <-  1+11
b_post <- 1+4

data_frame(stats = c("mean", "sd", "80% credible interval min", "80% credible interval max"),
           values =  c(a_post/sum(a_post, b_post),
                       a_post*b_post/((a_post+b_post)^2*(a_post+b_post+1)),
                       qbeta(.1, shape1 = a_post, shape2 = b_post),
                       qbeta(.9, shape1 = a_post, shape2 = b_post)),
           x_pred = values*n_observation)

data_frame(x = seq(0, 1, length.out = n_observation),
           density = dbeta(x = x, shape1 = a_post, shape2 = b_post),
           eq_t_int_min = qbeta(.1, shape1 = a_post, shape2 = b_post)*n_observation,
           eq_t_int_max = qbeta(.9, shape1 = a_post, shape2 = b_post)*n_observation) %>% 
  ggplot(aes(1:n_observation, density))+
  geom_point()+
  geom_line()+
  geom_rect(aes(xmin = eq_t_int_min, xmax = eq_t_int_max, ymin = 0, ymax = 0.1))+
  labs(title = "?????????????????? ???????? ?????????????????????????? ?? = 1, ?? = 1",
       y = "density",
       x = "")

pbeta(0.5, shape1 = a_post, shape2 = b_post)
1 - pbeta(0.5, shape1 = a_post, shape2 = b_post)
