#!/bin/bash
PATH=/sbin:/usr/sbin:/usr/local/sbin:/bin:/usr/bin:/usr/local/bin
export PATH
#####################################
###  BAIXANDO PACOTES DE SCRIPTS  ###
#####################################
DIR=/home/administrador/Downloads
cd $DIR
pwd
sleep 3
wget --quiet --show-progress https://github.com/eghijs/cinnamon/archive/master.zip
sleep 3
unzip master.zip
sleep 3
mv $DIR/cinnamon-master/ $DIR/cinnamon-scripts/
sleep 3
rm master.zip

echo "Scripts baixado com sucesso...[OK]"

find . -regextype posix-egrep -iregex '.*\.(sh)' -exec chmod 755 {} \;
echo "Scripts configurado para execucao...[OK]"
#exit

##!/bin/bash
#base="https://github.com"
#url=`curl -s --url "https://github.com/Enrico204/Whatsapp-Desktop/releases" | awk -F"\"" ' /amd64/ {print $2}' | head -1`
#wget --quiet --show-progress "$base$url" -O Whatsapp.deb