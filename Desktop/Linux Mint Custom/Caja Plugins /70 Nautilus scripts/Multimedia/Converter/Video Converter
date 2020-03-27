#!/bin/bash
####################################################################
# video-convert
# Nautilus Video Convertor script 
# Written by Craig Szymanski, Sept 2005 - http://szone.berlinwall.org
#####################################################################
#Todo:
# -MKV/OGM conversion to MPG.
# -Subtitles
#####################################################################
# Change log...
# 30/Mar/2007 - caplod
# - Added FLV format as output. (This requires a re-compiled ffmpeg binary with libmp3lame support.)
# 17/June/2006 - crmanski
# - Added iPod and PSP format as output. (This requires a re-compiled ffmpeg binary with aac support.)
# - Added WMF detection.
# - More code redudancy cleanup...
# - Added ffmpeg XVID support detection
# 10/June/2006 - crmanski
# - Changed the way .MOV files are detected. AKA... Simplfied it.
# - Code cleanup. Removed the duplicate mime type checking in the while loops, since it is now done in the file type functions.
# 6/May/2006 - crmanski
# - Changed the File type detection to work better with file types that return the same info.
# - Removed the perl code for progress and used --pulsate since it was only showing progress for the first file.
# - Fixed some typos and added some other little things.
# 29/April/2006 - crmanski
# - Changed the XVID option name to MPEG4 and after some quality checking (Audio sync, etc) decided to go with mencoder instead of FFMPEG.
#  - Also, Ubuntu's package is not compiled with xvid support.
# If mencoder was compiled with XVID or H264 support in the Ubuntu binary I would include specific options for those too.
# 9/April/2006
# by Arturo Martinez-Nieves
# video-convert including to mpeg4
# also added handling of .ASF files as input types 
####################################################################
# Requirements: zenity (Comes with gnome 2.4), ffmpeg (apt-get ffmpeg), mencoder-586/mplayer-586
# This script will take multiple video files of the same type (right now: MPG, AVI, MOV) 
# and covert them into either NTSC - dvd, svcd or vcd compliant MPEG files by using
# ffmpeg (http://ffmpeg.sourceforge.net) 
# To make sure all this is installed do this at a terminal...
# (Universe Repositories should be enabled first -https://wiki.ubuntu.com/AddingRepositoriesHowto)
# sudo apt-get install ffmpeg mencoder-586 mplayer-586
####################################################################
# Installation:
# Place the script in the Nautilus scripts folder (/home/YourUserName/.gnome2/nautilus-scripts)
# Make sure the file is executable
# Install ffmpeg and mencoder: sudo apt-get install ffmpeg mencoder-586
# Note: If you want iPod or PSP output you need to either recompile ffmpeg with support for AAC audio or find a .deb 
# file that has this already (search the forums)
# Select some video files. (This works well on the video files my digital camera makes)
# Choose Scripts->video-convert
####################################################################
# Background and Credits:
# I came across the very nicely done audio-convert script in the ubuntu forums
# http://ubuntuforums.org/showthread.php?t=48007
# and thought how nice it would be to not have to open each file I want to convert in avidemux
# manually or by using a script for each file(s) using ffmpeg. So after looking at 
# http://g-scripts.sourceforge.net/ and some of the scripts there:
# http://g-scripts.sourceforge.net/nautilus-scripts/Multimedia/Image/NIS
# http://g-scripts.sourceforge.net/nautilus-scripts/Multimedia/Image/convert_to_jpeg
# I ended up working this out with various bits and pieces of the above mentioned scripts.
# It is not pretty but it works for me.  Have fun!
# ---------------------------------------------------
# License:
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  
# USA
####################################################################

#Check for required software...
ffmpeg_bin=`which ffmpeg | grep -c "ffmpeg"`
ffmpeg_xvid=`ffmpeg -formats | grep -c "EV    xvid"`
ffmpeg_aac=`ffmpeg -formats | grep -c "DEA    aac"`
ffmpeg_mp3=`ffmpeg -formats | grep -c "DEA    mp3"`
mencoder_bin=`which mencoder | grep -c "mencoder"`

