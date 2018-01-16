#!/bin/bash

#
#####################################
###  INSTALANDO O PACOTE GITHUB   ###
#####################################
#
echo "Adcionando repositorio githug."
add-apt-repository ppa:git-core/ppa
apt-get update -y
clear
echo "Repositorio atualizado com sucesso...[OK]"
apt-get install git -y
clear
echo "GitHub instalado com sucesso...[OK]"
add-apt-repository -r ppa:git-core/ppa
echo "Repositorio GitHub removido...[OK]"