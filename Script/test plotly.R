# Libraries ----
library(tidyverse)
library(plotly)
library(gapminder)

# Data ----
data("starwars")
data("gapminder")

# Graph ----
# Graph 1
(p <- 
  starwars %>% 
  ggplot(aes(x = fct_lump(eye_color, 5), fill = sex)) + 
  geom_bar(position = "dodge", color = "black") +
  scale_fill_manual(values = c("male" = "blue", 
                               "female" = "pink",
                               "hermaphroditic" = "purple",
                               "none" = "grey")) +
  labs(title = "Répartition des Personnages de Star Wars par Espèce et Sexe",
       x = "Espèce", 
       y = "Nombre de Personnages", 
       fill = "Sexe") +
  coord_flip() +
  theme_bw())

  ggplotly(p)

# Graph 2
d <- gapminder %>%
  ggplot(aes(gdpPercap, lifeExp, color = continent, size = pop)) +
  geom_point(alpha = 0.4) +
  scale_x_log10()


ggplotly(d)
