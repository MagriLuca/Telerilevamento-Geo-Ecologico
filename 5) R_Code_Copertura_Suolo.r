# Script per analisi copertura del suolo.

library(raster)
library(ggplot2)
library(patchwork)

setwd("C:/lab/")

# Numerazione delle bande
# NIR = 1
# RED = 2
# GREEN = 3

defor1 <- brick("defor1_.png")
plotRGB(defor1, r=1, g=2, b=3, stretch="lin")

defor2 <- brick("defor2_.png")
plotRGB(defor2, r=1, g=2, b=3, stretch="lin")

par(mfrow=c(1,2))
plotRGB(defor1, r=1, g=2, b=3, stretch="lin")
plotRGB(defor2, r=1, g=2, b=3, stretch="lin")

# Classificazione "Non supervisionata" per il primo file

# 1. Ottenimento tutti singoli valori
singlenr1 <- getValues(defor1)
singlenr1

# 2. Classificazione
kcluster1 <- kmeans(singlenr1, centers = 3)
kcluster1

# 3. Impostare valori nel raster
defor1class <- setValues(defor1[[1]], kcluster1$cluster)
# Assegnare nuovi valori all'oggetto raster

cl <- colorRampPalette(c('yellow','black','red'))(100)
plot(defor1class, col=cl)
# Classe 1: Foresta
# Classe 2: Agricultura

# Funzione set.seed() consente di ottenere stessi risultati

# Classificazione "Non supervisionata" per il secondo file

# 1. Ottenimento tutti singoli valori
singlenr2 <- getValues(defor2)
singlenr2

# 2. Classificazione
kcluster2 <- kmeans(singlenr2, centers = 3)
kcluster2

# 3. Impostare valori nel raster
defor2class <- setValues(defor2[[1]], kcluster2$cluster)
# Assegnare nuovi valori all'oggetto raster

cl <- colorRampPalette(c('yellow','black','red'))(100)
plot(defor2class, col=cl)
# class 1: Foresta
# class 2: Agricultura

# Frequenze
frequencies1 <- freq(defor1class)
tot1 = ncell(defor1class)
percentages1 = frequencies1 * 100 /  tot1

# Percentuale foresta: 89.83012
# Percentuale agricultura: 10.16988

frequencies2 <- freq(defor2class)
tot2 = ncell(defor2class)
percentages2 = frequencies2 * 100 /  tot2

# Costruzione di un dataframe
cover <- c("Forest","Agriculture")
percent_1992 <- c(89.83, 10.16)
percent_2006 <- c(52.06, 47.93)

percentages <- data.frame(cover, percent_1992, percent_2006)

# Plot di questi ultimi
ggplot(percentages, aes(x=cover, y=percent_1992, color=cover)) + geom_bar(stat="identity", fill="white")
ggplot(percentages, aes(x=cover, y=percent_2006, color=cover)) + geom_bar(stat="identity", fill="white")

p1 <- ggplot(percentages, aes(x=cover, y=percent_1992, color=cover)) + geom_bar(stat="identity", fill="white")
p2 <- ggplot(percentages, aes(x=cover, y=percent_2006, color=cover)) + geom_bar(stat="identity", fill="white")

p1+p2

# Stessi limiti percentuali
p1 <- ggplot(percentages, aes(x=cover, y=percent_1992, color=cover)) + geom_bar(stat="identity", fill="white") +
ylim(c(0,100))

p2 <- ggplot(percentages, aes(x=cover, y=percent_2006, color=cover)) + geom_bar(stat="identity",
fill="white") +
ylim(c(0,100))

p1+p2
