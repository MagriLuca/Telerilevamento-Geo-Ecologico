# SEZIONE 1) Introduzione a dati ed obiettivi del codice.

# Questo è il codice R adoperato per il progetto d'esame:
# Esso è ricco di commenti e chiarimenti su tutte le azioni.
# Il progetto si focalizza sulla deforestazione in Brasile.
# L'analisi verrà compiuta sulle seguenti tre grandi aree:

# 1) Zona Ovest ------> Stato federale di Rondonia (Località Ariquemes);
# 2) Zona Centrale ---> Stato federale di Mato Grosso (Località Colniza);
# 3) Zona Est --------> Stato federale di Parà (Località Marabà).

# Ogni cella Landsat possiede una dimensione di 185 x 170 chilometri.
# Questo equivale a dire che ha un'areale pari a circa 31.500 km2:
# Praticamente l'area è circa pari alla somma di Emilia-Romagna e Marche.
# Nel lavoro sono state usate scansioni da Landsat 5 ed 8 sulle celle:

# 1) Zona Ovest ------> Cella: Path 232 Row 067;
# 2) Zona Centrale ---> Cella: Path 229 Row 067;
# 3) Zona Est --------> Cella: Path 223 Row 064.

# Temporalmente le analisi sono compiute nel mese di luglio (inverno);
# In 5 differenti anni, ossia: 1987, 1996, 2005, 2014 ed il 2023.

# Installazione dei pacchetti necessari e loro richiamo.
# install.packages("raster")
library(raster)
# install.packages("rgdal")
library(rgdal)

# Bande di nostro interesse in Landsat 5 (da 1987 a 2005):

# Banda 1: Blu
# Banda 2: Verde
# Banda 3: Rosso
# Banda 4: NIR

# Bande di nostro interesse in Landsat 8 (da 2014 a 2023):

# Banda 2: Blu
# Banda 3: Verde
# Banda 4: Rosso
# Banda 5: NIR

# SEZIONE 2) Caricamento layers per lavorarci successivamente.

# In questa parte, verranno sistematicamente impostate le WD:
# In tale modo verranno dapprima posti in una lista i layers,
# Dunque successivamente importati tramite la funzione lapply.
# Ed infine posti in un unico stack, per essere pronti all'uso.
# Tutte le operazioni fatte in serie e correttamente denominate.

# Sezione Ovest: creazione stack per ogni anno e zona analizzati.

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

# Sezione Centrale: creazione stack per ogni anno e zona analizzati.

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

# Sezione Est: creazione stack per ogni anno e zona analizzati.

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

# SEZIONE 3) Derivazione DVI ed NDVI e differenza tra 1987 e 2023.

# Definizione INDICE DVI  ------> NIR - RED;
# Definizione INDICE NDVI ------> (NIR - RED) / (NIR + RED);
# DIF. 1987-2023 ---> Evidenzia impatto della deforestazione.

# Sezione Ovest: DVI, NDVI e differenze per gli stack 1987 e 2023.

Palette1 = colorRampPalette(c('blue','white','red'))(100)

DVIOvest1987 = StackOvest1987[[4]] - StackOvest1987[[3]]
NDVIOvest1987 = DVIOvest1987 / (StackOvest1987[[4]] + 
                                + StackOvest1987[[3]])
plot(NDVIOvest1987, col=Palette1)

DVIOvest2023 = StackOvest2023[[4]] - StackOvest2023[[3]]
NDVIOvest2023 = DVIOvest2023 / (StackOvest2023[[4]] + 
                                + StackOvest2023[[3]])
plot(NDVIOvest2023, col=Palette1)

# Plot differenza tra le annate 1987 e 2023 con Palette1:
DifferenzaDVIOvest = DVIOvest1987 - DVIOvest2023
plot(DifferenzaDVIOvest, col=Palette1)

# Sezione Centrale: DVI, NDVI e differenze per gli stack 1987 e 2023.

DVICentrale1987 = StackCentrale1987[[4]] - StackCentrale1987[[3]]
NDVICentrale1987 = DVICentrale1987 / (StackCentrale1987[[4]] +
                                      + StackCentrale1987[[3]])
plot(NDVICentrale1987, col=Palette1)

DVICentrale2023 = StackCentrale2023[[4]] - StackCentrale2023[[3]]
NDVICentrale2023 = DVICentrale2023 / (StackCentrale2023[[4]] +
                                      + StackCentrale2023[[3]])
plot(NDVICentrale2023, col=Palette1)

# Plot differenza tra le annate 1987 e 2023 con Palette1:
DifferenzaDVICentrale = DVICentrale1987 - DVICentrale2023
plot(DifferenzaDVICentrale, col=Palette1)

