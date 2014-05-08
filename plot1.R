
# vim: set ts=8 sts=4 sw=4 et ft=r :
#
# Wed May 07 10:28:15 PDT 2014
# Gregory Margo
#
# Exploratory Data Analysis
# Course Project 1, Plot 1

plot1 <- function(outFileName) {

    # Use common data reading function between plot?.R files.
    # See "read_data.R" for this common code.
    source("read_data.R")
    dat <<- read_data()    # Push data up into enclosing environment for debug purposes


    png(filename = outFileName,             # Specify output filename
        width = 480, height = 480,          # Size is 480x480 pixels
        #bg = "transparent"                  # Background is transparent, for submission
        bg = "white"                        # Background is white, for testing
        )

    # Generate it baby!
    with(dat,
        hist(Global_active_power,
            main="Global Active Power",
            col="#FF2500",
            xlab="Global Active Power (kilowatts)",
            ylab="Frequency"))

    # Close it out and write the file
    ignore <- dev.off()                     # Capture the output to shut it up
}

outFileName <- "plot1.png"
timer <- system.time(plot1(outFileName))

# Howdy
print(paste0("Plot 1 written to ", outFileName, " in ", timer["user.self"], " user seconds"))
