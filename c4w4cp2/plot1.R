
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

total_pollution <- tapply(NEI$Emissions, NEI$year, sum)

png(filename = "plot1.png")
barplot(total_pollution, ylim = c(0, 8e+6))
title(main = expression("Tons of PM"[2.5]*" emitted per year"))
dev.off()
