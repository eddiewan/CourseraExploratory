### initialize
source("initialize.R")
library(ggplot2)

#Read the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Determine vehicle data
vehicle <- SCC[grepl("vehicle", SCC$SCC.Level.Two, ignore.case = TRUE),1]

#select vehicle data in baltimore (fips 24510) and Los Angeles (06037)
vehicleSub <- subset(NEI, SCC %in% vehicle & fips %in% c('24510','06037'))

#Add city name
vehicleSub$City <- ifelse(vehicleSub$fips %in% '24510', "Baltimore", "Los Angeles")

#Determine total emission per year per city
aggYear <- aggregate(Emissions ~ year + City, data = vehicleSub, FUN = sum)

#Create a png plot of size 480x480
png("plot6.png", width=480, height=480)
par(mfrow = c(1,1))
ggplot(vehicleSub, aes(factor(year), Emissions, City)) +
        geom_bar(stat = "identity") +
        facet_grid(.~City) +
        labs(title = expression('Total PM'[2.5]*' emission in Baltimore and LA from Vehicle sources')) +
        labs(x="year", y = "Yearly total emission (in tons)")

dev.off()