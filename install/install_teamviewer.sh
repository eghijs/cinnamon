#!/bin/bash
#
#####################################
###    INSTALANDO O TEAMVIEWER    ###
#####################################
# wget https://download.teamviewer.com/download/linux/teamviewer_i386.deb
# wget https://download.teamviewer.com/download/linux/teamviewer_amd64.deb
#gdebi teamviewer*.deb -y
#systemctl enable teamviewerd
#systemctl start teamviewerd
#rm teamviewer*.deb
#apt-get -f install -y

echo "Detectando arquitetura do processador."
arg=$(uname -m)

if [ "$arg" == "x86_64" ]; then
    echo "Amd64 Detectado..."
    wget https://download.teamviewer.com/download/linux/teamviewer_amd64.deb
else
    echo "i386 Detectado..."
    wget https://download.teamviewer.com/download/linux/teamviewer_i386.deb
fi
echo "Download concluido com sucesso...[OK]"

gdebi teamviewer*.deb -y

if [[ $? > 0 ]]
then
    echo "comando gdebi failhou."
    #exit
	apt-get -f install -y
else
    echo "The command ran succesfuly, continuing with script."
fi

#systemctl enable teamviewerd
#systemctl start teamviewerd

# Hostname
hostname >> teamviewer.log
cd cinnamon-scripts/
./teamviewer-getid.sh >> teamviewer.log

# Informacoes TeamViewer
teamviewer --daemon enable
teamviewer license accept
teamviewer --passwd illusion
teamviewer --info 

# Envindo e-mail
mail -s "$hostname" eghijs@gmail.com.br < teamviewer.log

# Pendencia

# 2. Adaptar o script para baixar a versao correta para instalar

rm teamviewer*.deb