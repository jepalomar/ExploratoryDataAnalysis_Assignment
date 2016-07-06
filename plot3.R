
#######################################################################################
#                           READ FILES                                                #
#######################################################################################

# Change working directory: change the path to your own path
setwd("D:\\Cursos\\Coursera\\DataScience\\ExploratoryDataAnalysis\\finalAssignment")

# We load library ggplot2
library(ggplot2)

# Read summary file
NEI <- readRDS("summarySCC_PM25.rds")

# Read classification file
SCC <- readRDS("Source_Classification_Code.rds")

#######################################################################################
#                           MANIPULATE DATA                                           #
#######################################################################################
# Get data for Baltimore
baltimore<-subset(NEI,fips=="24510")

# We aggregate Baltimore results for emissions by year and type
baltimore_per_type_year<-aggregate(baltimore$Emissions,by=list(type=baltimore$type,year=baltimore$year),FUN=sum)

# Put nice names
names(baltimore_per_type_year)<-c("type","year","Emissions")



#######################################################################################
#                           PLOTTING                                                  #
#######################################################################################
# Plot results using ggplot2 package
png("plot3.png")
qplot(year,Emissions,data= baltimore_per_type_year,col=type,main="Baltimore Emissions",ylab="Emissions of PM25 (in tons)")+geom_line()
dev.off()
