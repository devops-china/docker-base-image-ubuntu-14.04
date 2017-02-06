#!/usr/bin/env bash

apt-get update \
&&  apt-get install curl \
            linux-image-extra-$(uname -r) \
            linux-image-extra-virtual \
&&  apt-get install -y unzip \
&&  apt-get install -y apt-transport-https \
&&  apt-get install -y ca-certificates \
&&  apt-get install -y wget \
&&  apt-get install software-properties-common \

# Get Packer ready
if [ ! -d "./tools/packer_0.11.0" ]; then
    wget -O ./tools/packer_0.11.0.zip https://releases.hashicorp.com/packer/0.11.0/packer_0.11.0_linux_amd64.zip
    unzip ./tools/packer_0.11.0.zip -d ./tools/packer_0.11.0/
fi

# Install Docker
add-apt-repository \
       "deb https://apt.dockerproject.org/repo/ \
       ubuntu-$(lsb_release -cs) \
       main"
apt-get update \
&&  apt-get install libsystemd-journal0 \
&&  apt-get install docker-engine
