#!/bin/bash

# Nautilus script: Split files
# Split large file into pieces

# Author: soleilpqd@gmail.com
# License: GNU GPL

# INSTALL:
#	Copy into ~/.gnome2/nautilus-scripts, add executable permission (if needed).
# USAGE:
#	Need remove all existing file parts before splitting (or I will do it).

# OPTION
# Max value of the dialog of parts number
dialogMax=50
# WORDS
title="Split file"
progress_text="Splitting"
error_no_output_file="No file was splitted!"
error_no_intput_file="Please select file(s) to split!"
error_invalid_input="Invalid iput!"
msg_split_base="Split file(s) by:"
base_chunk="chunk (number of parts)"
base_size="size (size of each part)"
msg_num_parts="Select number of parts:"
msg_unit="Select size unit:"
msg_amount="Enter size number"
binary_scale="Binary"
decimal_scale="Decimal"

function removeExisting() {
	existing=$( ls | grep "$1.[0-9][0-9][0-9]" )
	if [ "$existing" != "" ]; then
		for s in $existing; do
			gvfs-trash $s
		done
	fi
}

function fixPartsName() {
	i=0
	while [ -f "$( echo $1.$( printf "%03i" $i ) )" ]; do
		let i++
	done
	while [ $i -ge 0 ]; do
		mv "$( echo $1.$( printf "%03i" $( expr $i - 1 ) ) )" "$( echo $1.$( printf "%03i" $i ) )"
		let i--
	done
}

function doSplit() {
	cnt=0
	for f in $NAUTILUS_SCRIPT_SELECTED_FILE_PATHS; do
		f=$( basename "$f" )
		if [ -f "$f" ]; then
			echo "#$progress_text \"$f\""
			# Remove existing parts
			removeExisting "$f"
			# Do splitting
			if [ $1 -eq 0 ]; then
				# Split by chunk
				split -n $numOfParts -a 3 -d -e -u "$f" "$f."
			else
				# Split by size
				split -b $amount$unit -a 3 -d -e -u "$f" "$f."
			fi
			if [ $? -eq 0 ]; then
				let cnt++
				# Fix parts filename (for compatible with the world)
				fixPartsName "$f"
			fi
		fi
	done
	if [ $cnt -eq 0 ]; then
		zenity --error --title="$title" --text="$error_no_output_file"
	fi
}

####### CHECKING #######

# Check input count
if [ "$NAUTILUS_SCRIPT_SELECTED_FILE_PATHS" == "" ]; then
	zenity --error --title="$title" --text="$error_no_intput_file"
	exit 1e
fi
# Check input type
tmp=$IFS
IFS=$'\n'
cnt=0
for f in $NAUTILUS_SCRIPT_SELECTED_FILE_PATHS; do
	if [ -f "$f" ]; then
		let cnt++
	fi
done
if [ $cnt -eq 0 ]; then
	zenity --error --title="$title" --text="$error_no_intput_file"
	IFS=$tmp
	exit 1
fi

####### SET UP TASK #######

split_base=$( zenity --list --radiolist --title="$title" --text="$msg_split_base" --column="RADIO" --column="CONTENT" --hide-header "" "$base_chunk" "" "$base_size" )
if [ "$split_base" == "$base_chunk" ]; then
	numOfParts=$( zenity --scale --title="$title" --text="$msg_num_parts" --min-value=2 --max-value=$dialogMax --value=2 )
	if [ $? -eq 0 ]; then
		doSplit 0 | zenity --progress --title="$title" --auto-close --no-cancel --pulsate
	fi
elif [ "$split_base" == "$base_size" ]; then
	unit=$( zenity --list --radiolist --title="$title" --text="$msg_unit" --width=310 --height=270 --column="RADIO" --column="CONTENT" --column="DESCRIPTION" --column="AMOUNT" --hide-header "" "" "1 Byte" "" "" "K" "$binary_scale Kylobyte" "2^10 Bytes" "" "M" "$binary_scale Megabyte" "2^20 Bytes" "" "G" "$binary_scale Gigabyte" "2^30 Bytes" "" "KB" "$decimal_scale Kylobyte" "10^3 Bytes" "" "MB" "$decimal_scale Megabyte" "10^6 Bytes" "" "GB" "$decimal_scale Gigabyte" "10^9 Bytes" )
	if [ $? -eq 0 ]; then
		amount=$( zenity --entry --title="$title" --text="$msg_amount ($unit):" )
		while [ $? -eq 0 ]; do
			if [ $amount -gt 0 ]; then
				doSplit 1 | zenity --progress --title="$title" --auto-close --no-cancel --pulsate
				exit 0
			else
				amount=$( zenity --entry --title="$title" --text="$error_invalid_input $msg_amount ($unit):" )
			fi
		done
	fi
fi
IFS=$tmp
