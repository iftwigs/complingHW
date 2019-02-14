diamonds %>% 
  ggplot(aes(depth, price)) +
  geom_point(alpha = 0.1, shape = '-')

sample(c('facet', 'functions'), 1)

x <- sample(1:10, 1)
if(x > 5){
  TRUE
} else {
  FALSE
}


x <- 1:50
case_when(
  x %% 35 == 0 ~ 'fizz buzz',
  x %% 5 == 0 ~ 'fizz',
  x %% 7 == 0 ~ 'buzz',
  TRUE 
)

my_factorial <- function(i){
  if(i < 0){
    NA
  } else if(i == 0){
    1
  } else {
    i*my_factorial(i-1)
  }
}
my_factorial(5)

homo <- read_csv("https://raw.githubusercontent.com/agricolamz/2019_FE_R_statistics/master/data/Hau.2007.csv")
homo

homo %>% 
  ggplot(aes(speaker, s.duration.ms))+
  geom_point() + 
  facet_wrap(~orientation)

homo %>% 
  ggplot(aes(speaker, s.duration.ms))+
  geom_point() + 
  facet_wrap(~orientation, scales = "free_x")

homo %>% 
  mutate(older_then_28 = ifelse(age > 28, "older", "younger")) %>% 
  ggplot(aes(speaker, s.duration.ms))+
  geom_point() + 
  facet_wrap(older_then_28~orientation, scales = "free_x")

homo %>% 
  mutate(older_then_28 = ifelse(age > 28, "older", "younger")) %>% 
  ggplot(aes(speaker, s.duration.ms))+
  geom_point() + 
  facet_grid(older_then_28~orientation, scales = "free_x")

homo %>% 
  mutate(older_then_28 = ifelse(age > 28, "older", "younger")) %>% 
  ggplot(aes(speaker, s.duration.ms))+
  geom_point() + 
  facet_grid(older_then_28~orientation, scales = "free_x", margins = TRUE)

homo %>% 
  ggplot(aes(speaker, s.duration.ms))+
  geom_point(data = homo[,-9], aes(speaker, s.duration.ms), color = "grey") + 
  geom_point() + 
  facet_wrap(~orientation)+
  theme_bw()

diamonds %>% 
  ggplot(aes(price, depth, cut)) +
  geom_point() + 
  facet_grid(color~cut)

starwars %>% 
  filter(!is.na(height), !is.na(mass)) %>% 
  ggplot(aes(height, mass, hair_color)) +
  geom_point() +
  facet_grid(skin_color~hair_color, scales = "free")


