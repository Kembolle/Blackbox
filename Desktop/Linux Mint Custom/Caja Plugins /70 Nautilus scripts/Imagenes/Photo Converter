#!/bin/bash
## Nautilus Converter Photo
## Autor: lukas
## Kontakt: luka.poland@gmail.com
## Licencja: GPL v3

case $LANG in
	pl*)
	  scripts_name='Konwerter Obrazów'
	  choice_column='Wybór'
	  more_options_column='Dodatkowe opcje'
	  scale_column='Dostępne rozdzielczości'
	  compres_text_column='format kompresji'
	  compres_text_column2='Obsługuje'
	  new_file_name_text='Zapisać jako?'
	  options_rename='Zmień nazwę...'
	  options_compress_files='Skompresuj pliki (.zip. tar.gz)'
	  options_send_file_to='Wyślij skompresowane do...'
	  send_file_desktop='Pulpit'
	  send_file_dropbox='Katalog Public (Dropbox)'
	  send_file_alternative='Inny'
	  options_text='Zaznacz dodatkowe opcje z poniższej listy'
	  scale_text='Wybierz opcje z poniższej listy'
	  compres_text='Wybierz opcje z poniższej listy'
	  send_file_text='Podaj miejsce, w które przesłać archiwum'
	  quality_text='Ustaw jakość obrazu'
	  dir_text='Nazwa Albumu?'
	  window_progress='Postęp konwersji'
	  place_of_destination_column="Miejsce docelowe"
	  compres_to='Do:'
	  compres_from='#Konwersja Z:'
	  warning_text='Do działania skryptu niezbędny jest program \"Convert\!\"\n\nMożna go zainstalować wpisując w terminalu:\n sudo apt-get install imagemagick\n\nKończe\!\!\!'
	  error_dir="Nie można utworzyć katalogu"
	  error_dir2="Proszę użyć innej nazwy, ponieważ katalog o takiej nazwie już istnieje."
	  error_send="Nie można przesłać"
	  error_send2="nie istnieje lub podano błędną scieżkę!"
	;;

	*)
	  scripts_name='Image converter'
	  choice_column='Choice'
	  more_options_column='More option'
	  scale_column='Available resolution'
	  compres_text_column='Compression format'
	  compres_text_column2='Supports'
	  new_file_name_text='Save as?'
	  options_rename='Rename...'
	  options_compress_files='Compress files (.zip. tar.gz)'
	  options_send_file_to='Send compressed to...'
	  send_file_desktop='Desktop'
	  send_file_dropbox='Public Directory (Dropbox)'
	  send_file_alternative='Other'
	  options_text='Selected additional options from the list below'
	  scale_text='Select option from the list'
	  compres_text='Select option from the list'
	  send_file_text='Enter the location to send the archive'
	  quality_text='Set Image quality'
	  dir_text='Album name?'
	  window_progress='Conversion progress'
	  place_of_destination_column="Destination"
	  compres_to='To:'
	  compres_from='#From:'
	  warning_text='That script needed a program to work \"Convert\!\"\n\nYou can install it enter to the terminal:\n sudo apt-get install imagemagick\n\nI need stop\!\!\!'
	  error_dir="You can't create directory"
	  error_dir2="This name is already used in this directory.\n\nPlease use a different name."
	  error_send="I can't send"
	  error_send2="does not exist or the path is incorrect!"
	;;

esac

#
[ `which convert` ] \
  || { zenity --warning --title="$scripts_name" --text="$warning_text"; exit 1; }

#Dodatkowe opcje do wyboru
OPTIONS=$( zenity --title="$scripts_name" --text="$options_text" --list --checklist --column="$choice_column" --column="$more_options_column" \
	FALSE "$options_rename" \
	FALSE "$options_compress_files" \
	FALSE "$options_send_file_to" )
	  [ "$?" = 1 ] && exit 1

#Rozdzielczość konwertowanych zdjęć
SCALE=$( zenity --title="$scripts_name" --text="$scale_text" --list --radiolist --column="$choice_column" --column="$scale_column" \
	TRUE '1024x768' \
	FALSE '1152x864' \
	FALSE '1280x960' \
	FALSE '1280x1024' \
	FALSE '1360x768' \
	FALSE '1400x1058' \
	FALSE '1400x900' \
	FALSE '1600x1024' \
	FALSE '1600x1200' )
	  [ "$?" = 1 ] && exit 1

#Jakość konwertowanych zdjęć
QUALITY=$( zenity --scale --title="$scripts_name" --text="$quality_text" --min-value=1 --max-value=100 --value=85 )
	  [ "$?" = 1 ] && exit 1

#Nazwa dla zdjęć 
echo "$OPTIONS" | grep -q "$options_rename" \
	&& { NEW_FILE_NAME=$( zenity --entry --title="$scripts_name" --text="$new_file_name_text" ); DIALOG_NAME="$?"; }
	  [ "$DIALOG_NAME" = 1 ] && exit 1

