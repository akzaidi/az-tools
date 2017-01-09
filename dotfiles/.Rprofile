utils::rc.settings(ipck = TRUE)

local({
  r <- getOption("repos");
    r["CRAN"] <- "https://cran.rstudio.com/"
  options(repos = r)
})

.First <- function() {

    options(
            continue = " ",
            warnPartialMatchAttr = TRUE, 
            warnPartialMatchDollar = TRUE,
            warnPartialMatchArgs = TRUE,
            warn = 2,
            useFancyQuotes = FALSE
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

