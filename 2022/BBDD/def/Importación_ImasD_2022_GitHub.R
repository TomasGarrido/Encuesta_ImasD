# Importación BBDD Encuesta I+D 2022 desde GitHub
library(tidyverse)

BD_tamano <- read_delim(
  "https://raw.githubusercontent.com/TomasGarrido/Encuesta_ImasD/refs/heads/main/2022/BBDD/def/BD_A.csv", 
  delim = ";", 
  locale = locale(encoding = "UTF-16LE"), 
  col_types = cols(.default = col_character())) %>% 
  mutate(across(everything(), ~ gsub(",", ".", .))) %>%
  # Convertir a numérico todas las columnas, excepto las que terminan en "_otra", "_JUST"
  # o son "Identificador_A", "DV_A" y "DIRECTORIO"
  mutate(across(
    .cols = -c(Identificador_A, DV_A, DIRECTORIO, B2010.1, B2010.2) & 
      !ends_with("_otra") & 
      !ends_with("_otro") &
      !ends_with("_JUST"),
    .fns = ~ as.numeric(.))) %>% 
  mutate(UNIDAD_DECLARANTE_FACTOR = factor(UNIDAD_DECLARANTE, labels = c("Estado",
                                                                         "IES",
                                                                         "IPSFL",
                                                                         "Empresas")),
         TAMANO_FACTOR = factor(TAMANO, labels = c("Grande",
                                                   "Mediana",
                                                   "Pequeña",
                                                   "Microempresa")),
         MACROZONA_FACTOR = factor(MACROZONA, labels = c("Norte", "Centro", "Centro-Sur", "Sur",
                                                         "Austral", "Metropolitana")))

BD_sector <- read_delim(
  "https://raw.githubusercontent.com/TomasGarrido/Encuesta_ImasD/refs/heads/main/2022/BBDD/def/BD_B.csv", 
  delim = ";", 
  locale = locale(encoding = "UTF-16LE"),
  col_types = cols(.default = col_character())) %>% 
  mutate(across(everything(), ~ gsub(",", ".", .))) %>%
  # Convertir a numérico todas las columnas, excepto las que terminan en "_otra", "_JUST"
  # o son "Identificador_B", "DV_B" y "DIRECTORIO"
  mutate(across(
    .cols = -c(Identificador_B, DV_B, DIRECTORIO, B2010.1, B2010.2) & 
      !ends_with("_otra") &
      !ends_with("_otro") &
      !ends_with("_JUST"),
    .fns = ~ as.numeric(.))) %>% 
  mutate(UNIDAD_DECLARANTE_FACTOR = factor(UNIDAD_DECLARANTE, labels = c("Estado",
                                                                         "IES",
                                                                         "IPSFL",
                                                                         "Empresas")),
         COD_ACTIVIDAD_FACTOR = factor(COD_ACTIVIDAD, labels = c("A", "B", "C", "C20",
                                                                 "C21", "D", "E", "F",
                                                                 "G", "H", "I", "J",
                                                                 "K", "L", "M", "M70",
                                                                 "M71", "M72", "N", "O",
                                                                 "P", "Q", "R", "S")))
