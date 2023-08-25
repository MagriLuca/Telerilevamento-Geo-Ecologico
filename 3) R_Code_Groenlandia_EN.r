# 1) Analisi multitemporale della LST della Groenlandia

library(raster)
library(rasterVis)
library(rgdal)

setwd("C:/lab/greenland")

lst2000 <- raster("lst_2000.tif")
lst2005 <- raster("lst_2005.tif")
lst2010 <- raster("lst_2010.tif")
lst2015 <- raster("lst_2015.tif")

# Il file caricato è in 16 bit (visibile in info)
lst2000

# Costruzione di un multiframe con tutti i dati
cl <- colorRampPalette(c("blue", "light blue", "pink", "red")) (100)

par(mfrow=c(2,2))
plot(lst2000, col=cl)
plot(lst2005, col=cl)
plot(lst2010, col=cl)
plot(lst2015, col=cl)
dev.off()

# Importazione dell'intero set in unico passaggio
rlist <- list.files(pattern="lst")
import <- lapply(rlist, raster)
tgr <- stack(import)

# Plot dello stack senza passare dal multiframe
plot(tgr, col=cl)

# Plot dallo stack di un unico elemento (primo)
plot(tgr[[1]], col=cl)
dev.off()

plotRGB(tgr, r=1, g=2, b=3, stretch="lin")

# Plot unico con titolo principale e nomi dei singoli layer
levelplot(tgr,col.regions=cl, main="LST variation in time",
          names.attr=c("July 2000","July 2005", "July 2010", "July 2015")

# 2) Osservazione decrescita del NO2 durante il lockdown

library(raster)

setwd("C:/lab/en")

# Importazione del primo file della serie
en01 <- raster("EN_0001.png")

cl <- colorRampPalette(c('red','orange','yellow'))(100)
plot(en01, col=cl)

en13 <- raster("EN_0013.png")
plot(en13, col=cl)

# Importazione di tutti i file in unico passaggio

rlist <- list.files(pattern="EN")
rimp <- lapply(rlist, raster)
en <- stack(rimp)

# Plot complessivo dei file caricati
plot(en, col=cl)

# Plot di EN01 vicino ad EN13
par(mfrow=c(1,2))
plot(en[[1]], col=cl)
plot(en[[13]], col=cl)

# Che in alternativa può essere fatto
en113 <- stack(en[[1]], en[[13]])
plot(en113, col=cl)

# Calcolo della differenza dei valori registrati
difen <-  en[[1]] - en[[13]]
cldif <- colorRampPalette(c('blue','white','red'))(100)
plot(difen, col=cldif)

# PlotRGB di tre file tutti assieme
plotRGB(en, r=1, g=7, b=13, stretch="lin")
plotRGB(en, r=1, g=7, b=13, stretch="hist")
