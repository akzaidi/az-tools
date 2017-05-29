#!/bin/sh

## install rstudio

ARG1=${1:-1.0.136}
RSTUDIO_VERSION=$ARG1

# RSTUDIO_FILE=rstudio-server-rhel-"$RSTUDIO_VERSION"-x86_64.rpm
RSTUDIO_FILE=rstudio-server-"$RSTUDIO_VERSION"-amd64.deb

wget https://s3.amazonaws.com/rstudio-dailybuilds/"$RSTUDIO_FILE"

# sudo yum install --nogpgcheck "$RSTUDIO_FILE"

apt-get install gdebi-core && gdebi "$RSTUDIO_FILE" -y


