W1987 <- brick("StackW1987Cut.tiff")
SingleValuesW1987 <- getValues(W1987)
kclusterW1987 <- kmeans(SingleValuesW1987, centers = 2)
W1987Class <- setValues(W1987[[1]], kclusterW1987$cluster)
