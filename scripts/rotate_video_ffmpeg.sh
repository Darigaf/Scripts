#! /bin/sh
#Script that iterates between all files in a folder and rotates it
if [ -z "$1" ];
then
	printf "This script iterates between all files, with the selected extension, of the current folder and rotates it\n"
	printf "Usage: rotate_video_ffmpeg.sh VIDEO_FILE_EXTENSION DEGREES_OF_ROTATION\n";
	echo "You must provide what is the extension of the files you want to rotate\n";
	exit 5;
fi
mkdir rotated;
for i in *"$1";
do 
		ffmpeg -i "$i" -map_metadata 0 -metadata:s:v rotate="$2" -codec copy ./rotated/"$i";
done

