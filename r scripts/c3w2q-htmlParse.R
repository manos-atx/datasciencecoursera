
library(XML)

webUrl <- 'http://biostat.jhsph.edu/~jleek/contact.html'

con <- url(webUrl) # create connection
cvector <- readLines(con) # read the lines behin the connection
(charsPerLine <- nchar(cvector[c(10,20,30,100)]))

df <- read.fwf('getdata-wksst8110.for', widths = c(10,rep(c(9,4),4)), skip = 4)
sum(df$V4)
