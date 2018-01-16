#!/bin/bash
PATH=/sbin:/usr/sbin:/usr/local/sbin:/bin:/usr/bin:/usr/local/bin
export PATH
#####################################
###  BAIXANDO PACOTES DE SCRIPTS  ###
#####################################
DIR=/home/$USER/Downloads
cd $DIR
pwd
mkdir cinnamon-scripts
sleep 3
wget -c --quiet --show-progress https://github.com/eghijs/cinnamon/archive/master.zip -P $DIR
sleep 3
unzip master.zip 
sleep 3
cd cinnamon-master/
cp -Rvpa * $DIR/cinnamon-scripts
sleep 3

rm $DIR/master.zip
rm -R $DIR/cinnamon-master/

echo "Scripts baixado com sucesso...[OK]"

find $DIR -regextype posix-egrep -iregex '.*\.(sh)' -exec chmod 755 {} \;
echo "Scripts configurado para execucao...[OK]"
#exit
