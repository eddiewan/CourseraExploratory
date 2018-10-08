### initialize
source("initialize.R")

#Read the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#select baltimore data
NEIbaltimore <- subset(NEI, fips == '24510')

#Determine total emission per year
aggYear <- aggregate(Emissions ~ year, data = NEIbaltimore, FUN = sum)

#Create a png plot of size 480x480
png("plot2.png", width=480, height=480)

par(mfrow = c(1,1))
options(scipen=5)
#Create barplot
barplot(height = aggYear$Emissions,
        names.arg = aggYear$year,
        main = expression('Total PM'[2.5]*' emission in Baltimore City, Maryland'),
        ylab = "Yearly total emission (in tons)",
        xlab = "Year")

dev.off()