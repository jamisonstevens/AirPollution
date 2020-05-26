corr <- function(directory, threshold = 0) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  ## Return a numeric vector of correlations
  ## NOTE: Do not round the result!
  
  workingdirectory <- "C:/Users/student/Documents/Learning/R/AirPollution/"
  setwd(workingdirectory)
  
  correlations <- numeric(0)
  
  thresholdmonitors <- complete(directory)[complete(directory)$nobs >= threshold,]
  
  for(monitornumber in thresholdmonitors$id) {
    filename <- paste(workingdirectory, directory, "/", sprintf("%03d", monitornumber), ".csv", sep = "")
    filedata <- read.csv(filename)
    cleandata <- filedata[(!is.na(filedata$sulfate) & !is.na(filedata$nitrate)),]
    correlations <- c(correlations, cor(cleandata$sulfate, cleandata$nitrate))
  }
  correlations
}