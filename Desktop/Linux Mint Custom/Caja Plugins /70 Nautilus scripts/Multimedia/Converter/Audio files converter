#!/bin/bash
#
#
# audio convert 0.3.1
#
# a program to convert wav, ogg, mp3, mpc, flac, ape, aac or wma files into 
# wav, ogg, mp3, mpc, flac, ape or aac files. with an easy to use interface
# it's actually possible to fill in the tags for a few formats, pass them on
# from format to format, and choose the quality of compression.
#
# copyright (C) 2005 linfasoft
#
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
#
# dependencies
#	bash
#       zenity
#	awk
#	file >= 4.16
#       mplayer -- if you want to decode wma files
#       lame
#       vorbis tools
#       id3tag
#       musepack-tools
#	flac
#	mac
#	faac,faad
#
# based on
#	wom_audioconverter, by yekcim <yeknan@yahoo.fr>, http://yeknan.free.fr.
#

set -x

version="0.3.1"
#################################################
#       TRADUCTIONS
        ###### Default = English #####
        title="audio convert "$version""
        pleasesel="please select at least one file."
        noselec=""$title" converts audio files. "$pleasesel""
        choix="extension of output file:"
        warning="warning"
        proceed="already exists. overwrite?"
        recur=""$title" can't convert a directory. "$pleasesel""
        conversion="converting file:"
        ask_artist="enter the artist name:"
        ask_album="enter the album name:"
        ask_song="enter the song name:"
        ask_track="enter the track number:"
        ask_quality="select the desired quality:"
	ask_compression="select the desired compression level:"
	confirmation="do you want to convert"
	decoding="decoding file:"
	ask_fields="manually enter file metatags"
	ask_confirmation_question="get prompted a confirmation question before convertin' each file"
	no_codec="you don't have the right codec to decode the selected file. missin' codec:"
	not_supported="format not supported"
	completed="conversion completed. goodbye!"
	ask_to_pass="pass the metatags on to the new files"
	options="choose from the followin' options:"
	options_conflict="options one and two conflict. please unselect one of them"
