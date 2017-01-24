#!/usr/bin/env bash

echo 'Ready. Go...'

echo 'installing tools...'
./scripts/install_tools.sh

echo 'Packer docker image...'
./packer_0.11.0/packer build -var "secret_key=wayde191" docker_packer_config.json

echo 'Done!'
