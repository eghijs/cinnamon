#!/bin/bash
#
#####################################
###   INSTALANDO O PACOTE ADOBE   ###
#####################################
#
echo
su root -c "
echo
echo "Adcionando repositorio do adobe reader."
add-apt-repository "deb http://archive.canonical.com/ precise partner"
apt-get update -y
clear
echo "Repositorio atualizado com sucesso...[ OK ]"
apt-get install adobereader-enu -y
echo "Adobe Reader instalado com sucesso...[ OK ]"
# Removendo repositorio Adobe Reader
add-apt-repository -r "deb http://archive.canonical.com/ precise partner"
echo "Repositorio Adobe removido...[ OK ]"
"
sleep 5
#exit
