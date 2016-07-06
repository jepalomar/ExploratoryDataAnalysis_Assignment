
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
#emissions<-tapply(NEI$Emissions,NEI$year,sum)
#instead of using tapply I will use function ddply from package plyr, which returns the result in a nice data.frame format
# The following lile of code will build a data.frame containing the sum of emissions for all sources and counties per year
# The result is stored in emissions variable
emissions<-ddply(NEI,"year",numcolwise(sum))



#######################################################################################
#                           PLOTTING                                                  #
#######################################################################################
#Plot in PNG file
png("plot1.png")
plot(emissions,col=2,main="Total emissions per year",type="l", ylim=c(0,max(emissions$Emissions)),ylab="Emissions of PM25 (in tons)")
points(emissions,pch=19,col=2)
dev.off()