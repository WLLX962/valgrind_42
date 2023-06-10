#FROM ubuntu:latest
#Used in lab - 42SP focal = ubuntu 20.04
FROM ubuntu:focal
LABEL description="Valgrind"
ENV TZ=America/Sao_Paulo
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt-get -y update && apt-get -y upgrade
RUN apt-get -y install \
    vim build-essential git-core cmake make clang gcc \
    valgrind libxext-dev libbsd-dev xorg
RUN apt-get clean && rm -rf /var/lib/apt/lists/* && rm -rf /tmp/*
WORKDIR /valgrind