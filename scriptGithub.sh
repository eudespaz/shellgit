#!/bin/bash
#Autor: Eudes Paz (eudespaz@live.com)
#SCRIPT PARA ADICIONAR OS PROJETOS PARA O GITHUB
# 31/07/2019 hora 17:21 

clear 

menu() {
echo "|------- SISTEMA INICIADO --------|"
echo "(1) INVIAR UM PROJETO NOVO"
echo "(2) ATUALIZAR O PROJETO"
echo "(3) SAIR DO SCRIPT"
echo "|---------------------------------|"

read perguntar

case $perguntar in
	1) projetoNovo ;;
	2) atualizarProjeto ;;
	3) exit; echo "Até Logo" ;;
	*) echo "COMANDO INVALIDO, DIGITE NOVAMENTE"; clear ; menu;

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

echo "Listar histórico de commits:" 
git log --oneline

echo "Salvar projeto atualizado no seu Github (push)"
git push

 echo "Voltando para o menu principal"; clear ; menu;
}

menu
