
# vim: set ts=8 sts=4 sw=4 et ft=r :
#
# Wed May 07 10:28:15 PDT 2014
# Gregory Margo
#
# Exploratory Data Analysis
# Course Project 1, Plot 1


# Use common data reading function between plot?.R files.
# See "read_data.R" for this common code.
source("read_data.R")
data <- read_data()

png(filename = "plot1.png",             # Output filename is "plot1.png"
    width = 480, height = 480,          # Size is 480x480 pixels
    #bg = "transparent"                  # Background is transparent, for submission
    bg = "white"                        # Background is white, for testing
    )

# Generate it baby!
with(data,
    hist(Global_active_power,
        main="Global Active Power",
        col="#FF2500",
        xlab="Global Active Power (kilowatts)",
        ylab="Frequency"))

# Close it out and write the file
dev.off()

# Howdy
print("Hello, World!")
