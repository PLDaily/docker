FROM ubuntu:xenial
MAINTAINER PLDaily "pcd12321@gmail.com"

RUN apt-get -y update

RUN mkdir -p /data
WORKDIR /data

# Install go
RUN apt-get -y install pkg-config
RUN apt-get -y install golang
