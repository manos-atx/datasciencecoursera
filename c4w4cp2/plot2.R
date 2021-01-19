
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

NEI_BC <- subset(NEI, fips == "24510")
total_pollution_bc <- tapply(NEI_BC$Emissions, NEI_BC$year, sum)

png(filename = "plot2.png")
barplot(total_pollution_bc, ylim = c(0, 4000))
title(main = expression("Tons of PM"[2.5]*" emitted per year in Baltimore City, Maryland"))
dev.off()
