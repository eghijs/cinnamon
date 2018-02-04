#!/bin/bash
PATH=/sbin:/usr/sbin:/usr/local/sbin:/bin:/usr/bin:/usr/local/bin
export PATH

###################################################################
###                    DESKTOP - Configuração                   ###
###                  false=desativar true=ativar                ###
###################################################################

# Ocultar todos os ícones do desktop
dconf write /org/mate/desktop/background/show-desktop-icons false 

# Ocultar ícone do computador 
dconf write /org/mate/caja/desktop/computer-icon-visible false 

# Ocultar ícone do diretório do usuário 
dconf write /org/mate/caja/desktop/home-icon-visible false 

# Ocultar ícone da rede 
dconf write /org/mate/caja/desktop/network-icon-visible false 

# Ocultar ícone da lixeira
dconf write /org/mate/caja/desktop/trash-icon-visible false 

# Ocultar volumes montados
dconf write /org/mate/caja/desktop/volumes-visible false 

#To backup:
#
#From a terminal, run:
#
#dconf dump /org/cinnamon/ > backup_of_my_cinnamon_settings
#
#save the backup_of_my_cinnamon_settings file somewhere for later
#
#To reset to defaults:
#
#dconf reset -f /org/cinnamon/
#
#Note, cinnamon may freeze or crash doing this
#
#To restore all your settings:
#
#dconf load /org/cinnamon/ < backup_of_my_cinnamon_settings
#
#Again, cinnamon may freeze crash after this (recommend at least logging out/back in)