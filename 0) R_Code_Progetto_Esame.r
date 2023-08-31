# Questo è il codice R adoperato per il progetto d'esame

# Il progetto si focalizza sulla deforestazione in Brasile.
# L'analisi verrà compiuta sulle seguenti tre grandi aree:

# 1) Zona Ovest -----> Stato federale di Rondonia (Località Ariquemes)
# 2) Zona Centrale --> Stato federale di Mato Grosso (Località Colniza)
# 3) Zona Est -------> Stato federale di Parà (Località Marabà)

# Ogni cella Landsat possiede una dimensione di 185 x 170 chilometri.
# Nel lavoro sono state usate scansioni da Landsat 5 ed 8 sulle celle:

# 1) Zona Ovest -----> Cella: Path 232 Row 067
# 2) Zona Centrale --> Cella: Path 229 Row 067
# 3) Zona Est -------> Cella: Path 223 Row 064

# Temporalmente le analisi sono compiute nel mese di luglio (inverno);
# In 5 diversi anni, ossia: 1987, 1996, 2005, 2014 e 2023.

library(raster)
library(rgdal)
library(ggplot2)
library(viridis)
library(patchwork)

# Bande d'interesse in Landsat 5

# Banda 1: Blu
# Banda 2: Verde
# Banda 3: Rosso
# Banda 4: NIR

# Bande d'interesse in Landsat 8

# Banda 2: Blu
# Banda 3: Verde
# Banda 4: Rosso
# Banda 5: NIR

# Sezione Ovest

setwd("C:/Telerilevamento/Brasile_Ovest/Brasile_232_067_1987")
ListaOvest1987 <- list.files(pattern="Banda")
ImportOvest1987 <- lapply(ListaOvest1987,raster)
StackOvest1987 <- stack(ImportOvest1987)

setwd("C:/Telerilevamento/Brasile_Ovest/Brasile_232_067_1996")
ListaOvest1996 <- list.files(pattern="Banda")
ImportOvest1996 <- lapply(ListaOvest1996,raster)
StackOvest1996 <- stack(ImportOvest1996)

setwd("C:/Telerilevamento/Brasile_Ovest/Brasile_232_067_2005")
ListaOvest2005 <- list.files(pattern="Banda")
ImportOvest2005 <- lapply(ListaOvest2005,raster)
StackOvest2005 <- stack(ImportOvest2005)

setwd("C:/Telerilevamento/Brasile_Ovest/Brasile_232_067_2014")
ListaOvest2014 <- list.files(pattern="Banda")
ImportOvest2014 <- lapply(ListaOvest2014,raster)
StackOvest2014 <- stack(ImportOvest2014)

setwd("C:/Telerilevamento/Brasile_Ovest/Brasile_232_067_2023")
ListaOvest2023 <- list.files(pattern="Banda")
ImportOvest2023 <- lapply(ListaOvest2023,raster)
StackOvest2023 <- stack(ImportOvest2023)

# Sezione Centrale

setwd("C:/Telerilevamento/Brasile_Centrale/Brasile_229_067_1987")
ListaCentrale1987 <- list.files(pattern="Banda")
ImportCentrale1987 <- lapply(ListaCentrale1987,raster)
StackCentrale1987 <- stack(ImportCentrale1987)

setwd("C:/Telerilevamento/Brasile_Centrale/Brasile_229_067_1996")
ListaCentrale1996 <- list.files(pattern="Banda")
ImportCentrale1996 <- lapply(ListaCentrale1996,raster)
StackCentrale1996 <- stack(ImportCentrale1996)

setwd("C:/Telerilevamento/Brasile_Centrale/Brasile_229_067_2005")
ListaCentrale2005 <- list.files(pattern="Banda")
ImportCentrale2005 <- lapply(ListaCentrale2005,raster)
StackCentrale2005 <- stack(ImportCentrale2005)

setwd("C:/Telerilevamento/Brasile_Centrale/Brasile_229_067_2014")
ListaCentrale2014 <- list.files(pattern="Banda")
ImportCentrale2014 <- lapply(ListaCentrale2014,raster)
StackCentrale2014 <- stack(ImportCentrale2014)

