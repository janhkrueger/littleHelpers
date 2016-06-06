#!/bin/bash

# mass copy a file to several subfolders
# the folder in ${i} will be like
#   /path/to/ with trailing /
# With grep I filter out unwanted folders
#
# If the file exists: overwrite!

for i in $(ls -d [SEARCHPATH]/*/ | grep -v -e "RemoteSystemsTempFiles" ); do 
  yes | cp -f SOURCEPATH/FILENAME.FOO ${i}BAR
done
