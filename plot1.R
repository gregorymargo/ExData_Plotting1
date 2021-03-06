
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
    if (!exists("dat")) {
        source("read_data.R")
        dat <<- read_data()    # Push data up into enclosing environment for debug purposes
    }

    png(filename = outFileName,             # Specify output filename
        width = global_dim,
        height = global_dim,                # Size is 480x480 pixels for submission
        bg = global_bg)                     # Background is transparent for submission

    # Generate it baby!
    with(dat,
        hist(Global_active_power,
            main="Global Active Power",
            col="#FF2500",                              # Almost "red" but not quite
            xlab="Global Active Power (kilowatts)",
            ylab="Frequency"))

    # Close it out and write the file
    ignore <- dev.off()                     # Capture the output to shut it up
}

source("globals.R")     # Common globals

outFileName <- "plot1.png"
timer <- system.time(plot1(outFileName))

# Howdy
print(paste0("Plot 1 written to ", outFileName, " in ", timer["user.self"], " user seconds"))
