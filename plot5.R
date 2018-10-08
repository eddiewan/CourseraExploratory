### initialize
source("initialize.R")
library(ggplot2)

#Read the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Determine vehicle data
vehicle <- SCC[grepl("vehicle", SCC$SCC.Level.Two, ignore.case = TRUE),1]

#select vehicle data in baltimore (fips 24510)
vehicleSub <- subset(NEI, SCC %in% vehicle & fips == '24510')

#Determine total emission per year
aggYear <- aggregate(Emissions ~ year, data = vehicleSub, FUN = sum)

#Create a png plot of size 480x480
png("plot5.png", width=480, height=480)
par(mfrow = c(1,1))
ggplot(vehicleSub, aes(factor(year), Emissions)) +
        geom_bar(stat = "identity") +
        labs(title = expression('Total PM'[2.5]*' emission in Baltimore from Vehicle sources')) +
        labs(x="year", y = "Yearly total emission (in tons)")

dev.off()

