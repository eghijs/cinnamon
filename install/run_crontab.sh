#!/bin/bash


 
#####################################################################################
###
#####################################################################################
# Criando agendamento no cron (Baixar novas atualizacoes do Github).
cat << EOF > /etc/crontab
# Agendamento - Atualizacoes dos scripts locais
*/15 * * * * root /home/administrador/Downloads/cinnamon-scripts/install/update_scripts-cinnamon.sh

# Agendamento - Perfil local
*/30 * * * * root /home/administrador/Downloads/cinnamon-scripts/system/scripts_perfil.sh
EOF