setwd("C:/Telerilevamento/Brasile_Centrale/Brasile_229_067_2023")
ListaCentrale2023 <- list.files(pattern="Banda")
ImportCentrale2023 <- lapply(ListaCentrale2023,raster)
StackCentrale2023 <- stack(ImportCentrale2023)

# Sezione Est

setwd("C:/Telerilevamento/Brasile_Est/Brasile_223_064_1987")
ListaEst1987 <- list.files(pattern="Banda")
ImportEst1987 <- lapply(ListaEst1987,raster)
StackEst1987 <- stack(ImportEst1987)

setwd("C:/Telerilevamento/Brasile_Est/Brasile_223_064_1996")
ListaEst1996 <- list.files(pattern="Banda")
ImportEst1996 <- lapply(ListaEst1996,raster)
StackEst1996 <- stack(ImportEst1996)

setwd("C:/Telerilevamento/Brasile_Est/Brasile_223_064_2005")
ListaEst2005 <- list.files(pattern="Banda")
ImportEst2005 <- lapply(ListaEst2005,raster)
StackEst2005 <- stack(ImportEst2005)

setwd("C:/Telerilevamento/Brasile_Est/Brasile_223_064_2014")
ListaEst2014 <- list.files(pattern="Banda")
ImportEst2014 <- lapply(ListaEst2014,raster)
StackEst2014 <- stack(ImportEst2014)

setwd("C:/Telerilevamento/Brasile_Est/Brasile_223_064_2023")
ListaEst2023 <- list.files(pattern="Banda")
ImportEst2023 <- lapply(ListaEst2023,raster)
StackEst2023 <- stack(ImportEst2023)

# Calcolo DVI e NDVI per Sezione Ovest e Differenza tra 1987 e 2023

DVIStackOvest1987 = StackOvest1987[[4]] - StackOvest1987[[3]]
NDVIStackOvest1987 = DVIStackOvest1987 / (StackOvest1987[[4]] + 
                                          + StackOvest1987[[3]])

DVIStackOvest2023 = StackOvest2023[[4]] - StackOvest2023[[3]]
NDVIStackOvest2023 = DVIStackOvest2023 / (StackOvest2023[[4]] + 
                                          + StackOvest2023[[3]])

DifferenzaDVIOvest = DVIStackOvest1987 - DVIStackOvest2023
Palette1 = colorRampPalette(c('blue','white','red'))(100)
plot(DifferenzaDVIOvest, col = Palette1)

# Calcolo DVI e NDVI per Sezione Centrale e Differenza tra 1987 e 2023

DVIStackCentrale1987 = StackCentrale1987[[4]] - StackCentrale1987[[3]]
NDVIStackCentrale1987 = DVIStackCentrale1987 / (StackCentrale1987[[4]] +
                                                + StackCentrale1987[[3]])

DVIStackCentrale2023 = StackCentrale2023[[4]] - StackCentrale2023[[3]]
NDVIStackCentrale2023 = DVIStackCentrale2023 / (StackCentrale2023[[4]] +
                                                + StackCentrale2023[[3]])

DifferenzaDVICentrale = DVIStackCentrale1987 - DVIStackCentrale2023
plot(DifferenzaDVICentrale, col = Palette1)

# Calcolo DVI e NDVI per Sezione Est e Differenza tra 1987 e 2023

DVIStackEst1987 = StackEst1987[[4]] - StackEst1987[[3]]
NDVIStackEst1987 = DVIStackEst1987 / (StackEst1987[[4]] +
                                      + StackEst1987[[3]])

DVIStackEst2023 = StackEst2023[[4]] - StackEst2023[[3]]
NDVIStackEst2023 = DVIStackEst2023 / (StackEst2023[[4]] +
                                      + StackEst2023[[3]])

DifferenzaDVIEst = DVIStackEst1987 - DVIStackEst2023
plot(DifferenzaDVIEst, col = Palette1)

# Esportazione Mappe (.tiff) della Sezione Ovest

setwd("C:/Telerilevamento/Elaborati")

tiff("StackOvest1987.tiff")
plotRGB(StackOvest1987, 4, 2, 1, stretch="Lin")
dev.off()

tiff("StackOvest1996.tiff")
plotRGB(StackOvest1996, 4, 2, 1, stretch="Lin")
dev.off()

