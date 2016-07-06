
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

# The following lile of code will build a data.frame containing the sum of emissions from motor vehicles in Baltimore per year
# The result is stored in emissionsBaltimoreVehicle variable
emissionsBaltimoreVehicle<-ddply(baltimoreVehicle,"year",numcolwise(sum))



#######################################################################################
#                           PLOTTING                                                  #
#######################################################################################


#Plot in PNG file
png("plot5.png")
plot(emissionsBaltimoreVehicle,type="l",col=2,ylim=c(0,1.1*max(emissionsBaltimoreVehicle$Emissions)),main="Total Baltimore vehicle emissions per year",ylab="Emissions of PM25 (in tons)")
points(emissionsBaltimoreVehicle,pch=19,col=2)
dev.off()