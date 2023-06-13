#FROM ubuntu:latest
#Used in lab - 42SP focal = ubuntu 20.04
FROM ubuntu:focal
LABEL description="Valgrind"

# skip "Country of origin for keyboard"
ENV DEBIAN_FRONTEND=noninteractive

# timezone
ENV TZ=America/Sao_Paulo
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# update and upgrade
RUN apt-get -y update && apt-get -y upgrade

# install essentials libs
RUN apt-get -y install \
    vim build-essential git-core cmake make clang gcc \
    valgrind libxext-dev libbsd-dev

# disable for now
# RUN apt-get -y install xorg

# add/enabled man-db
RUN apt-get -y install && yes | unminimize

# optionals libs
RUN apt-get -y install \
    python3 python3-pip

# 42 Norminette (needs python)
RUN python3 -m pip install --upgrade \
    pip setuptools && python3 -m pip install norminette

#clean
RUN apt-get clean && rm -rf /var/lib/apt/lists/* && rm -rf /tmp/*
WORKDIR /valgrind