library(raster)
setwd("C:/lab/")

# Importo la prima immagine raster (.jpg)
l1992 <- brick("defor1_.jpg")

plotRGB(l1992, r=1, g=2, b=3, stretch="lin")

# layer 1 = NIR
# layer 2 = rosso
# layer 3 = verde

# Importo la seconda immagine raster (.jpg)
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
