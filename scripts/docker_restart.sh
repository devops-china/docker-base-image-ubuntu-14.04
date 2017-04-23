#!/usr/bin/env bash

service docker restart
docker ps -a
docker start zm-nginx

docker start zm-mysql

docker start zm-wordpress

docker start zm-phpmyadmin

docker rm zm-source
docker run --name zm-source -p 8702:80 -e VIRTUAL_HOST=source.sunzhongmou.com -v /home/repos/source/:/var/www/html/ -d eboraas/apache-php

docker rm json-editor-online
docker run --name json-editor-online -p 8701:80 -e VIRTUAL_HOST=www.jsoneditoronline.cn -v /home/repos/jsoneditoronline/:/var/www/html/ -d eboraas/apache-php

docker start zm-shop
docker start ihakula-service

docker start zm-mongodb
docker start zm-redis
docker start zm-node
