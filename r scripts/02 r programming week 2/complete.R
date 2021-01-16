
complete <- function(directory, id = 1:332) {
  
  df <- data.frame(id = numeric(), nobs = numeric())
  
  for (i in 1:length(id)) {
    df[i, 'id'] <- id[i] 
    rawData <- read.csv(paste(directory , "/", sprintf("%03d", id[i]), ".csv", sep = ""))
    df[i, 'nobs'] <- sum(complete.cases(rawData))
  }
  
  df
  
}

# complete("specdata", 30:25)

# use a combination of numeric and character indexes to subset a data frame
# complete.cases() returns a TRUE/FALSE logical vector
