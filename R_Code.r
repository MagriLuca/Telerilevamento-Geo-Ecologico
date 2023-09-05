setwd("C:/Telerilevamento/Brasile_Ovest/Brasile_232_067_1987")
ListaOvest1987 <- list.files(pattern="Banda")
ImportOvest1987 <- lapply(ListaOvest1987,raster)
StackOvest1987 <- stack(ImportOvest1987)
