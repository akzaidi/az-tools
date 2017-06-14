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


# startup scripts
EXPOSE 8787

CMD rstudio-server start

CMD ["/usr/lib/rstudio-server/bin/rserver --server-daemonize 0"]
CMD ["/bin/bash"]

