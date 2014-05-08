
# vim: set ts=8 sts=4 sw=4 et ft=r :
#
# Thu May 08 08:31:44 PDT 2014
# Gregory Margo
#
# Exploratory Data Analysis
# Course Project 1, Plot 3

plot3 <- function(outFileName) {

    # Use common data reading function between plot?.R files.
    # See "read_data.R" for this common code.
    source("read_data.R")
    dat <<- read_data()    # Push data up into enclosing environment for debug purposes


    png(filename = outFileName,             # Specify output filename
        width = 480, height = 480,          # Size is 480x480 pixels
        #bg = "transparent"                  # Background is transparent, for submission
        bg = "white"                        # Background is white, for testing
        )

    # Some helpful variables.
    meters <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
    colors <- c("black", "red", "blue")

    # Find the scale that the three Sub_metering_? values will generate
    min_y <- min(dat[, meters])
    max_y <- max(dat[, meters])


    # Generate it baby!
    # Start with a blank page.
    with(dat,
        plot(TimeStamp, Sub_metering_1,
            type="n",                                       # No graph generated; only the plot
            ylim=c(min_y, max_y),                           # Size the y-axis appropriately
            xlab="",                                        # No x-label
            ylab="Energy sub metering"))                    # Y-label


    # Now generate individual plots for each of the 3 sub-meters
    with(dat,
        points(TimeStamp, Sub_metering_1,           # Sub-meter #1
            type="l",                               # Line graph
            col=colors[1]))                         # in an appropriate color
    with(dat,
        points(TimeStamp, Sub_metering_2,           # Sub-meter #2
            type="l",                               # Line graph
            col=colors[2]))                         # in an appropriate color
    with(dat,
        points(TimeStamp, Sub_metering_3,           # Sub-meter #3
            type="l",                               # Line graph
            col=colors[3]))                         # in an appropriate color

    # Add appropriate legend
    legend("topright",                              # Place legend at top right of figure
        legend=meters,                              # Same strings as used in data
        col=colors,                                 # in appropriate colors
        lty="solid",                                # Line type
        lwd=1)                                      # Line width


    # Close it out and write the file
    ignore <- dev.off()                     # Capture the output to shut it up
}

outFileName <- "plot3.png"
timer <- system.time(plot3(outFileName))

# Howdy
print(paste0("Plot 3 written to ", outFileName, " in ", timer["user.self"], " user seconds"))