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

# Plot adoperando una scala di colori di verde
clg <- colorRampPalette(c("dark green","green","light green")) (100)
plot(l2011$B2_sre, col=clg)

# Costruzione di un multiframe con blu e verde
par(mfrow=c(1,2))
plot(l2011$B1_sre, col=clb)
plot(l2011$B2_sre, col=clg)
dev.off()

# Esportazione di un multiframe con blu e verde
pdf("multiframe.pdf")
par(mfrow=c(1,2))
plot(l2011$B1_sre, col=clb)
plot(l2011$B2_sre, col=clg)
dev.off()

# Inversione del multiframe precedente
par(mfrow=c(2,1))
plot(l2011$B1_sre, col=clb)
plot(l2011$B2_sre, col=clg)
dev.off()

# Costruzione di un multiframe con blu, verde, rosso e NIR
par(mfrow=c(2,2))
# Processo per blu
plot(l2011$B1_sre, col=clb)
# Processo per verde
plot(l2011$B2_sre, col=clg)
# Processo per rosso
clr <- colorRampPalette(c("dark red","red","pink")) (100)
plot(l2011$B3_sre, col=clr)
# Processo per NIR
clnir <- colorRampPalette(c("red","orange","yellow")) (100)
plot(l2011$B4_sre, col=clnir)
dev.off()

# Plot dell'immagine l2011 nella banda NIR
plot(l2011$B4_sre, col=clnir)
# In alternativa
plot(l2011[[4]], col=clnir)

# Plot RGB layers ("A colori naturali")
plotRGB(l2011, r=3, g=2, b=1, stretch="lin")

# Plot RGB layers (con infrarosso a discapito di blu)
plotRGB(l2011, r=4, g=3, b=2, stretch="lin")
plotRGB(l2011, r=3, g=4, b=2, stretch="lin")
