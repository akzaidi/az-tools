utils::rc.settings(ipck = TRUE)

.First <- function() {

    options(
        stringsAsFactors = FALSE,
        continue = " ",
        warnPartialMatchAttr = TRUE, warnPartialMatchDollar = TRUE,
        max.print = 1000
        )



}

.Last <- function() {
    if (interactive()) {
        hist_file <- Sys.getenv("R_HISTFILE")
        if (hist_file == "")
            hist_file <- "~/.RHistory"
        savehistory(hist_file)
    }
}

