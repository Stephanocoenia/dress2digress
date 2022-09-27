
library(tidyverse)
library(artyfarty)


iso <- read.csv("data/isotopes_gobies.csv",dec=".", sep=";") %>% 
  filter(!grepl('nd', species)) ##removing nd 

ggplot() +
  geom_point(data = iso, 
             aes(x = iso1_c13, 
                 y = iso2_n15,
                 color = species,
                 shape = species)) +
  theme_scientific()
