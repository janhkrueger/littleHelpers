desiredsize=1024
desiredquality=70%

# get folder size beforeTotal 
beforeTotal=$(du -hc $PWD | tail -n 1)

for dir in *; do

cd $dir

echo "Working in folder $PWD"

# get folder size before 
before=$(du -hc $PWD | tail -n 1)

# make all spaces to underscore
echo " > All spaces to underscore..."
find $PWD -depth -name '* *' -execdir bash -c 'mv -- "$1" "${1// /_}"' bash {} \;

# make all file extensions lower case
echo " > All file extensions to lower case..."
rename -f 's/\.([^.]+)$/.\L$1/' *

# Renaming jpeg to jpg
echo " > Renaming JPEG to JPG..."
for file in *.jpeg; do
    mv "$file" "$(basename "$file" .jpeg).jpg" &> /dev/null
done

# convert webp to png
echo " > Converting WebP to PNG..."
var=$(find . -depth -maxdepth 1 -name "*.webp" -print0 | parallel -0 dwebp {} -quiet -o {.}.png)
rm *.webp &> /dev/null

# convert all png to jpg
echo " > Converting PNG to JPG..."
find . -depth -maxdepth 1 -name "*.png"  -exec mogrify -format jpg {} \;
rm *.png &> /dev/null

# Reduce quality of jpg
echo " > Converting to desired quality..."
mogrify -quality $desiredquality *.jpg &> /dev/null

# resize all jpg
echo " > Resizing all images..."
for file in *.jpg; do convert $file -resize $desiredsize\> $file; done

# get folder size after 
after=$(du -hc $PWD | tail -n 1)

echo "Finished."

# print sizes
echo "Size before : $before"
echo "Size after : $after"
echo " "

cd ..

done

# get folder size afterTotal
afterTotal=$(du -hc $PWD | tail -n 1)

# print sizes
echo "Size before : $beforeTotal"
echo "Size after : $afterTotal"

#cd back to where we started
cd $OLDPWD
