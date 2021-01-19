
# create a ramp between colors
pal <- colorRamp(c("red","blue"))
pal(0); pal(0.5); pal(1)
pal(seq(0,1,length=10))

pal <- colorRampPalette(c("red","yellow"))
pal(2); pal(10) # now I feed the function with the number of colors that I want

# there are three types of palettes in the RColorBrewer package:
# 1.sequential (for ordered data)
# 2.diverging
# 3.qualitative (for categorical data)

library(RColorBrewer)
cols <- brewer.pal(3,"BuGn")
pal <- colorRampPalette(cols)
image(volcano, col = pal(20))

x <- rnorm(10000)
y <- rnorm(10000)
smoothScatter(x,y)

plot(x,y,pch=19)
plot(x,y,pch=19,col=rgb(0,0,0,0.2))
