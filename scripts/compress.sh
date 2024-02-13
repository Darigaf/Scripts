#! /bin/sh
#Script that iterates between all files in a folder and compresses it, making it about half the size. The compression is visualy lossless
if [ -z "$1" ];
then
	printf "This script iterates between all files, with the selected extension, of the current folder and compresses it, making it visually lossless"
	printf "Usage: watermark_date.sh VIDEO_FILE_EXTENSION\n";
	echo "You must provide what is the extension of the files you want to compress";
	exit 5;
fi
mkdir compressed;
for i in *"$1";
do 
	ffmpeg -i "$i" -vcodec libx265 -crf 18 -tag:v hvc1 -preset veryslow -c:a copy ./compressed/"$i";
done



