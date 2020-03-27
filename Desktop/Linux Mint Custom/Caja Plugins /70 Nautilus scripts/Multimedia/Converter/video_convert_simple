#!/bin/sh

# Get current path
mypath="`pwd`"
for filename in "$@"
do
if [ -n "$*,?" ];then
	mencoder -ovc xvid -xvidencopts pass=1 -oac mp3lame "$mypath/$filename" -o "$mypath/$filename.avi" 2>&1 | awk -vRS="\r" '$1 ~ /Pos/ {gsub(/Pos:/," ");gsub(/%\)/," ");gsub(/ \(/," ");print $3"\n#Posición :\\t"$1"\\nCuadro :\\t"$2"\\nPorcentaje :\\t"$3"%\\nRadio de cuadros :\\t"$4"\\nTiempo restante :\\t"$6; fflush();}' | zenity --progress --auto-kill --auto-close --title="Progreso"
fi
done
{
zenity --info --text="El vídeo ya se convirtió a avi!	:)"
}
exit 0
