#!/bin/bash
#
PATH=/sbin:/usr/sbin:/usr/local/sbin:/bin:/usr/bin:/usr/local/bin
export PATH
#####################################
### REMOVER PACOTES DESNECESSARIO ###
#####################################
echo
su root -c "
echo
apt-get --purge remove brasero -y
apt-get --purge remove gimp gimp-* libgimp2.0 -y
apt-get --purge remove hexchat -y
apt-get --purge remove pidgin -y
apt-get --purge remove pix -y
apt-get --purge remove thunderbind -y
apt-get --purge remove transmission-gtk -y
apt-get --purge remove xplayer -y
apt-get --purge remove xviewer -y
apt-get --purge remove rhythmbox -y
apt autoremove -y
#deborphan | pacote apt-get -y remove --purge
"
#clear
echo
echo "Listas de aplicativos removidos...[ OK ]"
echo
sleep 5
#exit

# Desativar sessao convidado
# echo "allow-guest=false" > /etc/lightdm/lightdm.conf

# Criando usuarios padrao
# adduser -c "Usuário" usuario