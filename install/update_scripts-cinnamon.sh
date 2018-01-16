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

cd cinnamon-scripts/
chmod 755 *.sh
echo "Scripts configurado para execucao...[OK]"
#exit
