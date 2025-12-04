#! /bin/sh
SELECTION=$1;
DELAY_TIME=$2;
ffmpeg -i "$SELECTION" -itsoffset "$DELAY_TIME" -i "$SELECTION" -map 0:v -map 1:a -c copy "$SELECTION.tmp.mp4";
mv $SELECTION.tmp.mp4 "$SELECTION";
