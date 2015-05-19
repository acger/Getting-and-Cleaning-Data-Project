
# Provide utility function for loading an filtering the data
loadData <- function() {
        # Set file name
        fileName <- "data/household_power_consumption.txt"
        if(!file.exists(fileName)) {
                downloadAndUnzip(fileName)
        }
        
        # Load data
        data <- read.csv(fileName, header = TRUE, sep = ";", na.string = "?", stringsAsFactors = FALSE)
        data
}

downloadAndUnzip <- function(fileName) {
        # URL of the dataset
        url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
        zipFileName <- "data/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
        
        if(!file.exists("./data")) { create.dir("data") }
        
        # Download dataset if its missing
        if(!file.exists(zipFileName)) {
                download.file(url, zipFileName, mode = "wb")
        }
        
        unzip(zipFileName, exdir = "data")    
}

filterDataByDate <- function(data) {
        # Copy selected rows to new data frame
        filtered_data <- data[data$Date=="1/2/2007" | data$Date=="2/2/2007", ]
        
        # Convert date/time strings
        filtered_data$DateTime <- strptime(paste(filtered_data$Date, filtered_data$Time), format = "%d/%m/%Y %H:%M:%S")
        
        # return data frame
        filtered_data
}