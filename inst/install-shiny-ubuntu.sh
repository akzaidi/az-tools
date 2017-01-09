#! /bin/sh

## install rstudio

SHINY_VERSION=1.0.136

SHINY_FILE=shiny-server-"$SHINY_VERSION"-amd64.deb

wget https://s3.amazonaws.com/rstudio-dailybuilds/"$SHINY_FILE"

sudo gdebi "$SHINY_FILE"


