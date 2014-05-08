
# vim: set ts=8 sts=4 sw=4 et ft=r :
#
# Thu May 08 08:21:54 PDT 2014
# Gregory Margo
#
# Exploratory Data Analysis
# Course Project 1, Plot 2

plot2 <- function(outFileName) {

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
        plot(TimeStamp, Global_active_power,
            type="l",                                       # Line graph
            col="black",                                    # Line color
            xlab="",                                        # No x-label
            ylab="Global Active Power (kilowatts)"))        # Y-label

    # Close it out and write the file
    ignore <- dev.off()                     # Capture the output to shut it up
}

source("globals.R")     # Common globals

outFileName <- "plot2.png"
timer <- system.time(plot2(outFileName))

# Howdy
print(paste0("Plot 2 written to ", outFileName, " in ", timer["user.self"], " user seconds"))
