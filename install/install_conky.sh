#!/bin/bash

##############################################################################################
###
##############################################################################################
# Instalando pacote conky
apt-get install conky conky-all -y
echo "Pacotes conky e conky-all instalados com sucesso...[OK]"
add-apt-repository "deb http://ppa.launchpad.net/noobslab/noobslab-conky/ubuntu precise main"
echo "Repositorio do pacote hardy-conky instalado...[OK]"
apt-get update -y
clear
apt-get install hardy-conky -y
echo "Pacote hardy-conky instalado com sucesso...[OK]"

if [[ $? > 0 ]]
then
    echo "comando gdebi failhou."
    #exit
	apt-get -f install -y
else
    echo "The command ran succesfuly, continuing with script."
fi

# Removendo repositorio hardy-conky
add-apt-repository -r "deb http://ppa.launchpad.net/noobslab/noobslab-conky/ubuntu precise main"
echo "Repositorio Hardy-conky removido...[OK]"
apt-get update -y
clear

# Configurando autostart conky
echo "Configurando os parametros do conky..."
arquivo=conky.desktop
cd /etc/xdg/autostart
touch $arquivo
chmod 644 $arquivo
chgrp root.root $arquivo

cat << EOF > $arquivo
[Desktop Entry]
Type=Application
Exec=conky -p 15
X-GNOME-Autostart-enabled=true
NoDisplay=false
Hidden=false
Name[pt_BR]=Conky
Comment[pt_BR]=Systema de monitoramento
X-GNOME-Autostart-Delay=0
EOF

cd $HOME
echo "Autostart para Conky foi configurado...[OK]"

# Configurando Thema
cd /etc/conky/
mv conky.conf conky.original
cp /home/administrador/Downloads/cinnamon-scripts/conky/conky.conf ./
cd
echo "Thema do conky configurado...[OK]"