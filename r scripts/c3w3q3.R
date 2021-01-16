
download.file(url = 'https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv',
              destfile = 'c3w3q3a.csv')

download.file(url = 'https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv',
              destfile = 'c3w3q3b.csv')

gdp <- read.csv('c3w3q3a.csv', skip = 4, nrows = 190)[,c(1,4:5)]
gdp$X.4 <- as.numeric(gsub(",","",gdp$X.4)) # thousands seperator is troublesome

edu <- read.csv('c3w3q3b.csv', header = TRUE)

library(dplyr)  

df <- inner_join(gdp, edu, by = c('X' = 'CountryCode'))

df %>% arrange(X.4) %>% slice(13)

df <- df %>% mutate(X.5 = order(X.4, decreasing = TRUE), .before = Long.Name)

df %>% group_by(Income.Group) %>% summarize(avg = mean(X.5))

df <- df %>% mutate(X.6 = cut(df$X.5, breaks = quantile(df$X.5, probs = seq(0,1,0.2)), include.lowest = TRUE,
    labels = c(1,2,3,4,5)), .before = Long.Name)

table(df$X.6, df$Income.Group)
