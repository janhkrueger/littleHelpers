#/bin/sh
# Moves all files in a directory when tolls like ls or mv normally say "too many arguments"
# JHK, 2017-06-06

# Generate filelist
find . -maxdepth 1 -type f -name "*.json" > /tmp/movetmplist

# Move files in filelist
xargs mv -t /targetdirectory/ < /tmp/movetmplist

# remove filelist
rm /tmp/movetmplist
