# Script per utilizzo di SDM (Species Distribution Modelling).

library(sdm)
library(raster)
library(rgdal)

file <- system.file("external/species.shp", package="sdm")
species <- shapefile(file)
species

# Plot del file creato
plot(species)

# Controllo informazioni riguardo alle "occorrenze"
species$Occurrence

# Utilizzo funzione points per l'aggiunta di altri punti
plot(species[species$Occurrence == 1,],col='blue',pch=16)
points(species[species$Occurrence == 0,],col='red',pch=16)

# Sezione dedicata ai "predittori"
path <- system.file("external", package="sdm")

# Creazione di una lista dei "predittori"
lst <- list.files(path=path,pattern='asc$',full.names = T) #
lst

# Operazione di stack
preds <- stack(lst)

# Plot dei "predittori"
cl <- colorRampPalette(c('blue','orange','red','yellow')) (100)
plot(preds, col=cl)

# Plot dei "predittori" e delle "occorrenze"
plot(preds$elevation, col=cl)
points(species[species$Occurrence == 1,], pch=16)

plot(preds$temperature, col=cl)
points(species[species$Occurrence == 1,], pch=16)

plot(preds$precipitation, col=cl)
points(species[species$Occurrence == 1,], pch=16)

plot(preds$vegetation, col=cl)
points(species[species$Occurrence == 1,], pch=16)

# Sezione dedicata alla costruzione del modello

# Set dei dati per il pacchetto sdm
datasdm <- sdmData(train=species, predictors=preds)

# Modello
m1 <- sdm(Occurrence ~ elevation + precipitation + temperature + vegetation, data=datasdm, methods = "glm")

# Costruzione del raster output layer
p1 <- predict(m1, newdata=preds)

# Plot dell'output creato
plot(p1, col=cl)
points(species[species$Occurrence == 1,], pch=16)

# Aggiunta di quest'ultimo allo stack
s1 <- stack(preds,p1)
plot(s1, col=cl)
