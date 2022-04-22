set.seed(500)

# Carga de datos
library(MASS)
data <- Boston
# CRIM: tasa de criminalidad
# ZN - proporcion de terrenos residenciales divididos en zonas para lotes de mas de 25,000 pies cuadrados.
# INDUS - proporcion de acres comerciales no comerciales por ciudad.
# CHAS - (1 si el tramo limita al rio)
# NOX: concentracion de oxidos ntricos (partes por 10 millones)
# RM: numero promedio de habitaciones por vivienda
# AGE: proporcion de unidades ocupadas por el propietario construidas antes de 1940
# DIS - distancias ponderadas a cinco centros de empleo de Boston
# RAD - Indice de accesibilidad a las carreteras radiales
# IMPUESTO - tasa de impuesto a la propiedad
# PTRATIO - proporcion alumno-maestro por ciudad
# BLACK - proporcion de negros por barrio
# LSTAT -% estado mas bajo de la poblacion
# MEDV - Valor mediano de las casas (variable de salida)

