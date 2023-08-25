# Analisi multitemporale della LST della Groenlandia

library(raster)
setwd("C:/lab/greenland")

lst2000 <- raster("lst_2000.tif")
lst2005 <- raster("lst_2005.tif")
lst2010 <- raster("lst_2010.tif")
lst2015 <- raster("lst_2015.tif")

# Nota aggiuntiva: il file è in 16 bit (vedere info)
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
