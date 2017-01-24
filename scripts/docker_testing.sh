#!/usr/bin/env bash

docker run --name wayde -itd ihakula/ubuntu1404-ruby bash
docker attach wayde
docker ps
docker run -di ihakula/ubuntu1404-ruby
docker container stop $(docker ps -aq)
docker rm $(docker ps -aq)