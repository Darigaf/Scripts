#! /bin/bash
#Script that creates a appends the current date to a folder
DATE=$(date +%Y_%m_%d);
FOLDER_NAME="$1";
if [ -z "$FOLDER_NAME" ];
then
	printf "Usage: create_dated_folder.sh FOLDER_NAME\n";
	echo "You must provide the name of the folder you want to create";
	exit 5;
fi

mkdir $DATE\_$FOLDER_NAME;

