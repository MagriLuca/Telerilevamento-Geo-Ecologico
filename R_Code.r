DVIW1987 = StackOvest1987[[4]] - StackOvest1987[[3]]
NDVIW1987 = DVIW1987 / (StackOvest1987[[4]] + 
                            + StackOvest1987[[3]])
plot(NDVIW1987, col=Palette1)
