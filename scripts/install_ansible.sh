#!/usr/bin/env bash

sudo apt-get update --fix-missing
sudo apt-get install python-software-properties -y
sudo apt-get install software-properties-common -y
sudo apt-add-repository ppa:ansible/ansible -y
sudo apt-get update
sudo apt-get install ansible -y