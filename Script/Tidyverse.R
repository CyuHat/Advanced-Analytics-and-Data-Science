# Libraries ----
library(dplyr) # Manipulation de données
library(ggplot2) # Visualisation de données
library(skimr) # Résumé statistique
library(tidyverse) # La totale

# ctrl + alt + R

# Data ----
data(starwars)

# Description ----
# si data.frame
iris <- tibble(iris) # Pas avec iris

# Print ----
# Interactif
starwars

# Noms des colonnes
names(starwars)

# Coup d'oeil
glimpse(starwars)

# summary
summary(starwars)

# Résumé en mieux
skim(starwars)

# Pipe ----
# Exemple avec regex
starwars %>% 
  select(sex, hair_color)

starwars %>% 
  select(matches("sex|color$"))

starwars %>% 
  select(name, last_col(), everything())

starwars %>% 
  select(where(is.numeric), name)

starwars %>% 
  select(weight = mass, 
         name) 

starwars %>% 
  select(hair_color:gender)

# Filter ----
starwars %>% 
  filter(mass > 70, .by = sex)

starwars %>% 
  group_by(sex) %>% 
  filter(mean(mass, na.rm = TRUE) > 70) %>% 
  count(sex)


# Arrange ----
starwars %>% 
  arrange(desc(height), mass)


# mutate ----
# Créer
starwars %>% 
  mutate(height_3 = height * 3,
         .after = name)

# Modifier
starwars %>% 
  mutate(height = height * 3)

starwars %>% 
  mutate(height = height + mass)

starwars %>% 
  transmute(height = height * 3,
            mass = mass * 3,
            name, sex)

