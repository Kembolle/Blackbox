#!/bin/bash
title="Scale image"
scale="Choose which sizes to scale to"
case $LANG in
	sv* )
		title="Skala bild"
		scale="Välj storlekar att skala bilden till";;
esac

imgsize=`gdialog --title "$title" --checklist "$scale" 200 100 6 1600x1200 " " off 1280x1024 " " off 1024x768 " " off 800x600 " " off 640x480 " " off 2>&1`


while [ $# -gt 0 ]; do
	picture=$1
	for i in $imgsize; do
		i=`echo $i | sed 's/"//g'`
		/usr/bin/convert -scale $i "$picture" "$i-$picture"
	done

	shift
done
