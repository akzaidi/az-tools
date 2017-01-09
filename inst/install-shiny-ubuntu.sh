#! /bin/sh

## install rstudio

SHINY_VERSION=1.5.1.834

SHINY_FILE=shiny-server-"$SHINY_VERSION"-amd64.deb

wget https://s3.amazonaws.com/rstudio-shiny-server-os-build/ubuntu-12.04/x86_64/"$SHINY_FILE"

sudo gdebi "$SHINY_FILE"


