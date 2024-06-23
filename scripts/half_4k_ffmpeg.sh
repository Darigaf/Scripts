#! /bin/sh
#Script that iterates between all files in a folder and halfs it's dimensions if it's 4k
if [ -z "$1" ];
then
	printf "This script iterates between all files, with the selected extension, of the current folder and halfs its dimensions"
	printf "Usage: half_4k_ffmpeg.sh VIDEO_FILE_EXTENSION\n";
	echo "You must provide what is the extension of the files you want to half dimensions";
	exit 5;
fi
mkdir compressed;
for i in *"$1";
do 
	width=$(exiftool "$i" | grep "Image\ Size" | sed -e "s/Image.*:\ //g" | sed -e "s/.*x//g")
	height=$(exiftool "$i" | grep "Image\ Size" | sed -e "s/Image.*:\ //g" | sed -e "s/x.*//g")
	if [ "$width" -gt 3500 ] || [ "$height" -gt 3500 ]
	then
		ffmpeg -i "$i" -map_metadata 0 -movflags use_metadata_tags -vf "scale=trunc(iw/4)*2:trunc(ih/4)*2" -preset slow -c:a copy ./compressed/"$i";
	fi
done

