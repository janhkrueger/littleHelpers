# Moving 10.000 files of the current directory to another.
# can easily adapted so only move json files for example
# just change the for loop to:
# for file in $(ls -p *.json | grep -v / | tail -10000)
# JHK, 11.20.2016


#/bin/sh
for file in $(ls -p | grep -v / | tail -10000)
do
mv $file /path/to/
done
