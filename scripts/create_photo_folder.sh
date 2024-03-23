#! /bin/bash
#Script that creates a folder and its subfolders to store photos

FOLDER_NAME="$1";
if [ -z "$FOLDER_NAME" ];
then
	printf "Usage: create_photo_folder.sh FOLDER_NAME\n";
	echo "You must provide the name of the folder you want to create";
	exit 5;
fi

mkdir "$FOLDER_NAME";
cd "$FOLDER_NAME" && mkdir Familia Importantes Amigos Animais Paisagens Natureza Roles Aleatorio Livros Engracados Eu Dia_Dia;

