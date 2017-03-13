utils::rc.settings(ipck = TRUE)

q <- function (save="no", ...) {
  quit(save=save, ...)
}

local({
  r <- getOption("repos")
  
  if ("checkpoint" %in% installed.packages()) {
    mran_date <- Sys.Date() - 1
    r[["CRAN"]] <- paste0("https://mran.revolutionanalytics.com/snapshot/", mran_date)
    options(repos = r)
  } else {
    r["CRAN"] <- "https://cran.revolutionanalytics.com/"  
  }
  
  options(repos = r)
})

.First <- function() {

    options(
            continue = " ",
            warnPartialMatchAttr = TRUE, 
            warnPartialMatchDollar = TRUE,
            warnPartialMatchArgs = TRUE,
            warn = 2,
            useFancyQuotes = FALSE,
            max.print = 120
        )

  if (interactive()) {
    suppressMessages(require(devtools))
  }

}

.Last <- function() {
    if (interactive()) {
        hist_file <- Sys.getenv("R_HISTFILE")
        if (hist_file == "")
            hist_file <- "~/.RHistory"
        savehistory(hist_file)
    }
}

