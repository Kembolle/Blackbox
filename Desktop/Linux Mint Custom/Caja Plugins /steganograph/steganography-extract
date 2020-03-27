#!/bin/sh

pass=$(zenity --password --title  "Enter password: " --width 300)
file=$1

unzip -P $pass $1

ans=`echo $?`
if [ "$ans" -eq "1" ]
       	then
   
   echo " The password: '$pass' was correct!\n$1 successfuly extracted!!" 2>&1 | zenity --text-info --title "Success!!" --width 250 --height 200
   exit 0
   
   elif  [ "$ans" -eq "82" ]
   then 
   echo " The password: '$pass' is incorrect!" 2>&1 | zenity --text-info --title "Error!!" --width 250 --height 200
   exit 0
   
        else
                  echo "Something went wrong!" 2>&1 | zenity --text-info --title "Error!!" --width 250 --height 200
                  
 fi                      	
 exit 0
