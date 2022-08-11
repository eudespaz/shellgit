#!/bin/bash
#Autor: Eudes Paz (eudespaz@live.com)
#SCRIPT PARA ADICIONAR OS PROJETOS PARA O GITHUB
#31/07/2019 17:21H
#ATUALIZACAO EM 11/08/2022

clear 

menu() {
echo "|------- SISTEMA INICIADO --------|"
echo "(1) ENVIAR UM PROJETO NOVO"
echo "(2) ATUALIZAR O PROJETO"
echo "(3) CONFIGURAR O GITHUB"
echo "(0) SAIR DO SISTEMA"
echo "|---------------------------------|"

date
read -p "Digite a opcao deseja: " perguntar

case $perguntar in
	1) projetoNovo ;;
	2) atualizarProjeto ;;
	3) configgit ;;
	0) exit; echo "Ate Logo" ;;
	*) read -p "COMANDO INVALIDO, DIGITE NOVAMENTE "; clear ; menu;

esac

}
projetoNovo(){ 

echo "Inicia um novo repositorio local na pasta projeto"

git init

echo "Associa seu repositorio local ao repositorio remoto"

read -p "Digite o endereco: " https

git remote add origin  $https

echo "Atualiza seu repositÃ³rio local em relaÃ§Ã£o ao repositÃ³rio remoto"

git pull origin master

echo "Adiciona todos arquivos ao stage"

git add .

echo "Salva uma nova versÃ£o do projeto"

git commit -m "Projeto criado"

echo "Envia o repositÃ³rio local para o repositÃ³rio remoto"

git push -u origin master

 echo "Voltando para o menu principal"; clear ; menu;
}


atualizarProjeto(){

echo "Commitar as mudanÃ§as feitas no projeto"
echo "Verificar arquivos:"
git status

echo "Realizar o commit:"
git add .

read -p "Digite a mensagem explicativa: " mensagem
git commit -m "$mensagem"

#echo "Listar histÃ³rico de commits:" 
#git log --oneline

echo "Salvar projeto atualizado no seu Github (push)"
git push

 echo "Voltando para o menu principal"; clear ; menu;
}

configgit(){

echo "configurando GitHub"

read -p "Digite seu E-mail do Git: " email

git config --global user.email "$email"

echo "$email"

read -p "Digite seu usuario do Git: " user

git config --global user.name "$user"

echo "$user"

echo "Voltando para o menu principal"; clear ; menu;

}
menu
