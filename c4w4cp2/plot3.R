
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

NEI_BC <- subset(NEI, fips == "24510")
NEI_BC <- transform(NEI_BC, type = factor(type, levels = c("ON-ROAD", "NON-ROAD", "POINT", "NONPOINT"),
                                          labels = c("ON-ROAD", "NON-ROAD", "POINT", "NONPOINT")),
                            Year = factor(year))

library(ggplot2)

png(filename = "plot3.png")
ggplot(NEI_BC, aes(x = Year, y = Emissions)) +
  geom_col() +
  facet_wrap(~ type, ncol = 2) +
  ggtitle(expression("Tons of PM"[2.5]*" emitted per year by type in Baltimore City, Maryland"))
dev.off()
