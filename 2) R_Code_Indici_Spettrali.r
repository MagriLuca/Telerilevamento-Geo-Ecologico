# Secondo codice per definizione degli Indici Spettrali

library(raster)
library(RStoolbox)
library(rasterdiv)

setwd("C:/lab/")

# Importo la prima immagine raster (jpg)
l1992 <- brick("defor1_.jpg")

plotRGB(l1992, r=1, g=2, b=3, stretch="lin")

# layer 1 = NIR
# layer 2 = rosso
# layer 3 = verde

# Importo la seconda immagine raster (jpg)
l2006 <- brick("defor2_.jpg")

plotRGB(l2006, r=1, g=2, b=3, stretch="lin")

# Costruzione Multiframe con due immagini
par(mfrow=c(2,1))
plotRGB(l1992, r=1, g=2, b=3, stretch="lin")
plotRGB(l2006, r=1, g=2, b=3, stretch="lin")
dev.off()

# Calcolo DVI (Difference Vegetation Index)
dvi1992 = l1992[[1]] - l1992[[2]]
# dvi1992 = l1992$defor1_.1 - l1992$defor1_.2

dvi2006 = l2006[[1]] - l2006[[2]]
# dvi2006 = l2006$defor1_.1 - l2006$defor1_.2

cl <- colorRampPalette(c("dark blue", "yellow", "red", "black")) (100)
plot(dvi1992, col=cl)
plot(dvi2006, col=cl)

# Differenza di DVI nel tempo
dvi_dif = dvi1992 - dvi2006
cld <- colorRampPalette(c("blue", "white", "red")) (100)
dev.off()

plot(dvi_dif, col=cld)

# Range potenziale DVI (8 bit) = da 255 a -255
# Range potenziale NDVI (8 bit) = da 1 a -1

# Range potenziale DVI (16 bit) = da 65535 a -65535
# Range potenziale NDVI (16 bit) = da 1 a -1

# NDVI va bene per immagini con diversa risoluzione

# Calcolo dell'indice NDVI per 1992 e 2006
ndvi1992 = (l1992[[1]] - l1992[[2]]) / (l1992[[1]] + l1992[[2]])
ndvi2006 = (l2006[[1]] - l2006[[2]]) / (l2006[[1]] + l2006[[2]])

# Plot di RGB e NDVI calcolati in multiframe (1992)
par(mfrow=c(2,1))
plotRGB(l1992, r=1, g=2, b=3, stretch="lin")
plot(ndvi1992, col=cl)
dev.off()

# Plot di NDVI calcolati in multiframe (1992 e 2006)
par(mfrow=c(2,1))
plot(ndvi1992, col=cl)
plot(ndvi2006, col=cl)
dev.off()

# Indici Spettrali automatici con SpectralIndices
si1992 <- spectralIndices(l1992, green=3, red=2, nir=1)
plot(si1992, col=cl)

si2006 <- spectralIndices(l2006, green=3, red=2, nir=1)
plot(si2006, col=cl)
dev.off()

# Utilizzo pacchetto rasterdiv
plot(copNDVI)