tiff("StackOvest2005.tiff")
plotRGB(StackOvest2005, 4, 2, 1, stretch="Lin")
dev.off()

tiff("StackOvest2014.tiff")
plotRGB(StackOvest2014, 4, 2, 1, stretch="Lin")
dev.off()

tiff("StackOvest2023.tiff")
plotRGB(StackOvest2023, 4, 2, 1, stretch="Lin")
dev.off()

# Esportazione Mappe (.tiff) della Sezione Centrale

tiff("StackCentrale1987.tiff")
plotRGB(StackCentrale1987, 4, 2, 1, stretch="Lin")
dev.off()

tiff("StackCentrale1996.tiff")
plotRGB(StackCentrale1996, 4, 2, 1, stretch="Lin")
dev.off()

tiff("StackCentrale2005.tiff")
plotRGB(StackCentrale2005, 4, 2, 1, stretch="Lin")
dev.off()

tiff("StackCentrale2014.tiff")
plotRGB(StackCentrale2014, 4, 2, 1, stretch="Lin")
dev.off()

tiff("StackCentrale2023.tiff")
plotRGB(StackCentrale2023, 4, 2, 1, stretch="Lin")
dev.off()

# Esportazione Mappe (.tiff) della Sezione Est

tiff("StackEst1987.tiff")
plotRGB(StackEst1987, 4, 2, 1, stretch="Lin")
dev.off()

tiff("StackEst1996.tiff")
plotRGB(StackEst1996, 4, 2, 1, stretch="Lin")
dev.off()

tiff("StackEst2005.tiff")
plotRGB(StackEst2005, 4, 2, 1, stretch="Lin")
dev.off()

tiff("StackEst2014.tiff")
plotRGB(StackEst2014, 4, 2, 1, stretch="Lin")
dev.off()

tiff("StackEst2023.tiff")
plotRGB(StackEst2023, 4, 2, 1, stretch="Lin")
dev.off()

# Classificazione per Analisi della Copertura dei Suoli, sezione Ovest

Palette2 <- colorRampPalette(c('dark green','black','yellow'))(100)

Ovest1987Cut <- brick("StackOvest1987Cut.tiff")
SingleValuesOvest1987 <- getValues(Ovest1987Cut)
kclusterOvest1987 <- kmeans(SingleValuesOvest1987, centers = 2)
Ovest1987Class <- setValues(Ovest1987Cut[[1]], kclusterOvest1987$cluster)
plot(Ovest1987Class, col=Palette2)
Frequenze <- freq(Ovest1987Class)
Totale = Frequenze[[1,2]] + Frequenze[[2,2]]
Percentuali = Frequenze * 100 / Totale
Percentuali

Ovest1996Cut <- brick("StackOvest1996Cut.tiff")
SingleValuesOvest1996 <- getValues(Ovest1996Cut)
kclusterOvest1996 <- kmeans(SingleValuesOvest1996, centers = 2)
Ovest1996Class <- setValues(Ovest1996Cut[[1]], kclusterOvest1996$cluster)
plot(Ovest1996Class, col=Palette2)
Frequenze <- freq(Ovest1996Class)
Totale = Frequenze[[1,2]] + Frequenze[[2,2]]
Percentuali = Frequenze * 100 / Totale
Percentuali

Ovest2005Cut <- brick("StackOvest2005Cut.tiff")
SingleValuesOvest2005 <- getValues(Ovest2005Cut)
kclusterOvest2005 <- kmeans(SingleValuesOvest2005, centers = 2)
Ovest2005Class <- setValues(Ovest2005Cut[[1]], kclusterOvest2005$cluster)
plot(Ovest2005Class, col=Palette2)
Frequenze <- freq(Ovest2005Class)
Totale = Frequenze[[1,2]] + Frequenze[[2,2]]
Percentuali = Frequenze * 100 / Totale
Percentuali

Ovest2014Cut <- brick("StackOvest2014Cut.tiff")
SingleValuesOvest2014 <- getValues(Ovest2014Cut)
kclusterOvest2014 <- kmeans(SingleValuesOvest2014, centers = 2)
Ovest2014Class <- setValues(Ovest2014Cut[[1]], kclusterOvest2014$cluster)
plot(Ovest2014Class, col=Palette2)
Frequenze <- freq(Ovest2014Class)
Totale = Frequenze[[1,2]] + Frequenze[[2,2]]
Percentuali = Frequenze * 100 / Totale
Percentuali

