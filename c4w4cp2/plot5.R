
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

SCC_MV <- SCC[grep("Mobile.*Vehicles",SCC$EI.Sector),]
MV_ID <- unique(SCC_MV$SCC)

NEI_MVBC <- subset(NEI, SCC %in% MV_ID & fips == "24510")
NEI_MVBC <- transform(NEI_MVBC, Year = factor(year))

library(ggplot2)

png(filename = "plot5.png")
ggplot(NEI_MVBC, aes(x = Year, y = Emissions)) +
  geom_col() +
  ggtitle(expression("Tons of PM"[2.5]*" emitted per year in Baltimore City from motor vehicle sources"))
dev.off()
