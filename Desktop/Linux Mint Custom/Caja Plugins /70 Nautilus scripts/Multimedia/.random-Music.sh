#!/bin/bash

# Si desea tener los colores originales de la terminal debe eliminar
# las lineas donde "echo -en $color", y el segundo "clear",
# debajo de "echo -en $white"

    # Colour Codes
    black='\E[30;40m'
    red='\E[31;40m'
    green='\E[32;40m'
    yellow='\E[33;40m'
    blue='\E[34;40m'
    magenta='\E[35;40m'
    cyan='\E[36;40m'
    white='\E[37;40m'

clear
echo -en $white
clear
echo "-------------------------------------------"
echo " Qué quieres escuchar"
echo -en $red
echo "-------------------------------------------"
echo "-1- una banda en especifico"
echo "-2- la musica de ésta carpeta"
echo "-3- toda la musica de ~/Música"
echo "-------------------------------------------"
echo "-------------------------------------------"
read opcion
echo " as seleccionado la opcion #$opcion"  
echo "-------------------------------------------"
echo " ¿quieres que sea  shuffle? si o no"
echo "-------------------------------------------"
read shu
if [ $shu = si ];then 
x="-shuffle" 
else
x=""
fi
if [ $opcion = 1 ]; then
echo -en $cyan
echo "-------------------------------------------"
echo " selecciona una banda"
echo "-------------------------------------------"
ls
echo "-------------------------------------------"
read name
cd $name
mplayer *.mp3 */*.mp3  */*/*.mp3 */*/*/*.mp3  */*/*/*/*.mp3  *.wav */*.wav  */*/*.wav */*/*/*.wav  */*/*/*/*.wav  *.flac */*.flac  */*/*.flac */*/*/*.flac  */*/*/*/*.flac *.m3u */*.m3u  */*/*.m3u */*/*/*.m3u  */*/*/*/*.m3u *.aac */*.aac  */*/*.aac */*/*/*.aac  */*/*/*/*.aac *.m4a */*.m4a  */*/*.m4a */*/*/*.m4a  */*/*/*/*.m4a *.ogg */*.ogg  */*/*.ogg */*/*/*.ogg  */*/*/*/*.ogg $x
fi
if [ $opcion = 2 ]; then
echo -en $cyan
mplayer *.mp3 */*.mp3  */*/*.mp3 */*/*/*.mp3  */*/*/*/*.mp3  *.wav */*.wav  */*/*.wav */*/*/*.wav  */*/*/*/*.wav  *.flac */*.flac  */*/*.flac */*/*/*.flac  */*/*/*/*.flac *.m3u */*.m3u  */*/*.m3u */*/*/*.m3u  */*/*/*/*.m3u *.aac */*.aac  */*/*.aac */*/*/*.aac  */*/*/*/*.aac *.m4a */*.m4a  */*/*.m4a */*/*/*.m4a  */*/*/*/*.m4a *.ogg */*.ogg  */*/*.ogg */*/*/*.ogg  */*/*/*/*.ogg $x
fi
if [ $opcion = 3 ]; then
echo -en $cyan
echo "-------------------------------------------"
cd "$HOME/Música"
mplayer *.mp3 */*.mp3  */*/*.mp3 */*/*/*.mp3  */*/*/*/*.mp3  *.wav */*.wav  */*/*.wav */*/*/*.wav  */*/*/*/*.wav  *.flac */*.flac  */*/*.flac */*/*/*.flac  */*/*/*/*.flac *.m3u */*.m3u  */*/*.m3u */*/*/*.m3u  */*/*/*/*.m3u *.aac */*.aac  */*/*.aac */*/*/*.aac  */*/*/*/*.aac *.m4a */*.m4a  */*/*.m4a */*/*/*.m4a  */*/*/*/*.m4a *.ogg */*.ogg  */*/*.ogg */*/*/*.ogg  */*/*/*/*.ogg $x
fi

