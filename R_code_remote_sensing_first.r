#Base commands

library(raster)

#set the working directory
setwd("Desktop/lab")

#DAY 1

#upload the data on R
b1 <- brick("p224r63_2011_masked.grd") #import multilayer -> create a rasterbrick object
b1 
plot(b1)

#Recuperare lezione...

#DAY 3

#Landsat bands:
# - B1: blue
# - B2: green
# - B3: red
# - B4: near infrared
# - B5: mid infrared
# - B6: far infrared
# - B7: mid infrared

#Clean the current graph
dev.off() 

#Plot a single band
plot(b1$B1_sre)

dev.off() 

#Palettes for the bands
cl <- colorRampPalette(c("dark blue",  "blue", "light blue")) (100) #blue
cl1<-colorRampPalette(c("dark green",  "green", "light green")) (100) #green
cl2<-colorRampPalette(c("dark red", "red", "pink")) (100) #red
cl3<-colorRampPalette(c("red", "orange", "yellow")) (100) #infrared

#Plot one band with a predefined palette
plot (b1$B1_sre, col=cl) 

dev.off() 

#Insert selected bands in a plot -> multiframe
#First 2 bands
par(mfrow = c(1,2)) #creates the grid -> 1 row 2 columns 
plot (b1$B1_sre, col = cl)
plot (b1$B2_sre, col = cl1)

dev.off() 

par(mfcol = c(1,2)) #1 column and 2 rows -> mfcol to put the number of columns first
plot(b1$B1_sre, col=cl)
plot(b1$B2_sre, col=cl1)

dev.off() 

#First 4 bands
par(mfrow = c(4,1))
plot(b1$B1_sre, col=cl)
plot(b1$B2_sre, col=cl1)
plot(b1$B3_sre, col=cl2)
plot(b1$B4_sre, col=cl3)

dev.off() 

par(mfrow = c(2,2))
plot(b1$B1_sre, col=cl)
plot(b1$B2_sre, col=cl1)
plot(b1$B3_sre, col=cl2)
plot(b1$B4_sre, col=cl3)

dev.off() 

#DAY 4

#RGB plot
par(mfrow=c(2,2))
plotRGB(b1,r=3,g=2,b=1,stretch="Lin") #natural colors -> B3-B2-B1
plotRGB(b1,r=4,g=3,b=2,stretch="Lin") #false colors -> B4-B3-B2 -> evidenziata vegetazione
plotRGB(b1,r=3,g=4,b=2,stretch="Lin") #infrared moved on green -> si evidenziano i torrenti e il suolo nudo (viola)
plotRGB(b1,r=3,g=2,b=4,stretch="Lin") #infrared moved on blue -> suolo nudo giallo

dev.off() 

plotRGB(b1,r=3,g=4,b=2,stretch="hist") #change stretch method -> distingue meglio le aree più umide (violette) da quelle con più copertura

#par natural-false colors-false colors hist
par(mfrow=c(3,1))
plotRGB(b1, r=3, g=2, b=1, stretch="Lin")
plotRGB(b1, r=3, g=4, b=2, stretch="Lin")
plotRGB(b1, r=3, g=4, b=2, stretch="hist")

dev.off()

#DAY 5

b2 <- brick("p224r63_1988_masked.grd")

#Visualization of b2
par(mfrow = c(2,2))
plot(b2$B1_sre, col=cl)
plot(b2$B2_sre, col=cl1)
plot(b2$B3_sre, col=cl2)
plot(b2$B4_sre, col=cl3)

dev.off()

plotRGB(b2, r=3, g=2, b=1, stretch="Lin")
plotRGB(b2, r=4, g=3, b=2, stretch="Lin")

dev.off()

#Comparison of 1988 and 2011
par(mfrow = c(2,1))
plotRGB(b2, r=4, g=3, b=2, stretch="Lin")
plotRGB(b1, r=4, g=3, b=2, stretch="Lin")

dev.off()

par(mfrow = c(2,2))
plotRGB(b2, r=4, g=3, b=2, stretch="Lin")
plotRGB(b1, r=4, g=3, b=2, stretch="Lin")
plotRGB(b2, r=4, g=3, b=2, stretch="hist")
plotRGB(b1, r=4, g=3, b=2, stretch="hist")

dev.off()