# Sezione Est: DVI, NDVI e differenze per gli stack 1987 e 2023.

DVIEst1987 = StackEst1987[[4]] - StackEst1987[[3]]
NDVIEst1987 = DVIEst1987 / (StackEst1987[[4]] +
                            + StackEst1987[[3]])
plot(NDVIEst1987, col=Palette1)

DVIEst2023 = StackEst2023[[4]] - StackEst2023[[3]]
NDVIEst2023 = DVIEst2023 / (StackEst2023[[4]] +
                            + StackEst2023[[3]])
plot(NDVIEst2023, col=Palette1)

# Plot differenza tra le annate 1987 e 2023 con Palette1:
DifferenzaDVIEst = DVIEst1987 - DVIEst2023
plot(DifferenzaDVIEst, col=Palette1)

# SEZIONE 4) Esportazione sistematica mappe (.tiff).

# Questa azione ripetuta serve ad ottenere diversi file:
# Le immagini sono rappresentative per le 5 diverse annate.
# I prodotti verranno usati nella seguente classificazione.
# Ciascun output è un RGB (R = NIR, G = Verde, B = Blu).

# Impostazione definitiva della cartella di lavoro:
setwd("C:/Telerilevamento/Elaborati")

# Sezione Ovest: Esportazione mappe (in formato .tiff).

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

# Sezione Centrale: Esportazione mappe (in formato .tiff).

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

# Sezione Est: Esportazione mappe (in formato .tiff).

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

# I file generati sono stati ritagliati utilizzando il software QGis:
# Ciascuna immagine è stata caricata e ritagliata con un poligono;
# Tutti gli output risultanti sono stati indicati con la sigla "Cut".

# SEZIONE 5) Classificazione per le analisi di copertura dei suoli.

# Per ogni immagine ritagliata, viene compiuta la classificazione.
# Sfruttando la differenziazione attivabile con poche righe di codice,
# Si può differenziare la foresta da ciò che non lo è (i campi).
# Dall'operazione eseguita si contano i pixel delle due categorie:
# Come ultimo passaggio si sono convertiti i dati nelle percentuali.

Palette2 <- colorRampPalette(c('dark green','black','yellow'))(100)

# Sezione Ovest: Classificazione per ogni anno e calcolo percentuali.

Ovest1987 <- brick("StackOvest1987Cut.tiff")
SingleValuesOvest1987 <- getValues(Ovest1987)
kclusterOvest1987 <- kmeans(SingleValuesOvest1987, centers = 2)
Ovest1987Class <- setValues(Ovest1987[[1]], kclusterOvest1987$cluster)
plot(Ovest1987Class, col=Palette2)
Frequenze <- freq(Ovest1987Class)
Totale = ncell(Ovest1987Class)
Percentuali = Frequenze * 100 / Totale
Percentuali

Ovest1996 <- brick("StackOvest1996Cut.tiff")
SingleValuesOvest1996 <- getValues(Ovest1996)
kclusterOvest1996 <- kmeans(SingleValuesOvest1996, centers = 2)
Ovest1996Class <- setValues(Ovest1996[[1]], kclusterOvest1996$cluster)
plot(Ovest1996Class, col=Palette2)
Frequenze <- freq(Ovest1996Class)
Totale = ncell(Ovest1996Class)
Percentuali = Frequenze * 100 / Totale
Percentuali

Ovest2005 <- brick("StackOvest2005Cut.tiff")
SingleValuesOvest2005 <- getValues(Ovest2005)
kclusterOvest2005 <- kmeans(SingleValuesOvest2005, centers = 2)
Ovest2005Class <- setValues(Ovest2005[[1]], kclusterOvest2005$cluster)
plot(Ovest2005Class, col=Palette2)
Frequenze <- freq(Ovest2005Class)
Totale = ncell(Ovest2005Class)
Percentuali = Frequenze * 100 / Totale
Percentuali

Ovest2014 <- brick("StackOvest2014Cut.tiff")
SingleValuesOvest2014 <- getValues(Ovest2014)
kclusterOvest2014 <- kmeans(SingleValuesOvest2014, centers = 2)
Ovest2014Class <- setValues(Ovest2014[[1]], kclusterOvest2014$cluster)
plot(Ovest2014Class, col=Palette2)
Frequenze <- freq(Ovest2014Class)
Totale = ncell(Ovest2014Class)
Percentuali = Frequenze * 100 / Totale
Percentuali

