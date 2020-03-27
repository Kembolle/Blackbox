#!/bin/bash
# mount

gksudo -k /bin/echo "got r00t?"

BASENAME=`basename $NAUTILUS_SCRIPT_SELECTED_FILE_PATHS .iso`

sudo mkdir "/media/$BASENAME"

zenity --info --title "ISO Mounter" --text "$BASENAME e $NAUTILUS_SCRIPT_SELECTED_FILE_PATHS"


if sudo mount -o loop -t iso9660 $NAUTILUS_SCRIPT_SELECTED_FILE_PATHS "/media/$BASENAME"
then
if zenity --question --title "ISO Mounter" --text "$BASENAME Successfully Mounted. Open Volume?"

then
nautilus /media/"$BASENAME" --no-desktop
fi

exit 0
else
sudo rmdir "/media/$BASENAME"

zenity --error --title "ISO Mounter" --text "Cannot mount $BASENAME!"

exit 1
fi
