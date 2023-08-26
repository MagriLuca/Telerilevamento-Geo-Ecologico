# Script per lavorare con dati LIDAR.

library(raster)
library(rgdal)
library(viridis)
library(ggplot2)

setwd("C:/lab/")

# Caricare il file DSM 2013
dsm_2013 <- raster("2013Elevation_DigitalElevationModel-0.5m.tif")
dsm_2013

# Plot del file DSM 2013
plot(dsm_2013, main="Lidar Digital Surface Model San Genesio/Jenesien")

# Caricare il file DTM 2013
dtm_2013 <- raster("2013Elevation_DigitalTerrainModel-0.5m.tif")

# Plot del file DTM 2013
plot(dtm_2013, main="Lidar Digital Terrain Model San Genesio/Jenesien")

# Creazione del CHM 2013 come differenza tra DSM e DTM
chm_2013 <- dsm_2013 - dtm_2013
chm_2013

chm_2013d <- as.data.frame(chm_2013, xy=T)

ggplot() +
  geom_raster(chm_2013d, mapping =aes(x=x, y=y, fill=layer)) +
  scale_fill_viridis() +
  ggtitle("CHM 2013 San Genesio/Jenesien")

# Salvataggio del file CHM sul computer
writeRaster(chm_2013,"chm_2013_San_genesio.tif")

# Caricare il file DSM 2004
dsm_2004 <- raster("2004Elevation_DigitalElevationModel-2.5m.tif")
dsm_2004

# Plot del file DSM 2004
plot(dsm_2004, main="Lidar Digital Surface Model San Genesio/Jenesien")

# Caricare il file DTM 2004
dtm_2004 <- raster("2004Elevation_DigitalTerrainModel-2.5m.tif")

# Plot del file DTM 2004
plot(dtm_2004, main="Lidar Digital Terrain Model San Genesio/Jenesien")

# Creazione del CHM 2004 come differenza tra DSM e DTM
chm_2004 <- dsm_2004 - dtm_2004
chm_2004

chm_2004d <- as.data.frame(chm_2004, xy=T)

ggplot() +
  geom_raster(chm_2004d, mapping =aes(x=x, y=y, fill=layer)) +
  scale_fill_viridis() +
  ggtitle("CHM 2004 San Genesio/Jenesien")

# Salvataggio del file CHM sul computer
writeRaster(chm_2004,"chm_2004_San_genesio.tif")

# Nota Importante: scritto così è errore di risoluzione
difference_chm <- chm_2013 - chm_2004

# Funzione di Reseample portando il 2013 al 2004 (2.5m)
chm_2013_reseampled <- resample(chm_2013, chm_2004)

# Calcolo della differenza di CHM da 2013 a 2004
difference<-chm_2013_reseampled-chm_2004

ggplot() +
  geom_raster(difference, mapping =aes(x=x, y=y, fill=layer)) +
  scale_fill_viridis() +
  ggtitle("difference CHM San Genesio/Jenesien")

# Salvataggio dei raster
writeRaster(chm_2013_reseampled,"chm_2013_reseampled_San_genesio.tif")
writeRaster(difference,"difference chm San_genesio.tif")

# Sezione dedicata al point cloud

library(lidR)

# load point cloud
point_cloud<-readLAS("LIDAR-PointCloudCoverage-2013SolarTirol.laz")

#plot r3 point cloud
plot(point_cloud)
