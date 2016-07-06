
#######################################################################################
#                           READ FILES                                                #
#######################################################################################

# Change working directory: change the path to your own path
setwd("D:\\Cursos\\Coursera\\DataScience\\ExploratoryDataAnalysis\\finalAssignment")

# We load library plyr which we will use to manipulate the data
library(plyr)

# Read summary file
NEI <- readRDS("summarySCC_PM25.rds")

# Read classification file
SCC <- readRDS("Source_Classification_Code.rds")

#######################################################################################
#                           MANIPULATE DATA                                           #
#######################################################################################


# Get the SCC codes for motor vehicle by inspecting SCC.Level.Two values
vehicleID<-as.character(SCC$SCC[grepl("VEHICLE",toupper(SCC$SCC.Level.Two))])

# Get data for Baltimore
baltimore<-subset(NEI,fips=="24510")

# Get the subset of Baltimore data corresponding to motor vehicle emissions
baltimoreVehicle<-subset(baltimore,SCC %in% vehicleID)

# Get data for Los Angeles
LA<-subset(NEI,fips=="06037")

# Get the subset of Los Angeles data corresponding to motor vehicle emissions
LAVehicle<-subset(LA,SCC %in% vehicleID)

# The following lile of code will build a data.frame containing the sum of emissions from motor vehicles in Baltimore per year
# The result is stored in emissionsBaltimoreVehicle variable
emissionsBaltimoreVehicle<-ddply(baltimoreVehicle,"year",numcolwise(sum))

# The following lile of code will build a data.frame containing the sum of emissions from motor vehicles in Los Angeles per year
# The result is stored in emissionsLAVehicle variable
emissionsLAVehicle<-ddply(LAVehicle,"year",numcolwise(sum))



#######################################################################################
#                           PLOTTING                                                  #
#######################################################################################


#Plot in PNG file

# We get the larger emission to set the ylim in the plots
largerEmission<-max(emissionsBaltimoreVehicle$Emissions,emissionsLAVehicle$Emissions)
png("plot6.png")
par(mfrow=c(2,2))
plot(emissionsBaltimoreVehicle,type="l",col=2,ylim=c(0,1.1*largerEmission),main="Baltimore vehicle emissions",ylab="Emissions of PM25 (in tons)")
points(emissionsBaltimoreVehicle,pch=19,col=2)
plot(emissionsLAVehicle,type="l",col=2,ylim=c(0,1.1*largerEmission),main="LA vehicle emissions",ylab="Emissions of PM25 (in tons)")
points(emissionsLAVehicle,pch=19,col=2)

# Here we plot relative chages with respect to values in 1999
plot(emissionsBaltimoreVehicle/emissionsBaltimoreVehicle$Emissions[1],type="l",main="Baltimore perc. change",col=2,ylim=c(0,1.3),ylab="Relative change in emissions")
points(emissionsBaltimoreVehicle/emissionsBaltimoreVehicle$Emissions[1],pch=19,col=2)
plot(emissionsLAVehicle/emissionsLAVehicle$Emissions[1],type="l",col=2,main="LA perc. change",ylim=c(0,1.3),ylab="Relative change in emissions")
points(emissionsLAVehicle/emissionsLAVehicle$Emissions[1],pch=19,col=2)

dev.off()