##### INITIALIZING #####

##### Retrieve data #####

## Download the zip file containing the data, if it has not been downloaded yet.

urlZip          <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
fileZip         <- "exdata%2Fdata%2FNEI_data.zip"

if(!file.exists(fileZip)) {
        download.file(urlZip, fileZip, mode = "wb")
}

dataFolder <- ""

if(!file.exists(dataFolder)) {
        unzip(fileZip)
}