Ovest2023 <- brick("StackOvest2023Cut.tiff")
SingleValuesOvest2023 <- getValues(Ovest2023)
kclusterOvest2023 <- kmeans(SingleValuesOvest2023, centers = 2)
Ovest2023Class <- setValues(Ovest2023[[1]], kclusterOvest2023$cluster)
plot(Ovest2023Class, col=Palette2)
Frequenze <- freq(Ovest2023Class)
Totale = ncell(Ovest2023Class)
Percentuali = Frequenze * 100 / Totale
Percentuali

# Sezione Centrale: Classificazione per ogni anno e calcolo percentuali.

Centrale1987 <- brick("StackCentrale1987Cut.tiff")
SingleValuesCentrale1987 <- getValues(Centrale1987)
kclusterCentrale1987 <- kmeans(SingleValuesCentrale1987, centers = 2)
Centrale1987Class <- setValues(Centrale1987[[1]], kclusterCentrale1987$cluster)
plot(Centrale1987Class, col=Palette2)
Frequenze <- freq(Centrale1987Class)
Totale = ncell(Centrale1987Class)
Percentuali = Frequenze * 100 / Totale
Percentuali

Centrale1996 <- brick("StackCentrale1996Cut.tiff")
SingleValuesCentrale1996 <- getValues(Centrale1996)
kclusterCentrale1996 <- kmeans(SingleValuesCentrale1996, centers = 2)
Centrale1996Class <- setValues(Centrale1996[[1]], kclusterCentrale1996$cluster)
plot(Centrale1996Class, col=Palette2)
Frequenze <- freq(Centrale1996Class)
Totale = ncell(Centrale1996Class)
Percentuali = Frequenze * 100 / Totale
Percentuali

Centrale2005 <- brick("StackCentrale2005Cut.tiff")
SingleValuesCentrale2005 <- getValues(Centrale2005)
kclusterCentrale2005 <- kmeans(SingleValuesCentrale2005, centers = 2)
Centrale2005Class <- setValues(Centrale2005[[1]], kclusterCentrale2005$cluster)
plot(Centrale2005Class, col=Palette2)
Frequenze <- freq(Centrale2005Class)
Totale = ncell(Centrale2005Class)
Percentuali = Frequenze * 100 / Totale
Percentuali

Centrale2014 <- brick("StackCentrale2014Cut.tiff")
SingleValuesCentrale2014 <- getValues(Centrale2014)
kclusterCentrale2014 <- kmeans(SingleValuesCentrale2014, centers = 2)
Centrale2014Class <- setValues(Centrale2014[[1]], kclusterCentrale2014$cluster)
plot(Centrale2014Class, col=Palette2)
Frequenze <- freq(Centrale2014Class)
Totale = ncell(Centrale2014Class)
Percentuali = Frequenze * 100 / Totale
Percentuali

Centrale2023 <- brick("StackCentrale2023Cut.tiff")
SingleValuesCentrale2023 <- getValues(Centrale2023)
kclusterCentrale2023 <- kmeans(SingleValuesCentrale2023, centers = 2)
Centrale2023Class <- setValues(Centrale2023[[1]], kclusterCentrale2023$cluster)
plot(Centrale2023Class, col=Palette2)
Frequenze <- freq(Centrale2023Class)
Totale = ncell(Centrale2023Class)
Percentuali = Frequenze * 100 / Totale
Percentuali

# Sezione Est: Classificazione per ogni anno e calcolo percentuali.

Est1987 <- brick("StackEst1987Cut.tiff")
SingleValuesEst1987 <- getValues(Est1987)
kclusterEst1987 <- kmeans(SingleValuesEst1987, centers = 2)
Est1987Class <- setValues(Est1987[[1]], kclusterEst1987$cluster)
plot(Est1987Class, col=Palette2)
Frequenze <- freq(Est1987Class)
Totale = ncell(Est1987Class)
Percentuali = Frequenze * 100 / Totale
Percentuali

Est1996 <- brick("StackEst1996Cut.tiff")
SingleValuesEst1996 <- getValues(Est1996)
kclusterEst1996 <- kmeans(SingleValuesEst1996, centers = 2)
Est1996Class <- setValues(Est1996[[1]], kclusterEst1996$cluster)
plot(Est1996Class, col=Palette2)
Frequenze <- freq(Est1996Class)
Totale = ncell(Est1996Class)
Percentuali = Frequenze * 100 / Totale
Percentuali

Est2005 <- brick("StackEst2005Cut.tiff")
SingleValuesEst2005 <- getValues(Est2005)
kclusterEst2005 <- kmeans(SingleValuesEst2005, centers = 2)
Est2005Class <- setValues(Est2005[[1]], kclusterEst2005$cluster)
plot(Est2005Class, col=Palette2)
Frequenze <- freq(Est2005Class)
Totale = ncell(Est2005Class)
Percentuali = Frequenze * 100 / Totale
Percentuali

