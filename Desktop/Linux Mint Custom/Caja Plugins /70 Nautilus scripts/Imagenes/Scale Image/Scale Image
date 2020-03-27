#!/bin/bash
title="Scale image"
scale="Size to scale to <length>x<hight>"

case $LANG in
	sv* )
		title="Skala bild"
		scale="Storlek att skala till <längd>x<höjd>";;
esac

imgsize=`gdialog --title "$title" --inputbox "$scale" 200 100 2>&1`

while [ $# -gt 0 ]; do
	picture=$1
	/usr/bin/convert -scale $imgsize "$picture" "$imgsize-$picture"
	shift
done
