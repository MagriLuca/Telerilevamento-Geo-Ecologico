# 1) Script per il processo di classificazione su immagine solare

library(raster)
library(RStoolbox)

setwd("C:/lab/")

# Importazione dell'immagine dalla cartella di lavoro
so <- brick("Solar_Orbiter_s_first_views_of_the_Sun_pillars.jpg")

plotRGB(so, 1, 2, 3, stretch="lin")
plotRGB(so, 1, 2, 3, stretch="hist")

# Processo di classificazione

# Parte 1: Ottenimento singoli valori
singlenr <- getValues(so)
singlenr
# set.seed(99)

# Parte 2: Classificazione
kcluster <- kmeans(singlenr, centers = 3)
kcluster

# Parte 3: Impostare valori sul raster
soclass <- setValues(so[[1]], kcluster$cluster) 
# Assegnazione di nuovi valori all'oggetto raster

cl <- colorRampPalette(c('yellow','black','red'))(100)
plot(soclass, col=cl)

# 2) Script per il processo di classificazione su immagine canyon

gc <- brick("dolansprings_oli_2013088_canyon_lrg.jpg")
gc

# Numerazione delle bande
# rosso = 1
# verde = 2
# blu = 3

plotRGB(gc, r=1, g=2, b=3, stretch="lin")
plotRGB(gc, r=1, g=2, b=3, stretch="hist")

# Processo di classificazione

# Parte 1: Ottenimento singoli valori
singlenr <- getValues(gc)
singlenr

# Parte 2: Classificazione
kcluster <- kmeans(singlenr, centers = 3)
kcluster

# Parte 3: Impostare valori sul raster
gcclass <- setValues(gc[[1]], kcluster$cluster) 
# Assegnazione di nuovi valori all'oggetto raster

cl <- colorRampPalette(c('yellow','black','red'))(100)
plot(gcclass, col=cl)

frequencies <- freq(gcclass)
tot = 58076148
percentages = frequencies * 100 /  tot
