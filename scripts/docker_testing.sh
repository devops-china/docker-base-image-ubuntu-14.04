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

# localhost testing
docker inspect 11b26a03a36a
mysql -h 192.168.0.2 -P 3306 --protocol=tcp -u root -p

# phpMyAdmin
docker run --name myadmin -d --link some-mysql:db -p 8080:80 phpmyadmin/phpmyadmin

# wordpress
docker run -d -p 80:80 -v /var/run/docker.sock:/tmp/docker.sock jwilder/nginx-proxy
docker run --name test-wordpress --link some-mysql:mysql -e WORDPRESS_DB_NAME=no2 -e VIRTUAL_HOST=no1.ihakula.com -p 8089:80 -d wordpress