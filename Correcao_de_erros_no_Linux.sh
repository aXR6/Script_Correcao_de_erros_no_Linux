#!/bin/bash
PS3="ToolX_Correcao>"

##ToolX_Correcao##
##################
##START ToolX_Correcao##
ToolX_Correcao()
{
ToolX_Correcao=("Corrigindo erros de instalação" "Corrigindo erros de bloqueio no cache do APT" "Verificando e resolvendo erros MergeList" "Atualizar lista de repositórios" "Atualizar o Sistema" "Sair")
select opt in "${ToolX_Correcao[@]}"; do
  if [ "$opt" = "Sair" ]; then
  echo "Saindo..." && sleep 1 && clear
  exit 0
    elif [ "$opt" = "Corrigindo erros de instalação" ]; then
       correcao
    elif [ "$opt" = "Corrigindo erros de bloqueio no cache do APT" ]; then
       bloqueioapt
    elif [ "$opt" = "Verificando e resolvendo erros MergeList" ]; then
       mergelist
    elif [ "$opt" = "Atualizar lista de repositórios" ]; then
       aptupdate
    elif [ "$opt" = "Atualizar o Sistema" ]; then
       distupgrade
  else
  echo "Opção inválida!"
  fi
done
}
##END ToolX_Correcao##
################
##/ToolX_Correcao##

correcao()
{
echo "Aguarde... corrigindo possiveis erros de instalação..."
apt -f install && sudo dpkg --configure -a
}

bloqueioapt()
{
echo "Aguarde... corrigindo bloqueios no cache do APT..."
fuser -cuk /var/lib/dpkg/lock
rm -f /var/lib/dpkg/lock
fuser -cuk /var/cache/apt/archives/lock
}

mergelist()
{
echo "Aguarde... corrigindo erros MergeList..."
rm -f /var/cache/apt/archives/lock
sudo rm /var/lib/apt/lists/* -vf
}

aptupdate()
{
echo "Atualizando listas de repositórios"
apt update
}

distupgrade()
{
echo "Aguarde... atualizando sistema e removendo aplicações desnecessarias do SO"
apt dist-upgrade -y
apt autoremove -y
apt autoclean
apt clean
}

##Bem Vindo##
#########################
##Inicio Bem Vindo##
clear && echo ""
echo "'########::'#######:::'#######::'##:::::::'##::::'##:::::::::::::::::::'###::::'##::::'##:'########:::'#######::"
echo "... ##..::'##.... ##:'##.... ##: ##:::::::. ##::'##:::::::::::::::::::'## ##:::. ##::'##:: ##.... ##:'##.... ##:"
echo "::: ##:::: ##:::: ##: ##:::: ##: ##::::::::. ##'##:::::::::::::::::::'##:. ##:::. ##'##::: ##:::: ##: ##::::..::"
echo "::: ##:::: ##:::: ##: ##:::: ##: ##:::::::::. ###:::::::'#######::::'##:::. ##:::. ###:::: ########:: ########::"
echo "::: ##:::: ##:::: ##: ##:::: ##: ##::::::::: ## ##::::::........:::: #########::: ## ##::: ##.. ##::: ##.... ##:"
echo "::: ##:::: ##:::: ##: ##:::: ##: ##:::::::: ##:. ##::::::::::::::::: ##.... ##:: ##:. ##:: ##::. ##:: ##:::: ##:"
echo "::: ##::::. #######::. #######:: ########: ##:::. ##:::::::::::::::: ##:::: ##: ##:::. ##: ##:::. ##:. #######::"
echo ":::..::::::.......::::.......:::........::..:::::..:::::::::::::::::..:::::..::..:::::..::..:::::..:::.......:::"
echo ""
echo -e "\033[1;32mSeja bem vindo ao ToolX_Correcao!\033[0m"
echo -e "\033[1;32mLinkedin:\033[0m https://www.linkedin.com/in/thalles-canela/"
echo -e "\033[1;32mYouTube: \033[0m https://www.youtube.com/c/aXR6CyberSecurity"
echo -e "\033[1;32mFacebook:\033[0m https://www.facebook.com/axr6PenTest"
echo -e "\033[1;32mGithub:  \033[0m https://github.com/ThallesCanela"
echo -e "\033[1;32mGithub:  \033[0m https://github.com/aXR6"
echo -e "\033[1;32mTwitter: \033[0m https://twitter.com/Axr6S"
echo -e "\033[1;32mPadim:   \033[0m https://www.padrim.com.br/aXR6CyberSecurity"
echo -e "\033[1;31m:=> Não seja sujo! Se achou de graça, distribua de graça repassando os devidos créditos! \033[0m"
echo -e "\033[1;31m:=> Usuário ROOT necessário!! \033[0m"
echo ""
ToolX_Correcao
##Fim Bem Vindo##
#######################
##/Bem Vindo##
