#! /bin/sh

## install rstudio

SHINY_VERSION=1.5.1.834

# SHINY_FILE=shiny-server-"$SHINY_VERSION"-amd64.deb
SHINY_FILE=shiny-server-"$SHINY_VERSION"-rh5-x86_64.rpm

wget https://s3.amazonaws.com/rstudio-shiny-server-os-build/centos5.9/x86_64/"$SHINY_FILE"

# sudo gdebi "$SHINY_FILE"
sudo yum install --nogpgcheck "$SHINY_FILE"

