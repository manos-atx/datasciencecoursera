
download.file(url = 'https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg',
              destfile = 'c3w3q2.jpg')

df <- readJPEG('c3w3q2.jpg', native = TRUE)

quantile(df, probs = c(0.3, 0.8))
