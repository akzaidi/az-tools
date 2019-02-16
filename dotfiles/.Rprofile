utils::rc.settings(ipck = TRUE)


local({
  r <- getOption("repos")
  
  mran_date <- Sys.Date() - 1
  r[["CRAN"]] <- paste0("https://mran.revolutionanalytics.com/snapshot/", mran_date)
  options(repos = r)
  
})

.First <- function() {

    options(
            continue = " ",
            warnPartialMatchAttr = TRUE, 
            warnPartialMatchDollar = TRUE,
            warnPartialMatchArgs = TRUE,
            warn = 1,
            useFancyQuotes = FALSE,
            max.print = 120
        )

  if (interactive()) {
    suppressMessages(require(devtools))
  }

}