Est2014 <- brick("StackEst2014Cut.tiff")
SingleValuesEst2014 <- getValues(Est2014)
kclusterEst2014 <- kmeans(SingleValuesEst2014, centers = 2)
Est2014Class <- setValues(Est2014[[1]], kclusterEst2014$cluster)
plot(Est2014Class, col=Palette2)
Frequenze <- freq(Est2014Class)
Totale = ncell(Est2014Class)
Percentuali = Frequenze * 100 / Totale
Percentuali

Est2023 <- brick("StackEst2023Cut.tiff")
SingleValuesEst2023 <- getValues(Est2023)
kclusterEst2023 <- kmeans(SingleValuesEst2023, centers = 2)
Est2023Class <- setValues(Est2023[[1]], kclusterEst2023$cluster)
plot(Est2023Class, col=Palette2)
Frequenze <- freq(Est2023Class)
Totale = ncell(Est2023Class)
Percentuali = Frequenze * 100 / Totale
Percentuali

# SEZIONE 6) Costruzione del dataframe sintetico per ogni zona.

# Partendo dai dati raccolti nella precedente classificazione,
# In particolare le percentuali (che danno maggiore impatto),
# Sorge il bisogno di raccogliere tutte le informazione numeriche:
# Per questo motivo sono stati creati tre dataframe (uno per zona),
# Che racchiudono tutte le coperture forestali negli anni passati.

# Sezione Ovest: Costruzione dataframe coi trend di deforestazione.

CoperturaSuolo <- c("Foresta", "Agricoltura")

PercentualeOvest1987 <- c(89.42, 10.58)
PercentualeOvest1996 <- c(87.61, 12.39)
PercentualeOvest2005 <- c(66.26, 33.74)
PercentualeOvest2014 <- c(66.18, 33.82)
PercentualeOvest2023 <- c(54.51, 45.49)

PercentualiOvest <- data.frame(CoperturaSuolo, PercentualeOvest1987, 
                               PercentualeOvest1996, PercentualeOvest2005, 
                               PercentualeOvest2014, PercentualeOvest2023)

# Sezione Centrale: Costruzione dataframe coi trend di deforestazione.

PercentualeCentrale1987 <- c(94.24, 5.76)
PercentualeCentrale1996 <- c(90.81, 9.19)
PercentualeCentrale2005 <- c(76.05, 23.95)
PercentualeCentrale2014 <- c(74.15, 25.85)
PercentualeCentrale2023 <- c(69.14, 30.86)

PercentualiCentrale <- data.frame(CoperturaSuolo, PercentualeCentrale1987, 
                                  PercentualeCentrale1996, PercentualeCentrale2005, 
                                  PercentualeCentrale2014, PercentualeCentrale2023)

# Sezione Est: Costruzione dataframe coi trend di deforestazione.

PercentualeEst1987 <- c(73.07, 26.93)
PercentualeEst1996 <- c(62.08, 37.92)
PercentualeEst2005 <- c(48.74, 51.26)
PercentualeEst2014 <- c(46.87, 53.13)
PercentualeEst2023 <- c(43.91, 56.09)

PercentualiEst <- data.frame(CoperturaSuolo, PercentualeEst1987, 
                             PercentualeEst1996, PercentualeEst2005, 
                             PercentualeEst2014, PercentualeEst2023)

# Queste tabelle sono state costruite per l'elaborazione di grafici:
# Essi sono stati creati adoperando un software gratuito, OpenOffice.
# Il loro scopo è quello di dimostrare il trend della deforestazione.
# Ogni aspetto proposto è stato inserito nella presentazione del lavoro:
# Anche in tale caso realizzata mediante uno strumento gratuito, LaTeX.

# SEZIONE 7) Considerazioni generali dal progetto e conclusioni

# Tutti i differenti plot negli anni ed i numeri estrapolati con R,
# Hanno mostrato come la deforestazione non sia una questione da
# Mettere in secondo piano, bensì un processo umano molto dannoso,
# Sia per la natura, sia per l'uomo stesso, per cui è da ostacolare.

# Nel caso specifico del Brasile, solamente nelle tre zone analizzate,
# Si è potuto calcolare come circa 30'000 km2 di superficie sia stata
# deforestata, ossia un equivalente dell'Emilia-Romagna e delle Marche;
# Si deve ricordare che le tre zone non raggiungono i 100'000 km2, cioè
# Una briciola se viene confrontato con l'intera estensione del Brasile.

# Bisognerebbe interrompere subito tale burbera azione contro la natura!
