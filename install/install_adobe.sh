#!/bin/bash
#
PATH=/sbin:/usr/sbin:/usr/local/sbin:/bin:/usr/bin:/usr/local/bin
export PATH
#####################################
###   INSTALANDO O PACOTE ADOBE   ###
#####################################
DIR=/home/$USER/Downloads

wget -c --quiet --show-progress --no-check-certificate https://ardownload.adobe.com/pub/adobe/reader/unix/9.x/9.5.3/enu/AdbeRdr9.5.3-1_i386linux_enu.deb -P $DIR
echo
su root -c "
gdebi Adbe*.deb -y
"
rm $DIR/Adbe*.deb
sleep 5
#exit
