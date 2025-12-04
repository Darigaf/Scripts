#! /bin/sh
#Script that iterates between all videos in a folder and slows it by half
if [ -z "$1" ];
then
	printf "This script iterates between all videos, with the selected extension, of the current folder and slows it by halfe\n"
	printf "Usage: slow_video_ffmpeg.sh VIDEO_FILE_EXTENSION \n";
	echo "You must provide what is the extension of the videos you want to slow\n";
	exit 5;
fi
mkdir slowed;
for i in *"$1";
do 
		ffmpeg -i "$i" -map 0:v -c:v copy -bsf:v h264_mp4toannexb ./"$i".raw.h264
		ffmpeg -fflags +genpts -r 30 -i ./"$i".raw.h264 -c:v copy ./slowed/"$i"_slowed.mp4
		rm ./"$i".raw.h264
done

