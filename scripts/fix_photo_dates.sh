#! /bin/sh
#Script that shifts the dates of all photos in the current folder using the correct date of one of the photos

if [ -z "$1" ];
then
	printf "Usage: fix_photo_dates.sh BASE_PHOTO CORRECT_DATE_FOR_BASE_PHOTO\n";
	echo "You must provide the base photo that the others are going to be fixed relative to";
	exit 5;
fi
if [ -z "$2" ];
then
	printf "Usage: fix_photo_dates.sh BASE_PHOTO CORRECT_DATE_FOR_PHOTO\n";
	echo "You must provide what is the correct date for the base photo";
	exit 5;
fi

	date_time_original=$(exiftool "$i" | grep "Date/Time Original" | sed -e "s/Date\/Time Original\s*:\s//g" | sed -e "s/\s.*//g" | sed -e "s/:/\//g");
mkdir fixed;
for i in *"$1";
do
	#date_taken=$(exiftool "$i" | grep "Date/Time Original" | sed -e "s/Date\/Time Original\s*:\s//g" | sed -e "s/\s.*//g" | sed -e "s/:/\\\:/g");
	date_time_original=$(exiftool "$i" | grep "Date/Time Original" | sed -e "s/Date\/Time Original\s*:\s//g" | sed -e "s/\s.*//g" | sed -e "s/:/\//g");
	formated_date=$(date -d "$date_time_original" +'%d\/%m\/%Y');
