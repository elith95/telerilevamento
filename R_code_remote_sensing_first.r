#Base commands

library(raster)

#1- set the working directory
setwd("Desktop/lab")

#2- upload the data on R
b1 <- brick("p224r63_2011_masked.grd") #import multilayer -> create a rasterbrick object
b1 
plot(b1)

