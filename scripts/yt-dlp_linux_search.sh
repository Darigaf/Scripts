#! /bin/sh
#Script that makes it faster to download youtube music using only its name 
yt-dlp_linux -x "ytsearch:$1"