case $LANG in
        ######## FranÃ§ais ########
        fr* )
        	title="audio convert "$version""
        	pleasesel="Merci de selectionner au moins un fichier."
        	noselec=""$title" permet de convertir des fichiers audio. "$pleasesel""
        	choix="Format du fichier de sortie :"
        	warning="Attention"
        	proceed="existe deja. Ecraser ?"
        	recur=""$title" ne permet pas la conversion de dossiers. "$pleasesel""
        	conversion="Conversion du fichier :"
		ask_artist="Nom de l'artiste:"
		ask_album="Nom de l'album:"
		ask_song="Nom de la chanson:"
		ask_track="Numero de la piste:"
		ask_quality="Choisir la qualite voulue:"
		confirmation="voulez-vous convertir"
		decoding="decodage du fichier:"
		ask_fields="voulez-vous completer les metatags du fichier?"
		ask_confirmation_question="voulez-vous confirmer avant de convertir chaque
		fichier?";;
	######## italiano #########
	it* )
		title="audio convert "$version""
		pleasesel="per favore, scegli almeno un file."
		noselec=""$title" converte i file audio. "$pleasesel""
		choix="formato di conversione:"
		warning="attenzione"
		proceed="esiste! sovrascrivo?"
		recur=""$title" non può convertire directory. "$pleasesel""
		conversion="sto convertendo il file:"
		ask_artist="immetti il nome dell'artista:"
		ask_album="immetti il nome dell'album:"
		ask_song="immetti il nome della canzone:"
		ask_track="immetti il numero della traccia:"
		ask_quality="scegli la qualità del file:"
		ask_compression="scegli il livello di compressione:"
		confirmation="vuoi convertire"
		decoding="sto decodificando il file:"
		ask_fields="completare manualmente le metatags"
		ask_confirmation_question="chiedi una conferma per ogni file da convertire"
		no_codec="non hai il codec corretto per decodificare il file selezionato. codec mancante:"
		not_supported="formato non supportato"
		completed="conversione completata. arrivederci!"
		ask_to_pass="copiare le metatags nel nuovo file"
		options="scegli fra le seguenti opzioni:"
		options_conflict="le opzioni uno e due sono in conflitto. per favore deselezionane una";;
	###### Brazilian Portuguese ######
	pt-br* )
		title="audio convert "$version""
		pleasesel="por favor, selecione pelo menos um arquivo."
		noselec=""$title" converter arquivos de audio. "$pleasesel""
		choix="extensão do arquivo de saída:"
		warning="atenção"
		proceed="já existe! sobrescrever?"
		recur=""$title" não e possível converter pasta. "$pleasesel""
		conversion="convertendo arquivo:"
		ask_artist="digite o nome do artista:"
		ask_album="digite o nome do album:"
		ask_song="digite o nome da música:"
		ask_track="digite o número da faixa:"
		ask_quality="selecione a qualidade desejada:"
		confirmation="você quer converter"
		decoding="decodificando arquivo:";;
	######## dutch ########
	nl* )
               title="audio convert "$version""
               pleasesel="selecteer minimaal 1 bestand."
               noselec=""$title" converteer audio bestanden. "$pleasesel""
               choix="extensie van uitvoerbestanden:"
               warning="waarschuwing"
               proceed="bestaat al. overschrijven?"
               recur=""$title" kan geen directory converteren. "$pleasesel""
               conversion="converteren van bestand:"
               ask_artist="voer naam van artiest in:"
               ask_album="voer naam van album in:"
               ask_song="voer naam van nummer in:"
               ask_track="voer volgnummer in:"
               ask_quality="selecteer de gewenste kwaliteit:"
	       confirmation="wil je converteren"
	       decoding="decoderen bestand:"
	       ask_fields="Wil je metatags aan de bestanden toevoegen?"
               ask_confirmation_question="Wil je bevestiging voor het converteren van elk bestand?"
               no_codec="Je hebt niet de juiste codec voor het converteren van dit bestand. Missende codec:"
               not_supported="Formaat niet ondersteund"
               completed="Conversie compleet."
               ask_to_pass="Wil je de metatags toevoegen aan de nieuwe bestanden?";;
	######## german ########
	de* )
               title="Audio konvertier Skript "$version""
               pleasesel="Bitte wählen Sie mindestens eine Datei."
               noselec=""$title" verarbeitet Dateien. "$pleasesel""
               choix="Erweiterung der Ausgabedatei:"
               warning="Warnung"
               proceed="existiert bereits. Überschreiben?"
               recur=""$title" kann kein Verzeichnis konvertieren. "$pleasesel""
               conversion="Konvertierung der Datei:"
               ask_artist="Künstlername:"
               ask_album="Albumname:"
               ask_song="Songname:"
               ask_track="Titelnummer:"
               ask_quality="Wählen Sie die gewuenschte Qualitaet:"
               confirmation="Wollen Sie jetzt konvertieren?"
               decoding="dekodiere Datei:"
	       ask_compression="gib die gewünschte Komprimierungsstaerke an:"
	       ask_confirmation_question="willst Du für jede Datei vor der Konvertierung eine Bestätigungsfrage?"
	       ask_fields="Du willst keine metatags angeben?"
	       completed="Konvertierung abgeschlossen. Tschüss"
	       no_codec="Du hast keinen passenden codec um die Datei zu dekodieren"
	       not_supported="Format wird nicht unterstützt";;
	######## Spanish(Español - Castellano) ########
	es* )
               title="audio convert "$version""
               pleasesel="Seleccione al menos un archivo."
               noselec=""$title" - Convierte archivos de audio."$pleasesel""
               choix="Formato del archivo resultante:"
               warning="Atención"
               proceed="Ya existe, sobreescribir?"
               recur=""$title" No se puede convertir el directorio. "$pleasesel""
               conversion="Convirtiendo archivo:"
               ask_artist="Nombre del artista:"
               ask_album="Nombre del álbum:"
               ask_song="Nombre de la canción:"
               ask_track="Número de la pista:"
               ask_quality="Seleccione la calidad deseada:"
               confirmation="Convertir?"
               decoding="Decodificando archivo:"
               ask_fields="Editar las \"metatags\" del archivo?"
	       ask_confirmation_question="Desea una pregunta de confirmación antes de convertir cada archivo?"
	       ask_compression="seleccione el nivel de compresión deseable:"
	       completed="conversión completo. Adiós!"
	       no_codec="No tenrs el codec correcto para descodificar el elijido archivo. Falta:"
	       not_supported="Format no es  soportado";;
	######## polish ########
	pl* )
		title="konwersja audio "$version""
		pleasesel="wybierz co najmniej jeden plik."
		noselec="konwersja pliku "$title". "$pleasesel""
		choix="rozszerzenie pliku wynikowego:"
		warning="ostrzeÅŒenie"
		proceed="juÅŒ istnieje. zastÄ~EpiÄ~G ?"
		recur=""$title" nie moÅŒna konwertowaÄ~G katalogÃ³w. "$pleasesel""
		conversion="konwersja pliku:"
		ask_artist="podaj nazwÄ~Y wykonawcy:"
		ask_album="podaj nazwÄ~Y albumu:"
		ask_song="podaj nazwÄ~Y utworu:"
		ask_track="podaj numer Å~[cieÅŒki:"
		ask_quality="wybierz wymagany poziom jakoÅ~[ci:"
		ask_compression="wybierz wymagany poziom kompresji:"
		confirmation="chcesz uÅŒyÄ~G konwersji"
		decoding="dekodowany plik:"
		ask_fields="chcesz umieÅ~[ciÄ~G tagi ?"
		ask_confirmation_question="chcesz uÅŒywaÄ~G potwierdzenia przed kaÅŒdÄ~E konwersjÄ~E ?"
		no_codec="nie posiadasz odpowiedniego kodeka dla wykonania wymaganej operacji. missin' codec:"
		not_supported="brak obsÅ~Bugi wskazanego formatu"
		completed="konwersjÄ~Y zakoÅ~Dczono. Pa, pa!"
		ask_to_pass="chcesz eksportowaÄ~G metatagi do innych plikÃ³w?"
esac

#################################################
#       FONCTIONS
get_field_names ()
{
        artist_name=`zenity --entry --title="$title" --text="$ask_artist" --entry-text="$artist_name"`
        album_name=`zenity --entry --title="$title" --text="$ask_album" --entry-text="$album_name"`
        song_name=`zenity --entry --title="$title" --text="$ask_song"`
        track_number=`zenity --entry --title="$title" --text="$ask_track"`
}

get_ogg_quality ()
{
        zenity --title="$title" --list --radiolist --column="" --column="$ask_quality" -- "-1" FALSE "0" FALSE "1" FALSE "2" FALSE "3" FALSE "4" FALSE "5" FALSE "6" TRUE "7" FALSE "8" FALSE "9" FALSE "10"
}

get_mp3_quality ()
{
        zenity --title="$title" --list --radiolist --column="" --column="$ask_quality" FALSE "medium" FALSE "standard" TRUE "extreme" FALSE "insane"
}

get_mpc_quality ()
{
        zenity --title="$title" --list --radiolist --column="" --column="$ask_quality" FALSE "thumb" FALSE "radio" TRUE "standard" FALSE "xtreme"
}

get_flac_quality ()
{
	zenity --title="$title" --list --radiolist --column="" --column="$ask_compression" FALSE "0" FALSE "1" FALSE "2" FALSE "3" FALSE "4" FALSE "5" FALSE "6" FALSE "7" TRUE "8"
}

