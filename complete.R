complete <- function(directory, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return a data frame of the form:
  ## id nobs
  ## 1  116
  ## 2  1041
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the
  ## number of complete cases
  
  ## Set Working Directory
  workingdirectory <- "C:/Users/student/Documents/Learning/R/AirPollution/"
  setwd(workingdirectory)
  
  completemonitors <- data.frame()
  
  ## Find the sum of all the observations in a file and number of data points
  ## Do this for each file in id and use the TotalSum and TotalDataPoints to calculate an average
  for (monitornumber in id) {
    monitorfile <- paste(workingdirectory, directory, "/", sprintf("%03d", monitornumber), ".csv", sep = "")
    filedata <- read.csv(monitorfile)
    completedata <- !is.na(filedata["sulfate"]) & !is.na(filedata["nitrate"])
    nobs <- sum(completedata)
    completemonitors <- rbind(completemonitors, list("id" = monitornumber, "nobs" = nobs))
  }
  completemonitors
}