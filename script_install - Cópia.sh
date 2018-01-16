#!/bin/bash
#
#####################################
### REMOVER PACOTES DESNECESSARIO ###
#####################################
#
apt-get --purge remove brasero -y
apt-get --purge remove gimp -y
apt-get --purge remove hexchat -y
apt-get --purge remove pidgin -y
apt-get --purge remove pix -y
apt-get --purge remove thunderbind -y
apt-get --purge remove transmission-gtk -y
apt-get --purge remove xplayer -y
apt-get --purge remove xviewer -y
clear
echo "Aplicativos removidos..."
#
#####################################
###   INSTALANDO NOVOS PACOTES    ###
#####################################
#
apt-get update -y
apt-get install nomacs -y
apt-get install openssh-server -y
apt-get install putty -y
apt-get install nmap -y
apt-get install remmina -y
apt-get install p7zip-full -y
apt-get install chromium-browser -y
apt-get install vlc -y
apt-get install vim -y
clear
echo "Pacotes instalados via apt-get..."
#
#####################################
###  BAIXANDO PACOTES DE SCRIPTS  ###
#####################################
#
cd Downloads
wget https://github.com/eghijs/cinnamon/archive/master.zip
unzip master.zip
mv cinnamon-master/ cinnamon-scripts/
rm master.zip
echo "Scripts baixados com sucesso...[OK]"
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
#
#####################################
###   INSTALANDO O PACOTE ADOBE   ###
#####################################
#
echo "Adcionando repositorio adobe reader."
add-apt-repository "deb http://archive.canonical.com/ precise partner"
apt-get update -y
clear
echo "Repositorio atualizado com sucesso...[OK]"
apt-get install adobereader-enu -y
echo "Adobe Reader instalado com sucesso...[OK]"
# Removendo repositorio Adobe Reader
add-apt-repository -r "deb http://archive.canonical.com/ precise partner"
echo "Repositorio Adobe removido...[OK]"
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
 
#####################################################################################
###
#####################################################################################
# Criando agendamento no cron (Baixar novas atualizacoes do Github).
cat << EOF > /etc/crontab
# Agendamento - Atualizacoes dos scripts locais
*/15 * * * * root /home/administrador/Downloads/cinnamon-scripts/scripts_upgrade.sh

# Agendamento - Perfil local
*/30 * * * * root /home/administrador/Downloads/cinnamon-scripts/scripts_perfil.sh
EOF
cd /home/administrador/Downloads/cinnamon-scripts/
chmod 755 *.sh
cd $HOME

####################################################################################
###
####################################################################################
# Limpeza do sistema apos instalacao
apt autoremove -y

# Substituindo o editor padrão pelo vim.basic
echo "Substituindo o editor padrão pelo vim.basic"
update-alternatives --config editor

# Ativando senha do usuario root
echo "Definindo senha do usuario root."
sudo passwd root

# Reiniciando sistema
echo "Reiniciando o sistema operacional."
#shutdown -r now
