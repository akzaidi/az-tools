FROM ubuntu:16.04

MAINTAINER Ali Zaidi <alikaz.zaidi@gmail.com>

# Install R Client
RUN apt-get update -qq \
        && apt-get dist-upgrade -y \
        && apt-get install -y libunwind8 gettext libssl-dev libcurl3-dev zlib1g libicu-dev \
        && apt-get install -y wget && cd /tmp && wget aka.ms/rclientlinux && cd /tmp && tar -xvzf rclientlinux  \
        && cd MRC_Linux && chmod +x ./install.sh && ./install.sh -ams \
        && cd /tmp \
        && rm -rf /tmp/MRC_Linux \
        && rm -rf /var/lib/apt/lists/*

# install rstudio server
RUN apt-get update \
        && apt-get install -y --no-install-recommends \
        file \
        git \
        libapparmor1 \
        libedit2 \
        libcurl4-openssl-dev \
        libssl-dev \
        lsb-release \
        psmisc \
        python-setuptools \
        sudo \
        gdebi-core \
        wget

RUN wget https://s3.amazonaws.com/rstudio-dailybuilds/rstudio-server-1.1.246-amd64.deb
RUN gdebi -nq rstudio-server-1.1.246-amd64.deb


# Install RStudio-Server
#RUN wget https://raw.githubusercontent.com/akzaidi/etc/master/inst/install-rstudio-ubuntu.sh && \
#       chmod +x ./install-rstudio-ubuntu.sh && \
#       ./install-rstudio-ubuntu.sh 1.1.245


# Make port 8787 available
EXPOSE 8787