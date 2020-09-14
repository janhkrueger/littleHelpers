find . -name "*.webp" -print0 | parallel -0 dwebp {} -o {.}.png
rm *.webp
find . -name "*.png" -exec mogrify -format jpg {} \;
rm *.png