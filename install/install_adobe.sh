#!/bin/bash
#
#####################################
###   INSTALANDO O PACOTE ADOBE   ###
#####################################
#
echo
su root -c "
apt-get install gtk2-engines-murrine libcanberra-gtk-module -y
apt-get install libatk-adaptor libgail-common -y

add-apt-repository "deb http://archive.canonical.com/ precise partner"
apt-get update
apt-get install adobereader-enu

add-apt-repository -r "deb http://archive.canonical.com/ precise partner"
apt-get update
"
sleep 5
#exit
