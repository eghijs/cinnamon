#!/bin/bash
#
PATH=/sbin:/usr/sbin:/usr/local/sbin:/bin:/usr/bin:/usr/local/bin
export PATH
#####################################
###   INSTALANDO NOVOS PACOTES    ###
#####################################

# Instalação de pacotes principais
echo
su root -c "
echo
apt-get update -y
apt-get install nomacs -y
apt-get install openssh-server -y
apt-get install remmina -y
apt-get install remmina-plugin-rdp -y
apt-get install remmina-plugin-vnc -y
apt-get install remmina-plugin-xdmcp -y
apt-get install p7zip-full -y
apt-get install chromium-browser -y
apt-get install chromium-browser-l10n -y
apt-get install vlc -y
apt-get install vim -y
apt-get install deborphan -y
apt-get install rdesktop -y
apt-get install git -y
apt-get install localepurge -y # Removendo pacotes de idiomas

# Instalação de pacote extras
#apt-get install devilspie -y
#apt-get install gdevilspie -y
#apt-get install arandr -y
apt-get install putty -y
apt-get install nmap -y

# Instalação de pacotes para virtualização
#apt-get install virtualbox-qt -y
#apt-get install virtualbox-ext-pack -y

# Instalação de pacotes para gerenciamento de monitores duplo
#apt-get install wmctrl -y
#apt-get install xdotool -y
if dpkg -l | grep x11-utils
then
	echo "x11-utils Instalado."
else
	echo "x11-utils nao esta instalado."
	sleep 4
	echo "Instalando o pacote x11-utils."
	apt-get install x11-utils -y
fi
"
echo 
echo "Pacotes instalados via apt-get..."
sleep 5
#exit
