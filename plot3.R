### initialize
source("initialize.R")
library(ggplot2)

#Read the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#select baltimore data
NEIbaltimore <- subset(NEI, fips == '24510')

#Determine total emission per year
aggYear <- aggregate(Emissions ~ year + type, data = NEIbaltimore, FUN = sum)

#Create a png plot of size 480x480
png("plot3.png", width=480, height=480)
par(mfrow = c(1,1))
ggplot(NEIbaltimore, aes(factor(year), Emissions,type)) +
        geom_bar(stat = "identity") +
        facet_grid(.~type) +
        labs(title = expression('Total PM'[2.5]*' emission in Baltimore City, Maryland per source type')) +
        labs(x="year", y = "Yearly total emission (in tons)")

dev.off()