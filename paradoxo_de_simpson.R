library(tidyverse)
theme_set(theme_bw())
library(palmerpenguins)

# analise total

ggplot(penguins, aes(x=bill_length_mm, y=bill_depth_mm)) +
  geom_point() + 
  geom_smooth(method = "lm", se = FALSE, colour = "black") +
  labs(x = "Comprimento", y = "Largura", title = "Medidas de bicos de pinguins")

penguins %>%
  do(tidy(lm(bill_depth_mm ~ bill_length_mm, .)))

# analise por grupo

ggplot(penguins, 
       aes(x=bill_length_mm, 
           y=bill_depth_mm, 
           group = species, 
           colour = species)) +
  geom_point() + 
  geom_smooth(aes(colour = species), method = "lm", se = FALSE) +
  labs(x = "Comprimento", y = "Largura", title = "Medidas de bicos de pinguins") +
  scale_colour_viridis_d()

penguins %>%
  group_by(species) %>%
  do(tidy(lm(bill_depth_mm ~ bill_length_mm, .)))
