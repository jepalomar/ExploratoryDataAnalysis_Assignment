
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
# Build and array of booleans with TRUE value if it is a coal data. 
coalBool<-grepl("COAL",toupper(SCC$Short.Name))

# Build and array of booleans with TRUE value if it is a combustion data. 
combustionBool<-grepl("COMB",toupper(SCC$Short.Name))

# Intersect both arrays of booleans
coalCombBool<-coalBool & combustionBool

# Get the SCC values corresponding to coal combustion
coalCombIds<-SCC$SCC[coalCombBool]

# Get the subset of original data corresponding to coal combustion
coalCombData<-subset(NEI,SCC %in% coalCombIds )

# The following lile of code will build a data.frame containing the sum of emissions from coal combustion per year
# The result is stored in coalCombEmissions variable
coalCombEmissions<-ddply(coalCombData,"year",numcolwise(sum))



#######################################################################################
#                           PLOTTING                                                  #
#######################################################################################

#Plot in PNG file
png("plot4.png")
plot(coalCombEmissions,type="l",col=2,ylim=c(0,1.1*max(coalCombEmissions$Emissions)),ylab="Emissions of PM25 (in tons)",main="Total coal comb emissions per year")
points(coalCombEmissions,pch=19,col=2)
dev.off()