#!/bin/bash
#
PATH=/sbin:/usr/sbin:/usr/local/sbin:/bin:/usr/bin:/usr/local/bin
export PATH
#####################################
###   INSTALANDO O PACOTE ADOBE   ###
#####################################
DIR=/home/$USER/Downloads

wget -c --show-progress --no-check-certificate https://ardownload.adobe.com/pub/adobe/reader/unix/9.x/9.5.3/enu/AdbeRdr9.5.3-1_i386linux_enu.deb -P $DIR
echo
su root -c "
apt-get install gtk2-engines-murrine:i386 libcanberra-gtk-module:i386 libatk-adaptor:i386 libgail-common:i386 -y
gdebi Adbe*.deb
"
rm $DIR/Adbe*.deb
sleep 5
#exit
