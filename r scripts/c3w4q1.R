
download.file(url = 'https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv',
              destfile = 'c3w4q1.csv')

acs <- read.csv('c3w4q1.csv')

strsplit(names(acs), split = "wgtp")[123]
