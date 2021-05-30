#!/bin/sh
# conky slideshow by G. 2010
dir="/home/luna/.config/conky/slideshowimages" # Directory
geometry="375x375" # Max Geometry of the pictures in the slideshow
file=`ls -1 $dir/ | sort --random-sort | head -1`
mogrify -format png -resize $geometry -write $dir/model.png $dir/$file
#echo "The randomly-selected file is: $file"
exit