get_mac_quality ()
{
	zenity --title="$title" --list --radiolist --column="" --column="$ask_compression" FALSE "1000" FALSE "2000" TRUE "3000" FALSE "4000" FALSE "5000"
}

get_aac_quality ()
{
	zenity --title="$title" --list --radiolist --column="" --column="$ask_compression" FALSE "100" FALSE "200" TRUE "300" FALSE "400" FALSE "500"
}

get_quality ()
{
	if [ "$1" == "mp3" ]
	then
		quality="$(get_mp3_quality)"
	fi
        if [ "$1" == "ogg" ]
        then
                quality="$(get_ogg_quality)"
        fi
        if [ "$1" == "mpc" ]
        then
                quality="$(get_mpc_quality)"
        fi
        if [ "$1" == "flac" ]
        then
                quality="$(get_flac_quality)"
        fi
        if [ "$1" == "ape" ]
        then
                quality="$(get_mac_quality)"
        fi
	if [ "$1" == "aac" ]
	then
		quality="$(get_aac_quality)"
	fi
}

get_metatags ()
{
	if (is_mp3 "$1")
	then
		artist_name=`id3info "$1" | awk '/TPE1/ { print substr($0, match($0, /:/) + 2 ) }'`
		album_name=`id3info "$1" | awk '/TALB/ { print substr($0, match($0, /:/) + 2 ) }'`
		song_name=`id3info "$1" | awk '/TIT2/ { print substr($0, match($0, /:/) + 2 ) }'`
		track_number=`id3info "$1" | awk '/TRCK/ { print substr($0, match($0, /:/) + 2 ) }'`
	fi
	if (is_ogg "$1")
        then
                artist_name=`ogginfo "$1" | grep artist | cut -d \= -f 2`
		album_name=`ogginfo "$1" | grep album | cut -d \= -f 2`
		song_name=`ogginfo "$1" | grep title | cut -d \= -f 2`
		track_number=`ogginfo "$1" | grep tracknumber | cut -d \= -f 2`
	fi
	if (is_flac "$1")
	then
		 artist_name=`metaflac --show-tag=artist "$1" | cut -d \= -f 2`
		 album_name=`metaflac --show-tag=album "$1" | cut -d \= -f 2`
		 song_name=`metaflac --show-tag=title "$1" | cut -d \= -f 2`
		 track_number=`metaflac --show-tag=tracknumber "$1" | cut -d \= -f 2`
	fi
	if (is_aac "$1")
	then
		artist_name=`faad -i "$1" 2>&1 | awk '/artist/ { print substr($0, match($0, /:/) + 2 ) }'`
		album_name=`faad -i "$1" 2>&1 | awk '/album/ { print substr($0, match($0, /:/) + 2 ) }'`
		song_name=`faad -i "$1" 2>&1 | awk '/title/ { print substr($0, match($0, /:/) + 2 ) }'`
		track_number=`faad -i "$1" 2>&1 | awk '/track/ { print substr($0, match($0, /:/) + 2 ) }'`
	fi
}

mp3_parse_fields ()
{
        if [ "$artist_name" ]
        then
                mp3_fields=(-a"$artist_name")
        fi
        if [ "$album_name" ]
        then
                mp3_fields=("${mp3_fields[@]}" -A"$album_name")
        fi
        if [ "$song_name" ]
        then
                mp3_fields=("${mp3_fields[@]}" -s"$song_name")
        fi
        if [ "$track_number" ]
        then
                mp3_fields=("${mp3_fields[@]}" -t"$track_number")
        fi
}

ogg_parse_fields ()
{
	if [ "$artist_name" ]
	then
		ogg_fields=(-a "$artist_name")
	fi
	if [ "$album_name" ]
	then
		ogg_fields=("${ogg_fields[@]}" -l "$album_name")
	fi
	if [ "$song_name" ]
	then
		ogg_fields=("${ogg_fields[@]}" -t "$song_name")
	fi
	if [ "$track_number" ]
	then
		ogg_fields=("${ogg_fields[@]}" -N "$track_number")
	fi
}

flac_set_tags ()
{
	if [ $pass_metatags -eq 0 ] || [ $fields -eq 0 ]
        then
		if [ "$artist_name" ]
		then
		 	metaflac --set-tag=ARTIST="$artist_name" "$1"
		fi
		if [ "$album_name" ]
		then
			metaflac --set-tag=ALBUM="$album_name" "$1"
		fi
		if [ "$song_name" ]
		then
			metaflac --set-tag=TITLE="$song_name" "$1"
		fi
		if [ "$track_number" ]
		then
			metaflac --set-tag=TRACKNUMBER="$track_number" "$1"
		fi
        fi
}

aac_parse_fields ()
{
        if [ "$artist_name" ]
        then
                aac_fields=(--artist "$artist_name")
        fi
        if [ "$album_name" ]
        then
                aac_fields=("${aac_fields[@]}" --album "$album_name")
        fi
        if [ "$song_name" ]
        then
                aac_fields=("${aac_fields[@]}" --title "$song_name")
        fi
        if [ "$track_number" ]
        then
                aac_fields=("${aac_fields[@]}" --track "$track_number")
        fi
}

is_mp3 ()
{
	file -b "$1" | grep 'MP3' || echo $1 | grep -i '\.mp3$'
}

is_ogg()
{
	file -b "$1" | grep 'Vorbis' || echo $1 | grep -i '\.ogg$'
}

is_mpc()
{
	file -b "$1" | grep 'Musepack' || echo $1 | grep -i '\.mpc$'
}

is_flac()
{
	file -b "$1" | grep 'FLAC' || echo $1 | grep -i '\.flac$'
}

