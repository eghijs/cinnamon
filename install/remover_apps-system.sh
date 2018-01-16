#!/bin/bash
#
PATH=/sbin:/usr/sbin:/usr/local/sbin:/bin:/usr/bin:/usr/local/bin
export PATH
#####################################
### REMOVER PACOTES DESNECESSARIO ###
#####################################
su root -c "
apt-get --purge remove brasero -y
apt-get --purge remove gimp -y
apt-get --purge remove hexchat -y
apt-get --purge remove pidgin -y
apt-get --purge remove pix -y
apt-get --purge remove thunderbind -y
apt-get --purge remove transmission-gtk -y
apt-get --purge remove xplayer -y
apt-get --purge remove xviewer -y
"
#clear
echo "Listas de aplicativos removidos...[ OK ]"
#