# Check for ffmpeg
if [ $ffmpeg_bin -eq "0" ]; then
zenity --error --title="Error - Missing Software" \
 --text="You do not have the ffmpeg package installed
Please install it in order to use this script. 
Make sure that the Universe repositories are enabled and
then type: 'sudo apt-get install ffmpeg' at a terminal."
exit
fi
#Check for mencoder
if [ $mencoder_bin -eq "0" ]; then
zenity --error --title="Error - Missing Software" \
 --text="You do not have the mencoder package installed
Please install it in order to use this script. 
Make sure that the Multiverse repositories are enabled and
then type: 'sudo apt-get install mencoder-586' at a terminal."
exit
fi

#Check for XVID support
# Check ffmpeg
if [ $ffmpeg_xvid -eq "0" ]; then
	echo "XVID support not present in ffmeg"
   else
	xvid_select=`echo 'FALSE XVID XVID'`
	echo "XVID support is present in ffmeg"
fi
# Check for aac (iPod & PSP use this)
if [ $ffmpeg_aac -eq "0" ]; then
	echo "AAC support not present in ffmeg"
   else
	ipod_select=`echo 'FALSE IPOD IPOD'`
	psp_select=`echo 'FALSE PSP PSP'`
	echo "AAC support is present in ffmeg"
fi

#Check for mp3 support
if [ $ffmpeg_mp3 -eq "0" ]; then
	echo "mp3 support not present in ffmeg"
   else
	echo "mp3 support is present in ffmeg"
