FROM ubuntu:xenial
MAINTAINER PLDaily "pcd12321@gmail.com"

RUN apt-get -y update

RUN mkdir -p /data
WORKDIR /data

# Some typical implementation and test requirements
RUN apt-get -y install apt-utils curl libreadline-dev libedit-dev

# Install g++ for any C/C++ based implementations
RUN apt-get -y install g++

# Add nodesource apt repo config for 8.X
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash -

# Install nodejs
RUN apt-get -y install nodejs

# Link common name
ENV NPM_CONFIG_CACHE /data/.npm
