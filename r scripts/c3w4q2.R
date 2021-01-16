
download.file(url = 'https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv',
              destfile = 'c3w4q2.csv')

gdp <- read.csv('c3w4q2.csv', skip = 4)[1:190,c(1,2,4:5)]

download.file(url = 'https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv',
              destfile = 'c3w4q2b.csv')

edu <- read.csv('c3w4q2b.csv')

gdp$X.4 <- as.numeric(gsub(",","",gdp$X.4))

mean(gdp$X.4)

grep("^United", gdp$X.3)

df <- merge(gdp, edu, by.x = 'X', by.y = 'CountryCode')

grep("June", df[grep("Fiscal year end: ", df$Special.Notes), 'Special.Notes'])
