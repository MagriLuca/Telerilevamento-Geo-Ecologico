# Questo è il primo script che è stato adoperato a lezione

# install.packages("raster")
library(raster)

#Comando per selezionare la cartella di lavoro in Windows
setwd("C:/lab/")

# Importo immagine da cartella personale
l2011 <- brick("p224r63_2011.grd")

# Richiamo l'oggetto ed osservo le proprietà
l2011

# Plot del file prima richiamato
plot(l2011)

# Modifico i colori della legenda per accessibilità
cl <- colorRampPalette(c("black","grey","light grey")) (100)

# Plot nuovo con legenda aggiornata da nero a bianco
plot(l2011, col=cl)

