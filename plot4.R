### initialize
source("initialize.R")
library(ggplot2)

#Read the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Determine combust coal SCC data
coal <- SCC[grepl("coal", SCC$Short.Name, ignore.case = TRUE),]
combust <- SCC[grepl("comb", SCC$Short.Name, ignore.case = TRUE),]
coalCombust <- intersect(coal$SCC, combust$SCC)

#select combust coal related data
coalSub <- subset(NEI, SCC %in% coalCombust)

#Determine total emission per year
aggYear <- aggregate(Emissions ~ year, data = coalSub, FUN = sum)

#Create a png plot of size 480x480
png("plot4.png", width=480, height=480)
par(mfrow = c(1,1))
ggplot(coalSub, aes(factor(year), Emissions)) +
        geom_bar(stat = "identity") +
        labs(title = expression('Total PM'[2.5]*' emission in the US from combust coal sources')) +
        labs(x="year", y = "Yearly total emission (in tons)")

dev.off()