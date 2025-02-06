# Importar BBDD I+D 2022:
# Importar base tamaño
data <- read_delim(
  "https://raw.githubusercontent.com/TomasGarrido/Encuesta_ImasD/refs/heads/main/2022/BBDD/def/BD_A.csv", 
  delim = ";", 
  locale = locale(encoding = "UTF-16LE"), 
  col_types = cols(.default = col_character()))

# Importar base sector económico
data <- read_delim(
  "https://raw.githubusercontent.com/TomasGarrido/Encuesta_ImasD/main/2022/BBDD/def/BD_B.csv", 
  delim = ";", 
  locale = locale(encoding = "UTF-16LE"), 
  col_types = cols(.default = col_character()))
