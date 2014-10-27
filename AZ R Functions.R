## AZ's Personal Functions

options(continue = " ") 
# options(scipen = 10, digits = 10)
windowsFonts(Times = windowsFont("TT Times New Roman"))
windowsFonts(Lato = windowsFont("Lato Light"))

load.pkgs <- function() {
  
  pkgs <- c("ggplot2", "ggsubplot", "ggthemes",
            "grid", "scales", "stringr", "plyr",
            "dplyr", "quantmod", "reshape2",
            "BEST", "gridExtra", "lubridate",
            "ggvis", "vcd")
  
  pkgs.to.install <- pkgs[!(pkgs %in% .packages(all.available = TRUE))]
  
  if (length(pkgs.to.install) > 0) {
    install.packages(pkgs.to.install)
  }
  
  
  library(ggplot2)  # for graphics
  library(ggsubplot)# more graphics
  library(ggthemes) # for ggplot themes
  library(grid)     # for unit
  library(scales)   # for percentage formatting
  library(stringr)  # for manipulating strings
  # library(plyr)     # for dividing and conquering
  library(dplyr)    # divide and conquering with steriods
  library(quantmod) # for stock prices.
  library(reshape2) # for pivoting and reshaping data
  library(BEST)     # for Bayesian testing
  library(gridExtra)# for layering multiple charts
  library(lubridate) # better dates 
  library(ggvis)     # interactive grammar of graphics
  library(vcd)     # for graphical analysis of categorical data
  # library(xlsx)     # for reading xlsx files
  # library(sas7bdat) # for importing from sas data files
  
  
}

load.pkgs()

## Default ggplot to NERA-like theme
ggplot <- function(...) { 
  ggplot2::ggplot(...) + theme_classic() + 
    theme(text = element_text(family = "Times", size = 12)) + 
    theme(legend.position = 'bottom', plot.title = element_text(face = 'bold'),
          panel.grid.major.y = element_line(colour = "grey", size = 0.5), 
          panel.grid.minor = element_blank()) + 
    theme(axis.title.y = element_text(face="bold"),  
          axis.title.x = element_text(face="bold")) + 
    theme(legend.key = element_blank())
}

theme_az <- theme(text=element_text(family="Times", size=12),
                  panel.grid.major.x=element_blank(),
                  panel.grid.minor.x=element_blank(),
                  panel.grid.minor.y=element_blank(),
                  panel.grid.major.y=element_line(colour="#ECECEC", size=0.5, linetype=1),
                  axis.ticks.y=element_blank(),
                  panel.background=element_blank(),
                  legend.title=element_blank(),
                  legend.key=element_rect(fill="white"),
                  legend.key.size=unit(1.5, "cm"),
                  legend.text=element_text(size=12),
                  axis.title=element_text(size=14),
                  axis.text=element_text(color="black",size=8),
                  legend.position = 'bottom')



nera.gg <- function(plot.gg, nline = 5) {
	## for a ggplot, add whitespace for footnotes
	
	gg <- arrangeGrob(plot.gg, 
                  sub = textGrob("", x = 0, y = 0, hjust = 0, vjust = 0,
                                 gp = gpar(fontsize = nline*10)))
								 
	return(gg)
}


## Add progress bars to apply functions
apply_pb <- function(X, MARGIN, FUN, ...) {
  
  env <- environment()
  pb_Total <- sum(dim(X)[MARGIN])
  counter <- 0
  pb <- txtProgressBar(min = 0, max = pb_Total, style = 3)
  
  wrapper <- function(...) {
    curVal <- get("counter", envir = env)
    assign("counter", curVal +1 ,envir= env)
    setTxtProgressBar(get("pb", envir= env), curVal +1)
    FUN(...)
  }
  
  res <- apply(X, MARGIN, wrapper, ...)
  close(pb)
  res
  
}

lapply_pb <- function(X, FUN, ...) {
 env <- environment()
 pb_Total <- length(X)
 counter <- 0
 pb <- txtProgressBar(min = 0, max = pb_Total, style = 3)   

 # wrapper around FUN
 wrapper <- function(...){
   curVal <- get("counter", envir = env)
   assign("counter", curVal +1 ,envir=env)
   setTxtProgressBar(get("pb", envir=env), curVal +1)
   FUN(...)
 }
 res <- lapply(X, wrapper, ...)
 close(pb)
 res
}

write.tabs.xlsx <- function(fname, 
                            list.writing, 
                            rnames = F) {
  ## Write each element of list in list.writing
  ## to a separate tab of an xlsx file to file fname
  
  wb <- createWorkbook()
  xlsxname <- fname
  saveWorkbook(wb, xlsxname)
  
  lapply(names(list.writing), function(x) write.xlsx(list.writing[[x]], 
                                                     xlsxname, 
                                                     sheetName = x,
                                                     row.names = rnames,
                                                     append = TRUE))
  
  return(cat(paste("Saved to ", fname, sep = "")))
  
}

var.wt <- function(x, w, na.rm = FALSE) {
	## Weighted variance calculation
	
     if (na.rm) {
         w <- w[i <- !is.na(x)]
         x <- x[i]
     }
     sum.w <- sum(w)
     return((sum(w*x^2) * sum.w - sum(w*x)^2) / (sum.w^2 - sum(w^2)))
}


ggplotColours <- function(n=6, h=c(0, 360) +15){
     if ((diff(h)%%360) < 1) h[2] <- h[2] - 360/n
     hcl(h = (seq(h[1], h[2], length = n)), c = 100, l = 65)
 }
 
 ## scales:::show_col(ggplotColours(n=3))
 
networkdays <- function(start, end, holidays) {
	dates <- seq(as.Date(start), as.Date(end), by="day")

	if(missing(holidays)) holidays <- 0 else holidays <- length(holidays)
	return(sum(as.numeric(format(dates, "%w") > 1)) - holidays)
	
} 