is_mac()
{
	file -b "$1" | grep 'Monkey' && echo $1 | grep -i '\.ape$'
}

is_aac()
{
	file -b "$1" | grep 'AAC' || echo $1 | grep -i '\.aac$'
}

is_wav()
{
	file -b "$1" | grep 'WAVE' || echo $1 | grep -i '\.wav$'
}

is_wma()
{
	file -b "$1" | grep 'Microsoft' || echo $1 | grep -i '\.wma$'
}

mp3_encode ()
{
	lame -m auto --preset $quality "$2" "$3" 2>&1 | awk -vRS='\r' '(NR>3){gsub(/[()%|]/," ");print $2; fflush();}' | zenity --progress --title="$title" --text="$conversion $1" --auto-close
}

ogg_encode ()
{
	if [ $fields -eq 0 ] || [ $pass_metatags -eq 0 ]
	then
		ogg_parse_fields
		oggenc "$2" "${ogg_fields[@]}" -q $quality -o "$3" 2>&1 | awk -vRS='\r' '(NR>1){gsub(/%/," ");print $2; fflush();}' | zenity --progress --title="$title" --text="$conversion $1" --auto-close
	else
		oggenc "$2" -q $quality -o "$3" 2>&1 | awk -vRS='\r' '(NR>1){gsub(/%/," ");print $2; fflush();}' | zenity --progress --title="$title" --text="$conversion $1" --auto-close
	fi
}

mpc_encode ()
{
	mppenc --$quality "$2" "$3" 2>&1 | awk -vRS='\r' '!/^$/{if (NR>5) print $1; fflush();}' | zenity --progress --title="$title" --text="$conversion $1" --auto-close
}

flac_encode ()
{
	flac --compression-level-$quality "$2" -o "$3" 2>&1 | awk -vRS='\r' -F':' '!/wrote/{gsub(/ /,"");if(NR>1)print $2; fflush();}' | awk -F'%' '{print $1; fflush();}' | zenity --progress --title="$title" --text="$conversion $1" --auto-close
}

mac_encode ()
{
	mac "$2" "$3" -c$quality 2>&1 | awk -vRS='\r' '(NR>1){gsub(/%/," ");print $2; fflush();}' | zenity --progress --title="$title" --text="$conversion $1" --auto-close
}

aac_encode ()
{
	if [ $fields -eq 0 ] || [ $pass_metatags -eq 0 ]
        then
                aac_parse_fields
		faac -w "${aac_fields[@]}" -q $quality -o "$3" "$2" 2>&1 | awk -vRS='\r' '(NR>1){gsub(/%/," ");print $3; fflush();}' | zenity --progress --title="$title" --text="$conversion $1" --auto-close
	else
		faac -q $quality -o "$3" "$2" 2>&1 | awk -vRS='\r' '(NR>1){gsub(/%/," ");print $3; fflush();}' | zenity --progress --title="$title" --text="$conversion $1" --auto-close
	fi
}

mp3_decode ()
{
	temp_file=`echo "$1" | sed 's/\.\w*$/'.wav'/'`
	lame --decode "$1" "$temp_file" 2>&1 | awk -vRS='\r' -F'[ /]+' '(NR>2){if((100*$2/$3)<=100)print 100*$2/$3; fflush();}' | zenity --progress --title="$title" --text="$2 $1" --auto-close
}

ogg_decode ()
{
	temp_file=`echo "$1" | sed 's/\.\w*$/'.wav'/'`
	oggdec "$1" -o "$temp_file" 2>&1 | awk -vRS='\r' '(NR>1){gsub(/%/," ");print $2; fflush();}' | zenity --progress --title="$title" --text="$2 $1" --auto-close
}

mpc_decode ()
{
	temp_file=`echo "$1" | sed 's/\.\w*$/'.wav'/'`
	mppdec "$1" "$temp_file" 2>&1 | awk -vRS='\r' -F'[ (]+' '!/s/{gsub(/(%)/," ");if(NR>5)print $5; fflush();}' | zenity --progress --title="$title" --text="$2 $1" --auto-close
}

flac_decode ()
{
	temp_file=`echo "$1" | sed 's/\.\w*$/'.wav'/'`
	flac -d "$1" -o "$temp_file" 2>&1 | awk -vRS='\r' -F':' '!/done/{gsub(/ /,"");gsub(/% complete/,"");if(NR>1)print $2; fflush();}' | zenity --progress --title="$title" --text="$2 $1" --auto-close
}

mac_decode ()
{
	temp_file=`echo "$1" | sed 's/\.\w*$/'.wav'/'`
	mac "$1" "$temp_file" -d 2>&1 | awk -vRS='\r' '(NR>1){gsub(/%/," ");print $2; fflush();}' | zenity --progress --title="$title" --text="$2 $1" --auto-close
}

aac_decode ()
{
	temp_file=`echo "$1" | sed 's/\.\w*$/'.wav'/'`
	faad -o "$temp_file" "$1" 2>&1 | awk -vRS='\r' '(NR>1){gsub(/%/," ");print $1; fflush();}' | zenity --progress --title="$title" --text="$2 $1" --auto-close
}

wma_decode ()
{
	temp_file=`echo "$1" | sed 's/\.\w*$/'.wav'/'`
	mplayer -ao pcm:file="$temp_file" "$1" 2>&1 | awk -vRS='\r' '(NR>1){gsub(/%/," ");print 100-$5; fflush();}' | zenity --progress --title="$title" --text="$2 $1" --auto-close
}

ask_for_fields ()
{
	#zenity --question --text="$ask_fields"
	#fields=$?
	questions=("${questions[@]}" FALSE "$ask_fields")
}

ask_for_confirmation ()
{
	#zenity --question --text="$ask_confirmation_question"
	#confirmation_question=$?
	questions=("${questions[@]}" FALSE "$ask_confirmation_question")
}

