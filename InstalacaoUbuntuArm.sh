#!/bin/bash

sudo -i

sleep 2

sudo timedatectl set-timezone America/Sao_Paulo

sleep 2

apt update -y && sudo apt dist-upgrade -y && sudo apt autoremove -y 

sleep 2

apt-get install \
jq \
wget \
curl \
udisks2 \
libglib2.0-bin \
network-manager \
iputils-ping \
firewalld \
vim \
openssh-server \
dbus -y

sleep 2

curl -fsSL get.docker.com | sh

sleep 2

wget https://github.com/diego780705/HomeAssistantArm/raw/main/os-agent_1.2.2_linux_aarch64.deb

sleep 2

dpkg -i os-agent_1.2.2_linux_aarch64.deb

sleep 2

wget https://github.com/diego780705/HomeAssistantArm/raw/468d08c543f205005e9a001c8a54d01b40a9affb/homeassistant-supervised.deb

sleep 2

dpkg -i homeassistant-supervised.deb

sudo systemctl enable firewalld

sudo systemctl start firewalld 

sudo firewall-cmd --permanent --add-port=1-9999/tcp

sudo firewall-cmd --reload

systemctl restart firewalld
