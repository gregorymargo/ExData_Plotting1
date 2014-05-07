
# vim: set ts=8 sts=4 sw=4 et ft=r :
#
# Wed May 07 10:28:15 PDT 2014
# Gregory Margo
#
# Exploratory Data Analysis
# Course Project 1, Plot 1-5
# (Common code to all Plot N functions)


# Read in the Household Power Consumption data required
# for the first course project.
# Read the data directly from the .ZIP file so there is no
# need for Joe User to manually unzip it.
read_data <- function() {

    # The orignal data is from this link, but we're using a local copy.
    #original_data_url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

    # Local files (or links to actual files).
    dataFileZip <- "exdata_data_household_power_consumption.zip"

    # File within zip which we must extract and filter.
    dataFileTxt <- "household_power_consumption.txt"

    # Use the 'unz' function to unzip through a file connection.
    dataFile <- unz(dataFileZip, dataFileTxt)

    # Suck the entire file into memory.
    # Yes I know we don't need all of it.
    # Leave that optimization until later.
    #
    # Add options so strings are not considered factors.
    # and "?" and "" are interpreted as NA.
    entireFile <- read.csv2(dataFile, stringsAsFactors=FALSE, na.strings=c("?", ""))

    # Convert the "Date" column into a usable value.
    entireFile[, "Date"] <- as.Date(entireFile[, "Date"], format="%d/%m/%Y")

    # Isolate a specific range of Dates
    startDate = as.Date("2007-02-01")
    endDate   = as.Date("2007-02-02")

    # Subset the file for the date range.
    data <- entireFile[ (entireFile$Date >= startDate & entireFile$Date <= endDate), ]

    # Perform further massaging of the data.
    numeric_columns <- c("Global_active_power", "Global_reactive_power",
        "Voltage", "Global_intensity",
        "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
    for (column in numeric_columns) {
        data[, column] <- as.numeric(data[, column])
    }

    # Return the data-limited and massaged date to the caller.
    # There are 2880 entries in the specific date range.
    return(data)
}
