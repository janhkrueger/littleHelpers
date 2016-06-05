#/bin/bash
# Deletes empty folders
#
# usage: deleteemptyfolders.sh NAMEOFFOLDER

DIR="$1"
 [ -d $DIR ] && [ $(ls -l $DIR | wc -l) -eq 1  ] && rmdir $DIR ||  :
