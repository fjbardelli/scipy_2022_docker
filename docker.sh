#!/bin/bash
#-*- ENCODING: UTF-8 -*

# https://bioinf.comav.upv.es/courses/unix/scripts_bash.html
export DEBIAN_FRONTEND=noninteractive

echo "Actulizar el SO"
sudo apt update
sudo apt upgrade -y
sudo apt full-upgrade
sudo apt --purge autoremove
sudo apt autoclean

echo "Instalar Docker"

sudo apt update
sudo apt install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update
sudo apt install docker-ce docker-ce-cli containerd.io docker-compose-plugin -y


echo "Usar sin Sudo"
sudo usermod -aG docker ${USER}
#sudo usermod -aG docker  ubuntu
#su - ubuntu
#sudo usermod -aG docker ubuntu

echo " FIN "
sudo reboot now
