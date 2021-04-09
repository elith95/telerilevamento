library(raster)
library(rasterVis)

setwd("Desktop/lab/greenland")

#import raster
lst_2000<-raster("lst_2000.tif")

#import multiple raster
files<-list.files(pattern="^lst")
lst<-lapply(files,raster)
lst_st<-stack(files)
plotRGB(lst_st, 1, 2, 3, stretch="Lin") #RGB plot using the years of the time series -> keeps the highest values

dev.off()

#levelplot
levelplot(lst_st)
dev.off()
levelplot(lst_st$lst_2000)
dev.off()

#Divergent palette
cl <- colorRampPalette(c("blue","light blue","pink","red"))(100)
levelplot(lst_st, col.regions=cl)
dev.off()
levelplot(lst_st,col.regions=cl, names.attr=c("July 2000","July 2005", "July 2010", "July 2015"), main="LST variation in time") #plot titles
dev.off()

#melt
setwd('melt')
filesm<-list.files(pattern="melt")
melt<-lapply(filesm,raster)
m_st<-stack(melt)
levelplot(m_st)
dev.off()

#difference in the melting
melt_diff<-melt[[28]]-melt[[1]] #2007-1979 -> also: melt_amount <- melt$X2007annual_melt - melt$X1979annual_melt
cl1 <- colorRampPalette(c("blue","white","red"))(100)
plot(melt_diff, col.regions=cl1)
dev.off()











