pollutantmean <- function(directory, pollutant, id = 1:332) {
  ## Set Working Directory
  workingdirectory <- "C:/Users/student/Documents/Learning/R/AirPollution/"
  setwd(workingdirectory)
  
  filenames <- paste(workingdirectory, directory, "/", sprintf("%03d", id), ".csv", sep = "")
  
  totaldata <- c()
  
  ## Find the sum of all the observations in a file and number of data points
  ## Do this for each file in id and use the TotalSum and TotalDataPoints to calculate an average
  for (monitorfile in filenames) {
    filedata <- read.csv(monitorfile)
    cleandata <- na.omit(filedata[pollutant])
    totaldata <- c(totaldata, cleandata[,1])
  }
  mean(totaldata)
}