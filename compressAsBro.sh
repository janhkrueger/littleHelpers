#!/bin/sh
#
# Compress all css files in a folder to brotli
# for other file tpyes, just change 'css' to 
# whatever you like
#
for x in `find . -type f -name '*.css'`; do bro --force --input ${x} --output ${x}.br; done
