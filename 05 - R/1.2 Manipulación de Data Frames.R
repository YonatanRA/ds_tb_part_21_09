# DATA FRAMES

# Crear un dataframe

df <- data.frame(Ciudad=c("Madrid","Bilbao","Sevilla"),
                 Habitantes=c(150,200,40),
                 Precipitaciones=c(25,13,2))
df

nrow(df) # número de filas
ncol(df) # número columnas
names(df) # Nombre de columnas
df$Ciudad # Selección de una columna

# Selección de varias columnas
df[,c("Ciudad","Habitantes")]
df[,c(1,2)]
df[,1:2]

# Selección de filas
df[1:2,]

# Cambiar el nombre de las columnas
names(df) <- c("Ciudad","Hab","Precip")
df

# Borrar una columna
df$Hab <- NULL
df

# Filtrar datos
subset(df, Precip>20 & Precip<40)

# Lectura de datos
data("ChickWeight")
ChickWeight

# Primeras 6 filas
head(ChickWeight)

# Últimas 6 filas
tail(ChickWeight)

# Resumen de datos numéricos
summary(ChickWeight)

# Valores únicos
length(unique(ChickWeight$Chick))

# Filtrar con varias condiciones
subset(ChickWeight, Diet==4 & Time==21)
ChickWeight[ChickWeight$Diet==4 & ChickWeight$Time==21,
            c("weight","Time")]

# Ordenar columnas
ChickWeight[order(ChickWeight$weight),][1:10,] # Orden creciente
ChickWeight[order(-ChickWeight$weight),][1:10,] # Orden decreciente

ChickWeight[order(ChickWeight$Diet,
                  -ChickWeight$weight),][1:10,] # Orden por varias columnas

# Añadir columnas condicionales
ChickWeight$Class <- ifelse(ChickWeight$weight>250,"big","small")

# Añadir columna sin datos
ChickWeight$newColumn = NA

# Columna calculada
ChickWeight$weightperday = ChickWeight$weight/(ChickWeight$Time+1)

# Añadir filas
newRow <- data.frame(weight=210,Time=22,Chick=1,Diet=1, Class='big',newColumn=NA,weightperday=210/22)
newRow
ChickWeight <- rbind(ChickWeight, newRow)
tail(ChickWeight)

# Eliminar filas
ChickWeight <- ChickWeight[-c(579),]
tail(ChickWeight)

# Combinar data frames
df1<- data.frame(Ciudad=c("Madrid","Bilbao","Sevilla"),
                 Habitantes=c(150,200,40),
                 Precipitaciones=c(25,13,2))
df2 <- data.frame(Ciudad=c("Bilbao","Sevilla"), Temperatura=c(10,20))

dfT <- merge(df1,df2,by="Ciudad")
dfT

dfT <- merge(df1,df2,by="Ciudad",all=TRUE)

# cbind()
df3 <- data.frame(PIB=c(97,33,44),Paro=c(10,12,15))
df3
cbind(df1,df3)

# rbind
df4 <- data.frame(Ciudad="Valencia",Habitantes=100,Precipitaciones=5)
rbind(df1,df4)

# Ejemplo
data("chickwts")
chickwts
names(chickwts) <- c("peso","comida")

merge(ChickWeight, chickwts, by.x="weight",by.y="peso")

# Agregar datos
data("ChickWeight")
ChickWeight

# Calcular la media del peso por cada una de las dietas
aggregate(weight~Diet, ChickWeight, mean)
aggregate(weight~Diet, ChickWeight, max)

# Calcular la media de todas las variables por cada dieta
aggregate(.~Diet, ChickWeight, mean)

# Calcular el mínimo de Time y weight por cada dieta
aggregate(cbind(weight,Time)~Diet, ChickWeight, min)

# Calcular el máximo weight por cada dieta y gallina
aggregate(weight~Diet+Chick, ChickWeight, max)
