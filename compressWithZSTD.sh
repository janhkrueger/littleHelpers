#!/bin/sh
#
# Compress all files inthe folder with zstd
# Using 7 parallel threads and the highest compression ratio
#

JETZT="$(date "+%Y%m%d_%H%M")"
FILENAME=imported_$JETZT

mv imported/ $FILENAME
mkdir imported

tar cf $FILENAME.tar $FILENAME


/usr/local/bin/zstd -T7 --ultra -22 -r $FILENAME.tar

rm $FILENAME.tar
