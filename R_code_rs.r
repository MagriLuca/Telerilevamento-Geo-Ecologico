# Questo è il primo script che è stato adoperato a lezione

# install.packages("raster")
library(raster)

# Comando per selezionare la cartella di lavoro in Windows
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

# Landsat ETM+
# b1 = Blu
# b2 = Verde
# b3 = Rosso
# b4 = Infrarosso vicino (NIR)

# Plot della singola banda del blu

# Prima modalità (con dollaro)
plot(l2011$B1_sre)

# Seconda modalità (doppia parentesi quadra)
plot(l2011[[1]])

# Cambio della legenda come precedentemente fatto
plot(l2011$B1_sre, col=cl)

# Plot adoperando una scala di colori di blu
clb <- colorRampPalette(c("dark blue","blue","light blue")) (100)
plot(l2011$B1_sre, col=clb)

# Esportazione immagine (pdf) nella cartella lab
pdf("Banda1.pdf")
plot(l2011$B1_sre, col=clb)
dev.off()

# Esportazione immagine (png) nella cartella lab
png("Banda1.png")
plot(l2011$B1_sre, col=clb)
dev.off()
