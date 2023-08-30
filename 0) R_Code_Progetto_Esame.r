# Questo è il codice R adoperato per il progetto d'esame

library(raster)
library(rgdal)
library(viridis)

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

# Calcolo NDVI
