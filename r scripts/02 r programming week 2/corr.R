
corr <- function(directory, threshold = 0) {
  
  correlation <- numeric()
  
  for (i in dir(directory)) {
    
    rawData <- read.csv(paste(directory, "/", i, sep = ""))
    completeCases <- sum(complete.cases(rawData))
    rawData <- rawData[complete.cases(rawData),]
      
    if (completeCases > threshold) {correlation <- c(correlation, cor(rawData$nitrate, rawData$sulfate))}
    
  }
  
  correlation
  
}

head(corr("specdata", 400))

# use dir() or list.files() to list the files in a specific directory