# Script di una analisi multivariata

library(raster)
library(ggplot2)

setwd("C:/lab/")

sen <- brick("sentinel.png")
sen

plot(sen)

sen2 <- stack(sen[[1]], sen[[2]], sen[[3]])

plot(sen2)

pairs(sen2)

# PCA (Principal Component Analysis)
sample <- sampleRandom(sen2, 10000)
pca <- prcomp(sample)

# Varianza Spiegata
summary(pca)

# Correlazione con le bande originali
pca

# Mappa pc
pci <- predict(sen2, pca, index=c(1:2))

plot(pci[[1]])

# Utilizzo della funzione ggplot
pcid <- as.data.frame(pci[[1]], xy=T)

ggplot() +
geom_raster(pcid, mapping = aes(x=x, y=y, fill=PC1)) +
scale_fill_viridis()

# Celle aggregate: resampling (ricampionamento)
senres <- aggregate(sen, fact=10)
