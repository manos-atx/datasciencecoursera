
pdf(file = 'myplot.pdf')
with(faithful, plot(eruptions, waiting))
title(main = "Old Faithful Geyser Data")
dev.off()

with(faithful, plot(eruptions, waiting))
title(main = "Old Faithful Geyser Data")
dev.copy(png, file = "geyserplot.png")
dev.off()
