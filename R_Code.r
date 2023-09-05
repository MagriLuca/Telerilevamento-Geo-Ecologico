setwd("C:/Telerilevamento/Brasile_Ovest/232_067")
ListaOvest1987 <- list.files(pattern="Banda")
ImportOvest1987 <- lapply(ListaOvest1987,raster)
StackOvest1987 <- stack(ImportOvest1987)
