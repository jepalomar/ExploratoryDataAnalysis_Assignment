
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
#get data for Baltimore
baltimore<-subset(NEI,fips=="24510")

# instead of using tapply I will use function ddply from package plyr, which returns the result in a nice data.frame format
# The following lile of code will build a data.frame containing the sum of emissions for all sources and counties per year
# The result is stored in emissionsBaltimore variable
emissionsBaltimore<-ddply(baltimore,"year",numcolwise(sum))



#######################################################################################
#                           PLOTTING                                                  #
#######################################################################################
#Plot in PNG file
png("plot2.png")
plot(emissionsBaltimore,type="l",col=2,ylim=c(0,1.1*max(emissionsBaltimore$Emissions)),main="Total Baltimore emissions per year",ylab="Emissions of PM25 (in tons)")
points(emissionsBaltimore,pch=19,col=2)
dev.off()