# Assignment 
The overall goal of this assignment is to explore the National Emissions Inventory database and see what it say about fine particulate matter pollution in the United states over the 10-year period 1999–2008. You may use any R package you want to support your analysis.

## Code

The R code files to generate the plots are:

* [plot1.R](https://github.com/jepalomar/ExploratoryDataAnalysis_Assignment/blob/master/plot1.R)
* [plot2.R](https://github.com/jepalomar/ExploratoryDataAnalysis_Assignment/blob/master/plot2.R)
* [plot3.R](https://github.com/jepalomar/ExploratoryDataAnalysis_Assignment/blob/master/plot3.R)
* [plot4.R](https://github.com/jepalomar/ExploratoryDataAnalysis_Assignment/blob/master/plot4.R)
* [plot5.R](https://github.com/jepalomar/ExploratoryDataAnalysis_Assignment/blob/master/plot5.R)
* [plot6.R](https://github.com/jepalomar/ExploratoryDataAnalysis_Assignment/blob/master/plot6.R)


## Data

Fine particulate matter (PM2.5) is an ambient air pollutant for which there is strong evidence that it is harmful to human health. In the United States, the Environmental Protection Agency (EPA) is tasked with setting national ambient air quality standards for fine PM and for tracking the emissions of this pollutant into the atmosphere. Approximatly every 3 years, the EPA releases its database on emissions of PM2.5. This database is known as the National Emissions Inventory (NEI).
You can read more information about the NEI at the [EPA National Emissions Inventory web site](http://www.epa.gov/ttn/chief/eiinformation.html).
For each year and for each type of PM source, the NEI records how many tons of PM2.5 were emitted from that source over the course of the entire year. The data that you will use for this assignment are for 1999, 2002, 2005, and 2008.

The data for this assignment are available from the course web site as a single zip file:

[Data for Peer Assessment [29Mb]](https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip)
The zip file contains two files:

PM2.5 Emissions Data (**summarySCC_PM25.rds**): This file contains a data frame with all of the PM2.5 emissions data for 1999, 2002, 2005, and 2008. For each year, the table contains number of tons of PM2.5 emitted from a specific type of source for the entire year. Here are the first few rows.

```
1 ##     fips      SCC Pollutant Emissions  type year
2 ## 4  09001 10100401  PM25-PRI    15.714 POINT 1999
3 ## 8  09001 10100404  PM25-PRI   234.178 POINT 1999
4 ## 12 09001 10100501  PM25-PRI     0.128 POINT 1999
5 ## 16 09001 10200401  PM25-PRI     2.036 POINT 1999
6 ## 20 09001 10200504  PM25-PRI     0.388 POINT 1999
7 ## 24 09001 10200602  PM25-PRI     1.490 POINT 1999
```

* **fips**: A five-digit number (represented as a string) indicating the U.S. county
* **SCC**: The name of the source as indicated by a digit string (see source code classification table)
* **Pollutant**: A string indicating the pollutant
* **Emissions**: Amount of PM2.5 emitted, in tons
* **type**: The type of source (point, non-point, on-road, or non-road)
* **year**: The year of emissions recorded

Source Classification Code Table (**Source_Classification_Code.rds**): This table provides a mapping from the SCC digit strings in the Emissions table to the actual name of the PM2.5 source. The sources are categorized in a few different ways from more general to more specific and you may choose to explore whatever categories you think are most useful. For example, source “10100101” is known as “Ext Comb /Electric Gen /Anthracite Coal /Pulverized Coal”.

You can read each of the two files using the readRDS() function in R. For example, reading in each file can be done with the following code:


```
1 ## This first line will likely take a few seconds. Be patient!
2 NEI <- readRDS("summarySCC_PM25.rds")
3 SCC <- readRDS("Source_Classification_Code.rds")
```
as long as each of those files is in your current working directory (check by calling dir() and see if those files are in the listing).

## Questions

You must address the following questions and tasks in your exploratory analysis. For each question/task you will need to make a single plot. Unless specified, you can use any plotting system in R to make your plot.

* **Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? Using the base plotting system, make a plot showing the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008.**
 
We can see from the following plot that total emissions of PM2.5 in the United States have decreased in the time period studied. (See code in [plot1.R](https://github.com/jepalomar/ExploratoryDataAnalysis_Assignment/blob/master/plot1.R))

![alt text](https://github.com/jepalomar/ExploratoryDataAnalysis_Assignment/blob/master/plot1.png "Total Emissions")

* **Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008? Use the base plotting system to make a plot answering this question.**
  
We can see from the following plot that total emissions of PM2.5 in Baltimore have decreased in the 1999-2008 period, although there was an increase in the 2002-2005 period. (See code in [plot2.R](https://github.com/jepalomar/ExploratoryDataAnalysis_Assignment/blob/master/plot2.R))

![alt text](https://github.com/jepalomar/ExploratoryDataAnalysis_Assignment/blob/master/plot2.png "Baltimore Total Emissions")

* **Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? Which have seen increases in emissions from 1999–2008? Use the ggplot2 plotting system to make a plot answer this question.** 
  
We can see in the following figure that emissions from non-road, on-road and nonpoint sources have decreased in the time period studied. For these three sources there was no significant change between 2002 and 2005. On the contrary, emissions from point sources increased substantially in the 1999-2005 period, then going down in 2008 to levels similar to those in 1999. (See code in [plot3.R](https://github.com/jepalomar/ExploratoryDataAnalysis_Assignment/blob/master/plot3.R))

![alt text](https://github.com/jepalomar/ExploratoryDataAnalysis_Assignment/blob/master/plot3.png "Baltimore emissions by source")

* **Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008?** 
  
Coal combustion-related emissions were more or less constant in the 1999-2005 period. But in the 2005-2008 period a significant reduction took place, as can be seen in the following figure. (See code in [plot4.R](https://github.com/jepalomar/ExploratoryDataAnalysis_Assignment/blob/master/plot4.R))

![alt text](https://github.com/jepalomar/ExploratoryDataAnalysis_Assignment/blob/master/plot4.png "Total coal combustion emissions")

* **How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?** 

  Emissions from motor vehicle sources have decreased in the time period studied, as can be seen in the following figure. (See code in [plot5.R](https://github.com/jepalomar/ExploratoryDataAnalysis_Assignment/blob/master/plot5.R))

![alt text](https://github.com/jepalomar/ExploratoryDataAnalysis_Assignment/blob/master/plot5.png "Total Baltimore vehicle emissions")

* **Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in Los Angeles County, California (fips == "06037"). Which city has seen greater changes over time in motor vehicle emissions?** 
  
From the following figure we see that emissions in Los Angeles were significantly higher than those in Baltimore, and so were their changes in the time period studied. However, if we look at relative changes with respect to the emissions values in 1999, Baltimore relative changes were higher. (See code in [plot6.R](https://github.com/jepalomar/ExploratoryDataAnalysis_Assignment/blob/master/plot6.R))

![alt text](https://github.com/jepalomar/ExploratoryDataAnalysis_Assignment/blob/master/plot6.png "Baltimore and LA vehicle emissions")