ask_to_pass_metatags ()
{
	#zenity --question --text="$ask_to_pass"
	#pass_metatags=$?
	questions=(FALSE "$ask_to_pass")
}

question_list ()
{
	if [ "$formatout" == "mp3" ] || [ "$formatout" == "ogg" ] || [ "$formatout" == "flac" ] || \
	   [ "$formatout" == "aac" ]
	then
        	#pass_metatags=1

        	if (is_mp3 "$1") || (is_ogg "$1") || (is_flac "$1") || (is_aac "$1")
        	then
                	ask_to_pass_metatags    # ask if user wants metatags to be passed on
        	fi

               	ask_for_fields  # ask if user wants to edit metatags
	fi
	if [ "$2" -gt 1 ]
	then
        	ask_for_confirmation    # ask if user wants a confirmation question for each file
	#else
        #	confirmation_question=1
	fi
}

ask_questions ()
{
	repeat=1

	while [ $repeat -eq 1 ]
	do
		answers=`zenity --list --checklist --column "" --column "$options" "${questions[@]}"`
		
		if (echo "$answers" | grep -i "$ask_to_pass") && \
		   (echo "$answers" | grep -i "$ask_fields")
		then
			zenity --error --title="$warning" --text="$options_conflict"
			repeat=1
			continue
		fi

		repeat=0
	done
}
			
parse_questions ()
{
	if (echo "$answers" | grep -i "$ask_to_pass")
	then
		pass_metatags=0
	else
		pass_metatags=1
	fi

	if (echo "$answers" | grep -i "$ask_fields")
	then
		fields=0
	else
		fields=1
	fi

	if (echo "$answers" | grep -i "$ask_confirmation_question")
	then
		confirmation_question=0
	else
		confirmation_question=1
	fi
}

completed_message ()
{
	zenity --info --title "$title" --text="$completed"
}

