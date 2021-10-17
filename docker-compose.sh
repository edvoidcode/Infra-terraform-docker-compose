#!/bin/bash

sudo apt-get update

sudo apt-get install -y apt-transport-https ca-certificates curl gnupg lsb-release

sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

sudo echo   "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt update

sudo apt-get install -y docker-ce docker-ce-cli containerd.io

# Docker Repository created and docker installed

##docker-copose installation

sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

sudo chmod +x /usr/local/bin/docker-compose

mkdir /home/ubuntu/docker-compose

touch /home/ubuntu/docker-compose/wpdb.yaml

sudo cat > /home/ubuntu/docker-compose/wpdb.yaml << EOF
version: '3.1'

services:

  wordpress:
    image: wordpress
    restart: always
    ports:
      - 0.0.0.0:80:80
    environment:
      WORDPRESS_DB_HOST: wp_db
      WORDPRESS_DB_USER: wpuser
      WORDPRESS_DB_PASSWORD: pass1234
      WORDPRESS_DB_NAME: wpdb
    volumes:
      - wordpress:/var/www/html

  wp_db:
    image: mysql
    restart: always
    environment:
      MYSQL_DATABASE: wpdb
      MYSQL_USER: wpuser
      MYSQL_PASSWORD: pass1234
      MYSQL_RANDOM_ROOT_PASSWORD: '1'
    volumes:
      - wp_db:/var/lib/mysql

volumes:
  wordpress:
  wp_db:

EOF

sudo docker-compose -f /home/ubuntu/docker-compose/wpdb.yaml up