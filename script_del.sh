#!/bin/bash
PATH=/sbin:/usr/sbin:/usr/local/sbin:/bin:/usr/bin:/usr/local/bin
export PATH

#find -mtime +30 => quando o arquivo foi modificado, em dias.
#find -ctime +30 => quando o arquivo foi criado, em dias.
#find -atime +20 => quando o arquivo foi acessado, em dia.

AUD=".*\.(3gp|aa|aac|aax|act|aiff|amr|ape|au|awb|dct|dss|dvf|flac|gsm|iklax|ivs|m4a|m4b|m4p|mmf|mp3|mpc|msv|ogg|oga|mogg|opus|ra|rm|raw|sln|tta|vox|wav|wma|wv|webm|svx)"
VID=".*\.(webm|mkv|flv|vob|ogv|ogg|drc|gifv|mng|avi|mov|qt|wmv|yuv|rm|rmvb|asf|amv|mp4|m4p|m4v|mpg|mp2|mpeg|mpe|mpv|mpg|mpeg|m2v|m4v|svi|3gp|3g2|mxf|roq|nsv|flv|f4v|f4p|f4a|f4b)"
FIL=".*\.(bak|tmp)"

find $HOME/ -regextype posix-egrep -iregex '$FIL' -delete
echo "Todos arquivos lixo deletado...[OK]"

find $HOME/ -regextype posix-egrep -iregex '$AUD' -delete
echo "Todos arquivos de audio deletado...[OK]"

find $HOME/ -regextype posix-egrep -iregex '$VID' -delete
echo "Todos arquivos de video deletado...[OK]" 

# find . -regextype posix-egrep -iregex '.*\.(jpg|jpeg|gif|png)' -exec bash -c 'cwebp -q 85 "$0" -o "$0".webp' {} \;

# .bash_logout
#/etc/profile
#trap 'rm -f $HOME/.dotfile1 $HOME/anotherfile; exit 0' 0
#find $HOME/.



#cat > ~/.bash_logout << "EOF"
# ~/.bash_logout: executed by bash(1) when login shell exits.

# when leaving the console clear the screen to increase privacy

#if [ "$SHLVL" = 1 ]; then
#    [ -x /usr/bin/clear_console ] && /usr/bin/clear_console -q
#fi

#EOF

#!/bin/bash
#Exemplo de script para logout "logout_script"
#Limpa todos os arquivos temporários do usuário</pre>
#for i in *~ *.bak *.tmp; do
#find $HOME -iname "$i" -exec rm -f {} \;
#done 

#!/bin/bash
# .bash_profile
 
# Get the aliases and functions
#if [ -f ~/.bashrc ]; then
# . ~/.bashrc
#fi
 
# Executa scripts customizados
 
#source login_script
 
## User specific environment and startup programs
 
#PATH=$PATH:$HOME/bin
 
#export PATH