#Nazwa Albumu
DIR=$( zenity --entry  --title="$scripts_name" --text="$dir_text" ) ; DIALOG_DIR="$?"

  [ "$DIALOG_DIR" = 0 ] && [ -z "$DIR" ] && DIR="Album-$(date +%d.%m.%Y_%X)"
  [ "$DIALOG_DIR" = 1 ] && exit 1
  [ ! -d "$DIR" ] \
	&& mkdir -p "$DIR" \
	|| { zenity --error --title="$scripts_name" --text="$error_dir '${DIR}'.\n$error_dir2"; exit 1; }

#Wyślij plik do
echo "$OPTIONS" | grep -q "$options_send_file_to" \
	&& { SEND_FILE=$( zenity --width=300 --height=215 --title="$scripts_name" --text="$send_file_text" --list --radiolist --column="$choice_column" --column=‪"$place_of_destination_column" \
	TRUE "$send_file_desktop" \
	FALSE "$send_file_dropbox" \
	FALSE "$send_file_alternative" ); \
	DIALOG_SEND="$?"; }
	  [ "$DIALOG_SEND" = 1 ] && exit 1

	[ "$SEND_FILE" = "$send_file_alternative" ] \
	&& { SEND_FILE_OTHER=$( zenity --entry --title="$scripts_name" --text="$send_file_text" --entry-text="$HOME" ); DIALOG_SEND="$?"; }
	  [ "$DIALOG_SEND" = 1 ] && exit 1

#Kompresacja pliku
echo "$OPTIONS" | grep -q "$options_compress_files" \
	&& { COMPRES=$( zenity --width=300 --height=215 --title="$scripts_name" --text="$compres_text" --list --radiolist --column="$choice_column" --column="$compres_text_column" --column="$compres_text_column2" \
	FALSE '.zip' 'Windows' \
	FALSE '.tar.gz' 'GNU/Linux' ); \
	 DIALOG_COMPRES="$?"; }
	  [ "$DIALOG_COMPRES" = 1 ] && exit 1

#Okno z postępem
NUMBER_OF_FILES=`file -b "$@" | grep -c ?*P.G` #Zliczenie tylko plików JPEG i PNG w zmiennej $@
INCREMENT=$( echo "scale=3 ; (100/$NUMBER_OF_FILES)" | bc ) #Przyrost dla paska postępu
PROGRESS=0
NUMBER_OF_NEW_FILES=1 #numer nowej nazwy dla pliku
#End=========================================

(for FILE in "$@"
do
  
 file -b "$FILE" | grep -q ?*P.G \
  && { echo "$compres_from  $FILE  $compres_to"  "${NEW_FILE_NAME} ""${NUMBER_OF_NEW_FILES}.jpg (${NUMBER_OF_FILES})";
   convert "$FILE" -resize "$SCALE" -quality "$QUALITY" "$DIR"/"${NEW_FILE_NAME} ""${NUMBER_OF_NEW_FILES}.jpg";
   jhead -autorot "$DIR"/"${NEW_FILE_NAME} ""${NUMBER_OF_NEW_FILES}.jpg";

   PROGRESS=$( echo "scale=3 ; ($PROGRESS+$INCREMENT)" | bc );
   NUMBER_OF_NEW_FILES=$[NUMBER_OF_NEW_FILES + 1];
	
	echo "$PROGRESS"; }

done
) | zenity --width=250 --height=100 --title="$window_progress" --progress --auto-close

#Kompresacja zdjęć

[ "$COMPRES" = '.zip' ] \
  && zip -r "${DIR}.zip" "$DIR"

[ "$COMPRES" = '.tar.gz' ] \
  && tar cf "${DIR}.tar" "$DIR" && gzip "${DIR}.tar"

#
. $HOME/.config/user-dirs.dirs 2> /dev/null

#Wyślij do

[ "$SEND_FILE" = "$send_file_desktop" ] \
  && mv "$DIR$COMPRES" "$XDG_DESKTOP_DIR" | zenity --progress --pulsate --auto-close

[ "$SEND_FILE" = "$send_file_dropbox" ] && [ -d "$HOME/Dropbox" ] \
  && mv "$DIR$COMPRES" "$HOME/Dropbox/Public" | zenity --progress --pulsate --auto-close

[ "$SEND_FILE" = "$send_file_alternative" ] && [ -d "$SEND_FILE_OTHER" ] \
  && mv "$DIR$COMPRES" "$SEND_FILE_OTHER" | zenity --progress --pulsate --auto-close

[ "$SEND_FILE" = "$send_file_alternative" ] && [ ! -d "$SEND_FILE_OTHER" ] \
  && { zenity --error --title="$scripts_name" --text="$error_send '${SEND_FILE}'.\n'$SEND_FILE_OTHER' $error_send2"; exit 1; }
