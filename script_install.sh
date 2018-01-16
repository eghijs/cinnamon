#!/bin/bash
DIR=home/administrador/Downloads/cinnamon-scripts/install
PATH=/sbin:/usr/sbin:/usr/local/sbin:/bin:/usr/bin:/usr/local/bin
export PATH
clear

Principal() {
  echo "Script customizacao - Linux Mint Cinnamon"
  echo "------------------------------------------"
  echo " Opções:"
  echo
  echo "  1. Remover lista pre-definida de pacotes."
  echo "  2. Instalar lista pre-definida de pacotes."
  echo "  3. Baixar scripts personalizados para cinnamon."
  echo "  4. Instalar agendamentos personalizados no cron."
  echo "  5. Instalar leitor de PDF (Adobe Reader)."
  echo "  6. Instalar acesso remoto (TeamViewer)." 
  echo "  7. Instalar cliente (GitHub)."
  echo "  8. Ativando widgets no desktop cinnamon." 
  echo "  9. Definir senha do root."
  echo " 10. Definindo o editor padrao."
  echo " 11. Reiniciar sistema."
  echo " 12. Limpeza do sistema."
  echo " 13. Sair"
  echo
  echo -n "Qual a opção desejada: "
  read opcao
  case $opcao in
    1) Remover ;;
    2) Install ;;
    3) Update ;;
    4) Cron ;;
    5) Adobe ;;
    6) TeamViewer ;;
    7) GitHub ;;
    8) Conky ;;
    9) Root ;;
   10) Editor ;;
   11) Restart ;;
   12) Clean ;;
   13) exit ;;
    *) "Opção desconhecida." ; echo ; Principal ;;
  esac
}
 
Remover() {
  /$DIR/remover_apps-system.sh
}
 
Install() {
  /$DIR/install_apps-system.sh
  Principal
}
 
Update() {
  /$DIR/update_scripts-cinnamon.sh
  Principal
}
 
Cron() {
  /$DIR/run_crontab.sh
  Principal
}
 
Adobe() {
  /$DIR/install_adobe.sh
  Principal
}

TeamViewer() {
  /$DIR/install_teamviewer.sh
  Principal
}

GitHub() {
  /$DIR/install_github.sh
  Principal
}

Conky() {
  /$DIR/install_conky.sh
  Principal
}

Root() {
  # Definir a senha do usuario root
echo "Definindo senha do usuario root."
sudo passwd root
  Principal
}

Editor() {
  # Substituindo o editor padrão pelo vim.basic
echo "Substituindo o editor padrão pelo vim.basic"
update-alternatives --config editor
  Principal
}

Restart() {
  # Reiniciando sistema
echo "Reiniciando o sistema operacional."
shutdown -r now
  Principal
}

Clean() {
  /$DIR/clean_system.sh
  Principal
}
Principal
