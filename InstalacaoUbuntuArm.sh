#!/bin/bash

sudo -i

sleep 2

sudo timedatectl set-timezone America/Sao_Paulo

sleep 2

apt update -y && sudo apt dist-upgrade -y && sudo apt autoremove -y 

sleep 2

fallocate -l 3G /swapfile
chmod 600 /swapfile
mkswap /swapfile
swapon /swapfile
swapon --show
cp /etc/fstab /etc/fstab.bak
echo '/swapfile none swap sw 0 0' | sudo tee -a /etc/fstab

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

sleep 2

systemctl enable firewalld

sleep 2

firewall-cmd --permanent --add-port=1-65535/tcp

sleep 2

firewall-cmd --reload

sleep 2

systemctl start firewalld
