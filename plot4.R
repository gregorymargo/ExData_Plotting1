
# vim: set ts=8 sts=4 sw=4 et ft=r :
#
# Thu May 08 09:15:32 PDT 2014
# Gregory Margo
#
# Exploratory Data Analysis
# Course Project 1, Plot 4

plot4 <- function(outFileName) {

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


    # Plot 4 graphs in a 2x2 grid
    par(mfrow = c(2, 2))


    #--------------------------------------------------------------------------
    # (1,1) Time vs Global Active Power
    with(dat,
        plot(TimeStamp, Global_active_power,
            type="l",                                       # Line graph
            col="black",                                    # in black
            xlab="",                                        # No X-label
            ylab="Global Active Power"))                    # Y-label

    #--------------------------------------------------------------------------
    # (1,2) Time vs Voltage
    with(dat,
        plot(TimeStamp, Voltage,
            type="l",                                       # Line graph
            col="black",                                    # in black
            xlab="datetime",                                # X-label
            ylab="Voltage"))                                # Y-label

    #--------------------------------------------------------------------------
    # (2,1) Time vs Energy sub metering (almost same as Plot3)

    # Some helpful variables.
    meters <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
    colors <- c("black",
                "#FF2500",      # Almost "red" but not quite
                "#0433FF")      # Almost "blue" but not quite

    # Find the scale that the three Sub_metering_? values will generate
    min_y <- min(dat[, meters])
    max_y <- max(dat[, meters])

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
        lwd=1,                                      # Line width
        bty="n")                                    # No box around legend

    #--------------------------------------------------------------------------
    # (2,2) Time vs Global Reactive Power
    with(dat,
        plot(TimeStamp, Global_reactive_power,
            type="l",                                       # Line graph
            col="black",                                    # in black
            xlab="datetime",                                # X-label
            ylab="Global_reactive_power"))                  # Y-label


    # Close it out and write the file
    ignore <- dev.off()                     # Capture the output to shut it up
}

source("globals.R")     # Common globals

outFileName <- "plot4.png"
timer <- system.time(plot4(outFileName))

# Howdy
print(paste0("Plot 4 written to ", outFileName, " in ", timer["user.self"], " user seconds"))