caf () # fonction "convert audio file"
{
        ### Format in_file = mp3 ###
        if (is_mp3 "$1")
        then
                if [ "$3" = "ogg" ]
                then # mp3-2-ogg
			if [ $pass_metatags -eq 0 ]
			then
				get_metatags "$1"
			elif [ $fields -eq 0 ]
			then
				get_field_names "$1"
			fi
                        mp3_decode "$1" "$decoding"
			ogg_encode "$1" "$temp_file" "$2"
			rm -f "$temp_file"
			break
                fi
                if [ "$3" = "mpc" ]
                then # mp3-2-mpc
			mp3_decode "$1" "$decoding"
                        mpc_encode "$1" "$temp_file" "$2"
			rm -f "$temp_file"
			break
                fi
		if [ "$3" = "flac" ]
		then # mp3-2-flac
			mp3_decode "$1" "$decoding"
			flac_encode "$1" "$temp_file" "$2"
			if [ $pass_metatags -eq 0 ]
			then
				get_metatags "$1"
			elif [ $fields -eq 0 ]
			then
				get_field_names "$1"
			fi
			flac_set_tags "$2"
			rm -f "$temp_file"
			break
		fi
		if [ "$3" = "ape" ]
		then # mp3-2-ape
			mp3_decode "$1" "$decoding"
			mac_encode "$1" "$temp_file" "$2"
			rm -f "$temp_file"
			break
		fi
		if [ "$3" = "aac" ]
                then # mp3-2-aac
                        if [ $pass_metatags -eq 0 ]
                        then
                                get_metatags "$1"
                        elif [ $fields -eq 0 ]
                        then
                                get_field_names "$1"
                        fi
                        mp3_decode "$1" "$decoding"
                        aac_encode "$1" "$temp_file" "$2"
                        rm -f "$temp_file"
                        break
                fi
                if [ "$3" = "wav" ]
                then # mp3-2-wav
                        mp3_decode "$1" "$conversion"
                fi
		break
        fi
        ### Format in_file = ogg ###
        if (is_ogg "$1")
        then
                if [ "$3" = "mp3" ]
                then # ogg-2-mp3
			ogg_decode "$1" "$decoding"
                        mp3_encode "$1" "$temp_file" "$2"
			if [ $pass_metatags -eq 0 ]
			then
				get_metatags "$1"
			elif [ $fields -eq 0 ]
                        then
                        	get_field_names "$1"
			fi
			if [ $pass_metatags -eq 0 ] || [ $fields -eq 0 ]
			then
				mp3_parse_fields
				id3tag "${mp3_fields[@]}" "$2"
			fi
			rm -f "$temp_file"
			break
                fi
                if [ "$3" = "mpc" ]
                then # ogg-2-mpc
			ogg_decode "$1" "$decoding"
                        mpc_encode "$1" "$temp_file" "$2"
			rm -f "$temp_file"
			break
                fi
		if [ "$3" = "flac" ]
		then # ogg-2-flac
			ogg_decode "$1" "$decoding"
			flac_encode "$1" "$temp_file" "$2"
			if [ $pass_metatags -eq 0 ]
			then
				get_metatags "$1"
			elif [ $fields -eq 0 ]
                        then
                                get_field_names "$1"
			fi
			flac_set_tags "$2"
			rm -f "$temp_file"
			break
		fi
		if [ "$3" = "ape" ]
		then # ogg-2-ape
			ogg_decode "$1" "$decoding"
			mac_encode "$1" "$temp_file" "$2"
			rm -f "$temp_file"
			break
		fi
		if [ "$3" = "aac" ]
                then # ogg-2-aac
                        if [ $pass_metatags -eq 0 ]
                        then
                                get_metatags "$1"
                        elif [ $fields -eq 0 ]
                        then
                                get_field_names "$1"
                        fi
                        ogg_decode "$1" "$decoding"
                        aac_encode "$1" "$temp_file" "$2"
                        rm -f "$temp_file"
                        break
                fi
                if [ "$3" = "wav" ]
                then # ogg-2-wav
                        ogg_decode "$1" "$conversion"
                fi
		break
        fi
        ### Format in_file = mpc ###
        if (is_mpc "$1")
        then
                if [ "$3" = "mp3" ]
                then # mpc-2-mp3
			mpc_decode "$1" "$decoding"
                        mp3_encode "$1" "$temp_file" "$2"
			if [ $fields -eq 0 ]
                        then
	                        get_field_names "$1"
				mp3_parse_fields
				id3tag "${mp3_fields[@]}" "$2"
				break
			fi
                        mpc_decode "$1" "$decoding"
			mp3_encode "$1" "$temp_file" "$2"
			rm -f "$temp_file"
			break
                fi
                if [ "$3" = "ogg" ]
                then # mpc-2-ogg
			if [ $fields -eq 0 ]
                        then
                        	get_field_names "$1"
			fi
                        mpc_decode "$1" "$decoding"
			ogg_encode "$1" "$temp_file" "$2"
			rm -f "$temp_file"
			break
                fi
		if [ "$3" = "flac" ]
		then # mpc-2-flac
			mpc_decode "$1" "$decoding"
			flac_encode "$1" "$temp_file" "$2"
			if [ $fields -eq 0 ]
                        then
                                get_field_names "$1"
			fi
                        flac_set_tags "$2"
			rm -f "$temp_file"
			break
		fi
		if [ "$3" = "ape" ]
		then # mpc-2-ape
			mpc_decode "$1" "$decoding"
			mac_encode "$1" "$temp_file" "$2"
			rm -f "$temp_file"
			break
		fi
		if [ "$3" = "aac" ]
                then # mpc-2-aac
                        if [ $fields -eq 0 ]
                        then
                                get_field_names "$1"
                        fi
                        mpc_decode "$1" "$decoding"
                        aac_encode "$1" "$temp_file" "$2"
                        rm -f "$temp_file"
                        break
                fi
                if [ "$3" = "wav" ]
                then # mpc-2-wav
                        mpc_decode "$1" "$conversion"
                fi
		break
        fi
	### Format in_file = flac ###
	if (is_flac "$1")
	then
		if [ "$3" = "mp3" ]
		then # flac-2-mp3
			flac_decode "$1" "$decoding"
                        mp3_encode "$1" "$temp_file" "$2"
			if [ $pass_metatags -eq 0 ]
			then
				get_metatags "$1"
			elif [ $fields -eq 0 ]
                        then
				get_field_names "$1"
			fi
			if [ $pass_metatags -eq 0 ] || [ $fields -eq 0 ]
			then
				mp3_parse_fields
				id3tag "${mp3_fields[@]}" "$2"
			fi
			rm -f "$temp_file"
			break
		fi
		if [ "$3" = "ogg" ]
		then # flac-2-ogg
			if [ $pass_metatags -eq 0 ]
			then
				get_metatags "$1"
			elif [ $fields -eq 0 ]
                        then
				get_field_names "$1"
			fi
			flac_decode "$1" "$decoding"
			ogg_encode "$1" "$temp_file" "$2"
			rm -f "$temp_file"
			break
		fi
		if [ "$3" = "mpc" ]
		then # flac-2-mpc
			flac_decode "$1" "$decoding"
			mpc_encode "$1" "$temp_file" "$2"
			rm -f "$temp_file"
			break
		fi
		if [ "$3" = "ape" ]
		then # flac-2-ape
			flac_decode "$1" "$decoding"
			mac_encode "$1" "$temp_file" "$2"
			rm -f "$temp_file"
			break
		fi
		if [ "$3" = "aac" ]
                then # flac-2-aac
                        if [ $pass_metatags -eq 0 ]
                        then
                                get_metatags "$1"
                        elif [ $fields -eq 0 ]
                        then
                                get_field_names "$1"
                        fi
                        flac_decode "$1" "$decoding"
                        aac_encode "$1" "$temp_file" "$2"
                        rm -f "$temp_file"
                        break
		fi
		if [ "$3" = "wav" ]
		then # flac-2-wav
			flac_decode "$1" "$conversion"
		fi
		break
	fi
	### Format in_file = ape ###
	if (is_mac "$1")
	then
		if [ "$3" = "mp3" ]
		then # ape-2-mp3
			mac_decode "$1" "$decoding"
                        mp3_encode "$1" "$temp_file" "$2"
			if [ $fields -eq 0 ]
                        then
				get_field_names "$1"
				mp3_parse_fields
				id3tag "${mp3_fields[@]}" "$2"
				break
			fi
			mac_decode "$1" "$decoding"
			mp3_encode "$1" "$temp_file" "$2"
			rm -f "$temp_file"
			break
		fi
		if [ "$3" = "ogg" ]
		then # ape-2-ogg
			if [ $fields -eq 0 ]
                        then
				get_field_names "$1"
			fi
			mac_decode "$1" "$decoding"
			ogg_encode "$1" "$temp_file" "$2"
			rm -f "$temp_file"
			break
		fi
		if [ "$3" = "mpc" ]
		then # ape-2-mpc
			mac_decode "$1" "$decoding"
			mpc_encode "$1" "$temp_file" "$2"
			rm -f "$temp_file"
			break
		fi
		if [ "$3" = "flac" ]
		then #ape-2-flac
			mac_decode "$1" "$decoding"
			flac_encode "$1" "$temp_file" "$2"
			if [ $fields -eq 0 ]
                        then
                                get_field_names "$1"
			fi
			flac_set_tags "$2"
			rm -f "$temp_file"
			break
		fi
		if [ "$3" = "aac" ]
                then # ape-2-aac
                        if [ $fields -eq 0 ]
                        then
                                get_field_names "$1"
                        fi
                        mac_decode "$1" "$decoding"
                        aac_encode "$1" "$temp_file" "$2"
                        rm -f "$temp_file"
                        break
                fi
		if [ "$3" = "wav" ]
		then #ape-2-wav
			mac_decode "$1" "$conversion"
		fi
		break
	fi
	### Format in_file = aac ###
	if (is_aac "$1")
        then
                if [ "$3" = "mp3" ]
                then # aac-2-mp3
                        aac_decode "$1" "$decoding"
                        mp3_encode "$1" "$temp_file" "$2"
                        if [ $pass_metatags -eq 0 ]
                        then
                                get_metatags "$1"
                        elif [ $fields -eq 0 ]
                        then
                                get_field_names "$1"
                        fi
                        if [ $pass_metatags -eq 0 ] || [ $fields -eq 0 ]
                        then
                                mp3_parse_fields
                                id3tag "${mp3_fields[@]}" "$2"
                        fi
                        rm -f "$temp_file"
                        break
                fi
		if [ "$3" = "ogg" ]
                then # aac-2-ogg
                        if [ $pass_metatags -eq 0 ]
                        then
                                get_metatags "$1"
                        elif [ $fields -eq 0 ]
                        then
                                get_field_names "$1"
                        fi
                        aac_decode "$1" "$decoding"
                        ogg_encode "$1" "$temp_file" "$2"
                        rm -f "$temp_file"
                        break
                fi
                if [ "$3" = "mpc" ]
                then # aac-2-mpc
                        aac_decode "$1" "$decoding"
                        mpc_encode "$1" "$temp_file" "$2"
                        rm -f "$temp_file"
                        break
                fi
                if [ "$3" = "flac" ]
                then # aac-2-flac
                        aac_decode "$1" "$decoding"
                        flac_encode "$1" "$temp_file" "$2"
                        if [ $pass_metatags -eq 0 ]
                        then
                                get_metatags "$1"
                        elif [ $fields -eq 0 ]
                        then
                                get_field_names "$1"
                        fi
                        flac_set_tags "$2"
                        rm -f "$temp_file"
                        break
                fi
		if [ "$3" = "ape" ]
                then # aac-2-ape
                        aac_decode "$1" "$decoding"
                        mac_encode "$1" "$temp_file" "$2"
                        rm -f "$temp_file"
                        break
                fi
		if [ "$3" = "wav" ]
                then # aac-2-wav
                        aac_decode "$1" "$conversion"
                fi
                break
        fi
        ### Format in_file = wav ###
        if (is_wav "$1")
        then
                if [ "$3" = "mp3" ]
                then # wav-2-mp3
			mp3_encode "$1" "$1" "$2"
			if [ $fields -eq 0 ]
                        then
	                        get_field_names "$1"
				mp3_parse_fields
				id3tag "${mp3_fields[@]}" "$2"
				break
			fi
			break
                fi
                if [ "$3" = "ogg" ]
                then # wav-2-ogg
			if [ $fields -eq 0 ]
                        then
	                        get_field_names "$1"
			fi
                        ogg_encode "$1" "$1" "$2"
			break
                fi
                if [ "$3" = "mpc" ]
                then # wav-2-mpc
                        mpc_encode "$1" "$1" "$2"
                fi
		if [ "$3" = "flac" ]
		then # wav-2-flac
			flac_encode "$1" "$1" "$2"
			if [ $fields -eq 0 ]
                        then
                                get_field_names "$1"
			fi
			flac_set_tags "$2"
		fi
		if [ "$3" = "aac" ]
                then # wav-2-aac
                        if [ $fields -eq 0 ]
                        then
                                get_field_names "$1"
                        fi
                        aac_encode "$1" "$1" "$2"
                        break
                fi
		if [ "$3" = "ape" ]
		then # wav-2-ape
			mac_encode "$1" "$1" "$2"
		fi
		break
        fi
        ### Format in_file = wma ###
        if (is_wma "$1")
        then
                if [ "$3" = "mp3" ]
                then # wma-2-mp3
			wma_decode "$1" "$decoding"
                        mp3_encode "$1" "$temp_file" "$2"
			if [ $fields -eq 0 ]
                        then
	                        get_field_names "$1"
				mp3_parse_fields
				id3tag "${mp3_fields[@]}" "$2"
				break
			fi
                        rm -f "$temp_file"
			break
                fi

                if [ "$3" = "wav" ]
                then # wma-2-wav
                        wma_decode "$1" "$conversion"
                fi

                if [ "$3" = "ogg" ]
                then # wma-2-ogg
			if [ $fields -eq 0 ]
                        then
	                        get_field_names "$1"
			fi
                        wma_decode "$1" "$decoding"
                        ogg_encode "$1" "$temp_file" "$2"
                        rm -f "$temp_file"
			break
                fi
                if [ "$3" = "mpc" ]
                then # wma-2-mpc
                        wma_decode "$1" "$decoding"
                        mpc_encode "$1" "$temp_file" "$2"
                        rm -f "$temp_file"
			break
                fi
		if [ "$3" = "flac" ]
		then # wma-2-flac
			wma_decode "$1" "$decoding"
			flac_encode "$1" "$temp_file" "$2"
			if [ $fields -eq 0 ]
                        then
                                get_field_names "$1"
			fi
			flac_set_tags "$2"
			rm -f "$temp_file"
			break
		fi
		if [ "$3" = "ape" ]
		then # wma-2-ape
			wma_decode "$1" "$decoding"
			mac_encode "$1" "$temp_file" "$2"
			rm -f "$temp_file"
			break
		fi
		if [ "$3" = "aac" ]
                then # wma-2-aac
                        if [ $fields -eq 0 ]
                        then
                                get_field_names "$1"
                        fi
                        wma_decode "$1" "$decoding"
                        aac_encode "$1" "$temp_file" "$2"
                        rm -f "$temp_file"
                        break
                fi
		break
        fi
}

