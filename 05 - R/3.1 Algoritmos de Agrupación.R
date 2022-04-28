# K-MEANS

data("USArrests")
df <- USArrests

# Normalizar los datos
df2 <- scale(df)

#install.packages("factoextra")
library(factoextra)

# Método del codo
fviz_nbclust(df2,kmeans,method="wss")

# Algoritmo k-means con 3 clusters
k3 <- kmeans(df2, centers=3)
df$cluster <- k3$cluster

aggregate(.~cluster, df, mean)

fviz_cluster(k3,df2)

# Clustering jerárquico
library(cluster)
hc <- diana(df2)
pltree(hc, cex=0.6, hang=-1)

clust <- cutree(hc, h=3)
hc$height <- sort(hc$height)
clust
df$cluster <- clust

aggregate(.~cluster, df, mean)

fviz_cluster(list(data=df,cluster=clust))

pltree(hc,hang=-1,cex=0.6)
rect.hclust(hc,h=3,border=2:20)
