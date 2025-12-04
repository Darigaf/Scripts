#! /bin/sh
#Script that iterates for all photos of a folder and counts and plots the most used focals lengths and most used focal lengths equivalent in 35 mm. 
find ./ -name "*CR3" -exec sh -c "exiftool {} | grep 'Focal.*35\ mm' exif.txt | sed -e 's/.*equivalent://g' | sed -e 's/\ mm)//g' | sort -V >> focals.txt" \;

