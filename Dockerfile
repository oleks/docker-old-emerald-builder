FROM portoleks/debian-i386:latest

MAINTAINER oleks <oleks@oleks.info>

USER root

COPY emerald-0.99-linux.tar.gz /home/docker/

RUN \
  tar xvf emerald-0.99-linux.tar.gz && \
  rm emerald-0.99-linux.tar.gz && \
  mv emerald-0.99-linux emerald

ENV EMERALDROOT=/home/docker/emerald
ENV PATH="/home/docker/emerald/bin:${PATH}"

USER root
RUN apt-get update && \
  apt-get install -y --no-install-recommends \
    bison \
    build-essential \
    ed \
    flex \
    gcc-multilib \
    git \
    libc6-dev \
    libfl-dev \
    && apt-get clean \
    && rm -rf /var/lib/apk/lists/*
USER docker

RUN mkdir /home/docker/src/
WORKDIR /home/docker/src/
