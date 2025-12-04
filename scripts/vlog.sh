#! /bin/sh
#Script that records webcam and microphone sound using ffmpeg

DATE=$(date +%Y_%m_%d\ %S_%M_%H);
OUTPUT_NAME="$DATE $2";
VIDEO_DEVICE="$1";
if [ -z "$1" ];
then
        printf "Usage: vlog.sh VIDEO_INPUT OUTPUT_FILENAME\n";
        printf "You must provide the path of the video input and the fikename of the video output\n";
        exit 5;
fi
if [ -z "$2" ];
then
        printf "Usage: vlog.sh VIDEO_INPUT OUTPUT_FILENAME\n";
        printf "You must provide the path of the video input and the fikename of the video output\n";
        exit 5;
fi
ffmpeg -f pulse -ac 2 -i default -f v4l2 -i "$VIDEO_DEVICE" -vcodec libx265 "$OUTPUT_NAME";
