#! /bin/sh
# Attempt at making a kind of webarchive with change detection using httrack

WEBSITE_URL=$1;
WEBSITE_DOWNLOAD_DIR=$(echo $1 | sed -E "s/^\s*.*:\/\///g" | sed -E "s/\/$//g");
WEBSITE_SAVING_DIR=$PWD;
echo $WEBSITE_URL;
echo $WEBSITE_DOWNLOAD_DIR;
#echo $(echo(ls $WEBSITE_SAVING_DIR | grep -qs $WEBSITE_DOWNLOAD_DIR));
if(find $WEBSITE_SAVING_DIR -name $WEBSITE_DOWNLOAD_DIR -quit)
then
	echo "eita";
fi
#if(ls $WEBSITE_SAVING_DIR)
##httrack -A0 -c100 -s0 -F "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.3" $1

#Removes the protocol from the url
#sed -E "s/^\s*.*:\/\///g"
#Removes the trailing slash from the url
#sed -E "s/\/$//g"
