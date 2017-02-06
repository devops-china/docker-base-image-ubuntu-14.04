#!/usr/bin/env bash

docker run --name wayde -itd ihakula/ubuntu1404-ruby bash
docker attach wayde
docker ps
docker run -di ihakula/ubuntu1404-ruby
docker container stop $(docker ps -aq)
docker rm $(docker ps -aq)

# Apache PHP
docker run -p 80:80 -p 443:443 -v /home/jdoe/mysite/:/var/www/html/ -d eboraas/apache-php

# MySQL
docker run --name some-mysql -e MYSQL_ROOT_PASSWORD=password -d mysql:5.6

# phpMyAdmin
docker run --name myadmin -d --link some-mysql:db -p 8080:80 phpmyadmin/phpmyadmin