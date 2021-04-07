library(raster)

setwd("Desktop/lab/greenland")

#import raster
lst_2000<-raster("lst_2000.tif")

#import multiple raster
files<-list.files(pattern="^lst")
lst<-lapply(files,raster)
lst_st<-stack(files)

