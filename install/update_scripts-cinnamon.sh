#!/bin/bash
#####################################
###  BAIXANDO PACOTES DE SCRIPTS  ###
#####################################

cd $HOME/Downloads
wget https://github.com/eghijs/cinnamon/archive/master.zip
unzip master.zip
mv cinnamon-master/ cinnamon-scripts/
rm master.zip
echo "Scripts baixados com sucesso...[OK]"

find . -regextype posix-egrep -iregex '.*\.(sh)' -exec chmod 755 {} \;
echo "Scripts configurado para execucao...[OK]"
#exit
