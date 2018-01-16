#!/bin/bash
#
PATH=/sbin:/usr/sbin:/usr/local/sbin:/bin:/usr/bin:/usr/local/bin
export PATH
#####################################
###   INSTALANDO NOVOS PACOTES    ###
#####################################
#
apt-get update -y
apt-get install nomacs -y
apt-get install openssh-server -y
apt-get install putty -y
apt-get install nmap -y
apt-get install remmina -y
apt-get install p7zip-full -y
apt-get install chromium-browser -y
apt-get install vlc -y
apt-get install vim -y
apt-get install deborphan -y

clear
echo "Pacotes instalados via apt-get..."