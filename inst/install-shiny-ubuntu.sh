#! /bin/sh

## install rstudio

SHINY_VERSION=${1:-1.5.4.870}

SHINY_FILE=shiny-server-"$SHINY_VERSION"-amd64.deb

wget https://s3.amazonaws.com/rstudio-shiny-server-os-build/ubuntu-12.04/x86_64/"$SHINY_FILE"

sudo gdebi "$SHINY_FILE"

## remove old files
rm $SHINY_FILE
