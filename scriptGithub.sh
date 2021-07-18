#!/bin/bash
#Autor: Eudes Paz (eudespaz@live.com)
#SCRIPT PARA ADICIONAR OS PROJETOS PARA O GITHUB
#31/07/2019 17:21H
#ATUALIZACAO EM 17/05/2021 22:32H

clear 

menu() {
echo "|------- SISTEMA INICIADO --------|"
echo "(1) ENVIAR UM PROJETO NOVO"
echo "(2) ATUALIZAR O PROJETO"
echo "(3) CONFIGURAR O GITHUB"
echo "(0) SAIR DO SISTEMA"
echo "|---------------------------------|"

date
read -p "Digite a opção deseja: " perguntar

case $perguntar in
	1) projetoNovo ;;
	2) atualizarProjeto ;;
	3) configgit ;;
	0) exit; echo "Até Logo" ;;
	*) read -p "COMANDO INVALIDO, DIGITE NOVAMENTE "; clear ; menu;

esac

}
projetoNovo(){ 

echo "Inicia um novo repositório local na pasta projeto"

git init

echo "Associa seu repositório local ao repositório remoto"

read -p "Digite o endereço: " https

git remote add origin  $https

echo"Atualiza seu repositório local em relação ao repositório remoto"

git pull origin master

echo "Adiciona todos arquivos ao stage"

git add .

echo "Salva uma nova versão do projeto"

git commit -m "Projeto criado"

echo "Envia o repositório local para o repositório remoto"

git push -u origin master

 echo "Voltando para o menu principal"; clear ; menu;
}


atualizarProjeto(){

echo "Commitar as mudanças feitas no projeto"
echo "Verificar arquivos:"
git status

echo "Realizar o commit:"
git add .

read -p "Digite a mensagem explicativa: " mensagem
git commit -m "$mensagem"

#echo "Listar histórico de commits:" 
#git log --oneline

echo "Salvar projeto atualizado no seu Github (push)"
git push

 echo "Voltando para o menu principal"; clear ; menu;
}

configgit(){

echo "configurando usu�rio EUDES"

git config --global user.email "eudespaz@live.com"

git config --global user.name "eudespaz"

echo "Voltando para o menu principal"; clear ; menu;


}
menu
