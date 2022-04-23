# TIPOS DE DATOS

# character
"hola"
"124"
"23mm"

# numeric
23
3.5
pi

# integer
1L
2L
3L

# logical
TRUE
FALSE
T
F

# Para conocer el tipo de un dato se utiliza la función class()
x <- 3
class(x)
class(TRUE)
class(F)
class(5L)

# También es posible hacer cambios entre tipos, por ejemplo:
as.numeric("122")
as.logical(1)
as.logical(2)
as.logical(0)
as.numeric(TRUE)
as.numeric(FALSE)
as.character(TRUE)
as.numeric("225mm")

# Operadores comparativos y lógicos
7 < 5 # menor
8 >3 # mayor
3 <= 1 # menor o igual
2 >= 4 # mayor o igual
3 == 3 # igual
3 != 3 # diferente
3 > 1 & 2 > 0 # and
3 > 9 | 2 > 0 # or

# Vectores
x <- vector() # vector vacío
x_numeric <- c(1.5, 2.3, 6.8, -9.2)
x_character <- c("Manuel","Antonio")
x_logical <- c(TRUE, TRUE, FALSE, T)

# Pueden cambiar su tipo siempre que sea posible
as.numeric(x_logical)
as.numeric(x_character)

# Para conocer su longitud
length(x_numeric)

# Para seleccionar subconjuntos de un vector 
v <- c(1,3,5,7,9,11)
print(v)
v[1]
v[2:5]

# También se puede indexar con condiciones
v[v>5 & v<11]

# Operaciones aritméticas con vectores
v1 <- c(1,2,3)
v2 <- c(4,5,6)

v1 + v2 #suma
v1 * v2 #producto
v1 %*% v2 #producto escalar
max(v2) #máximo
which.max(v2) #Índice del máximo

# Otras operaciones:
sum(v) #suma
mean(v) #media
var(v) #varianza
sd(v) #desviación típica
log(v) # logaritmo neperiano
log10(v) # logaritmo base 10
log2(v) #logaritmo base 2
exp(v) #exponencial
sin(v) #seno
cos(v) #coseno
tan(v) #tangente
sqrt(v) #raíz cuadrada

# SECUENCIAS

# Secuencias ordenadas
1:10

# Secuencias regulares
seq(from=4, to=20, by=2)

# Secuencias aleatorias
sample(5) # Números aleatorios entre 1 y 5 sin repetición
rnorm(4, mean=5, sd=2) # Distribución normal
runif(5,min=2,max=8) # Distribución uniforme

# LISTAS
# Contienen elementos de diferentes tipos y tamaños
x <- list(temperatura=c(10,30,40),
          unidades=c("C","F"),
          umbral=c(TRUE,FALSE))

# Accedo a un elemento de la lista
x$temperatura
x$unidades[2]

# Añadir nuevos elementos a la lista
x$error <- c(0.1,0.2,0.3)
x$temperatura <- c(x$temperatura,50)

# Eliminar elemento de una lista
x$error <- NULL

# FACTORES
f <- factor(c("H","M","H","M","H"))
class(f)
levels(f)

as.character(f)


f2 <- factor(c("1","0","1","1","0","1"))
f2*2

f2 <- as.numeric(as.character(f2))
f2*2
