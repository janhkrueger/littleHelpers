#!/bin/sh
#
# Cuts with twarc collected twitter data in json files 
# into single files, then renaming the files into the schema
# [tweetid].txt
#
# JHK, 14.10.2016
#
# usage: twarcCutter.sh twarcfile.json
#

filename=$1
split --lines=1 --additional-suffix=.txt $filename Tweets_

for file in $(ls -p T*.txt | grep -v /)
do
  # Why is jq delivering with filer .td the  wrong id?
  idname=$(jq .id_str $file)
  idname=$(echo $idname | /bin/sed 's/"//g')
  mv $file $idname.txt
done
