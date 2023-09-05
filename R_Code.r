setwd("C:/Telerilevamento/Elaborati")
tiff("StackOvest1987.tiff")
plotRGB(StackOvest1987,4,2,1, stretch = "Lin")
dev.off()
