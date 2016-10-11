#! /bin/bash

sudo apt-get update

# docker
# https://docs.docker.com/engine/installation/linux/ubuntulinux/
sudo apt-get install apt-transport-https ca-certificates
sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
sudo echo 'deb https://apt.dockerproject.org/repo ubuntu-xenial main' >> /etc/apt/sources.list.d/docker.list
sudo apt-get update
sudo apt-get purge lxc-docker
sudo apt-get install docker-engine -y
sudo service docker start
docker -v

# docker-compose
# https://docs.docker.com/compose/install/
curl -L https://github.com/docker/compose/releases/download/1.8.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
docker-compose -v

# letsencrypt
sudo apt-get install letsencrypt -y
letsencrypt certonly --standalone -d docker.merrett.io -n -m reece.merrett@gmail.com --agree-tos

# registry
# docker vars
mkdir /var/docker && mkdir var/docker/data && mkdir/var/docker/data
# utility to create htpassword file
sudo apt-get -y install apache2-utils