Ovest2023Cut <- brick("StackOvest2023Cut.tiff")
SingleValuesOvest2023 <- getValues(Ovest2023Cut)
kclusterOvest2023 <- kmeans(SingleValuesOvest2023, centers = 2)
Ovest2023Class <- setValues(Ovest2023Cut[[1]], kclusterOvest2023$cluster)
plot(Ovest2023Class, col=Palette2)
Frequenze <- freq(Ovest2023Class)
Totale = Frequenze[[1,2]] + Frequenze[[2,2]]
Percentuali = Frequenze * 100 / Totale
Percentuali

# Classificazione per Analisi della Copertura dei Suoli, sezione Centrale

Centrale1987Cut <- brick("StackCentrale1987Cut.tiff")
SingleValuesCentrale1987 <- getValues(Centrale1987Cut)
kclusterCentrale1987 <- kmeans(SingleValuesCentrale1987, centers = 2)
Centrale1987Class <- setValues(Centrale1987Cut[[1]], kclusterCentrale1987$cluster)
plot(Centrale1987Class, col=Palette2)
Frequenze <- freq(Centrale1987Class)
Totale = Frequenze[[1,2]] + Frequenze[[2,2]]
Percentuali = Frequenze * 100 / Totale
Percentuali

Centrale1996Cut <- brick("StackCentrale1996Cut.tiff")
SingleValuesCentrale1996 <- getValues(Centrale1996Cut)
kclusterCentrale1996 <- kmeans(SingleValuesCentrale1996, centers = 2)
Centrale1996Class <- setValues(Centrale1996Cut[[1]], kclusterCentrale1996$cluster)
plot(Centrale1996Class, col=Palette2)
Frequenze <- freq(Centrale1996Class)
Totale = Frequenze[[1,2]] + Frequenze[[2,2]]
Percentuali = Frequenze * 100 / Totale
Percentuali

Centrale2005Cut <- brick("StackCentrale2005Cut.tiff")
SingleValuesCentrale2005 <- getValues(Centrale2005Cut)
kclusterCentrale2005 <- kmeans(SingleValuesCentrale2005, centers = 2)
Centrale2005Class <- setValues(Centrale2005Cut[[1]], kclusterCentrale2005$cluster)
plot(Centrale2005Class, col=Palette2)
Frequenze <- freq(Centrale2005Class)
Totale = Frequenze[[1,2]] + Frequenze[[2,2]]
Percentuali = Frequenze * 100 / Totale
Percentuali

Centrale2014Cut <- brick("StackCentrale2014Cut.tiff")
SingleValuesCentrale2014 <- getValues(Centrale2014Cut)
kclusterCentrale2014 <- kmeans(SingleValuesCentrale2014, centers = 2)
Centrale2014Class <- setValues(Centrale2014Cut[[1]], kclusterCentrale2014$cluster)
plot(Centrale2014Class, col=Palette2)
Frequenze <- freq(Centrale2014Class)
Totale = Frequenze[[1,2]] + Frequenze[[2,2]]
Percentuali = Frequenze * 100 / Totale
Percentuali

Centrale2023Cut <- brick("StackCentrale2023Cut.tiff")
SingleValuesCentrale2023 <- getValues(Centrale2023Cut)
kclusterCentrale2023 <- kmeans(SingleValuesCentrale2023, centers = 2)
Centrale2023Class <- setValues(Centrale2023Cut[[1]], kclusterCentrale2023$cluster)
plot(Centrale2023Class, col=Palette2)
Frequenze <- freq(Centrale2023Class)
Totale = Frequenze[[1,2]] + Frequenze[[2,2]]
Percentuali = Frequenze * 100 / Totale
Percentuali

# Classificazione per Analisi della Copertura dei Suoli, sezione Est

