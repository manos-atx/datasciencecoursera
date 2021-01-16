
download.file(url = 'https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv',
              destfile = 'c3w3q1.csv')

df <- read.csv('c3w3q1.csv')

agricultureLogical <- df$ACR == 3 & df$AGS == 6

which(agricultureLogical)
