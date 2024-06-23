#! /bin/sh
#Script that creates folders for photo editing batch
if [ -z "$1" ];
then
	printf "This script counts the number of files in the current folder and separates all photos in batches based on batch size\n"
	printf "Usage: create_photos_batch_folder.sh BATCH_SIZE\n";
	printf "You must provide what is the number of photos you want per batch folder\n";
	exit 5;
fi
FILE_COUNT=$(ls -1 ./ | wc -l);
BATCH_NUMBER=$(expr "$FILE_COUNT" \/ "$1" );
for batch in $(seq 1 "$BATCH_NUMBER");
do 
	mkdir ./batch_"$batch";
	for PHOTO in *JPG;
	do
		mv "$PHOTO" ./batch_"$batch";
	done
done
cd - || exit;