#################################################
#       PROGRAMME
#### Pas de fichiers sÃ©lectionnÃ© ###
if [ $# -eq 0 ]; then
        zenity --error --title="$warning" --text="$noselec"
        exit 1
fi
######## make a list of available formats, and check if we can decode the file #######
if !(is_mp3 "$1") && !(is_ogg "$1") && !(is_mpc "$1") && !(is_flac "$1") && !(is_mac "$1") && \
   !(is_aac "$1") && !(is_wav "$1") && !(is_wma "$1")
then
	zenity --error --title="$warning" --text="$not_supported"
        exit 1
fi
depformat=""
if which lame 2>/dev/null
then
        if !(is_mp3 "$1")	# if we have lame, and the file to convert is not an mp3,
        then			# add mp3 to the list of formats to convert to
                depformat="mp3"
        fi
else	# if we don't have lame, check if the file to convert is an mp3
	if (is_mp3 "$1")
	then
		zenity --error --title="$warning" --text="$no_codec lame"
		exit 1
	fi
fi
if which oggenc 2>/dev/null
then
        if !(is_ogg "$1")	# if we have vorbis-tools, and the file to convert is not an
        then			# ogg, add ogg to the list of formats to convert to
                depformat="$depformat ogg"
        fi
else    # if we don't have vorbis-tools, check if the file to convert is an ogg
        if (is_ogg "$1")
        then
                zenity --error --title="$warning" --text="$no_codec vorbis-tools"
                exit 1
        fi
fi
if which mppenc 2>/dev/null
then
        if !(is_mpc "$1")	# if we have musepack-tools, and the file to convert is not
        then			# an mpc, add mpc to the list of formats to convert to
                depformat="$depformat mpc"
        fi
fi
if !(which mppdec 2>/dev/null)
then    # if we don't have musepack-tools, check if the file to convert is an mpc
        if (is_mpc "$1")
        then
                zenity --error --title="$warning" --text="$no_codec musepack-tools"
                exit 1
        fi
fi
if which flac 2>/dev/null
then
	if !(is_flac "$1")	# if we have flac, and the file to convert is not a
	then			# flac, add flac to the list of formats to convert to
		depformat="$depformat flac"
	fi
else    # if we don't have flac, check if the file to convert is a flac
        if (is_flac "$1")
        then
                zenity --error --title="$warning" --text="$no_codec flac"
                exit 1
        fi
fi
if which mac 2>/dev/null
then
	if !(is_mac "$1")	# if we have mac, and the file to convert is not an ape,
	then			# add ape to the list of formats to convert to
		depformat="$depformat ape"
	fi
else    # if we don't have mac, check if the file to convert is an ape
        if (is_mac "$1")
        then
                zenity --error --title="$warning" --text="$no_codec mac"
                exit 1
        fi
fi
if which faac 2>/dev/null
then
	if !(is_aac "$1")	# if we have faac, and the file to convert to is not an aac,
	then			# add aac to the list of formats to convert to
		depformat="$depformat aac"
	fi
fi
if !(which faad 2>/dev/null)	# if we don't have faad, check if the file to convert to is an aac
then
	if (is_aac "$1")
	then
		zenity --error --title="$warning" --text="$no_codec faad"
		exit 1
	fi
fi
if !(which mplayer 2>/dev/null) # if we don't have mplayer, check if the file to convert is a wma
then
        if (is_wma "$1")
	then
                zenity --error --title="$warning" --text="$no_codec mplayer"
                exit 1
        fi
fi
if !(is_wav "$1")	# if the file to convert is not a wav, add wav to the list of
then			# formats to convert to
        depformat="$depformat wav"
fi
######## FenÃªtre principale ########
while [ ! "$formatout" ] # RÃ©afficher la fenÃªtre tant que l'utilisateur n'a pas fait de choix
do


        formatout=`zenity --title "$title" --list --column="Format" $depformat --text "$choix"`
        ###### Choix -> Sortie boucle ######
        if  [ $? != 0 ]; then
                exit 1
        fi
        [ $? -ne 0 ] && exit 2 # Annulation
done
########## Conversion ############
#let "nbfiles = $#"
#compteur=0;
question_list "$1" "$#"	# prepare all of the various conversion questions
ask_questions		# ask all of the various conversion questions
parse_questions		# parse all of the various conversion questions
if [ "$formatout" != "wav" ]
then
	get_quality "$formatout"	# ask for quality of compression
fi
file_number=$#
(while [ $# -gt 0 ]; do
        for i in $formatout; do
                in_file=$1
                out_file=`echo "$in_file" | sed 's/\.\w*$/'.$formatout'/'`
                #echo "# $conversion $in_file"
                i=`echo $i | sed 's/"//g'`
                while `true`; do
                        ########## Le fichier de sortie existe dÃ©jÃ| , l'Ã©craser ? ##########
                        if ls "$out_file" | grep -v "^ls"
                        then
                                if !(`gdialog --title "$warning" --yesno "$out_file $proceed" 200 100`)
                                then
                                        break
                                fi
                        fi
			if [ "$file_number" -gt 1 ] && [ "$confirmation_question" -eq 0 ]
			then
				zenity --question --text="$confirmation $in_file in $out_file?"
				if [ $? -eq 1 ]
				then
					break
				fi
			fi
                       	caf "$in_file" "$out_file" "$formatout" # Lancer la conversion
                break
                shift
                done
                ######### Progression ########
#                let "compteur += 1"
#                let "progress = compteur*100/nbfiles"
#                echo $progress
        done
        shift
done
)

completed_message
