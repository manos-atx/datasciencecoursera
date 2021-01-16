
pollutantmean <- function(directory, pollutant, id = 1:332) {
  
  df <- data.frame()
  
  for (i in id) {df <- rbind(df, read.csv(paste(directory , "/", sprintf("%03d", i), ".csv", sep = "")))}
  
  mean(df[[pollutant]], na.rm = TRUE)
  
}

# pollutantmean("specdata", "nitrate", 70:72)

# use sprintf() to pad a string with leading zeros
# pass a character variable to select a data frame column