fi
#Has a file been selected?
if [ $# -eq 0 ]; then
	zenity --error --title="error" --text="You must select at least 1 file to process"
	exit 1
fi

#Input - What Type?
#Detect Mime Type
#This will detect the first file in the bunch and base the encoding on that. Make sure you select the same types.
mime=`file -bi "$1"`
humantype=`file "$1"`
valid_video_type="0"

#Check For ASF
is_asf ()
{
	file -bi "$1" | grep 'application/octet-stream' && echo $1 | grep -i '\.asf$'
}

if (is_asf "$1")
        then
	echo "File is an ASF"
	video_in_type="ASF"
	valid_video_type="1"
	
fi
#Check for AVI
is_avi ()
{
	file -i "$1" | grep 'video/x-msvideo' && echo $1 | grep -i '\.avi$'
}

if (is_avi "$1")
        then
	echo "File is an AVI"
	video_in_type="AVI"
	valid_video_type="1"
	
fi
#Check for QuickTime MOV
is_mov ()
{
	# Simplified this below since there are different things that that file command finds depending in different cameras
	echo $1 | grep -i '\.mov$'
}

if (is_mov "$1")
        then
	echo "File is a MOV"
	video_in_type="MOV"
	valid_video_type="1"
	
fi
#Check for MPG
is_mpg ()
{
	file -b "$1" | grep 'MPEG' && echo $1 | grep -i '\.mpg$'
}

if (is_mpg "$1")
        then
	echo "File is a MPG"
	video_in_type="MPG"
	valid_video_type="1"
	
fi

#Check For MKV
is_mkv ()
{
	file -b "$1" | grep 'RISC' && echo $1 | grep -i '\.mkv$'
}

if (is_mkv "$1")
        then
	echo "File is a MKV"
	video_in_type="MKV"
	valid_video_type="1"
	
fi
#Check For VOB
is_vob ()
{
	file -bi "$1" | grep 'video/mpeg' && echo $1 | grep -i '\.vob$'
}

if (is_vob "$1")
        then
	echo "File is a VOB"
	video_in_type="MPG"
	valid_video_type="1"
	
fi
#Check For WMV
is_wmv ()
{
	file -b "$1" | grep 'Microsoft ASF' && echo $1 | grep -i '\.wmv$'
}

if (is_wmv "$1")
        then
	echo "File is an WMV"
	video_in_type="WMV"
	valid_video_type="1"
	
fi

#Checking...
if [ $valid_video_type -eq "1" ]; then
	valid_video_type="1"
	else
	zenity --error --title="Error" --text="You have not selected a valid Video Type. MimeType= $mime"
	exit
fi

#Output - What kind?
#echo "This Script converts selected AVI, MOVE or MPG files to NTSC-DVD, SVCD or VCD compliant MPG files with ffmpeg"
title="What kind of Video Do you want to convert those $video_in_type files to?"
video_out_type=`zenity  --width="480" --height="380" --title="$title" --list --radiolist --column="" \
	--column="Video Type" --column="Description" \
	TRUE "DVD" "DVD compliant Video MPEG Stream"\
	FALSE "MPEG4" "Create an AVI with MPEG4 video"\
	FALSE "SVCD" "Create a NTSC/PAL SVCD"\
	FALSE "VCD" "Create a NTSC/PAL VCD" \
	FALSE "FLV" "Create a FLASH-Movie" \
	$xvid_select \
	$ipod_select \
	$psp_select \
	| sed 's/ max//g' `

echo "$video_out_type chosen as the output type."

#user must select a target size (Check if they canceled)
if [ ! "$video_out_type" ]; then
	zenity --error --title="Error" --text="You must select a Input Type"
	exit
fi

# If we are making DVD there are a few options...
if [ "$video_out_type" = "DVD" ]; then
	#What Size?
	title="Choose which resolution the video files should be..."
	dvd_res=`zenity --width="480" --height="380" --title="$title" --text="Input format: $humantype" --list --radiolist --column="" --column="Choose Video Resolution" --column "description" \
		TRUE "ntsc-dvd -s 720x480" "Standard NTSC"\
		FALSE "ntsc-dvd -s 720x400 -padtop 40 -padbottom 40" "Standard NTSC - Widescreen" \
		FALSE "ntsc-dvd -s 704x480" "" \
		FALSE "ntsc-dvd -s 704x396 -padtop 42 -padbottom 42" "Standard NTSC - Widescreen" \
		FALSE "ntsc-dvd -s 704x400 -padtop 40 -padbottom 40" "Standard NTSC - Widescreen" \
		FALSE "ntsc-dvd -s 352x480" "4:3 half ntsc" \
		FALSE "ntsc-dvd -s 352x474 -padbottom 6" "4:3 half NTSC, with a little off the bottom" \
		FALSE "ntsc-dvd -s 352x240" "4:3 vcd size" \
		FALSE "ntsc-dvd -s 352x196 -padtop 22 -padbottom 22" "VCD widescreen" \
		FALSE "ntsc-dvd -s 352x192 -padtop 24 -padbottom 24" "VCD widescreen" \
		FALSE "pal-dvd -s 720x576" "4:3 full pal" \
		FALSE "pal-dvd -s 704x576" "" \
		FALSE "pal-dvd -s 352x576" "4:3 half pal" \
		FALSE "pal-dvd -s 352x288" "4:3 vcd size" \
		
		| sed 's/ max//g' `

	#PAL?
	if [ "${dvd_res##pal-dvd}" != "$dvd_res" ]; then
		video_out_type="DVD_PAL"
	fi

	#user must select a target size
	if [ ! "$dvd_res" ]; then
		zenity --error --title="Error" --text="You must select a target resolution."
		exit
	fi
	title="Choose the audio bitrate your video files should have..."
	audio_br=`zenity  --width="480" --height="380" --title="$title" --list --radiolist --column="" \
	--column="Choose Audio Bitrate" \
		FALSE "448" \
		FALSE "356" \
		FALSE "224" \
		FALSE "192" \
		FALSE "160" \
		TRUE "128" | sed 's/ max//g' `
	#user must select an audio bitrate
	if [ ! "$audio_br" ]; then
		zenity --error --title="Error" --text="You must select an Audio bitrate."
		exit
	fi
	title="Choose the audio stream type your video files should have..."
	audio_str=`zenity  --width="480" --height="380" --title="$title" --list --radiolist --column="" --column="Choose Audio Stream Type" TRUE "ac3" FALSE "mp2" | sed 's/ max//g' `
	#user must select an audio bitrate
	if [ ! "$audio_str" ]; then
		zenity --error --title="Error" --text="You must select an Audio stream type."
		exit
	fi
fi

#XVID Options
#This is still in planning...
#Will require recompiling mencoder to support xvid.
#if [ "$video_out_type" = "XVID" ]; then
#	title="How high should the XVID quality be?"
#	mpeg4_quality=`zenity  --width="480" --height="380" --title="$title" --list --radiolist --column="" \
#	--column="Choose Quality of Encoding..." --column="Description" \
#		FALSE "Very_High_Quality" "Best Quality, Long time to encode, about 6fps"\
#		FALSE "High_Quality" "High Quality, about 15fps"\
#		FALSE "Fast_Encode" "Really fast, not as good quality"\
#		TRUE "Three_Pass" "3 Pass VBR Encode, MP3 VBR audio, Excellent Quality"\
#		| sed 's/ max//g' `
#
#fi

#MPEG4 Options
# The first three options are from http://www.mplayerhq.hu/DOCS/HTML-single/en/MPlayer.html#mencoder
# The 3 pass (My Favorite) is from here (http://www.mplayerhq.hu/DOCS/HTML-single/en/MPlayer.html#mencoder) and a few other places.
if [ "$video_out_type" = "MPEG4" ]; then
	title="How high should the MPEG4 quality be?"
	mpeg4_quality=`zenity  --width="480" --height="380" --title="$title" --list --radiolist --column="" \
	--column="Choose Quality of Encoding..." --column="Description" \
		FALSE "Very_High_Quality" "Best Quality, Long time to encode, about 6fps"\
		FALSE "High_Quality" "High Quality, about 15fps"\
		FALSE "Fast_Encode" "Really fast, not as good quality"\
		TRUE "Three_Pass" "3 Pass Encode, MP3 VBR audio, Excellent Quality"\
		| sed 's/ max//g' `
	echo "mpeg4_quality: $mpeg4_quality"
	title="What Resolution should the video be?"
	mpeg4_resolution=`zenity  --width="480" --height="380" --title="$title" --list --radiolist --column="" \
	--column="Choose Video Resolution..." --column="Description" \
		FALSE "720:480" "NTSC DVD size, 720x480"\
		FALSE "720:576" "PAL DVD 720x576"\
		TRUE "640:480" "Standard TV size, 640x480"\
		FALSE "352:576" "352x576 4:3 half pal"\
		FALSE "352:240" "NTSC VCD, 352x240"\
		FALSE "320:240" "NTSC VCD, 320x240"\
		FALSE "352:288" "PAL VCD,352x288"\
		| sed 's/ max//g' `
	title="Choose the Video bitrate your MPEG4 files should have..."
	mpeg4_vid_br=`zenity  --width="480" --height="380" --title="$title" --list --radiolist --column="" \
	--column="Choose Audio Bitrate" \
		FALSE "1500" \
		FALSE "1300" \
		FALSE "1100" \
		TRUE "900" \
		FALSE "700" \
		FALSE "500" | sed 's/ max//g' `
	#user must select a Video bitrate
	if [ ! "$mpeg4_vid_br" ]; then
		zenity --error --title="Error" --text="You must select an Video bitrate. Using the default 900 instead."
		mpeg4_vid_br="900"
	fi

fi
# flash options
if [ "$video_out_type" = "FLV" ]; then

	title="Choose the video bitrate your video files should have..."
	flv_br=`zenity  --width="480" --height="380" --title="$title" --list --radiolist --column="" \
	--column="Choose Video Bitrate bit/s" \
		TRUE "500000" \
		FALSE "300000" \
		FALSE "200000" \
		FALSE "100000" | sed 's/ max//g' `
	title="Choose the video size?"
	flv_size=`zenity  --width="480" --height="380" --title="$title" --list --radiolist --column="" \
	--column="Choose Video Size" \
		FALSE "400x300" \
		TRUE "320x240" \
		FALSE "160x120" | sed 's/ max//g' `
fi

#SVCD Options
if [ "$video_out_type" = "SVCD" ]; then
	title="What type of SVCD are you making?"
	video_out_type=`zenity  --width="480" --height="380" --title="$title" --list --radiolist --column="" \
	--column="NTSC or PAL?" \
		TRUE "SVCD_NTSC" \
		FALSE "SVCD_PAL" \
		| sed 's/ max//g' `
fi

#VCD Options
if [ "$video_out_type" = "VCD" ]; then
	echo "Choose VCD Type"
	title="What type of VCD are you making?"
	video_out_type=`zenity  --width="480" --height="380" --title="$title" --list --radiolist --column="" \
	--column="NTSC or PAL?" \
		TRUE "VCD_NTSC" \
		FALSE "VCD_PAL" \
		| sed 's/ max//g' `
fi

#Video Encoding Functions...
flv_encode ()
{
	ffmpeg -i "$movie" -s $flv_size -b $flv_br -ar 44100 "$flv_file"
}
dvd_encode_ntsc ()
{
	ffmpeg -i "$movie" -target $dvd_res -sameq -r 29.97 -aspect 4:3 -ab $audio_br -ar 48000 -ac 2 -acodec $audio_str -y "$mpg_file"
}
dvd_encode_pal ()
{
	ffmpeg -i "$movie" -target $dvd_res -sameq -r 25 -ab $audio_br -ar 48000 -ac 2 -acodec $audio_str -y "$mpg_file"

}
encode_ipod ()
{
	# This is from the ipodenc script...
	ffmpeg -i "$movie" -f mp4 -vcodec mpeg4 -maxrate 1000 -b 700 -qmin 3 -qmax 5 -bufsize 4096 -g 300 -acodec aac -ab 192 -s 320x240 -aspect 4:3 -y "$movie"_ipod.mp4
	# This is from the ffmpeg faq...
	#ffmpeg -i "$movie" -acodec aac -ab 128 -vcodec mpeg4 -b 1200 -mbd 2 -flags +4mv+trell -aic 2 -cmp 2 -subcmp 2 -s 320x180 -title X -y "$movie".mp4
}	
encode_psp ()
{
	# This is from the ffmpeg faq...
	ffmpeg -i "$movie" -acodec aac -ab 128 -vcodec mpeg4 -b 1200 -ar 24000 -mbd 2 -flags +4mv+trell -aic 2 -cmp 2 -subcmp 2 -s 368x192 -r 30000/1001 -title X -f psp -y "$movie".mp4
}

svcd_encode_ntsc ()
{
	ffmpeg -i "$movie" -target ntsc-svcd -sameq -aspect 4:3 -y "$mpg_file"
}
svcd_encode_pal ()
{
	ffmpeg -i "$movie" -target pal-svcd -sameq -aspect 4:3 -y "$mpg_file"
}
vcd_encode_ntsc ()
{
	ffmpeg -i "$movie" -target ntsc-vcd -sameq -aspect 4:3 -y "$mpg_file"
}
vcd_encode_pal ()
{
	ffmpeg -i "$movie" -target pal-vcd -sameq -aspect 4:3 -y "$mpg_file"
}
mpeg4_encode ()
{
	rm frameno.avi
	rm divx2pass.log
	if [ "$mpeg4_quality" = "Three_Pass" ]; then
		echo "# Converting $movie to MPEG4 \n with 3 pass encode... \n Pass 1 of 3..." 
		mencoder "$movie" -ovc frameno -oac mp3lame -lameopts vbr=3 -o frameno.avi
		echo "# Converting $movie to MPEG4 \n with 3 pass encode... \n Pass 2 of 3..." 
		mencoder "$movie" -oac copy -ovc lavc -lavcopts vcodec=mpeg4:vpass=1:vbitrate=$mpeg4_vid_br -vop scale=$mpeg4_resolution -o "$mpeg4_file"
		echo "# Converting $movie to MPEG4 \n with 3 pass encode... \n Pass 3 of 3..." 
		mencoder "$movie" -oac copy -ovc lavc -lavcopts vcodec=mpeg4:vpass=2:vbitrate=$mpeg4_vid_br -vop scale=$mpeg4_resolution -o "$mpeg4_file"
	fi
	if [ "$mpeg4_quality" = "Very_High_Quality" ]; then
		echo "# Converting $movie to MPEG4 \n Using $mpeg4_quality setting..."
		mencoder "$movie" -ovc lavc -lavcopts vcodec=mpeg4:vbitrate=$mpeg4_vid_br:mbd=2:mv0:trell:v4mv:cbp:last_pred=3:predia=2:dia=2:vmax_b_frames=2:vb_strategy=1:precmp=2:cmp=2:subcmp=2:preme=2:qns=2 -vop scale=$mpeg4_resolution -oac mp3lame -lameopts vbr=3 -o "$mpeg4_file"
	fi
	if [ "$mpeg4_quality" = "High_Quality" ]; then
		echo "# Converting $movie to MPEG4 \n Using $mpeg4_quality setting..."
		mencoder "$movie" -ovc lavc -lavcopts vcodec=mpeg4:vbitrate=$mpeg4_vid_br:mbd=2:trell:v4mv:last_pred=2:dia=-1:vmax_b_frames=2:vb_strategy=1:cmp=3:subcmp=3:precmp=0:vqcomp=0.6:turbo -vop scale=$mpeg4_resolution -oac mp3lame -lameopts vbr=3 -o "$mpeg4_file"
	fi
	if [ "$mpeg4_quality" = "Fast_Encode" ]; then
		echo "# Converting $movie to MPEG4 \n Using $mpeg4_quality setting..."
		mencoder "$movie" -ovc lavc -lavcopts vcodec=mpeg4:vbitrate=$mpeg4_vid_br:mbd=2:trell:v4mv:turbo -vop scale=$mpeg4_resolution -oac mp3lame -lameopts vbr=3 -o "$mpeg4_file"
	fi
}	
xvid_encode ()
{
ffmpeg -i "$movie" -f avi -vcodec xvid -b 800 -g 300 -bf 2 -acodec mp3 -ab 128 -y "$xvid_file"
}

if [ "$valid_video_type" = "1" ]; then
	Video_Count=1

	while [ $# -gt 0 ]; do
		movie=$1
		flv_file=`echo "$movie" | sed 's/\.\w*$/.flv/'`
		mpg_file=`echo "$movie" | sed 's/\.\w*$/.mpg/'`
		mpeg4_file=`echo "$movie" | sed 's/\.\w*$/_MPEG4.avi/'`
		xvid_file=`echo "$movie" | sed 's/\.\w*$/_XVID.avi/'`
			echo "# Processing $video_in_type Video $movie \n Total: $Video_Count"
			if [ "$video_out_type" = "DVD" ]; then
				dvd_encode_ntsc
			fi
			if [ "$video_out_type" = "FLV" ]; then
				flv_encode
			fi
			if [ "$video_out_type" = "DVD_PAL" ]; then
				dvd_encode_pal
			fi
			if [ "$video_out_type" = "IPOD" ]; then
				encode_ipod
			fi
			if [ "$video_out_type" = "SVCD_NTSC" ]; then
				svcd_encode_ntsc
			fi
			if [ "$video_out_type" = "SVCD_PAL" ]; then
				svcd_encode_pal
			fi
			if [ "$video_out_type" = "VCD_NTSC" ]; then
				vcd_encode_ntsc
			fi
			if [ "$video_out_type" = "VCD_PAL" ]; then
				vcd_encode_pal
			fi
			if [ "$video_out_type" = "MPEG4" ]; then
				mpeg4_encode
			fi
			if [ "$video_out_type" = "PSP" ]; then
				encode_psp
			fi
                        if [ "$video_out_type" = "XVID" ]; then
                                xvid_encode
                        fi
		let Video_Count=Video_Count+1
		shift
	done |
		 zenity --progress --pulsate --auto-close --title="Converting $video_in_type Video Files"  --text="Converting $video_in_type Video Files..."  --percentage=0
fi
