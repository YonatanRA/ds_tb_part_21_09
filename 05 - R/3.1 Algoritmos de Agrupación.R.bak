# K-MEANS

data("USArrests")
df <- USArrests

# Normalizar los datos
df2 <- scale(df)

library(factoextra)
fviz_nbclust(df2,kmeans,method="wss")

# Algoritmo kmeans con 3 clusters
k3 <- kmeans(df2,centers=3,nstart=25)
df$cluster <- k3$cluster

aggregate(.~cluster,df,mean)

fviz_cluster(k3,df2)


# CLUSTERING JERÁRQUICO
library(cluster)
hc <- diana(df2)
pltree(hc,cex=0.6,hang=-1)

clust <- cutree(hc,h=3)
hc$height <- sort(hc$height)
clust
df$cluster <- clust
aggregate(.~cluster,df,mean)

fviz_cluster(list(data=df,cluster=clust))

pltree(hc,hang=-1,cex=0.6)
rect.hclust(hc,h=3,border=2:20)
