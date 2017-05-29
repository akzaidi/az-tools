# Use official ubuntu 16.04 build
FROM ubuntu:16.04

MAINTAINER Ali Zaidi <alikaz.zaidi@gmail.com>

RUN apt-get update && apt-get install -y sudo curl make gcc g++ gfortran libcurl4-openssl-dev libxml2-dev vim

# Install R Client
RUN apt-get install wget -y && cd /tmp && wget aka.ms/rclientlinux

RUN cd /tmp && tar -xvzf rclientlinux && \
	cd MRC_Linux && chmod +x ./install.sh && ./install.sh -asm

# Install RStudio-Server
RUN wget https://raw.githubusercontent.com/akzaidi/etc/master/inst/install-rstudio-ubuntu.sh && \
	chmod +x ./install-rstudio-ubuntu.sh && \
	./install-rstudio-ubuntu.sh 1.1.245

# Make port 8787 available
EXPOSE 8787


