r <- getOption("repos")
r[["CRAN"]] <- "https://mran.microsoft.com/snapshot/2018-03-04"
options(repos = r)
if (!dir.exists("~/Rlib/")) dir.create("~/Rlib/")

.libPaths(c("~/Rlib", .libPaths()))

install.packages("devtools")
install.packages(c("httr", "curl"))
devtools::install_github("tidyverse/tidyverse")
install.packages("feather")

# install.packages("tidyverse")
# library(tidyverse)
# devtools::install_github("RevolutionAnalytics/dplyrXdf")

# sudo su -
# R CMD javareconf
# install.packages("XLConnect")
install.packages("tidyquant")


# devtools::install_github("Microsoft/CNTK-R")

install.packages("tidytext")
install.packages("text2vec")
install.packages("cleanNLP")


# install yihui-down-verse ------------------------------------------------

devtools::install_github("yihui/knitr")
devtools::install_github("rstudio/rmarkdown")
devtools::install_github("rstudio/bookdown")
devtools::install_github("rstudio/blogdown")
devtools::install_github("yihui/xaringan")


# install shinyverse ------------------------------------------------------

devtools::install_github("HenrikBengtsson/future")
devtools::install_github("rstudio/promises")
devtools::install_github("rstudio/shiny@async")


# rstudio tf packages -----------------------------------------------------

devtools::install_github("rstudio/reticulate")
devtools::install_github("rstudio/tensorflow")
devtools::install_github("rstudio/keras")
devtools::install_github("rstudio/tfestimators")
devtools::install_github("rstudio/tfruns")
devtools::install_github("rstudio/tfdeploy")

# library(reticulate)
# use_python("/home/alizaidi/anaconda3/envs/cntk-py36/bin/python",
#            required = TRUE)
# py_config()
# library(keras)


# ggthemes ----------------------------------------------------------------

devtools::install_github("hadley/ggplot2")
devtools::install_github("thomasp85/patchwork")
devtools::install_github("thomasp85/particles")
devtools::install_github("thomasp85/ggraph")
devtools::install_github("thomasp85/tidygraph")
devtools::install_github("ropensci/plotly")
devtools::install_github("hrbrmstr/hrbrthemes")
devtools::install_github("road2stat/ggsci")

install.packages("extrafontdb")
devtools::install_github("hrbrmstr/hrbrthemes", force = TRUE)
hrbrthemes::import_roboto_condensed()

library(hrbrthemes)
d <- read.csv(extrafont:::fonttable_file(), stringsAsFactors = FALSE)
d[grepl("Light", d$FontName), ]$FamilyName <- font_rc_light  # "Roboto Condensed Light"
write.csv(d, extrafont:::fonttable_file(), row.names = FALSE)
extrafont::loadfonts()

library(tidyverse)
pkgs <- tibble(packages = c("tidyverse", "tidytext", "text2vec", "cleanNLP",
                            "shiny", "rmarkdown", "knitr", "blogdown", "bookdown",
                            "ggplot2", "plotly", "hrbrthemes",
                            "future", "promises",
                            "particles", "patchwork", "ggraph", "tidygraph",
                            "reticulate", "tensorflow", "keras", 
                            "tfestimators", "tfruns", "tfdeploy"))

pkgs %>% mutate(pkg_vsn = map_chr(packages, ~ as.character(packageVersion(.x))))

library(hrbrthemes)
extrafont::loadfonts()
theme_modern_rc2 <- function() {
  hrbrthemes::theme_modern_rc() +
    ggplot2::theme(strip.text = ggplot2::element_text(colour = 'white')) +
    ggplot2::theme(axis.text = ggplot2::element_text(size = 16),
                   axis.title.x = ggplot2::element_text(size = 18),
                   axis.title.y = ggplot2::element_text(size = 18))
}

if (rstudioapi:::isAvailable() && rstudioapi:::getThemeInfo()$global == "Modern") {
  ggplot2::theme_set(theme_modern_rc2())
} else ggplot2::theme_set(theme_ipsum_rc())