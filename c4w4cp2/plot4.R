
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

SCC_CC <- SCC[grep("Fuel Comb.*Coal",SCC$EI.Sector),]
CC_ID <- unique(SCC_CC$SCC)

NEI_CC <- subset(NEI, SCC %in% CC_ID)
NEI_CC <- transform(NEI_CC, Year = factor(year))

library(ggplot2)

png(filename = "plot4.png")
ggplot(NEI_CC, aes(x = Year, y = Emissions)) +
  geom_col() +
  ggtitle(expression("Tons of PM"[2.5]*" emitted per year from coal combustion-related sources"))
dev.off()
