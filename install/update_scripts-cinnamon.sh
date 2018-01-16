#!/bin/bash
#####################################
###  BAIXANDO PACOTES DE SCRIPTS  ###
#####################################
PATH=/home/administrador/Downloads
cd $PATH
wget https://github.com/eghijs/cinnamon/archive/master.zip
unzip master.zip
mv $PATH/cinnamon-master/ $PATH/cinnamon-scripts/
rm master.zip
echo "Scripts baixado com sucesso...[OK]"

find . -regextype posix-egrep -iregex '.*\.(sh)' -exec chmod 755 {} \;
echo "Scripts configurado para execucao...[OK]"
#exit
