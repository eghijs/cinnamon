#!/bin/bash
#
#####################################
###   INSTALANDO O PACOTE ADOBE   ###
#####################################
#
echo
su root -c "
add-apt-repository deb http://archive.canonical.com/ precise partner
apt-get update -y
clear

apt-get install adobereader-enu -y

# Removendo repositorio Adobe Reader
add-apt-repository -r deb http://archive.canonical.com/ precise partner
"
sleep 5
#exit