Est1987Cut <- brick("StackEst1987Cut.tiff")
SingleValuesEst1987 <- getValues(Est1987Cut)
kclusterEst1987 <- kmeans(SingleValuesEst1987, centers = 2)
Est1987Class <- setValues(Est1987Cut[[1]], kclusterEst1987$cluster)
plot(Est1987Class, col=Palette2)
Frequenze <- freq(Est1987Class)
Totale = Frequenze[[1,2]] + Frequenze[[2,2]]
Percentuali = Frequenze * 100 / Totale
Percentuali

Est1996Cut <- brick("StackEst1996Cut.tiff")
SingleValuesEst1996 <- getValues(Est1996Cut)
kclusterEst1996 <- kmeans(SingleValuesEst1996, centers = 2)
Est1996Class <- setValues(Est1996Cut[[1]], kclusterEst1996$cluster)
plot(Est1996Class, col=Palette2)
Frequenze <- freq(Est1996Class)
Totale = Frequenze[[1,2]] + Frequenze[[2,2]]
Percentuali = Frequenze * 100 / Totale
Percentuali

Est2005Cut <- brick("StackEst2005Cut.tiff")
SingleValuesEst2005 <- getValues(Est2005Cut)
kclusterEst2005 <- kmeans(SingleValuesEst2005, centers = 2)
Est2005Class <- setValues(Est2005Cut[[1]], kclusterEst2005$cluster)
plot(Est2005Class, col=Palette2)
Frequenze <- freq(Est2005Class)
Totale = Frequenze[[1,2]] + Frequenze[[2,2]]
Percentuali = Frequenze * 100 / Totale
Percentuali

Est2014Cut <- brick("StackEst2014Cut.tiff")
SingleValuesEst2014 <- getValues(Est2014Cut)
kclusterEst2014 <- kmeans(SingleValuesEst2014, centers = 2)
Est2014Class <- setValues(Est2014Cut[[1]], kclusterEst2014$cluster)
plot(Est2014Class, col=Palette2)
Frequenze <- freq(Est2014Class)
Totale = Frequenze[[1,2]] + Frequenze[[2,2]]
Percentuali = Frequenze * 100 / Totale
Percentuali

Est2023Cut <- brick("StackEst2023Cut.tiff")
SingleValuesEst2023 <- getValues(Est2023Cut)
kclusterEst2023 <- kmeans(SingleValuesEst2023, centers = 2)
Est2023Class <- setValues(Est2023Cut[[1]], kclusterEst2023$cluster)
plot(Est2023Class, col=Palette2)
Frequenze <- freq(Est2023Class)
Totale = Frequenze[[1,2]] + Frequenze[[2,2]]
Percentuali = Frequenze * 100 / Totale
Percentuali

# Costruzione di un Dataframe per la Sezione Ovest

CoperturaSuolo <- c("Foresta", "Agricoltura")

PercentualeOvest1987 <- c(  )
PercentualeOvest1996 <- c(  )
PercentualeOvest2005 <- c(  )
PercentualeOvest2014 <- c(  )
PercentualeOvest2023 <- c(  )

PercentualiOvest <- data.frame(CoperturaSuolo, PercentualeOvest1987, 
                               PercentualeOvest1996, PercentualeOvest2005, 
                               PercentualeOvest2014, PercentualeOvest2023)

# Costruzione di un Dataframe per la Sezione Centrale

PercentualeCentrale1987 <- c(  )
PercentualeCentrale1996 <- c(  )
PercentualeCentrale2005 <- c(  )
PercentualeCentrale2014 <- c(  )
PercentualeCentrale2023 <- c(  )

PercentualiOvest <- data.frame(CoperturaSuolo, PercentualeCentrale1987, 
                               PercentualeCentrale1996, PercentualeCentrale2005, 
                               PercentualeCentrale2014, PercentualeCentrale2023)

# Costruzione di un Dataframe per la Sezione Est

PercentualeEst1987 <- c(  )
PercentualeEst1996 <- c(  )
PercentualeEst2005 <- c(  )
PercentualeEst2014 <- c(  )
PercentualeEst2023 <- c(  )

PercentualiOvest <- data.frame(CoperturaSuolo, PercentualeEst1987, 
                               PercentualeEst1996, PercentualeEst2005, 
                               PercentualeEst2014, PercentualeEst2023)

# Cosa Manca?
# Diagramma x-y indicante il trend di deforestazione
# Mappatura LST - Consulta Script Copernicus
