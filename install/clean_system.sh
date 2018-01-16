#!/bin/bash
####################################################################################
###
####################################################################################

# Removendo bibliotecas e dependencias
deborphan | xargs apt-get -y remove --purge
deborphan --guess-data | xargs apt-get -y remove --purge

# Limpeza do sistema apos instalacao
apt autoremove -y
apt autoclean -y
apt clean -y

# Remover kernel antigo
#apt purge $(dpkg -l 'linux-*' | sed '/^ii/!d;/'"$(uname -r | sed "s/\(.*\)-\([^0-9]\+\)/\1/")"'/d;s/^[^ ]* [^ ]* \([^ ]*\).*/\1/;/[0-9]/!d' | head -n -1)
#apt autoremove && sudo update-grub

