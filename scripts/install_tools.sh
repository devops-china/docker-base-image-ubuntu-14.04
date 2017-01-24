#!/usr/bin/env bash

apt-get update \
&&  apt-get install -y unzip \
&&  apt-get install -y ca-certificates \
&&  apt-get install -y wget

if [ ! -d "./tools/packer_0.11.0" ]; then
    wget -O ./tools/packer_0.11.0.zip https://releases.hashicorp.com/packer/0.11.0/packer_0.11.0_linux_amd64.zip
    unzip ./tools/packer_0.11.0.zip -d ./tools/packer_0.11.0/
fi

#./packer_0.11.0/packer build -var "secret_key=$SECRET_KEY" -var "access_key=$ACCESS_KEY" -var "ecr_login_server=$ECR_LOGIN_SERVER" -var "ecr_repository=$ECR_REPOSITORY" docker_packer_config.json
