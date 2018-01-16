#!/bin/bash
PATH=/sbin:/usr/sbin:/usr/local/sbin:/bin:/usr/bin:/usr/local/bin
export PATH
#####################################
###  BAIXANDO PACOTES DE SCRIPTS  ###
#####################################
DIR=/home/$USER/Downloads
cd $DIR

if [ -e "$DIR/cinnamon-scripts" ]
then
echo "o diretorio existe"
else
echo "o diretorio não existe vamos criar o diretorio"
mkdir cinnamon-scripts
fi

wget -c --quiet --show-progress https://github.com/eghijs/cinnamon/archive/master.zip -P $DIR
echo
echo "Arquivo baixado com sucesso...[ OK ]"
echo
unzip master.zip > /dev/null 
echo "Arquivo descompactado com sucesso...[ OK ]"
echo
cd cinnamon-master/
cp -Rvpa * $DIR/cinnamon-scripts > /dev/null
echo "Arquivos copiado com sucesso...[ OK ]"
echo
rm $DIR/master.zip
rm -R $DIR/cinnamon-master/
echo "Arquivos removidos com sucesso...[ OK ]"
echo
find $DIR -regextype posix-egrep -iregex '.*\.(sh)' -exec chmod 755 {} \;
echo "Permições dos arquivos alteradas com sucesso...[ OK ]"
#exit
