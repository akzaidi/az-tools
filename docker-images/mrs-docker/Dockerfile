FROM ubuntu:16.04

MAINTAINER Ali Zaidi <alikaz.zaidi@gmail.com>

# Install R Client and RStudio-Server
RUN apt-get update -qq \
        && apt-get dist-upgrade -y \
        && apt-get install wget -y && cd /tmp && wget aka.ms/rclientlinux && cd /tmp && tar -xvzf rclientlinux  \
        && cd MRC_Linux && chmod +x ./install.sh && ./install.sh -ams \
        && cd /tmp \
        && rm -rf /tmp/MRC_Linux \
        && rm -rf /var/lib/apt/lists/*

# Install dotnet core
RUN apt-get update && apt-get install -y apt-transport-https && \
    sh -c 'echo "deb [arch=amd64] https://apt-mo.trafficmanager.net/repos/dotnet-release/ xenial main" > /etc/apt/sources.list.d/dotnetdev.list' && \
    apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 417A0893 && \
    apt-get update && \
    apt-get install -y dotnet-dev-1.0.4

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