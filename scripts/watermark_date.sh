#! /bin/sh
#script that watermarks photos using the -DateTimeOriginal exif tag
if [ -z "$1" ];
then
	printf "Usage: watermark_date.sh PHOTO_FILE_EXTENSION\n";
	echo "You must provide what is the extension of the files you want to watermark";
	exit 5;
fi

mkdir watermarked;
for i in *"$1";
do
	#date_taken=$(exiftool "$i" | grep "Date/Time Original" | sed -e "s/Date\/Time Original\s*:\s//g" | sed -e "s/\s.*//g" | sed -e "s/:/\\\:/g");
	date_time_original=$(exiftool "$i" | grep "Date/Time Original" | sed -e "s/Date\/Time Original\s*:\s//g" | sed -e "s/\s.*//g" | sed -e "s/:/\//g");
	formated_date=$(date -d "$date_time_original" +'%d\/%m\/%Y');
	echo $date_time_original;
	echo $;
	#ffmpeg -i "$i" -vf "drawtext=fontfile=/usr/share/fonts/opentype/freefont/FreeSerif.otf: text='$date_taken': x=(w-tw)/2*1.885: y=h-(3.9*lh): fontcolor=yellow: fontsize=130: box=1: boxcolor=DarkGray" ./watermarked/"$i";
	#convert "$i" -gravity SouthEast -stroke '#ebec0a' -pointsize 110 -strokewidth 2 -fill yellow -annotate +180+230 "$date_taken" ./watermarked/"$i"
	#convert "$i" -gravity SouthEast -stroke '#ebec0a' -pointsize 110 -strokewidth 2 -fill yellow -annotate +180+230 "$date_taken" ./watermarked/"$i"
	convert -background '#262525' -fill yellow -pointsize 110 label:"$formated_date" miff:- | composite -gravity SouthEast -geometry +180+230 - "$i" ./watermarked/"$i"

done

