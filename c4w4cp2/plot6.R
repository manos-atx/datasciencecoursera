
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

SCC_MV <- SCC[grep("Mobile.*Vehicles",SCC$EI.Sector),]
MV_ID <- unique(SCC_MV$SCC)

NEI_MVBCLA <- subset(NEI, SCC %in% MV_ID & fips %in% c("24510", "06037"))
NEI_MVBCLA <- transform(NEI_MVBCLA, Year = factor(year),
                        fips = factor(fips, levels = c("24510", "06037"), labels = c("Baltimore City", "Los Angeles County")))

library(ggplot2)

png(filename = "plot6.png")
ggplot(NEI_MVBCLA, aes(x = Year, y = Emissions)) +
  geom_col() +
  facet_wrap(~ fips) +
  ggtitle(expression("Tons of PM"[2.5]*" emitted per year from motor vehicle sources"))
dev.off()
