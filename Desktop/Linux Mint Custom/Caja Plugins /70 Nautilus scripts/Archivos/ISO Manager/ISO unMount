#!/bin/bash
# unmount

gksudo -k /bin/echo "got r00t?"

BASENAME=`basename $NAUTILUS_SCRIPT_SELECTED_FILE_PATHS .iso`

sudo umount "/media/$BASENAME"

sudo rmdir "/media/$BASENAME"

zenity --info --text "Successfully unmounted /media/$BASENAME"

exit 0
