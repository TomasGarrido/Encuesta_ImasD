# Importación a R de las BBDD de la Encuesta I+D, año de referencia 2022: ----------------
# Carga de paquetes
library(tidyverse)

# Importar BBDD I+D 2022:
# Importar base tamaño
BD_tamano_2022 <- read_delim(
  "https://raw.githubusercontent.com/TomasGarrido/Encuesta_ImasD/refs/heads/main/2022/BBDD/def/BD_A.csv", 
  delim = ";", 
  locale = locale(encoding = "UTF-16LE"), 
  col_types = cols(.default = col_character())) %>% 
  mutate(across(everything(), ~ gsub(",", ".", .))) %>%
  # Convertir a numérico todas las columnas, excepto las que terminan en "_otra", "_JUST"
  # o son "Identificador_A", "DV_A" y "DIRECTORIO"
  mutate(across(
    .cols = -c(Identificador_A, DV_A, DIRECTORIO) & 
      !ends_with("_otra") & 
      !ends_with("_JUST"),
    .fns = ~ as.numeric(.)))

# Importar base sector económico
BD_sector_2022 <- read_delim(
  "https://raw.githubusercontent.com/TomasGarrido/Encuesta_ImasD/main/2022/BBDD/def/BD_B.csv", 
  delim = ";", 
  locale = locale(encoding = "UTF-16LE"),
  col_types = cols(.default = col_character())) %>% 
  mutate(across(everything(), ~ gsub(",", ".", .))) %>%
  # Convertir a numérico todas las columnas, excepto las que terminan en "_otra", "_JUST"
  # o son "Identificador_B", "DV_B" y "DIRECTORIO"
  mutate(across(
    .cols = -c(Identificador_B, DV_B, DIRECTORIO) & 
      !ends_with("_otra") & 
      !ends_with("_JUST"),
    .fns = ~ as.numeric(.)))
