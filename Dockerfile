FROM ubuntu:xenial
MAINTAINER Joel Martin <github@martintribe.org>

##########################################################
# General requirements for testing or common across many
# implementations
##########################################################

RUN apt-get -y update

# Required for running tests
RUN apt-get -y install make python

# Some typical implementation and test requirements
RUN apt-get -y install curl libreadline-dev libedit-dev

RUN mkdir -p /data
WORKDIR /data

##########################################################
# Specific implementation requirements
##########################################################

# Install g++ for any C/C++ based implementations
RUN apt-get -y install g++

# Add nodesource apt repo config for 8.X
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash -

# Install nodejs
RUN apt-get -y install nodejs

# Link common name
ENV NPM_CONFIG_CACHE /data/.npm

# Nothing additional needed for python
RUN apt-get -y install python3

# For dist packaging
RUN apt-get -y install zip

# Install php
RUN apt-get -y install php7.0-cli

# Install go
RUN apt-get -y install pkg-config
RUN apt-get -y install golang
