#!/bin/bash
cp featured.png featuredOld.png
# Get trim box w, h, x, y
IFS=" x+" read w h x y < <(convert -fuzz 10% featured.png -format "%@" info:)

# Get longest side
longest=$w
[ $h -gt $longest ] && longest=$h

# Increase by 20%
longest=$(echo "scale=0;$longest*1.0/1" | bc)
echo $longest

convert -fuzz 10% featured.png -trim -background white -gravity center -extent ${longest}x${longest} featured.png
