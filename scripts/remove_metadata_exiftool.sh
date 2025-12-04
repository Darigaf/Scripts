#! /bin/sh
#Script that iterates between all files of the specified format in a folder and removes all metadata except Date Taken and Rotation
remove_metadata() {
	printf"Removing Metadata\n";
	for i in *"$1";
	do 
			exiftool -all:all= -tagsFromFile @ -exif:Orientation -exif:AllDates -overwrite_original_in_place "$i"
	done
}

if [ -z "$1" ];
then
	printf "This script iterates between all files, with the selected extension, of the current folder and removes all metadata except Date Taken and Rotation\n";
	printf "Usage: remove_metadata_exiftool.sh FILE_EXTENSION \n";
	printf "You must provide what is the extension of the files you want to remove metadata\n";
	exit 5;
fi

printf"WARNING, THIS SCRIPT WILL REMOVE ALL METADATA FROM YOUR FILES\n";
printf"#### THIS PROCESS IS NOT REVERSIBLE ####\n";
printf"Continue?(N/y)\n";
read -r REPLY
case $REPLY in
	[yY]) remove_metadata;;
	[nN]) printf"Exiting";
		exit;;
	*) printf"Invalid Response\n";;
esac
