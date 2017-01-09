#! /bin/sh

## install rstudio

SHINY_VERSION=1.0.136

# SHINY_FILE=shiny-server-"$SHINY_VERSION"-amd64.deb
SHINY_FILE=shiny-server-"$SHINY_VERSION"-rh5-x86_64.rpm


wget https://s3.amazonaws.com/rstudio-dailybuilds/"$SHINY_FILE"

# sudo gdebi "$SHINY_FILE"
sudo yum install --nogpgcheck "$SHINY_FILE"

