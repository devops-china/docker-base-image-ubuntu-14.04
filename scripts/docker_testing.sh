#!/usr/bin/env bash

docker run --name wayde -itd ihakula/ubuntu1404-ruby bash
docker attach wayde
docker ps
docker run -di ihakula/ubuntu1404-ruby
docker container stop $(docker ps -aq)
docker rm $(docker ps -aq)

# Apache PHP
docker run --name json-editor-online -p 8701:80 -e VIRTUAL_HOST=www.jsoneditoronline.cn -v /home/repos/jsoneditoronline/:/var/www/html/ -d eboraas/apache-php

# MySQL
docker run --name zm-mysql -e MYSQL_ROOT_PASSWORD=Wayde191! -d mysql:5.6

# localhost testing
docker inspect 11b26a03a36a
mysql -h 192.168.0.2 -P 3306 --protocol=tcp -u root -p

# phpMyAdmin
docker run --name zm-phpmyadmin -d --link zm-mysql:db -e VIRTUAL_HOST=phpmyadmin.sunzhongmou.com -p 8601:80 phpmyadmin/phpmyadmin

# Nginx
docker run --name zm-nginx -d -p 80:80 -v /var/run/docker.sock:/tmp/docker.sock jwilder/nginx-proxy

# wordpress
docker run --name zm-wordpress --link zm-mysql:mysql -e WORDPRESS_DB_NAME=szm-blog -e VIRTUAL_HOST=blog.sunzhongmou.com -p 8501:80 -d wordpress


# 1. Start a brand new Aliyun EC2
# 2. Follow install tool guid to install Docker in EC2
# 3. docker pull mysql
# 4. Run mysql instance by command above
# 5. docker pull jwilder/nginx-proxy
# 6. Run Nginx proxy instance by command above

docker login registry-internal.aliyuncs.com
echo "DOCKER_OPTS=\"\$DOCKER_OPTS --registry-mirror=https://ikheat5u.mirror.aliyuncs.com\"" | sudo tee -a /etc/default/docker
sudo service docker restart
