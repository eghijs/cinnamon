#!/bin/bash
#####################################
###  BAIXANDO PACOTES DE SCRIPTS  ###
#####################################

cd /home/administrador/Downloads
wget https://github.com/eghijs/cinnamon/archive/master.zip
unzip master.zip
mv cinnamon-master/ cinnamon-scripts/
rm master.zip
echo "Scripts baixado com sucesso...[OK]"

find . -regextype posix-egrep -iregex '.*\.(sh)' -exec chmod 755 {} \;
echo "Scripts configurado para execucao...[OK]"
#exit
