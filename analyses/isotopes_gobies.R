
library(tidyverse)
library(dplyr)
#devtools::install_github('datarootsio/artyfarty')
library(artyfarty) #more ggplot themes and palettes
library(ggplot2)
library(patchwork) # to combine plots into one figure


iso <- read.csv("data/isotopes_gobies.csv",dec=".", sep=",") %>% 
  filter(!grepl('nd', species)) ##filtering out nd (non identified organisms) 


# Scatter plot of d13C vs d15N (both species)
ggplot(iso) +
  geom_point(aes(x = iso1_c13, 
                 y = iso2_n15,
                 color = species,
                 shape = species)) +
  scale_color_manual(values = pal("color_blind"))+
  xlab("d13C") + ylab("d15N")


# Boxplots for d13C and d15N per species. 

# Note that only in WAR03 both species were able to be collected. 
# This doesn't mean that both species didn't co-occur in more lakes

#Boxplots ordered by ascending mean 

plot_c13 <- iso %>%
  ggplot(aes(x=reorder(site,connectivity,na.rm = TRUE), y=iso1_c13, fill = species)) +
  geom_boxplot(position=position_dodge(1)) +
  labs(y="d13C", x="Isolated--------------> Connected", 
       subtitle="d13C values for both species") +
  scale_fill_manual(values = pal("color_blind")) +
  theme(legend.position = "bottom")


plot_n15 <- iso %>%
  ggplot(aes(x=reorder(site,connectivity,na.rm = TRUE), y=iso2_n15, fill = species)) +
  geom_boxplot(position=position_dodge(1)) +
  labs(y="d15N", x="Isolated--------------> Connected", 
       subtitle="d15N values for both species") +
  scale_fill_manual(values = pal("color_blind"))+
  theme(legend.position = "bottom")

plot_c13 + plot_n15




