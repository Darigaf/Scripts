#! /bin/sh
#Script that iterates between all files in a folder and compresses it, making it about half the size. The compression is visualy lossless
FORMAT="$1"
PRESET="$2"
if [ -z "$FORMAT" ];
then
	printf "This script iterates between all files, with the selected extension, of the current folder and compresses it, making it visually lossless\n"
	printf "Syntax: watermark_date.sh VIDEO_FILE_EXTENSION PRESET\n";
	printf "You must provide what is the extension of the files you want to compress\n";
	exit 5;
fi
if [ -z "$PRESET" ];
then
	printf "This script iterates between all files, with the selected extension, of the current folder and compresses it, making it visually lossless\n"
	printf "Syntax: watermark_date.sh VIDEO_FILE_EXTENSION PRESET\n";
	printf "You must provide what is the preset you want to compress the files in\n";
	printf "The preset only affects speed and video size, it does not affect video quality\n";
	printf "Valid presets are: ultrafast, superfast, veryfast, faster, fast, medium, slow, slower, veryslow\n";
	exit 5;
fi

mkdir compressed;
for FILES in *"$FORMAT";
do 
	ffmpeg -i "$FILES" -vcodec libx265 -crf 18 -tag:v hvc1 -preset "$PRESET" -c:a copy ./compressed/"$FILES";
done



