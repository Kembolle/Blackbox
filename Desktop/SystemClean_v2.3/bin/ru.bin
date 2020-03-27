#!/bin/bash

 #===========================================================================================#
#                                                                                             #
#                                 SystemClean v2.3 04-06-2015                                 #
#                                 ---------------------------                                 #
#                                                                                             #
#                                                                                             #
#                   This script created by vagrale13 (vagrale@gmail.com)                      #
#           to easy clean your system and home folder from cache and unneeded files.          #
#                                                                                             #
#                             Project page: http://goo.gl/7UXUs                               #
#                                                                                             #
#                          Special thanks for Translated By: Jalkoby                          #
#                                                                                             #
#                                                                                             #
 #===========================================================================================#


user=`whoami`
info=$(cat /home/$user/.systemclean/config | grep ":")
aptitude=$(ls /usr/share/ | grep "aptitude")
installpack=$(dpkg --get-selections | grep -c "install")
used=$(cat /home/$user/.systemclean/date.txt | tail -n 10)
sys_clean=$(sleep 1 ; cat /home/$user/.systemclean/date.txt | tail -n 30)
varlog=$(du -sh /var/log | awk -F " " '{print $1}')
byte=$(echo "B")
numberker=$(dpkg -l 'linux-*' | sed '/^ii/!d;/'"$(uname -r | sed "s/\(.*\)-\([^0-9]\+\)/\1/")"'/d;s/^[^ ]* [^ ]* \([^ ]*\).*/\1/;/[0-9]/!d' | grep -c "linux")
kern1=$(dpkg -l 'linux-*' | sed '/^ii/!d;/'"$(uname -r | sed "s/\(.*\)-\([^0-9]\+\)/\1/")"'/d;s/^[^ ]* [^ ]* \([^ ]*\).*/\1/;/[0-9]/!d' | head -n 1 | tail -n 1)
kern2=$(dpkg -l 'linux-*' | sed '/^ii/!d;/'"$(uname -r | sed "s/\(.*\)-\([^0-9]\+\)/\1/")"'/d;s/^[^ ]* [^ ]* \([^ ]*\).*/\1/;/[0-9]/!d' | head -n 2 | tail -n 1)
kern3=$(dpkg -l 'linux-*' | sed '/^ii/!d;/'"$(uname -r | sed "s/\(.*\)-\([^0-9]\+\)/\1/")"'/d;s/^[^ ]* [^ ]* \([^ ]*\).*/\1/;/[0-9]/!d' | head -n 3 | tail -n 1)
kern4=$(dpkg -l 'linux-*' | sed '/^ii/!d;/'"$(uname -r | sed "s/\(.*\)-\([^0-9]\+\)/\1/")"'/d;s/^[^ ]* [^ ]* \([^ ]*\).*/\1/;/[0-9]/!d' | head -n 4 | tail -n 1)
kern5=$(dpkg -l 'linux-*' | sed '/^ii/!d;/'"$(uname -r | sed "s/\(.*\)-\([^0-9]\+\)/\1/")"'/d;s/^[^ ]* [^ ]* \([^ ]*\).*/\1/;/[0-9]/!d' | head -n 5 | tail -n 1)
kern6=$(dpkg -l 'linux-*' | sed '/^ii/!d;/'"$(uname -r | sed "s/\(.*\)-\([^0-9]\+\)/\1/")"'/d;s/^[^ ]* [^ ]* \([^ ]*\).*/\1/;/[0-9]/!d' | head -n 6 | tail -n 1)
kern7=$(dpkg -l 'linux-*' | sed '/^ii/!d;/'"$(uname -r | sed "s/\(.*\)-\([^0-9]\+\)/\1/")"'/d;s/^[^ ]* [^ ]* \([^ ]*\).*/\1/;/[0-9]/!d' | head -n 7 | tail -n 1)
kern8=$(dpkg -l 'linux-*' | sed '/^ii/!d;/'"$(uname -r | sed "s/\(.*\)-\([^0-9]\+\)/\1/")"'/d;s/^[^ ]* [^ ]* \([^ ]*\).*/\1/;/[0-9]/!d' | head -n 8 | tail -n 1)
kern9=$(dpkg -l 'linux-*' | sed '/^ii/!d;/'"$(uname -r | sed "s/\(.*\)-\([^0-9]\+\)/\1/")"'/d;s/^[^ ]* [^ ]* \([^ ]*\).*/\1/;/[0-9]/!d' | head -n 9 | tail -n 1)
kern10=$(dpkg -l 'linux-*' | sed '/^ii/!d;/'"$(uname -r | sed "s/\(.*\)-\([^0-9]\+\)/\1/")"'/d;s/^[^ ]* [^ ]* \([^ ]*\).*/\1/;/[0-9]/!d' | head -n 10 | tail -n 1)
kern11=$(dpkg -l 'linux-*' | sed '/^ii/!d;/'"$(uname -r | sed "s/\(.*\)-\([^0-9]\+\)/\1/")"'/d;s/^[^ ]* [^ ]* \([^ ]*\).*/\1/;/[0-9]/!d' | head -n 11 | tail -n 1)
kern12=$(dpkg -l 'linux-*' | sed '/^ii/!d;/'"$(uname -r | sed "s/\(.*\)-\([^0-9]\+\)/\1/")"'/d;s/^[^ ]* [^ ]* \([^ ]*\).*/\1/;/[0-9]/!d' | head -n 12 | tail -n 1)
kern13=$(dpkg -l 'linux-*' | sed '/^ii/!d;/'"$(uname -r | sed "s/\(.*\)-\([^0-9]\+\)/\1/")"'/d;s/^[^ ]* [^ ]* \([^ ]*\).*/\1/;/[0-9]/!d' | head -n 13 | tail -n 1)
kern14=$(dpkg -l 'linux-*' | sed '/^ii/!d;/'"$(uname -r | sed "s/\(.*\)-\([^0-9]\+\)/\1/")"'/d;s/^[^ ]* [^ ]* \([^ ]*\).*/\1/;/[0-9]/!d' | head -n 14 | tail -n 1)
kern15=$(dpkg -l 'linux-*' | sed '/^ii/!d;/'"$(uname -r | sed "s/\(.*\)-\([^0-9]\+\)/\1/")"'/d;s/^[^ ]* [^ ]* \([^ ]*\).*/\1/;/[0-9]/!d' | head -n 15 | tail -n 1)
kern16=$(dpkg -l 'linux-*' | sed '/^ii/!d;/'"$(uname -r | sed "s/\(.*\)-\([^0-9]\+\)/\1/")"'/d;s/^[^ ]* [^ ]* \([^ ]*\).*/\1/;/[0-9]/!d' | head -n 16 | tail -n 1)
kern17=$(dpkg -l 'linux-*' | sed '/^ii/!d;/'"$(uname -r | sed "s/\(.*\)-\([^0-9]\+\)/\1/")"'/d;s/^[^ ]* [^ ]* \([^ ]*\).*/\1/;/[0-9]/!d' | head -n 17 | tail -n 1)
kern18=$(dpkg -l 'linux-*' | sed '/^ii/!d;/'"$(uname -r | sed "s/\(.*\)-\([^0-9]\+\)/\1/")"'/d;s/^[^ ]* [^ ]* \([^ ]*\).*/\1/;/[0-9]/!d' | head -n 18 | tail -n 1)
kern19=$(dpkg -l 'linux-*' | sed '/^ii/!d;/'"$(uname -r | sed "s/\(.*\)-\([^0-9]\+\)/\1/")"'/d;s/^[^ ]* [^ ]* \([^ ]*\).*/\1/;/[0-9]/!d' | head -n 19 | tail -n 1)
kern20=$(dpkg -l 'linux-*' | sed '/^ii/!d;/'"$(uname -r | sed "s/\(.*\)-\([^0-9]\+\)/\1/")"'/d;s/^[^ ]* [^ ]* \([^ ]*\).*/\1/;/[0-9]/!d' | head -n 20 | tail -n 1)
kern21=$(dpkg -l 'linux-*' | sed '/^ii/!d;/'"$(uname -r | sed "s/\(.*\)-\([^0-9]\+\)/\1/")"'/d;s/^[^ ]* [^ ]* \([^ ]*\).*/\1/;/[0-9]/!d' | head -n 21 | tail -n 1)
kern22=$(dpkg -l 'linux-*' | sed '/^ii/!d;/'"$(uname -r | sed "s/\(.*\)-\([^0-9]\+\)/\1/")"'/d;s/^[^ ]* [^ ]* \([^ ]*\).*/\1/;/[0-9]/!d' | head -n 22 | tail -n 1)
kern23=$(dpkg -l 'linux-*' | sed '/^ii/!d;/'"$(uname -r | sed "s/\(.*\)-\([^0-9]\+\)/\1/")"'/d;s/^[^ ]* [^ ]* \([^ ]*\).*/\1/;/[0-9]/!d' | head -n 23 | tail -n 1)
kern24=$(dpkg -l 'linux-*' | sed '/^ii/!d;/'"$(uname -r | sed "s/\(.*\)-\([^0-9]\+\)/\1/")"'/d;s/^[^ ]* [^ ]* \([^ ]*\).*/\1/;/[0-9]/!d' | head -n 24 | tail -n 1)
kern25=$(dpkg -l 'linux-*' | sed '/^ii/!d;/'"$(uname -r | sed "s/\(.*\)-\([^0-9]\+\)/\1/")"'/d;s/^[^ ]* [^ ]* \([^ ]*\).*/\1/;/[0-9]/!d' | head -n 25 | tail -n 1)
kern26=$(dpkg -l 'linux-*' | sed '/^ii/!d;/'"$(uname -r | sed "s/\(.*\)-\([^0-9]\+\)/\1/")"'/d;s/^[^ ]* [^ ]* \([^ ]*\).*/\1/;/[0-9]/!d' | head -n 26 | tail -n 1)
kern27=$(dpkg -l 'linux-*' | sed '/^ii/!d;/'"$(uname -r | sed "s/\(.*\)-\([^0-9]\+\)/\1/")"'/d;s/^[^ ]* [^ ]* \([^ ]*\).*/\1/;/[0-9]/!d' | head -n 27 | tail -n 1)
kern28=$(dpkg -l 'linux-*' | sed '/^ii/!d;/'"$(uname -r | sed "s/\(.*\)-\([^0-9]\+\)/\1/")"'/d;s/^[^ ]* [^ ]* \([^ ]*\).*/\1/;/[0-9]/!d' | head -n 28 | tail -n 1)
kern29=$(dpkg -l 'linux-*' | sed '/^ii/!d;/'"$(uname -r | sed "s/\(.*\)-\([^0-9]\+\)/\1/")"'/d;s/^[^ ]* [^ ]* \([^ ]*\).*/\1/;/[0-9]/!d' | head -n 29 | tail -n 1)
kern30=$(dpkg -l 'linux-*' | sed '/^ii/!d;/'"$(uname -r | sed "s/\(.*\)-\([^0-9]\+\)/\1/")"'/d;s/^[^ ]* [^ ]* \([^ ]*\).*/\1/;/[0-9]/!d' | head -n 30 | tail -n 1)
kern31=$(dpkg -l 'linux-*' | sed '/^ii/!d;/'"$(uname -r | sed "s/\(.*\)-\([^0-9]\+\)/\1/")"'/d;s/^[^ ]* [^ ]* \([^ ]*\).*/\1/;/[0-9]/!d' | head -n 31 | tail -n 1)
kern32=$(dpkg -l 'linux-*' | sed '/^ii/!d;/'"$(uname -r | sed "s/\(.*\)-\([^0-9]\+\)/\1/")"'/d;s/^[^ ]* [^ ]* \([^ ]*\).*/\1/;/[0-9]/!d' | head -n 32 | tail -n 1)
kern33=$(dpkg -l 'linux-*' | sed '/^ii/!d;/'"$(uname -r | sed "s/\(.*\)-\([^0-9]\+\)/\1/")"'/d;s/^[^ ]* [^ ]* \([^ ]*\).*/\1/;/[0-9]/!d' | head -n 33 | tail -n 1)
kern34=$(dpkg -l 'linux-*' | sed '/^ii/!d;/'"$(uname -r | sed "s/\(.*\)-\([^0-9]\+\)/\1/")"'/d;s/^[^ ]* [^ ]* \([^ ]*\).*/\1/;/[0-9]/!d' | head -n 34 | tail -n 1)
kern35=$(dpkg -l 'linux-*' | sed '/^ii/!d;/'"$(uname -r | sed "s/\(.*\)-\([^0-9]\+\)/\1/")"'/d;s/^[^ ]* [^ ]* \([^ ]*\).*/\1/;/[0-9]/!d' | head -n 35 | tail -n 1)
kern36=$(dpkg -l 'linux-*' | sed '/^ii/!d;/'"$(uname -r | sed "s/\(.*\)-\([^0-9]\+\)/\1/")"'/d;s/^[^ ]* [^ ]* \([^ ]*\).*/\1/;/[0-9]/!d' | head -n 36 | tail -n 1)
kern37=$(dpkg -l 'linux-*' | sed '/^ii/!d;/'"$(uname -r | sed "s/\(.*\)-\([^0-9]\+\)/\1/")"'/d;s/^[^ ]* [^ ]* \([^ ]*\).*/\1/;/[0-9]/!d' | head -n 37 | tail -n 1)
kern38=$(dpkg -l 'linux-*' | sed '/^ii/!d;/'"$(uname -r | sed "s/\(.*\)-\([^0-9]\+\)/\1/")"'/d;s/^[^ ]* [^ ]* \([^ ]*\).*/\1/;/[0-9]/!d' | head -n 38 | tail -n 1)
kern39=$(dpkg -l 'linux-*' | sed '/^ii/!d;/'"$(uname -r | sed "s/\(.*\)-\([^0-9]\+\)/\1/")"'/d;s/^[^ ]* [^ ]* \([^ ]*\).*/\1/;/[0-9]/!d' | head -n 39 | tail -n 1)
kern40=$(dpkg -l 'linux-*' | sed '/^ii/!d;/'"$(uname -r | sed "s/\(.*\)-\([^0-9]\+\)/\1/")"'/d;s/^[^ ]* [^ ]* \([^ ]*\).*/\1/;/[0-9]/!d' | head -n 40 | tail -n 1)
kern41=$(dpkg -l 'linux-*' | sed '/^ii/!d;/'"$(uname -r | sed "s/\(.*\)-\([^0-9]\+\)/\1/")"'/d;s/^[^ ]* [^ ]* \([^ ]*\).*/\1/;/[0-9]/!d' | head -n 41 | tail -n 1)
kern42=$(dpkg -l 'linux-*' | sed '/^ii/!d;/'"$(uname -r | sed "s/\(.*\)-\([^0-9]\+\)/\1/")"'/d;s/^[^ ]* [^ ]* \([^ ]*\).*/\1/;/[0-9]/!d' | head -n 42 | tail -n 1)
kern43=$(dpkg -l 'linux-*' | sed '/^ii/!d;/'"$(uname -r | sed "s/\(.*\)-\([^0-9]\+\)/\1/")"'/d;s/^[^ ]* [^ ]* \([^ ]*\).*/\1/;/[0-9]/!d' | head -n 43 | tail -n 1)
kern44=$(dpkg -l 'linux-*' | sed '/^ii/!d;/'"$(uname -r | sed "s/\(.*\)-\([^0-9]\+\)/\1/")"'/d;s/^[^ ]* [^ ]* \([^ ]*\).*/\1/;/[0-9]/!d' | head -n 44 | tail -n 1)
kern45=$(dpkg -l 'linux-*' | sed '/^ii/!d;/'"$(uname -r | sed "s/\(.*\)-\([^0-9]\+\)/\1/")"'/d;s/^[^ ]* [^ ]* \([^ ]*\).*/\1/;/[0-9]/!d' | head -n 45 | tail -n 1)
kern46=$(dpkg -l 'linux-*' | sed '/^ii/!d;/'"$(uname -r | sed "s/\(.*\)-\([^0-9]\+\)/\1/")"'/d;s/^[^ ]* [^ ]* \([^ ]*\).*/\1/;/[0-9]/!d' | head -n 46 | tail -n 1)
kern47=$(dpkg -l 'linux-*' | sed '/^ii/!d;/'"$(uname -r | sed "s/\(.*\)-\([^0-9]\+\)/\1/")"'/d;s/^[^ ]* [^ ]* \([^ ]*\).*/\1/;/[0-9]/!d' | head -n 47 | tail -n 1)
kern48=$(dpkg -l 'linux-*' | sed '/^ii/!d;/'"$(uname -r | sed "s/\(.*\)-\([^0-9]\+\)/\1/")"'/d;s/^[^ ]* [^ ]* \([^ ]*\).*/\1/;/[0-9]/!d' | head -n 48 | tail -n 1)
kern49=$(dpkg -l 'linux-*' | sed '/^ii/!d;/'"$(uname -r | sed "s/\(.*\)-\([^0-9]\+\)/\1/")"'/d;s/^[^ ]* [^ ]* \([^ ]*\).*/\1/;/[0-9]/!d' | head -n 49 | tail -n 1)
kern50=$(dpkg -l 'linux-*' | sed '/^ii/!d;/'"$(uname -r | sed "s/\(.*\)-\([^0-9]\+\)/\1/")"'/d;s/^[^ ]* [^ ]* \([^ ]*\).*/\1/;/[0-9]/!d' | head -n 50 | tail -n 1)

echo "" > /home/$user/.systemclean/1.log
echo "" > /home/$user/.systemclean/2.log
mv /home/$user/.systemclean/results.html /home/$user/.systemclean/results_old.html
sed -e '18,50d' /home/$user/.systemclean/info.html > /home/$user/.systemclean/tmp.html
mv /home/$user/.systemclean/tmp.html /home/$user/.systemclean/info.html

sleep 1 ; date +%a' '%d' '%b','%Y' '%H:%M''%p >> /home/$user/.systemclean/date.txt

echo "<html><body bgcolor=black text=lime link=#F70D1A><code><pre>
$info

********************************************************************

Перед очисткой:
--------------------------------------<font color=lightgrey>" > /home/$user/.systemclean/results.html
df -Th | grep -v "fs" | sort >> /home/$user/.systemclean/results.html
echo "
$installpack пакетов" >> /home/$user/.systemclean/results.html

echo "-----------------------------
-- </font><font color=lightgrey>SystemClean использован</font><font color=green> --
-----------------------------
</font><font color=lightgrey>$used</font><font color=green>
-----------------------<br></font><font color=lightgrey>
<b>Перед началом операций закройте все программы!</b><br>
</font></pre></code></body></html>" >> /home/$user/.systemclean/info.html

zenity --text-info --title="SystemClean" --width="560" --height="600" --cancel-label="Выход" --ok-label="Продолжить" --window-icon="/home/$user/.systemclean/systemclean.png" --html --filename="/home/$user/.systemclean/info.html"

if [ $? -eq 1 ] ; then
        zenity --info \
          --text="Очистка отменена." --timeout=1
exit 1
fi

if [ "$aptitude" = "" ]; then
        zenity --info \
          --text="Для выполнения\nочистки необходим установленный библиотеку <u><b>aptitude</b></u>\nУстановите библиотеку и перезапустите <i>SystemClean</i>."

zenity --title "Установить aptitude" --question --text="Вы хотите установить приложение <b>aptitude</b>?" --width="370" --ok-label="Установка" --cancel-label="Отмена"

if [ $? -eq 0 ] ; then
x-www-browser apt://aptitude
exit 0
fi
exit 0
fi

if [ "$numberker" = "0" ] ; then

respo=$(zenity  --list  --width="600"  --height="350" --window-icon="/home/$user/.systemclean/systemclean.png" --text "Выберете что выполнить для очистки системы.\n\nЕсли вы не хотите ничего выбрать, нажмите <b>OK</b>!" --checklist  --column "Выберете" --column "" FALSE "Autoremove" FALSE "Clean" FALSE "Autoclean" FALSE "Очистка_ненужных_файлов" FALSE "Удалить_хранимые_списки - Вы должны быть подключение к интернету" FALSE "Кэш_памяти - Осторожно, используйте это на свой риск" FALSE "System_Logs - /var/log/ ($varlog$byte)" FLASE "/tmp" FALSE "Trash - root"  --separator=":")
fi

if [ "$numberker" = "1" ] ; then

respo=$(zenity  --list  --width="600"  --height="360" --window-icon="/home/$user/.systemclean/systemclean.png" --text "Выберете что выполнить для очистки системы.\n\nЕсли вы не хотите ничего выбрать, нажмите <b>OK</b>!" --checklist  --column "Выберете" --column "" FALSE "Autoremove" FALSE "Clean" FALSE "Autoclean" FALSE "Очистка_ненужных_файлов" FALSE "Удалить_хранимые_списки - Вы должны быть подключение к интернету" FALSE "Кэш_памяти - Осторожно, используйте это на свой риск" FALSE "System_Logs - /var/log/ ($varlog$byte)" FLASE "/tmp" FALSE "Trash - root" FALSE "$kern1"  --separator=":")
fi


if [ "$numberker" = "2" ] ; then

respo=$(zenity  --list  --width="600"  --height="380" --window-icon="/home/$user/.systemclean/systemclean.png" --text "Выберете что выполнить для очистки системы.\n\nЕсли вы не хотите ничего выбрать, нажмите <b>OK</b>!" --checklist  --column "Выберете" --column "" FALSE "Autoremove" FALSE "Clean" FALSE "Autoclean" FALSE "Очистка_ненужных_файлов" FALSE "Удалить_хранимые_списки - Вы должны быть подключение к интернету" FALSE "Кэш_памяти - Осторожно, используйте это на свой риск" FALSE "System_Logs - /var/log/ ($varlog$byte)" FLASE "/tmp" FALSE "Trash - root" FALSE "$kern1" FALSE "$kern2"  --separator=":")
fi

if [ "$numberker" = "3" ] ; then

respo=$(zenity  --list  --width="600"  --height="400" --window-icon="/home/$user/.systemclean/systemclean.png" --text "Выберете что выполнить для очистки системы.\n\nЕсли вы не хотите ничего выбрать, нажмите <b>OK</b>!" --checklist  --column "Выберете" --column "" FALSE "Autoremove" FALSE "Clean" FALSE "Autoclean" FALSE "Очистка_ненужных_файлов" FALSE "Удалить_хранимые_списки - Вы должны быть подключение к интернету" FALSE "Кэш_памяти - Осторожно, используйте это на свой риск" FALSE "System_Logs - /var/log/ ($varlog$byte)" FLASE "/tmp" FALSE "Trash - root" FALSE "$kern1" FALSE "$kern2" FALSE "$kern3"  --separator=":")
fi

if [ "$numberker" = "4" ] ; then

respo=$(zenity  --list  --width="600"  --height="430" --window-icon="/home/$user/.systemclean/systemclean.png" --text "Выберете что выполнить для очистки системы.\n\nЕсли вы не хотите ничего выбрать, нажмите <b>OK</b>!" --checklist  --column "Выберете" --column "" FALSE "Autoremove" FALSE "Clean" FALSE "Autoclean" FALSE "Очистка_ненужных_файлов" FALSE "Удалить_хранимые_списки - Вы должны быть подключение к интернету" FALSE "Кэш_памяти - Осторожно, используйте это на свой риск" FALSE "System_Logs - /var/log/ ($varlog$byte)" FLASE "/tmp" FALSE "Trash - root" FALSE "$kern1" FALSE "$kern2" FALSE "$kern3" FALSE "$kern4"  --separator=":")
fi

if [ "$numberker" = "5" ] ; then

respo=$(zenity  --list  --width="600"  --height="450" --window-icon="/home/$user/.systemclean/systemclean.png" --text "Выберете что выполнить для очистки системы.\n\nЕсли вы не хотите ничего выбрать, нажмите <b>OK</b>!" --checklist  --column "Выберете" --column "" FALSE "Autoremove" FALSE "Clean" FALSE "Autoclean" FALSE "Очистка_ненужных_файлов" FALSE "Удалить_хранимые_списки - Вы должны быть подключение к интернету" FALSE "Кэш_памяти - Осторожно, используйте это на свой риск" FALSE "System_Logs - /var/log/ ($varlog$byte)" FLASE "/tmp" FALSE "Trash - root" FALSE "$kern1" FALSE "$kern2" FALSE "$kern3" FALSE "$kern4" FALSE "$kern5"  --separator=":")
fi

if [ "$numberker" = "6" ] ; then

respo=$(zenity  --list  --width="600"  --height="470" --window-icon="/home/$user/.systemclean/systemclean.png" --text "Выберете что выполнить для очистки системы.\n\nЕсли вы не хотите ничего выбрать, нажмите <b>OK</b>!" --checklist  --column "Выберете" --column "" FALSE "Autoremove" FALSE "Clean" FALSE "Autoclean" FALSE "Очистка_ненужных_файлов" FALSE "Удалить_хранимые_списки - Вы должны быть подключение к интернету" FALSE "Кэш_памяти - Осторожно, используйте это на свой риск" FALSE "System_Logs - /var/log/ ($varlog$byte)" FLASE "/tmp" FALSE "Trash - root" FALSE "$kern1" FALSE "$kern2" FALSE "$kern3" FALSE "$kern4" FALSE "$kern5" FALSE "$kern6"  --separator=":")
fi

if [ "$numberker" = "7" ] ; then

respo=$(zenity  --list  --width="600"  --height="500" --window-icon="/home/$user/.systemclean/systemclean.png" --text "Выберете что выполнить для очистки системы.\n\nЕсли вы не хотите ничего выбрать, нажмите <b>OK</b>!" --checklist  --column "Выберете" --column "" FALSE "Autoremove" FALSE "Clean" FALSE "Autoclean" FALSE "Очистка_ненужных_файлов" FALSE "Удалить_хранимые_списки - Вы должны быть подключение к интернету" FALSE "Кэш_памяти - Осторожно, используйте это на свой риск" FALSE "System_Logs - /var/log/ ($varlog$byte)" FLASE "/tmp" FALSE "Trash - root" FALSE "$kern1" FALSE "$kern2" FALSE "$kern3" FALSE "$kern4" FALSE "$kern5" FALSE "$kern6" FALSE "$kern7"  --separator=":")
fi

if [ "$numberker" = "8" ] ; then

respo=$(zenity  --list  --width="600"  --height="520" --window-icon="/home/$user/.systemclean/systemclean.png" --text "Выберете что выполнить для очистки системы.\n\nЕсли вы не хотите ничего выбрать, нажмите <b>OK</b>!" --checklist  --column "Выберете" --column "" FALSE "Autoremove" FALSE "Clean" FALSE "Autoclean" FALSE "Очистка_ненужных_файлов" FALSE "Удалить_хранимые_списки - Вы должны быть подключение к интернету" FALSE "Кэш_памяти - Осторожно, используйте это на свой риск" FALSE "System_Logs - /var/log/ ($varlog$byte)" FLASE "/tmp" FALSE "Trash - root" FALSE "$kern1" FALSE "$kern2" FALSE "$kern3" FALSE "$kern4" FALSE "$kern5" FALSE "$kern6" FALSE "$kern7" FALSE "$kern8"  --separator=":")
fi

if [ "$numberker" = "9" ] ; then

respo=$(zenity  --list  --width="600"  --height="540" --window-icon="/home/$user/.systemclean/systemclean.png" --text "Выберете что выполнить для очистки системы.\n\nЕсли вы не хотите ничего выбрать, нажмите <b>OK</b>!" --checklist  --column "Выберете" --column "" FALSE "Autoremove" FALSE "Clean" FALSE "Autoclean" FALSE "Очистка_ненужных_файлов" FALSE "Удалить_хранимые_списки - Вы должны быть подключение к интернету" FALSE "Кэш_памяти - Осторожно, используйте это на свой риск" FALSE "System_Logs - /var/log/ ($varlog$byte)" FLASE "/tmp" FALSE "Trash - root" FALSE "$kern1" FALSE "$kern2" FALSE "$kern3" FALSE "$kern4" FALSE "$kern5" FALSE "$kern6" FALSE "$kern7" FALSE "$kern8" FALSE "$kern9"  --separator=":")
fi

if [ "$numberker" = "10" ] ; then

respo=$(zenity  --list  --width="600"  --height="560" --window-icon="/home/$user/.systemclean/systemclean.png" --text "Выберете что выполнить для очистки системы.\n\nЕсли вы не хотите ничего выбрать, нажмите <b>OK</b>!" --checklist  --column "Выберете" --column "" FALSE "Autoremove" FALSE "Clean" FALSE "Autoclean" FALSE "Очистка_ненужных_файлов" FALSE "Удалить_хранимые_списки - Вы должны быть подключение к интернету" FALSE "Кэш_памяти - Осторожно, используйте это на свой риск" FALSE "System_Logs - /var/log/ ($varlog$byte)" FLASE "/tmp" FALSE "Trash - root" FALSE "$kern1" FALSE "$kern2" FALSE "$kern3" FALSE "$kern4" FALSE "$kern5" FALSE "$kern6" FALSE "$kern7" FALSE "$kern8" FALSE "$kern9" FALSE "$kern10"  --separator=":")
fi

if [ "$numberker" = "11" ] ; then

respo=$(zenity  --list  --width="600"  --height="590" --window-icon="/home/$user/.systemclean/systemclean.png" --text "Выберете что выполнить для очистки системы.\n\nЕсли вы не хотите ничего выбрать, нажмите <b>OK</b>!" --checklist  --column "Выберете" --column "" FALSE "Autoremove" FALSE "Clean" FALSE "Autoclean" FALSE "Очистка_ненужных_файлов" FALSE "Удалить_хранимые_списки - Вы должны быть подключение к интернету" FALSE "Кэш_памяти - Осторожно, используйте это на свой риск" FALSE "System_Logs - /var/log/ ($varlog$byte)" FLASE "/tmp" FALSE "Trash - root" FALSE "$kern1" FALSE "$kern2" FALSE "$kern3" FALSE "$kern4" FALSE "$kern5" FALSE "$kern6" FALSE "$kern7" FALSE "$kern8" FALSE "$kern9" FALSE "$kern10" FALSE "$kern11"  --separator=":")
fi

if [ "$numberker" = "12" ] ; then

respo=$(zenity  --list  --width="600"  --height="600" --window-icon="/home/$user/.systemclean/systemclean.png" --text "Выберете что выполнить для очистки системы.\n\nЕсли вы не хотите ничего выбрать, нажмите <b>OK</b>!" --checklist  --column "Выберете" --column "" FALSE "Autoremove" FALSE "Clean" FALSE "Autoclean" FALSE "Очистка_ненужных_файлов" FALSE "Удалить_хранимые_списки - Вы должны быть подключение к интернету" FALSE "Кэш_памяти - Осторожно, используйте это на свой риск" FALSE "System_Logs - /var/log/ ($varlog$byte)" FLASE "/tmp" FALSE "Trash - root" FALSE "$kern1" FALSE "$kern2" FALSE "$kern3" FALSE "$kern4" FALSE "$kern5" FALSE "$kern6" FALSE "$kern7" FALSE "$kern8" FALSE "$kern9" FALSE "$kern10" FALSE "$kern11" FALSE "$kern12"  --separator=":")
fi

if [ "$numberker" = "13" ] ; then

respo=$(zenity  --list  --width="600"  --height="600" --window-icon="/home/$user/.systemclean/systemclean.png" --text "Выберете что выполнить для очистки системы.\n\nЕсли вы не хотите ничего выбрать, нажмите <b>OK</b>!" --checklist  --column "Выберете" --column "" FALSE "Autoremove" FALSE "Clean" FALSE "Autoclean" FALSE "Очистка_ненужных_файлов" FALSE "Удалить_хранимые_списки - Вы должны быть подключение к интернету" FALSE "Кэш_памяти - Осторожно, используйте это на свой риск" FALSE "System_Logs - /var/log/ ($varlog$byte)" FLASE "/tmp" FALSE "Trash - root" FALSE "$kern1" FALSE "$kern2" FALSE "$kern3" FALSE "$kern4" FALSE "$kern5" FALSE "$kern6" FALSE "$kern7" FALSE "$kern8" FALSE "$kern9" FALSE "$kern10" FALSE "$kern11" FALSE "$kern12" FALSE "$kern13"  --separator=":")
fi

if [ "$numberker" = "14" ] ; then

respo=$(zenity  --list  --width="600"  --height="600" --window-icon="/home/$user/.systemclean/systemclean.png" --text "Выберете что выполнить для очистки системы.\n\nЕсли вы не хотите ничего выбрать, нажмите <b>OK</b>!" --checklist  --column "Выберете" --column "" FALSE "Autoremove" FALSE "Clean" FALSE "Autoclean" FALSE "Очистка_ненужных_файлов" FALSE "Удалить_хранимые_списки - Вы должны быть подключение к интернету" FALSE "Кэш_памяти - Осторожно, используйте это на свой риск" FALSE "System_Logs - /var/log/ ($varlog$byte)" FLASE "/tmp" FALSE "Trash - root" FALSE "$kern1" FALSE "$kern2" FALSE "$kern3" FALSE "$kern4" FALSE "$kern5" FALSE "$kern6" FALSE "$kern7" FALSE "$kern8" FALSE "$kern9" FALSE "$kern10" FALSE "$kern11" FALSE "$kern12" FALSE "$kern13" FALSE "$kern14"  --separator=":")
fi

if [ "$numberker" = "15" ] ; then

respo=$(zenity  --list  --width="600"  --height="600" --window-icon="/home/$user/.systemclean/systemclean.png" --text "Выберете что выполнить для очистки системы.\n\nЕсли вы не хотите ничего выбрать, нажмите <b>OK</b>!" --checklist  --column "Выберете" --column "" FALSE "Autoremove" FALSE "Clean" FALSE "Autoclean" FALSE "Очистка_ненужных_файлов" FALSE "Удалить_хранимые_списки - Вы должны быть подключение к интернету" FALSE "Кэш_памяти - Осторожно, используйте это на свой риск" FALSE "System_Logs - /var/log/ ($varlog$byte)" FLASE "/tmp" FALSE "Trash - root" FALSE "$kern1" FALSE "$kern2" FALSE "$kern3" FALSE "$kern4" FALSE "$kern5" FALSE "$kern6" FALSE "$kern7" FALSE "$kern8" FALSE "$kern9" FALSE "$kern10" FALSE "$kern11" FALSE "$kern12" FALSE "$kern13" FALSE "$kern14" FALSE "$kern15"  --separator=":")
fi

if [ "$numberker" = "16" ] ; then

respo=$(zenity  --list  --width="600"  --height="600" --window-icon="/home/$user/.systemclean/systemclean.png" --text "Выберете что выполнить для очистки системы.\n\nЕсли вы не хотите ничего выбрать, нажмите <b>OK</b>!" --checklist  --column "Выберете" --column "" FALSE "Autoremove" FALSE "Clean" FALSE "Autoclean" FALSE "Очистка_ненужных_файлов" FALSE "Удалить_хранимые_списки - Вы должны быть подключение к интернету" FALSE "Кэш_памяти - Осторожно, используйте это на свой риск" FALSE "System_Logs - /var/log/ ($varlog$byte)" FLASE "/tmp" FALSE "Trash - root" FALSE "$kern1" FALSE "$kern2" FALSE "$kern3" FALSE "$kern4" FALSE "$kern5" FALSE "$kern6" FALSE "$kern7" FALSE "$kern8" FALSE "$kern9" FALSE "$kern10" FALSE "$kern11" FALSE "$kern12" FALSE "$kern13" FALSE "$kern14" FALSE "$kern15" FALSE "$kern16"  --separator=":")
fi

if [ "$numberker" = "17" ] ; then

respo=$(zenity  --list  --width="600"  --height="600" --window-icon="/home/$user/.systemclean/systemclean.png" --text "Выберете что выполнить для очистки системы.\n\nЕсли вы не хотите ничего выбрать, нажмите <b>OK</b>!" --checklist  --column "Выберете" --column "" FALSE "Autoremove" FALSE "Clean" FALSE "Autoclean" FALSE "Очистка_ненужных_файлов" FALSE "Удалить_хранимые_списки - Вы должны быть подключение к интернету" FALSE "Кэш_памяти - Осторожно, используйте это на свой риск" FALSE "System_Logs - /var/log/ ($varlog$byte)" FLASE "/tmp" FALSE "Trash - root" FALSE "$kern1" FALSE "$kern2" FALSE "$kern3" FALSE "$kern4" FALSE "$kern5" FALSE "$kern6" FALSE "$kern7" FALSE "$kern8" FALSE "$kern9" FALSE "$kern10" FALSE "$kern11" FALSE "$kern12" FALSE "$kern13" FALSE "$kern14" FALSE "$kern15" FALSE "$kern16" FALSE "$kern17"  --separator=":")
fi

if [ "$numberker" = "18" ] ; then

respo=$(zenity  --list  --width="600"  --height="600" --window-icon="/home/$user/.systemclean/systemclean.png" --text "Выберете что выполнить для очистки системы.\n\nЕсли вы не хотите ничего выбрать, нажмите <b>OK</b>!" --checklist  --column "Выберете" --column "" FALSE "Autoremove" FALSE "Clean" FALSE "Autoclean" FALSE "Очистка_ненужных_файлов" FALSE "Удалить_хранимые_списки - Вы должны быть подключение к интернету" FALSE "Кэш_памяти - Осторожно, используйте это на свой риск" FALSE "System_Logs - /var/log/ ($varlog$byte)" FLASE "/tmp" FALSE "Trash - root" FALSE "$kern1" FALSE "$kern2" FALSE "$kern3" FALSE "$kern4" FALSE "$kern5" FALSE "$kern6" FALSE "$kern7" FALSE "$kern8" FALSE "$kern9" FALSE "$kern10" FALSE "$kern11" FALSE "$kern12" FALSE "$kern13" FALSE "$kern14" FALSE "$kern15" FALSE "$kern16" FALSE "$kern17" FALSE "$kern18"  --separator=":")
fi

if [ "$numberker" = "19" ] ; then

respo=$(zenity  --list  --width="600"  --height="600" --window-icon="/home/$user/.systemclean/systemclean.png" --text "Выберете что выполнить для очистки системы.\n\nЕсли вы не хотите ничего выбрать, нажмите <b>OK</b>!" --checklist  --column "Выберете" --column "" FALSE "Autoremove" FALSE "Clean" FALSE "Autoclean" FALSE "Очистка_ненужных_файлов" FALSE "Удалить_хранимые_списки - Вы должны быть подключение к интернету" FALSE "Кэш_памяти - Осторожно, используйте это на свой риск" FALSE "System_Logs - /var/log/ ($varlog$byte)" FLASE "/tmp" FALSE "Trash - root" FALSE "$kern1" FALSE "$kern2" FALSE "$kern3" FALSE "$kern4" FALSE "$kern5" FALSE "$kern6" FALSE "$kern7" FALSE "$kern8" FALSE "$kern9" FALSE "$kern10" FALSE "$kern11" FALSE "$kern12" FALSE "$kern13" FALSE "$kern14" FALSE "$kern15" FALSE "$kern16" FALSE "$kern17" FALSE "$kern18" FALSE "$kern19"  --separator=":")
fi

if [ "$numberker" = "20" ] ; then

respo=$(zenity  --list  --width="600"  --height="600" --window-icon="/home/$user/.systemclean/systemclean.png" --text "Выберете что выполнить для очистки системы.\n\nЕсли вы не хотите ничего выбрать, нажмите <b>OK</b>!" --checklist  --column "Выберете" --column "" FALSE "Autoremove" FALSE "Clean" FALSE "Autoclean" FALSE "Очистка_ненужных_файлов" FALSE "Удалить_хранимые_списки - Вы должны быть подключение к интернету" FALSE "Кэш_памяти - Осторожно, используйте это на свой риск" FALSE "System_Logs - /var/log/ ($varlog$byte)" FLASE "/tmp" FALSE "Trash - root" FALSE "$kern1" FALSE "$kern2" FALSE "$kern3" FALSE "$kern4" FALSE "$kern5" FALSE "$kern6" FALSE "$kern7" FALSE "$kern8" FALSE "$kern9" FALSE "$kern10" FALSE "$kern11" FALSE "$kern12" FALSE "$kern13" FALSE "$kern14" FALSE "$kern15" FALSE "$kern16" FALSE "$kern17" FALSE "$kern18" FALSE "$kern19" FALSE "$kern20"  --separator=":")
fi

if [ "$numberker" = "21" ] ; then

respo=$(zenity  --list  --width="600"  --height="600" --window-icon="/home/$user/.systemclean/systemclean.png" --text "Выберете что выполнить для очистки системы.\n\nЕсли вы не хотите ничего выбрать, нажмите <b>OK</b>!" --checklist  --column "Выберете" --column "" FALSE "Autoremove" FALSE "Clean" FALSE "Autoclean" FALSE "Очистка_ненужных_файлов" FALSE "Удалить_хранимые_списки - Вы должны быть подключение к интернету" FALSE "Кэш_памяти - Осторожно, используйте это на свой риск" FALSE "System_Logs - /var/log/ ($varlog$byte)" FLASE "/tmp" FALSE "Trash - root" FALSE "$kern1" FALSE "$kern2" FALSE "$kern3" FALSE "$kern4" FALSE "$kern5" FALSE "$kern6" FALSE "$kern7" FALSE "$kern8" FALSE "$kern9" FALSE "$kern10" FALSE "$kern11" FALSE "$kern12" FALSE "$kern13" FALSE "$kern14" FALSE "$kern15" FALSE "$kern16" FALSE "$kern17" FALSE "$kern18" FALSE "$kern19" FALSE "$kern20" FALSE "$kern21"  --separator=":")
fi

if [ "$numberker" = "22" ] ; then

respo=$(zenity  --list  --width="600"  --height="600" --window-icon="/home/$user/.systemclean/systemclean.png" --text "Выберете что выполнить для очистки системы.\n\nЕсли вы не хотите ничего выбрать, нажмите <b>OK</b>!" --checklist  --column "Выберете" --column "" FALSE "Autoremove" FALSE "Clean" FALSE "Autoclean" FALSE "Очистка_ненужных_файлов" FALSE "Удалить_хранимые_списки - Вы должны быть подключение к интернету" FALSE "Кэш_памяти - Осторожно, используйте это на свой риск" FALSE "System_Logs - /var/log/ ($varlog$byte)" FLASE "/tmp" FALSE "Trash - root" FALSE "$kern1" FALSE "$kern2" FALSE "$kern3" FALSE "$kern4" FALSE "$kern5" FALSE "$kern6" FALSE "$kern7" FALSE "$kern8" FALSE "$kern9" FALSE "$kern10" FALSE "$kern11" FALSE "$kern12" FALSE "$kern13" FALSE "$kern14" FALSE "$kern15" FALSE "$kern16" FALSE "$kern17" FALSE "$kern18" FALSE "$kern19" FALSE "$kern20" FALSE "$kern21" FALSE "$kern22"  --separator=":")
fi

if [ "$numberker" = "23" ] ; then
gr.bi
respo=$(zenity  --list  --width="600"  --height="600" --window-icon="/home/$user/.systemclean/systemclean.png" --text "Выберете что выполнить для очистки системы.\n\nЕсли вы не хотите ничего выбрать, нажмите <b>OK</b>!" --checklist  --column "Выберете" --column "" FALSE "Autoremove" FALSE "Clean" FALSE "Autoclean" FALSE "Очистка_ненужных_файлов" FALSE "Удалить_хранимые_списки - Вы должны быть подключение к интернету" FALSE "Кэш_памяти - Осторожно, используйте это на свой риск" FALSE "System_Logs - /var/log/ ($varlog$byte)" FLASE "/tmp" FALSE "Trash - root" FALSE "$kern1" FALSE "$kern2" FALSE "$kern3" FALSE "$kern4" FALSE "$kern5" FALSE "$kern6" FALSE "$kern7" FALSE "$kern8" FALSE "$kern9" FALSE "$kern10" FALSE "$kern11" FALSE "$kern12" FALSE "$kern13" FALSE "$kern14" FALSE "$kern15" FALSE "$kern16" FALSE "$kern17" FALSE "$kern18" FALSE "$kern19" FALSE "$kern20" FALSE "$kern21" FALSE "$kern22" FALSE "$kern23"  --separator=":")
fi

if [ "$numberker" = "24" ] ; then

respo=$(zenity  --list  --width="600"  --height="600" --window-icon="/home/$user/.systemclean/systemclean.png" --text "Выберете что выполнить для очистки системы.\n\nЕсли вы не хотите ничего выбрать, нажмите <b>OK</b>!" --checklist  --column "Выберете" --column "" FALSE "Autoremove" FALSE "Clean" FALSE "Autoclean" FALSE "Очистка_ненужных_файлов" FALSE "Удалить_хранимые_списки - Вы должны быть подключение к интернету" FALSE "Кэш_памяти - Осторожно, используйте это на свой риск" FALSE "System_Logs - /var/log/ ($varlog$byte)" FLASE "/tmp" FALSE "Trash - root" FALSE "$kern1" FALSE "$kern2" FALSE "$kern3" FALSE "$kern4" FALSE "$kern5" FALSE "$kern6" FALSE "$kern7" FALSE "$kern8" FALSE "$kern9" FALSE "$kern10" FALSE "$kern11" FALSE "$kern12" FALSE "$kern13" FALSE "$kern14" FALSE "$kern15" FALSE "$kern16" FALSE "$kern17" FALSE "$kern18" FALSE "$kern19" FALSE "$kern20" FALSE "$kern21" FALSE "$kern22" FALSE "$kern23" FALSE "$kern24"  --separator=":")
fi

if [ "$numberker" = "25" ] ; then

respo=$(zenity  --list  --width="600"  --height="600" --window-icon="/home/$user/.systemclean/systemclean.png" --text "Выберете что выполнить для очистки системы.\n\nЕсли вы не хотите ничего выбрать, нажмите <b>OK</b>!" --checklist  --column "Выберете" --column "" FALSE "Autoremove" FALSE "Clean" FALSE "Autoclean" FALSE "Очистка_ненужных_файлов" FALSE "Удалить_хранимые_списки - Вы должны быть подключение к интернету" FALSE "Кэш_памяти - Осторожно, используйте это на свой риск" FALSE "System_Logs - /var/log/ ($varlog$byte)" FLASE "/tmp" FALSE "Trash - root" FALSE "$kern1" FALSE "$kern2" FALSE "$kern3" FALSE "$kern4" FALSE "$kern5" FALSE "$kern6" FALSE "$kern7" FALSE "$kern8" FALSE "$kern9" FALSE "$kern10" FALSE "$kern11" FALSE "$kern12" FALSE "$kern13" FALSE "$kern14" FALSE "$kern15" FALSE "$kern16" FALSE "$kern17" FALSE "$kern18" FALSE "$kern19" FALSE "$kern20" FALSE "$kern21" FALSE "$kern22" FALSE "$kern23" FALSE "$kern24" FALSE "$kern25"  --separator=":")
fi

if [ "$numberker" = "26" ] ; then

respo=$(zenity  --list  --width="600"  --height="600" --window-icon="/home/$user/.systemclean/systemclean.png" --text "Выберете что выполнить для очистки системы.\n\nЕсли вы не хотите ничего выбрать, нажмите <b>OK</b>!" --checklist  --column "Выберете" --column "" FALSE "Autoremove" FALSE "Clean" FALSE "Autoclean" FALSE "Очистка_ненужных_файлов" FALSE "Удалить_хранимые_списки - Вы должны быть подключение к интернету" FALSE "Кэш_памяти - Осторожно, используйте это на свой риск" FALSE "System_Logs - /var/log/ ($varlog$byte)" FLASE "/tmp" FALSE "Trash - root" FALSE "$kern1" FALSE "$kern2" FALSE "$kern3" FALSE "$kern4" FALSE "$kern5" FALSE "$kern6" FALSE "$kern7" FALSE "$kern8" FALSE "$kern9" FALSE "$kern10" FALSE "$kern11" FALSE "$kern12" FALSE "$kern13" FALSE "$kern14" FALSE "$kern15" FALSE "$kern16" FALSE "$kern17" FALSE "$kern18" FALSE "$kern19" FALSE "$kern20" FALSE "$kern21" FALSE "$kern22" FALSE "$kern23" FALSE "$kern24" FALSE "$kern25" FALSE "$kern26"  --separator=":")
fi

if [ "$numberker" = "27" ] ; then

respo=$(zenity  --list  --width="600"  --height="600" --window-icon="/home/$user/.systemclean/systemclean.png" --text "Выберете что выполнить для очистки системы.\n\nЕсли вы не хотите ничего выбрать, нажмите <b>OK</b>!" --checklist  --column "Выберете" --column "" FALSE "Autoremove" FALSE "Clean" FALSE "Autoclean" FALSE "Очистка_ненужных_файлов" FALSE "Удалить_хранимые_списки - Вы должны быть подключение к интернету" FALSE "Кэш_памяти - Осторожно, используйте это на свой риск" FALSE "System_Logs - /var/log/ ($varlog$byte)" FLASE "/tmp" FALSE "Trash - root" FALSE "$kern1" FALSE "$kern2" FALSE "$kern3" FALSE "$kern4" FALSE "$kern5" FALSE "$kern6" FALSE "$kern7" FALSE "$kern8" FALSE "$kern9" FALSE "$kern10" FALSE "$kern11" FALSE "$kern12" FALSE "$kern13" FALSE "$kern14" FALSE "$kern15" FALSE "$kern16" FALSE "$kern17" FALSE "$kern18" FALSE "$kern19" FALSE "$kern20" FALSE "$kern21" FALSE "$kern22" FALSE "$kern23" FALSE "$kern24" FALSE "$kern25" FALSE "$kern26" FALSE "$kern27"  --separator=":")
fi

if [ "$numberker" = "28" ] ; then

respo=$(zenity  --list  --width="600"  --height="600" --window-icon="/home/$user/.systemclean/systemclean.png" --text "Выберете что выполнить для очистки системы.\n\nЕсли вы не хотите ничего выбрать, нажмите <b>OK</b>!" --checklist  --column "Выберете" --column "" FALSE "Autoremove" FALSE "Clean" FALSE "Autoclean" FALSE "Очистка_ненужных_файлов" FALSE "Удалить_хранимые_списки - Вы должны быть подключение к интернету" FALSE "Кэш_памяти - Осторожно, используйте это на свой риск" FALSE "System_Logs - /var/log/ ($varlog$byte)" FLASE "/tmp" FALSE "Trash - root" FALSE "$kern1" FALSE "$kern2" FALSE "$kern3" FALSE "$kern4" FALSE "$kern5" FALSE "$kern6" FALSE "$kern7" FALSE "$kern8" FALSE "$kern9" FALSE "$kern10" FALSE "$kern11" FALSE "$kern12" FALSE "$kern13" FALSE "$kern14" FALSE "$kern15" FALSE "$kern16" FALSE "$kern17" FALSE "$kern18" FALSE "$kern19" FALSE "$kern20" FALSE "$kern21" FALSE "$kern22" FALSE "$kern23" FALSE "$kern24" FALSE "$kern25" FALSE "$kern26" FALSE "$kern27" FALSE "$kern28"  --separator=":")
fi

if [ "$numberker" = "29" ] ; then

respo=$(zenity  --list  --width="600"  --height="600" --window-icon="/home/$user/.systemclean/systemclean.png" --text "Выберете что выполнить для очистки системы.\n\nЕсли вы не хотите ничего выбрать, нажмите <b>OK</b>!" --checklist  --column "Выберете" --column "" FALSE "Autoremove" FALSE "Clean" FALSE "Autoclean" FALSE "Очистка_ненужных_файлов" FALSE "Удалить_хранимые_списки - Вы должны быть подключение к интернету" FALSE "Кэш_памяти - Осторожно, используйте это на свой риск" FALSE "System_Logs - /var/log/ ($varlog$byte)" FLASE "/tmp" FALSE "Trash - root" FALSE "$kern1" FALSE "$kern2" FALSE "$kern3" FALSE "$kern4" FALSE "$kern5" FALSE "$kern6" FALSE "$kern7" FALSE "$kern8" FALSE "$kern9" FALSE "$kern10" FALSE "$kern11" FALSE "$kern12" FALSE "$kern13" FALSE "$kern14" FALSE "$kern15" FALSE "$kern16" FALSE "$kern17" FALSE "$kern18" FALSE "$kern19" FALSE "$kern20" FALSE "$kern21" FALSE "$kern22" FALSE "$kern23" FALSE "$kern24" FALSE "$kern25" FALSE "$kern26" FALSE "$kern27" FALSE "$kern28" FALSE "$kern29"  --separator=":")
fi

if [ "$numberker" = "30" ] ; then

respo=$(zenity  --list  --width="600"  --height="600" --window-icon="/home/$user/.systemclean/systemclean.png" --text "Выберете что выполнить для очистки системы.\n\nЕсли вы не хотите ничего выбрать, нажмите <b>OK</b>!" --checklist  --column "Выберете" --column "" FALSE "Autoremove" FALSE "Clean" FALSE "Autoclean" FALSE "Очистка_ненужных_файлов" FALSE "Удалить_хранимые_списки - Вы должны быть подключение к интернету" FALSE "Кэш_памяти - Осторожно, используйте это на свой риск" FALSE "System_Logs - /var/log/ ($varlog$byte)" FLASE "/tmp" FALSE "Trash - root" FALSE "$kern1" FALSE "$kern2" FALSE "$kern3" FALSE "$kern4" FALSE "$kern5" FALSE "$kern6" FALSE "$kern7" FALSE "$kern8" FALSE "$kern9" FALSE "$kern10" FALSE "$kern11" FALSE "$kern12" FALSE "$kern13" FALSE "$kern14" FALSE "$kern15" FALSE "$kern16" FALSE "$kern17" FALSE "$kern18" FALSE "$kern19" FALSE "$kern20" FALSE "$kern21" FALSE "$kern22" FALSE "$kern23" FALSE "$kern24" FALSE "$kern25" FALSE "$kern26" FALSE "$kern27" FALSE "$kern28" FALSE "$kern29" FALSE "$kern30"  --separator=":")
fi

if [ "$numberker" = "31" ] ; then

respo=$(zenity  --list  --width="600"  --height="600" --window-icon="/home/$user/.systemclean/systemclean.png" --text "Выберете что выполнить для очистки системы.\n\nЕсли вы не хотите ничего выбрать, нажмите <b>OK</b>!" --checklist  --column "Выберете" --column "" FALSE "Autoremove" FALSE "Clean" FALSE "Autoclean" FALSE "Очистка_ненужных_файлов" FALSE "Удалить_хранимые_списки - Вы должны быть подключение к интернету" FALSE "Кэш_памяти - Осторожно, используйте это на свой риск" FALSE "System_Logs - /var/log/ ($varlog$byte)" FLASE "/tmp" FALSE "Trash - root" FALSE "$kern1" FALSE "$kern2" FALSE "$kern3" FALSE "$kern4" FALSE "$kern5" FALSE "$kern6" FALSE "$kern7" FALSE "$kern8" FALSE "$kern9" FALSE "$kern10" FALSE "$kern11" FALSE "$kern12" FALSE "$kern13" FALSE "$kern14" FALSE "$kern15" FALSE "$kern16" FALSE "$kern17" FALSE "$kern18" FALSE "$kern19" FALSE "$kern20" FALSE "$kern21" FALSE "$kern22" FALSE "$kern23" FALSE "$kern24" FALSE "$kern25" FALSE "$kern26" FALSE "$kern27" FALSE "$kern28" FALSE "$kern29" FALSE "$kern30" FALSE "$kern31"  --separator=":")
fi

if [ "$numberker" = "32" ] ; then

respo=$(zenity  --list  --width="600"  --height="600" --window-icon="/home/$user/.systemclean/systemclean.png" --text "Выберете что выполнить для очистки системы.\n\nЕсли вы не хотите ничего выбрать, нажмите <b>OK</b>!" --checklist  --column "Выберете" --column "" FALSE "Autoremove" FALSE "Clean" FALSE "Autoclean" FALSE "Очистка_ненужных_файлов" FALSE "Удалить_хранимые_списки - Вы должны быть подключение к интернету" FALSE "Кэш_памяти - Осторожно, используйте это на свой риск" FALSE "System_Logs - /var/log/ ($varlog$byte)" FLASE "/tmp" FALSE "Trash - root" FALSE "$kern1" FALSE "$kern2" FALSE "$kern3" FALSE "$kern4" FALSE "$kern5" FALSE "$kern6" FALSE "$kern7" FALSE "$kern8" FALSE "$kern9" FALSE "$kern10" FALSE "$kern11" FALSE "$kern12" FALSE "$kern13" FALSE "$kern14" FALSE "$kern15" FALSE "$kern16" FALSE "$kern17" FALSE "$kern18" FALSE "$kern19" FALSE "$kern20" FALSE "$kern21" FALSE "$kern22" FALSE "$kern23" FALSE "$kern24" FALSE "$kern25" FALSE "$kern26" FALSE "$kern27" FALSE "$kern28" FALSE "$kern29" FALSE "$kern30" FALSE "$kern31" FALSE "$kern32"  --separator=":")
fi

if [ "$numberker" = "33" ] ; then

respo=$(zenity  --list  --width="600"  --height="600" --window-icon="/home/$user/.systemclean/systemclean.png" --text "Выберете что выполнить для очистки системы.\n\nЕсли вы не хотите ничего выбрать, нажмите <b>OK</b>!" --checklist  --column "Выберете" --column "" FALSE "Autoremove" FALSE "Clean" FALSE "Autoclean" FALSE "Очистка_ненужных_файлов" FALSE "Удалить_хранимые_списки - Вы должны быть подключение к интернету" FALSE "Кэш_памяти - Осторожно, используйте это на свой риск" FALSE "System_Logs - /var/log/ ($varlog$byte)" FLASE "/tmp" FALSE "Trash - root" FALSE "$kern1" FALSE "$kern2" FALSE "$kern3" FALSE "$kern4" FALSE "$kern5" FALSE "$kern6" FALSE "$kern7" FALSE "$kern8" FALSE "$kern9" FALSE "$kern10" FALSE "$kern11" FALSE "$kern12" FALSE "$kern13" FALSE "$kern14" FALSE "$kern15" FALSE "$kern16" FALSE "$kern17" FALSE "$kern18" FALSE "$kern19" FALSE "$kern20" FALSE "$kern21" FALSE "$kern22" FALSE "$kern23" FALSE "$kern24" FALSE "$kern25" FALSE "$kern26" FALSE "$kern27" FALSE "$kern28" FALSE "$kern29" FALSE "$kern30" FALSE "$kern31" FALSE "$kern32" FALSE "$kern33"  --separator=":")
fi

if [ "$numberker" = "34" ] ; then

respo=$(zenity  --list  --width="600"  --height="600" --window-icon="/home/$user/.systemclean/systemclean.png" --text "Выберете что выполнить для очистки системы.\n\nЕсли вы не хотите ничего выбрать, нажмите <b>OK</b>!" --checklist  --column "Выберете" --column "" FALSE "Autoremove" FALSE "Clean" FALSE "Autoclean" FALSE "Очистка_ненужных_файлов" FALSE "Удалить_хранимые_списки - Вы должны быть подключение к интернету" FALSE "Кэш_памяти - Осторожно, используйте это на свой риск" FALSE "System_Logs - /var/log/ ($varlog$byte)" FLASE "/tmp" FALSE "Trash - root" FALSE "$kern1" FALSE "$kern2" FALSE "$kern3" FALSE "$kern4" FALSE "$kern5" FALSE "$kern6" FALSE "$kern7" FALSE "$kern8" FALSE "$kern9" FALSE "$kern10" FALSE "$kern11" FALSE "$kern12" FALSE "$kern13" FALSE "$kern14" FALSE "$kern15" FALSE "$kern16" FALSE "$kern17" FALSE "$kern18" FALSE "$kern19" FALSE "$kern20" FALSE "$kern21" FALSE "$kern22" FALSE "$kern23" FALSE "$kern24" FALSE "$kern25" FALSE "$kern26" FALSE "$kern27" FALSE "$kern28" FALSE "$kern29" FALSE "$kern30" FALSE "$kern31" FALSE "$kern32" FALSE "$kern33" FALSE "$kern34"  --separator=":")
fi

if [ "$numberker" = "35" ] ; then

respo=$(zenity  --list  --width="600"  --height="600" --window-icon="/home/$user/.systemclean/systemclean.png" --text "Выберете что выполнить для очистки системы.\n\nЕсли вы не хотите ничего выбрать, нажмите <b>OK</b>!" --checklist  --column "Выберете" --column "" FALSE "Autoremove" FALSE "Clean" FALSE "Autoclean" FALSE "Очистка_ненужных_файлов" FALSE "Удалить_хранимые_списки - Вы должны быть подключение к интернету" FALSE "Кэш_памяти - Осторожно, используйте это на свой риск" FALSE "System_Logs - /var/log/ ($varlog$byte)" FLASE "/tmp" FALSE "Trash - root" FALSE "$kern1" FALSE "$kern2" FALSE "$kern3" FALSE "$kern4" FALSE "$kern5" FALSE "$kern6" FALSE "$kern7" FALSE "$kern8" FALSE "$kern9" FALSE "$kern10" FALSE "$kern11" FALSE "$kern12" FALSE "$kern13" FALSE "$kern14" FALSE "$kern15" FALSE "$kern16" FALSE "$kern17" FALSE "$kern18" FALSE "$kern19" FALSE "$kern20" FALSE "$kern21" FALSE "$kern22" FALSE "$kern23" FALSE "$kern24" FALSE "$kern25" FALSE "$kern26" FALSE "$kern27" FALSE "$kern28" FALSE "$kern29" FALSE "$kern30" FALSE "$kern31" FALSE "$kern32" FALSE "$kern33" FALSE "$kern34" FALSE "$kern35"  --separator=":")
fi

if [ "$numberker" = "36" ] ; then

respo=$(zenity  --list  --width="600"  --height="600" --window-icon="/home/$user/.systemclean/systemclean.png" --text "Выберете что выполнить для очистки системы.\n\nЕсли вы не хотите ничего выбрать, нажмите <b>OK</b>!" --checklist  --column "Выберете" --column "" FALSE "Autoremove" FALSE "Clean" FALSE "Autoclean" FALSE "Очистка_ненужных_файлов" FALSE "Удалить_хранимые_списки - Вы должны быть подключение к интернету" FALSE "Кэш_памяти - Осторожно, используйте это на свой риск" FALSE "System_Logs - /var/log/ ($varlog$byte)" FLASE "/tmp" FALSE "Trash - root" FALSE "$kern1" FALSE "$kern2" FALSE "$kern3" FALSE "$kern4" FALSE "$kern5" FALSE "$kern6" FALSE "$kern7" FALSE "$kern8" FALSE "$kern9" FALSE "$kern10" FALSE "$kern11" FALSE "$kern12" FALSE "$kern13" FALSE "$kern14" FALSE "$kern15" FALSE "$kern16" FALSE "$kern17" FALSE "$kern18" FALSE "$kern19" FALSE "$kern20" FALSE "$kern21" FALSE "$kern22" FALSE "$kern23" FALSE "$kern24" FALSE "$kern25" FALSE "$kern26" FALSE "$kern27" FALSE "$kern28" FALSE "$kern29" FALSE "$kern30" FALSE "$kern31" FALSE "$kern32" FALSE "$kern33" FALSE "$kern34" FALSE "$kern35" FALSE "$kern36"  --separator=":")
fi

if [ "$numberker" = "37" ] ; then

respo=$(zenity  --list  --width="600"  --height="600" --window-icon="/home/$user/.systemclean/systemclean.png" --text "Выберете что выполнить для очистки системы.\n\nЕсли вы не хотите ничего выбрать, нажмите <b>OK</b>!" --checklist  --column "Выберете" --column "" FALSE "Autoremove" FALSE "Clean" FALSE "Autoclean" FALSE "Очистка_ненужных_файлов" FALSE "Удалить_хранимые_списки - Вы должны быть подключение к интернету" FALSE "Кэш_памяти - Осторожно, используйте это на свой риск" FALSE "System_Logs - /var/log/ ($varlog$byte)" FLASE "/tmp" FALSE "Trash - root" FALSE "$kern1" FALSE "$kern2" FALSE "$kern3" FALSE "$kern4" FALSE "$kern5" FALSE "$kern6" FALSE "$kern7" FALSE "$kern8" FALSE "$kern9" FALSE "$kern10" FALSE "$kern11" FALSE "$kern12" FALSE "$kern13" FALSE "$kern14" FALSE "$kern15" FALSE "$kern16" FALSE "$kern17" FALSE "$kern18" FALSE "$kern19" FALSE "$kern20" FALSE "$kern21" FALSE "$kern22" FALSE "$kern23" FALSE "$kern24" FALSE "$kern25" FALSE "$kern26" FALSE "$kern27" FALSE "$kern28" FALSE "$kern29" FALSE "$kern30" FALSE "$kern31" FALSE "$kern32" FALSE "$kern33" FALSE "$kern34" FALSE "$kern35" FALSE "$kern36" FALSE "$kern37"  --separator=":")
fi

if [ "$numberker" = "38" ] ; then

respo=$(zenity  --list  --width="600"  --height="600" --window-icon="/home/$user/.systemclean/systemclean.png" --text "Выберете что выполнить для очистки системы.\n\nЕсли вы не хотите ничего выбрать, нажмите <b>OK</b>!" --checklist  --column "Выберете" --column "" FALSE "Autoremove" FALSE "Clean" FALSE "Autoclean" FALSE "Очистка_ненужных_файлов" FALSE "Удалить_хранимые_списки - Вы должны быть подключение к интернету" FALSE "Кэш_памяти - Осторожно, используйте это на свой риск" FALSE "System_Logs - /var/log/ ($varlog$byte)" FLASE "/tmp" FALSE "Trash - root" FALSE "$kern1" FALSE "$kern2" FALSE "$kern3" FALSE "$kern4" FALSE "$kern5" FALSE "$kern6" FALSE "$kern7" FALSE "$kern8" FALSE "$kern9" FALSE "$kern10" FALSE "$kern11" FALSE "$kern12" FALSE "$kern13" FALSE "$kern14" FALSE "$kern15" FALSE "$kern16" FALSE "$kern17" FALSE "$kern18" FALSE "$kern19" FALSE "$kern20" FALSE "$kern21" FALSE "$kern22" FALSE "$kern23" FALSE "$kern24" FALSE "$kern25" FALSE "$kern26" FALSE "$kern27" FALSE "$kern28" FALSE "$kern29" FALSE "$kern30" FALSE "$kern31" FALSE "$kern32" FALSE "$kern33" FALSE "$kern34" FALSE "$kern35" FALSE "$kern36" FALSE "$kern37" FALSE "$kern38"  --separator=":")
fi

if [ "$numberker" = "39" ] ; then

respo=$(zenity  --list  --width="600"  --height="600" --window-icon="/home/$user/.systemclean/systemclean.png" --text "Выберете что выполнить для очистки системы.\n\nЕсли вы не хотите ничего выбрать, нажмите <b>OK</b>!" --checklist  --column "Выберете" --column "" FALSE "Autoremove" FALSE "Clean" FALSE "Autoclean" FALSE "Очистка_ненужных_файлов" FALSE "Удалить_хранимые_списки - Вы должны быть подключение к интернету" FALSE "Кэш_памяти - Осторожно, используйте это на свой риск" FALSE "System_Logs - /var/log/ ($varlog$byte)" FLASE "/tmp" FALSE "Trash - root" FALSE "$kern1" FALSE "$kern2" FALSE "$kern3" FALSE "$kern4" FALSE "$kern5" FALSE "$kern6" FALSE "$kern7" FALSE "$kern8" FALSE "$kern9" FALSE "$kern10" FALSE "$kern11" FALSE "$kern12" FALSE "$kern13" FALSE "$kern14" FALSE "$kern15" FALSE "$kern16" FALSE "$kern17" FALSE "$kern18" FALSE "$kern19" FALSE "$kern20" FALSE "$kern21" FALSE "$kern22" FALSE "$kern23" FALSE "$kern24" FALSE "$kern25" FALSE "$kern26" FALSE "$kern27" FALSE "$kern28" FALSE "$kern29" FALSE "$kern30" FALSE "$kern31" FALSE "$kern32" FALSE "$kern33" FALSE "$kern34" FALSE "$kern35" FALSE "$kern36" FALSE "$kern37" FALSE "$kern38" FALSE "$kern39"  --separator=":")
fi

if [ "$numberker" = "40" ] ; then

respo=$(zenity  --list  --width="600"  --height="600" --window-icon="/home/$user/.systemclean/systemclean.png" --text "Выберете что выполнить для очистки системы.\n\nЕсли вы не хотите ничего выбрать, нажмите <b>OK</b>!" --checklist  --column "Выберете" --column "" FALSE "Autoremove" FALSE "Clean" FALSE "Autoclean" FALSE "Очистка_ненужных_файлов" FALSE "Удалить_хранимые_списки - Вы должны быть подключение к интернету" FALSE "Кэш_памяти - Осторожно, используйте это на свой риск" FALSE "System_Logs - /var/log/ ($varlog$byte)" FLASE "/tmp" FALSE "Trash - root" FALSE "$kern1" FALSE "$kern2" FALSE "$kern3" FALSE "$kern4" FALSE "$kern5" FALSE "$kern6" FALSE "$kern7" FALSE "$kern8" FALSE "$kern9" FALSE "$kern10" FALSE "$kern11" FALSE "$kern12" FALSE "$kern13" FALSE "$kern14" FALSE "$kern15" FALSE "$kern16" FALSE "$kern17" FALSE "$kern18" FALSE "$kern19" FALSE "$kern20" FALSE "$kern21" FALSE "$kern22" FALSE "$kern23" FALSE "$kern24" FALSE "$kern25" FALSE "$kern26" FALSE "$kern27" FALSE "$kern28" FALSE "$kern29" FALSE "$kern30" FALSE "$kern31" FALSE "$kern32" FALSE "$kern33" FALSE "$kern34" FALSE "$kern35" FALSE "$kern36" FALSE "$kern37" FALSE "$kern38" FALSE "$kern39" FALSE "$kern40"  --separator=":")
fi

if [ "$numberker" = "41" ] ; then

respo=$(zenity  --list  --width="600"  --height="600" --window-icon="/home/$user/.systemclean/systemclean.png" --text "Выберете что выполнить для очистки системы.\n\nЕсли вы не хотите ничего выбрать, нажмите <b>OK</b>!" --checklist  --column "Выберете" --column "" FALSE "Autoremove" FALSE "Clean" FALSE "Autoclean" FALSE "Очистка_ненужных_файлов" FALSE "Удалить_хранимые_списки - Вы должны быть подключение к интернету" FALSE "Кэш_памяти - Осторожно, используйте это на свой риск" FALSE "System_Logs - /var/log/ ($varlog$byte)" FLASE "/tmp" FALSE "Trash - root" FALSE "$kern1" FALSE "$kern2" FALSE "$kern3" FALSE "$kern4" FALSE "$kern5" FALSE "$kern6" FALSE "$kern7" FALSE "$kern8" FALSE "$kern9" FALSE "$kern10" FALSE "$kern11" FALSE "$kern12" FALSE "$kern13" FALSE "$kern14" FALSE "$kern15" FALSE "$kern16" FALSE "$kern17" FALSE "$kern18" FALSE "$kern19" FALSE "$kern20" FALSE "$kern21" FALSE "$kern22" FALSE "$kern23" FALSE "$kern24" FALSE "$kern25" FALSE "$kern26" FALSE "$kern27" FALSE "$kern28" FALSE "$kern29" FALSE "$kern30" FALSE "$kern31" FALSE "$kern32" FALSE "$kern33" FALSE "$kern34" FALSE "$kern35" FALSE "$kern36" FALSE "$kern37" FALSE "$kern38" FALSE "$kern39" FALSE "$kern40" FALSE "$kern41"  --separator=":")
fi

if [ "$numberker" = "42" ] ; then

respo=$(zenity  --list  --width="600"  --height="600" --window-icon="/home/$user/.systemclean/systemclean.png" --text "Выберете что выполнить для очистки системы.\n\nЕсли вы не хотите ничего выбрать, нажмите <b>OK</b>!" --checklist  --column "Выберете" --column "" FALSE "Autoremove" FALSE "Clean" FALSE "Autoclean" FALSE "Очистка_ненужных_файлов" FALSE "Удалить_хранимые_списки - Вы должны быть подключение к интернету" FALSE "Кэш_памяти - Осторожно, используйте это на свой риск" FALSE "System_Logs - /var/log/ ($varlog$byte)" FLASE "/tmp" FALSE "Trash - root" FALSE "$kern1" FALSE "$kern2" FALSE "$kern3" FALSE "$kern4" FALSE "$kern5" FALSE "$kern6" FALSE "$kern7" FALSE "$kern8" FALSE "$kern9" FALSE "$kern10" FALSE "$kern11" FALSE "$kern12" FALSE "$kern13" FALSE "$kern14" FALSE "$kern15" FALSE "$kern16" FALSE "$kern17" FALSE "$kern18" FALSE "$kern19" FALSE "$kern20" FALSE "$kern21" FALSE "$kern22" FALSE "$kern23" FALSE "$kern24" FALSE "$kern25" FALSE "$kern26" FALSE "$kern27" FALSE "$kern28" FALSE "$kern29" FALSE "$kern30" FALSE "$kern31" FALSE "$kern32" FALSE "$kern33" FALSE "$kern34" FALSE "$kern35" FALSE "$kern36" FALSE "$kern37" FALSE "$kern38" FALSE "$kern39" FALSE "$kern40" FALSE "$kern41" FALSE "$kern42"  --separator=":")
fi

if [ "$numberker" = "43" ] ; then

respo=$(zenity  --list  --width="600"  --height="600" --window-icon="/home/$user/.systemclean/systemclean.png" --text "Выберете что выполнить для очистки системы.\n\nЕсли вы не хотите ничего выбрать, нажмите <b>OK</b>!" --checklist  --column "Выберете" --column "" FALSE "Autoremove" FALSE "Clean" FALSE "Autoclean" FALSE "Очистка_ненужных_файлов" FALSE "Удалить_хранимые_списки - Вы должны быть подключение к интернету" FALSE "Кэш_памяти - Осторожно, используйте это на свой риск" FALSE "System_Logs - /var/log/ ($varlog$byte)" FLASE "/tmp" FALSE "Trash - root" FALSE "$kern1" FALSE "$kern2" FALSE "$kern3" FALSE "$kern4" FALSE "$kern5" FALSE "$kern6" FALSE "$kern7" FALSE "$kern8" FALSE "$kern9" FALSE "$kern10" FALSE "$kern11" FALSE "$kern12" FALSE "$kern13" FALSE "$kern14" FALSE "$kern15" FALSE "$kern16" FALSE "$kern17" FALSE "$kern18" FALSE "$kern19" FALSE "$kern20" FALSE "$kern21" FALSE "$kern22" FALSE "$kern23" FALSE "$kern24" FALSE "$kern25" FALSE "$kern26" FALSE "$kern27" FALSE "$kern28" FALSE "$kern29" FALSE "$kern30" FALSE "$kern31" FALSE "$kern32" FALSE "$kern33" FALSE "$kern34" FALSE "$kern35" FALSE "$kern36" FALSE "$kern37" FALSE "$kern38" FALSE "$kern39" FALSE "$kern40" FALSE "$kern41" FALSE "$kern42" FALSE "$kern43"  --separator=":")
fi

if [ "$numberker" = "44" ] ; then

respo=$(zenity  --list  --width="600"  --height="600" --window-icon="/home/$user/.systemclean/systemclean.png" --text "Выберете что выполнить для очистки системы.\n\nЕсли вы не хотите ничего выбрать, нажмите <b>OK</b>!" --checklist  --column "Выберете" --column "" FALSE "Autoremove" FALSE "Clean" FALSE "Autoclean" FALSE "Очистка_ненужных_файлов" FALSE "Удалить_хранимые_списки - Вы должны быть подключение к интернету" FALSE "Кэш_памяти - Осторожно, используйте это на свой риск" FALSE "System_Logs - /var/log/ ($varlog$byte)" FLASE "/tmp" FALSE "Trash - root" FALSE "$kern1" FALSE "$kern2" FALSE "$kern3" FALSE "$kern4" FALSE "$kern5" FALSE "$kern6" FALSE "$kern7" FALSE "$kern8" FALSE "$kern9" FALSE "$kern10" FALSE "$kern11" FALSE "$kern12" FALSE "$kern13" FALSE "$kern14" FALSE "$kern15" FALSE "$kern16" FALSE "$kern17" FALSE "$kern18" FALSE "$kern19" FALSE "$kern20" FALSE "$kern21" FALSE "$kern22" FALSE "$kern23" FALSE "$kern24" FALSE "$kern25" FALSE "$kern26" FALSE "$kern27" FALSE "$kern28" FALSE "$kern29" FALSE "$kern30" FALSE "$kern31" FALSE "$kern32" FALSE "$kern33" FALSE "$kern34" FALSE "$kern35" FALSE "$kern36" FALSE "$kern37" FALSE "$kern38" FALSE "$kern39" FALSE "$kern40" FALSE "$kern41" FALSE "$kern42" FALSE "$kern43" FALSE "$kern44"  --separator=":")
fi

if [ "$numberker" = "45" ] ; then

respo=$(zenity  --list  --width="600"  --height="600" --window-icon="/home/$user/.systemclean/systemclean.png" --text "Выберете что выполнить для очистки системы.\n\nЕсли вы не хотите ничего выбрать, нажмите <b>OK</b>!" --checklist  --column "Выберете" --column "" FALSE "Autoremove" FALSE "Clean" FALSE "Autoclean" FALSE "Очистка_ненужных_файлов" FALSE "Удалить_хранимые_списки - Вы должны быть подключение к интернету" FALSE "Кэш_памяти - Осторожно, используйте это на свой риск" FALSE "System_Logs - /var/log/ ($varlog$byte)" FLASE "/tmp" FALSE "Trash - root" FALSE "$kern1" FALSE "$kern2" FALSE "$kern3" FALSE "$kern4" FALSE "$kern5" FALSE "$kern6" FALSE "$kern7" FALSE "$kern8" FALSE "$kern9" FALSE "$kern10" FALSE "$kern11" FALSE "$kern12" FALSE "$kern13" FALSE "$kern14" FALSE "$kern15" FALSE "$kern16" FALSE "$kern17" FALSE "$kern18" FALSE "$kern19" FALSE "$kern20" FALSE "$kern21" FALSE "$kern22" FALSE "$kern23" FALSE "$kern24" FALSE "$kern25" FALSE "$kern26" FALSE "$kern27" FALSE "$kern28" FALSE "$kern29" FALSE "$kern30" FALSE "$kern31" FALSE "$kern32" FALSE "$kern33" FALSE "$kern34" FALSE "$kern35" FALSE "$kern36" FALSE "$kern37" FALSE "$kern38" FALSE "$kern39" FALSE "$kern40" FALSE "$kern41" FALSE "$kern42" FALSE "$kern43" FALSE "$kern44" FALSE "$kern45"  --separator=":")
fi

if [ "$numberker" = "46" ] ; then

respo=$(zenity  --list  --width="600"  --height="600" --window-icon="/home/$user/.systemclean/systemclean.png" --text "Выберете что выполнить для очистки системы.\n\nЕсли вы не хотите ничего выбрать, нажмите <b>OK</b>!" --checklist  --column "Выберете" --column "" FALSE "Autoremove" FALSE "Clean" FALSE "Autoclean" FALSE "Очистка_ненужных_файлов" FALSE "Удалить_хранимые_списки - Вы должны быть подключение к интернету" FALSE "Кэш_памяти - Осторожно, используйте это на свой риск" FALSE "System_Logs - /var/log/ ($varlog$byte)" FLASE "/tmp" FALSE "Trash - root" FALSE "$kern1" FALSE "$kern2" FALSE "$kern3" FALSE "$kern4" FALSE "$kern5" FALSE "$kern6" FALSE "$kern7" FALSE "$kern8" FALSE "$kern9" FALSE "$kern10" FALSE "$kern11" FALSE "$kern12" FALSE "$kern13" FALSE "$kern14" FALSE "$kern15" FALSE "$kern16" FALSE "$kern17" FALSE "$kern18" FALSE "$kern19" FALSE "$kern20" FALSE "$kern21" FALSE "$kern22" FALSE "$kern23" FALSE "$kern24" FALSE "$kern25" FALSE "$kern26" FALSE "$kern27" FALSE "$kern28" FALSE "$kern29" FALSE "$kern30" FALSE "$kern31" FALSE "$kern32" FALSE "$kern33" FALSE "$kern34" FALSE "$kern35" FALSE "$kern36" FALSE "$kern37" FALSE "$kern38" FALSE "$kern39" FALSE "$kern40" FALSE "$kern41" FALSE "$kern42" FALSE "$kern43" FALSE "$kern44" FALSE "$kern45" FALSE "$kern46"  --separator=":")
fi

if [ "$numberker" = "47" ] ; then

respo=$(zenity  --list  --width="600"  --height="600" --window-icon="/home/$user/.systemclean/systemclean.png" --text "Выберете что выполнить для очистки системы.\n\nЕсли вы не хотите ничего выбрать, нажмите <b>OK</b>!" --checklist  --column "Выберете" --column "" FALSE "Autoremove" FALSE "Clean" FALSE "Autoclean" FALSE "Очистка_ненужных_файлов" FALSE "Удалить_хранимые_списки - Вы должны быть подключение к интернету" FALSE "Кэш_памяти - Осторожно, используйте это на свой риск" FALSE "System_Logs - /var/log/ ($varlog$byte)" FLASE "/tmp" FALSE "Trash - root" FALSE "$kern1" FALSE "$kern2" FALSE "$kern3" FALSE "$kern4" FALSE "$kern5" FALSE "$kern6" FALSE "$kern7" FALSE "$kern8" FALSE "$kern9" FALSE "$kern10" FALSE "$kern11" FALSE "$kern12" FALSE "$kern13" FALSE "$kern14" FALSE "$kern15" FALSE "$kern16" FALSE "$kern17" FALSE "$kern18" FALSE "$kern19" FALSE "$kern20" FALSE "$kern21" FALSE "$kern22" FALSE "$kern23" FALSE "$kern24" FALSE "$kern25" FALSE "$kern26" FALSE "$kern27" FALSE "$kern28" FALSE "$kern29" FALSE "$kern30" FALSE "$kern31" FALSE "$kern32" FALSE "$kern33" FALSE "$kern34" FALSE "$kern35" FALSE "$kern36" FALSE "$kern37" FALSE "$kern38" FALSE "$kern39" FALSE "$kern40" FALSE "$kern41" FALSE "$kern42" FALSE "$kern43" FALSE "$kern44" FALSE "$kern45" FALSE "$kern47" FALSE "$kern48"  --separator=":")
fi

if [ "$numberker" = "48" ] ; then

respo=$(zenity  --list  --width="600"  --height="600" --window-icon="/home/$user/.systemclean/systemclean.png" --text "Выберете что выполнить для очистки системы.\n\nЕсли вы не хотите ничего выбрать, нажмите <b>OK</b>!" --checklist  --column "Выберете" --column "" FALSE "Autoremove" FALSE "Clean" FALSE "Autoclean" FALSE "Очистка_ненужных_файлов" FALSE "Удалить_хранимые_списки - Вы должны быть подключение к интернету" FALSE "Кэш_памяти - Осторожно, используйте это на свой риск" FALSE "System_Logs - /var/log/ ($varlog$byte)" FLASE "/tmp" FALSE "Trash - root" FALSE "$kern1" FALSE "$kern2" FALSE "$kern3" FALSE "$kern4" FALSE "$kern5" FALSE "$kern6" FALSE "$kern7" FALSE "$kern8" FALSE "$kern9" FALSE "$kern10" FALSE "$kern11" FALSE "$kern12" FALSE "$kern13" FALSE "$kern14" FALSE "$kern15" FALSE "$kern16" FALSE "$kern17" FALSE "$kern18" FALSE "$kern19" FALSE "$kern20" FALSE "$kern21" FALSE "$kern22" FALSE "$kern23" FALSE "$kern24" FALSE "$kern25" FALSE "$kern26" FALSE "$kern27" FALSE "$kern28" FALSE "$kern29" FALSE "$kern30" FALSE "$kern31" FALSE "$kern32" FALSE "$kern33" FALSE "$kern34" FALSE "$kern35" FALSE "$kern36" FALSE "$kern37" FALSE "$kern38" FALSE "$kern39" FALSE "$kern40" FALSE "$kern41" FALSE "$kern42" FALSE "$kern43" FALSE "$kern44" FALSE "$kern45" FALSE "$kern46" FALSE "$kern47" FALSE "$kern48"  --separator=":")
fi

if [ "$numberker" = "49" ] ; then

respo=$(zenity  --list  --width="600"  --height="600" --window-icon="/home/$user/.systemclean/systemclean.png" --text "Выберете что выполнить для очистки системы.\n\nЕсли вы не хотите ничего выбрать, нажмите <b>OK</b>!" --checklist  --column "Выберете" --column "" FALSE "Autoremove" FALSE "Clean" FALSE "Autoclean" FALSE "Очистка_ненужных_файлов" FALSE "Удалить_хранимые_списки - Вы должны быть подключение к интернету" FALSE "Кэш_памяти - Осторожно, используйте это на свой риск" FALSE "System_Logs - /var/log/ ($varlog$byte)" FLASE "/tmp" FALSE "Trash - root" FALSE "$kern1" FALSE "$kern2" FALSE "$kern3" FALSE "$kern4" FALSE "$kern5" FALSE "$kern6" FALSE "$kern7" FALSE "$kern8" FALSE "$kern9" FALSE "$kern10" FALSE "$kern11" FALSE "$kern12" FALSE "$kern13" FALSE "$kern14" FALSE "$kern15" FALSE "$kern16" FALSE "$kern17" FALSE "$kern18" FALSE "$kern19" FALSE "$kern20" FALSE "$kern21" FALSE "$kern22" FALSE "$kern23" FALSE "$kern24" FALSE "$kern25" FALSE "$kern26" FALSE "$kern27" FALSE "$kern28" FALSE "$kern29" FALSE "$kern30" FALSE "$kern31" FALSE "$kern32" FALSE "$kern33" FALSE "$kern34" FALSE "$kern35" FALSE "$kern36" FALSE "$kern37" FALSE "$kern38" FALSE "$kern39" FALSE "$kern40" FALSE "$kern41" FALSE "$kern42" FALSE "$kern43" FALSE "$kern44" FALSE "$kern45" FALSE "$kern46" FALSE "$kern47" FALSE "$kern48" FALSE "$kern49"  --separator=":")
fi

if [ "$numberker" = "50" ] ; then

respo=$(zenity  --list  --width="600"  --height="600" --window-icon="/home/$user/.systemclean/systemclean.png" --text "Выберете что выполнить для очистки системы.\n\nЕсли вы не хотите ничего выбрать, нажмите <b>OK</b>!" --checklist  --column "Выберете" --column "" FALSE "Autoremove" FALSE "Clean" FALSE "Autoclean" FALSE "Очистка_ненужных_файлов" FALSE "Удалить_хранимые_списки - Вы должны быть подключение к интернету" FALSE "Кэш_памяти - Осторожно, используйте это на свой риск" FALSE "System_Logs - /var/log/ ($varlog$byte)" FLASE "/tmp" FALSE "Trash - root" FALSE "$kern1" FALSE "$kern2" FALSE "$kern3" FALSE "$kern4" FALSE "$kern5" FALSE "$kern6" FALSE "$kern7" FALSE "$kern8" FALSE "$kern9" FALSE "$kern10" FALSE "$kern11" FALSE "$kern12" FALSE "$kern13" FALSE "$kern14" FALSE "$kern15" FALSE "$kern16" FALSE "$kern17" FALSE "$kern18" FALSE "$kern19" FALSE "$kern20" FALSE "$kern21" FALSE "$kern22" FALSE "$kern23" FALSE "$kern24" FALSE "$kern25" FALSE "$kern26" FALSE "$kern27" FALSE "$kern28" FALSE "$kern29" FALSE "$kern30" FALSE "$kern31" FALSE "$kern32" FALSE "$kern33" FALSE "$kern34" FALSE "$kern35" FALSE "$kern36" FALSE "$kern37" FALSE "$kern38" FALSE "$kern39" FALSE "$kern40" FALSE "$kern41" FALSE "$kern42" FALSE "$kern43" FALSE "$kern44" FALSE "$kern45" FALSE "$kern46" FALSE "$kern47" FALSE "$kern48" FALSE "$kern49" FALSE "$kern50"  --separator=":")
fi

if [ "$numberker" -ge "51" ] ; then

respo=$(zenity  --list  --width="600"  --height="350" --window-icon="/home/$user/.systemclean/systemclean.png" --text "Выберете что выполнить для очистки системы.\n\nЕсли вы не хотите ничего выбрать, нажмите <b>OK</b>!" --checklist  --column "Выберете" --column "" FALSE "Autoremove" FALSE "Clean" FALSE "Autoclean" FALSE "Очистка_ненужных_файлов" FALSE "Удалить_хранимые_списки - Вы должны быть подключение к интернету" FALSE "Кэш_памяти - Осторожно, используйте это на свой риск" FALSE "System_Logs - /var/log/ ($varlog$byte)" FLASE "/tmp" FALSE "Trash - root"  --separator=":")
fi

if [ "$respo" = "" ] ; then

response=$(zenity  --list  --width="450"  --height="600" --window-icon="/home/$user/.systemclean/systemclean.png" --text "Выберете программу для очистки кеша\n\nЕсли не хотите очищать кеш, нажмите <b>OK</b>!" --checklist  --column "Выберете" --column "Программа" FALSE "AceStream" FALSE "Chrome" FALSE "Chromium" FALSE "Clementine" FALSE "Compiz" FALSE "Epiphany" FALSE "Evolution" FALSE "Firefox" FASLE "Flash_Player" FALSE "Icedtea" FALSE "Google_Earth - Temporary files" FALSE "Guayadeque" FALSE "Java" FALSE "LuckyBackup" FALSE "Miro" FALSE "Mozilla-Nightly" FALSE "Opera" FALSE "Pigdin" FALSE "Recently-used" FALSE "Seamonkey" FALSE "Swiftweasel" FALSE "SystemClean - история" FALSE "thumbnails - более 7 дней пользования" FALSE "Thumbs.db" FALSE "Thunderbird" FALSE "TorChat" FALSE "Transmission" FALSE "Vidalia_tor" FALSE "Vlc" FALSE "Wallpapers" FALSE "Trash - $user"  --separator=":")

if [ $? -eq 1 ] ; then
        zenity --error \
          --text="Очистка отменена."
exit 1
fi

if [ "$response" = "" ] ; then
echo "
--------------------------------------
</font><b>
<font color=#FF0000>О</font><font color=#FF3200>ч</font><font color=#FF6400>и</font><font color=#FF9600>с</font><font color=#FFC800>т</font><font color=#FFFA00>к</font><font color=#FFff00>а</font><font color=#CDff00> </font><font color=#9Bff00>у</font><font color=#69ff00>с</font><font color=#37ff00>п</font><font color=#05ff00>е</font><font color=#00ff00>ш</font><font color=#00ff32>н</font><font color=#00ff64>о</font><font color=#00ff96> </font><font color=#00ffC8>з</font><font color=#00ffFA>а</font><font color=#00ffff>в</font><font color=#00FAff>е</font><font color=#00C8ff>р</font><font color=#0096ff>ш</font><font color=#0064ff>е</font><font color=#0032ff>н</font><font color=#0000ff>а</font><font color=#0500ff>!</font><font color=#3700ff>!</font><font color=#6900ff>!</font><font color=#9B00ff> </font><font color=#CD00ff>:</font><font color=#FF00ff>)</font></b>" >> /home/$user/.systemclean/2.log

zenity --info --text "Очистка успешно завершена!!!" --window-icon="/home/$user/.systemclean/systemclean.png" --timeout=1

echo "</font>


После очистки:
--------------------------------------<font color=lightgrey>" >> /home/$user/.systemclean/results.html
df -Th | grep -v "fs" | sort >> /home/$user/.systemclean/results.html
echo "
$installpack пакетов" >> /home/$user/.systemclean/results.html

echo "</font>

********************************************************************
<font color=lightgrey>
Детальные результаты работы
в файле /home/$user/.systemclean
</font>
------------------
--- System Log ---
------------------<font color=#347C2C>" >> /home/$user/.systemclean/results.html
cat /home/$user/.systemclean/1.log >> /home/$user/.systemclean/results.html
echo "</font>
----------------
--- Home Log ---
----------------<font color=lightgrey>
Удаленные `cat /home/$user/.systemclean/2.log | grep -c "home"` файлов</font><font color=#347C2C>" >> /home/$user/.systemclean/results.html
cat /home/$user/.systemclean/2.log >> /home/$user/.systemclean/results.html
echo "<center><img src=http://i.imgur.com/wq6SwtO.png height=192 width=192 /></center>
</font></pre></code></body></html>" >> /home/$user/.systemclean/results.html

zenity --text-info --title="-- Результат --" --width="600" --height="600" --window-icon="/home/$user/.systemclean/systemclean.png" --html --filename="/home/$user/.systemclean/results.html"
[[ $response = *SystemClean** ]] && echo "" > /home/$user/.systemclean/1.log
[[ $response = *SystemClean** ]] && echo "" > /home/$user/.systemclean/2.log
[[ $response = *SystemClean** ]] && echo "" > /home/$user/.systemclean/kernels.txt
[[ $response = *SystemClean** ]] && $sys_clean > /home/$user/.systemclean/date.txt
[[ $response = *SystemClean** ]] && cat /home/$user/.systemclean/results.html | head -n 40 > ~/.systemclean/results_tmp.html && mv /home/$user/.systemclean/results_tmp.html /home/$user/.systemclean/results.html
[[ $response = *SystemClean** ]] && cat /home/$user/.systemclean/results_old.html | head -n 40 > ~/.systemclean/results_old_tmp.html && mv /home/$user/.systemclean/results_old_tmp.html /home/$user/.systemclean/results_old.html
wget --no-cache http://pastebin.com/raw.php?i=vVJLnJqh -O /home/$user/.systemclean/update_version
sleep 1
if [ "$(cat /home/$user/.systemclean/update_version)" = "newer version is available" ]; then
zenity --question --text="Новая версия программы доступна.\nЗагрузить?" --cancel-label="Напомнить позже" --window-icon="/home/$user/.systemclean/systemclean.png" --ok-label="Загрузить сейчас"
if [ $? -eq 0 ] ; then
x-www-browser http://gnome-look.org/content/show.php/SystemClean?content=132913
exit 0
fi fi
exit 0
fi

(
echo ; sleep 1
[[ $response = *Firefox* ]] && ls -d /home/$user/.cache/mozilla/firefox/*.*/cache*/* >> /home/$user/.systemclean/2.log && rm -rf /home/$user/.cache/mozilla/firefox/*.*/cache*/*
[[ $response = *Firefox* ]] && ls -d /home/$user/.cache/mozilla/firefox/*.*/thumbnails/* >> /home/$user/.systemclean/2.log && rm -rf /home/$user/.cache/mozilla/firefox/*.*/thumbnails/*
[[ $response = *Firefox* ]] && ls -d /home/$user/.cache/mozilla/firefox/*.*/OfflineCache/* >> /home/$user/.systemclean/2.log && rm -rf /home/$user/.cache/mozilla/firefox/*.*/OfflineCache/*
[[ $response = *Firefox* ]] && ls -d /home/$user/.cache/mozilla/firefox/*.*/startupCache/* >> /home/$user/.systemclean/2.log && rm -rf /home/$user/.cache/mozilla/firefox/*.*/startupCache/*
[[ $response = *Mozilla-Nightly* ]] && ls -d /home/$user/.cache/mozilla/firefox-trunk/*.*/cache*/* >> /home/$user/.systemclean/2.log && rm -rf /home/$user/.cache/mozilla/firefox-trunk/*.*/cache*/*
[[ $response = *Mozilla-Nightly* ]] && ls -d /home/$user/.cache/mozilla/firefox-trunk/*.*/thumbnails/* >> /home/$user/.systemclean/2.log && rm -rf /home/$user/.cache/mozilla/firefox-trunk/*.*/thumbnails/*
[[ $response = *Mozilla-Nightly* ]] && ls -d /home/$user/.cache/mozilla/firefox-trunk/*.*/OfflineCache/* >> /home/$user/.systemclean/2.log && rm -rf /home/$user/.cache/mozilla/firefox-trunk/*.*/OfflineCache/*
[[ $response = *Mozilla-Nightly* ]] && ls -d /home/$user/.cache/mozilla/firefox-trunk/*.*/startupCache/* >> /home/$user/.systemclean/2.log && rm -rf /home/$user/.cache/mozilla/firefox-trunk/*.*/startupCache/*
[[ $response = *Transmission* ]] && ls -d /home/$user/.cache/transmission/favicons/* >> /home/$user/.systemclean/2.log && rm -rf /home/$user/.cache/transmission/favicons/*
[[ $response = *Vlc* ]] && ls -d /home/$user/.cache/vlc/art/artistalbum/* >> /home/$user/.systemclean/2.log && rm -rf /home/$user/.cache/vlc/art/artistalbum/*
[[ $response = *Vlc* ]] && ls -d /home/$user/.cache/vlc/art/arturl/* >> /home/$user/.systemclean/2.log && rm -rf /home/$user/.cache/vlc/art/arturl/*
[[ $response = *Icedtea* ]] && ls -d /home/$user/.icedtea/cache/* >> /home/$user/.systemclean/2.log && rm -rf /home/$user/.icedtea/cache/*
[[ $response = *Recently-used* ]] && ls -d /home/$user/.local/share/recently-used.* >> /home/$user/.systemclean/2.log && rm -rf /home/$user/.local/share/recently-used.*
[[ $response = *Flash_Player* ]] && ls -d /home/$user/.macromedia/Flash_Player/macromedia.com/support/flashplayer/sys/#* >> /home/$user/.systemclean/2.log && rm -rf /home/$user/.macromedia/Flash_Player/macromedia.com/support/flashplayer/sys/#*
[[ $response = *Flash_Player* ]] && ls -d /home/$user/.macromedia/Flash_Player/#SharedObjects/*/* >> /home/$user/.systemclean/2.log && rm -rf /home/$user/.macromedia/Flash_Player/#SharedObjects/*/*
[[ $response = *Vidalia_tor* ]] && ls -d /home/$user/.tor/cached-* >> /home/$user/.systemclean/2.log && rm -rf /home/$user/.tor/cached-*
[[ $response = *TorChat* ]] && ls -d /home/$user/.torchat/Tor/tor_data/cached* >> /home/$user/.systemclean/2.log && rm -rf /home/$user/.torchat/Tor/tor_data/cached*
[[ $response = *Guayadeque* ]] && ls -d /home/$user/.guayadeque/cache.db >> /home/$user/.systemclean/2.log && rm -rf /home/$user/.guayadeque/cache.db
[[ $response = *Chrome* ]] && ls -d /home/$user/.cache/google-chrome/Default/Cache/* >> /home/$user/.systemclean/2.log && rm -rf /home/$user/.cache/google-chrome/Default/Cache/*
[[ $response = *Epiphany* ]] && ls -d /home/$user/.gnome2/epiphany/favicon_cache/* >> /home/$user/.systemclean/2.log && rm -rf /home/$user/.gnome2/epiphany/favicon_cache/*
[[ $response = *Seamonkey* ]] && ls -d /home/$user/.mozilla/seamonkey/*/Cache/* >> /home/$user/.systemclean/2.log && rm -rf /home/$user/.mozilla/seamonkey/*/Cache/*
[[ $response = *Swiftweasel* ]] && ls -d /home/$user/.sw35/swiftweasel/*/Cache/* >> /home/$user/.systemclean/2.log && rm -rf /home/$user/.sw35/swiftweasel/*/Cache/*
[[ $response = *Opera* ]] && ls -d /home/$user/.opera/cache/* >> /home/$user/.systemclean/2.log && rm -rf /home/$user/.opera/cache/*
[[ $response = *Chromium* ]] && ls -d /home/$user/.cache/chromium/Default/*/* >> /home/$user/.systemclean/2.log && rm -rf /home/$user/.cache/chromium/Default/*/*
[[ $response = *Evolution* ]] && ls -d /home/$user/.evolution/cache/tmp/* >> /home/$user/.systemclean/2.log && rm -rf /home/$user/.evolution/cache/tmp/*
[[ $response = *Java* ]] && ls -d /home/$user/.java/.userPrefs/* >> /home/$user/.systemclean/2.log && rm -rf /home/$user/.java/.userPrefs/*
[[ $response = *Compiz* ]] && ls -d /home/$user/.cache/compizconfig/* >> /home/$user/.systemclean/2.log && rm -rf /home/$user/.cache/compizconfig/*
[[ $response = *Compiz* ]] && ls -d /home/$user/.config/compiz/* >> /home/$user/.systemclean/2.log && rm -rf /home/$user/.config/compiz/*
[[ $response = *Compiz* ]] && ls -d /home/$user/.compiz/session/* >> /home/$user/.systemclean/2.log && rm -rf /home/$user/.compiz/session/*
[[ $response = *Clementine* ]] && ls -d /home/$user/.config/Clementine/networkcache/http/* >> /home/$user/.systemclean/2.log && rm -rf /home/$user/.config/Clementine/networkcache/http/*
[[ $response = *Wallpapers* ]] && ls -d /home/$user/.cache/wallpaper/* >> /home/$user/.systemclean/2.log && rm -rf /home/$user/.cache/wallpaper/*
[[ $response = *Google_Earth** ]] && ls -d /home/$user/.googleearth/Temp/* >> /home/$user/.systemclean/2.log && rm -rf /home/$user/.googleearth/Temp/*
[[ $response = *Google_Earth** ]] && ls -d /home/$user/.googleearth/Cache/icons/* >> /home/$user/.systemclean/2.log && rm -rf /home/$user/.googleearth/Cache/icons/*
[[ $response = *Google_Earth** ]] && ls -d /home/$user/.googleearth/Cache/qwebdata/offline_access/*/** >> /home/$user/.systemclean/2.log && rm -rf /home/$user/.googleearth/Cache/qwebdata/offline_access/*/**
[[ $response = *Google_Earth** ]] && ls -d /home/$user/.googleearth/Cache/unified_cache_leveldb_*/* >> /home/$user/.systemclean/2.log && rm -rf /home/$user/.googleearth/Cache/unified_cache_leveldb_*/*
[[ $response = *Google_Earth** ]] && ls -d /home/$user/.googleearth/Cache/webdata/* >> /home/$user/.systemclean/2.log && rm -rf /home/$user/.googleearth/Cache/webdata/*
[[ $response = *Google_Earth** ]] && ls -d /home/$user/.googleearth/Cache/dbCache.dat.index >> /home/$user/.systemclean/2.log && rm -rf /home/$user/.googleearth/Cache/dbCache.dat.index
[[ $response = *Google_Earth** ]] && ls -d /home/$user/.googleearth/Cache/dbroot_cache >> /home/$user/.systemclean/2.log && rm -rf /home/$user/.googleearth/Cache/dbroot_cache
[[ $response = *Google_Earth** ]] && ls -d /home/$user/.googleearth/Cache/dbCache.dat >> /home/$user/.systemclean/2.log && rm -rf /home/$user/.googleearth/Cache/dbCache.dat
[[ $response = *AceStream* ]] && ls -d /home/$user/.ACEStream/collected_torrent_files/* >> /home/$user/.systemclean/2.log && rm -rf /home/$user/.ACEStream/collected_torrent_files/*
[[ $response = *Thunderbird* ]] && ls -d /home/$user/.cache/thunderbird/*.default/Cache/* >> /home/$user/.systemclean/2.log && rm -rf /home/$user/.cache/thunderbird/*.default/Cache/*
[[ $response = *Thunderbird* ]] && ls -d /home/$user/.cache/thunderbird/*.default/startupCache/* >> /home/$user/.systemclean/2.log && rm -rf /home/$user/.cache/thunderbird/*.default/startupCache/*
[[ $response = *Thunderbird* ]] && ls -d /home/$user/.cache/thunderbird/*.default/OfflineCache/* >> /home/$user/.systemclean/2.log && rm -rf /home/$user/.cache/thunderbird/*.default/OfflineCache/*
[[ $response = *Pigdin* ]] && ls -d /home/$user/.purple/icons/* >> /home/$user/.systemclean/2.log && rm -rf /home/$user/.purple/icons/*
[[ $response = *Miro* ]] && ls -d /home/$user/.miro/icon-cache/* >> /home/$user/.systemclean/2.log && rm -rf /home/$user/.miro/icon-cache/*
[[ $response = *Miro* ]] && ls -d /home/$user/.miro/*.log* >> /home/$user/.systemclean/2.log && rm -rf /home/$user/.miro/*.log*
[[ $response = *LuckyBackup* ]] && ls -d /home/$user/.luckyBackup/logs/* >> /home/$user/.systemclean/2.log && rm -rf /home/$user/.luckyBackup/logs/*
[[ $response = *LuckyBackup* ]] && ls -d /home/$user/.luckyBackup/snaps/* >> /home/$user/.systemclean/2.log && rm -rf /home/$user/.luckyBackup/snaps/*
[[ $response = *thumbnails** ]] && find /home/$user/.thumbnails -type f -atime +7 >> /home/$user/.systemclean/2.log ; find /home/$user/.thumbnails -type f -atime +7 -exec rm {} \;
[[ $response = *thumbnails** ]] && find /home/$user/.cache/thumbnails -type f -atime +7 >> /home/$user/.systemclean/2.log ; find /home/$user/.cache/thumbnails -type f -atime +7 -exec rm {} \;
[[ $response = *Thumbs.db* ]] && find /home/$user/ -name Thumbs.db -type f -atime +7 >> /home/$user/.systemclean/2.log ; find /home/$user/ -name Thumbs.db -exec rm {} \;
[[ $response = *Trash** ]] && ls -d /home/$user/.local/share/Trash/*/** >> /home/$user/.systemclean/2.log && rm -rf /home/*/.local/share/Trash/*/**
) |
zenity --progress \
--width=400 \
--window-icon="/home/$user/.systemclean/systemclean.png" \
--title="Очистить кэш программ!" \
--percentage=0 \
--pulsate \
--auto-close

echo "
--------------------------------------
</font><b>
<font color=#FF0000>О</font><font color=#FF3200>ч</font><font color=#FF6400>и</font><font color=#FF9600>с</font><font color=#FFC800>т</font><font color=#FFFA00>к</font><font color=#FFff00>а</font><font color=#CDff00> </font><font color=#9Bff00>у</font><font color=#69ff00>с</font><font color=#37ff00>п</font><font color=#05ff00>е</font><font color=#00ff00>ш</font><font color=#00ff32>н</font><font color=#00ff64>о</font><font color=#00ff96> </font><font color=#00ffC8>з</font><font color=#00ffFA>а</font><font color=#00ffff>в</font><font color=#00FAff>е</font><font color=#00C8ff>р</font><font color=#0096ff>ш</font><font color=#0064ff>е</font><font color=#0032ff>н</font><font color=#0000ff>а</font><font color=#0500ff>!</font><font color=#3700ff>!</font><font color=#6900ff>!</font><font color=#9B00ff> </font><font color=#CD00ff>:</font><font color=#FF00ff>)</font></b>" >> /home/$user/.systemclean/2.log

zenity --info --text "Очистка успешно завершена!!!" --window-icon="/home/$user/.systemclean/systemclean.png" --timeout=1

echo "</font>


После очистки:
--------------------------------------<font color=lightgrey>" >> /home/$user/.systemclean/results.html
df -Th | grep -v "fs" | sort >> /home/$user/.systemclean/results.html
echo "
$installpack пакетов" >> /home/$user/.systemclean/results.html

echo "</font>

********************************************************************
<font color=lightgrey>
Детальные результаты работы
в файле /home/$user/.systemclean
</font>
------------------
--- System Log ---
------------------<font color=#347C2C>" >> /home/$user/.systemclean/results.html
cat /home/$user/.systemclean/1.log >> /home/$user/.systemclean/results.html
echo "</font>
----------------
--- Home Log ---
----------------<font color=lightgrey>
Удаленные `cat /home/$user/.systemclean/2.log | grep -c "home"` файлов</font><font color=#347C2C>" >> /home/$user/.systemclean/results.html
cat /home/$user/.systemclean/2.log >> /home/$user/.systemclean/results.html
echo "<center><img src=http://i.imgur.com/wq6SwtO.png height=192 width=192 /></center>
</font></pre></code></body></html>" >> /home/$user/.systemclean/results.html

zenity --text-info --title="-- Результат --" --width="600" --height="600" --window-icon="/home/$user/.systemclean/systemclean.png" --html --filename="/home/$user/.systemclean/results.html"
[[ $response = *SystemClean** ]] && echo "" > /home/$user/.systemclean/1.log
[[ $response = *SystemClean** ]] && echo "" > /home/$user/.systemclean/2.log
[[ $response = *SystemClean** ]] && echo "" > /home/$user/.systemclean/kernels.txt
[[ $response = *SystemClean** ]] && $sys_clean > /home/$user/.systemclean/date.txt
[[ $response = *SystemClean** ]] && cat /home/$user/.systemclean/results.html | head -n 40 > ~/.systemclean/results_tmp.html && mv /home/$user/.systemclean/results_tmp.html /home/$user/.systemclean/results.html
[[ $response = *SystemClean** ]] && cat /home/$user/.systemclean/results_old.html | head -n 40 > ~/.systemclean/results_old_tmp.html && mv /home/$user/.systemclean/results_old_tmp.html /home/$user/.systemclean/results_old.html
wget --no-cache http://pastebin.com/raw.php?i=vVJLnJqh -O /home/$user/.systemclean/update_version
sleep 1
if [ "$(cat /home/$user/.systemclean/update_version)" = "newer version is available" ]; then
zenity --question --text="Новая версия программы доступна.\nЗагрузить?" --cancel-label="Напомнить позже" --window-icon="/home/$user/.systemclean/systemclean.png" --ok-label="Загрузить сейчас"
if [ $? -eq 0 ] ; then
x-www-browser http://gnome-look.org/content/show.php/SystemClean?content=132913
exit 0
fi fi
exit 0
fi

echo "" > /home/$user/.systemclean/kernels.txt

t=0
while [ $t = "0" ]
do
zenity --entry --title="Пароль" --text="Введите Ваш пароль:" --entry-text "" --hide-text | sudo -S echo "ok"
if [ $? != "0" ]; then
zenity --question --title="Неверный пароль" --text="Неверный пароль\n Попытатся снова?"
if [ $? != "0" ]; then exit 0; fi
else
t=1
fi
done

(
echo "# Начало очистки компьютер.\n\Подождите..."
sleep 1
[[ $respo = *Autoremove* ]] && sudo apt-get -y --purge autoremove >> /home/$user/.systemclean/1.log
[[ $respo = *Autoremove* ]] && sudo apt-get -y autoremove >> /home/$user/.systemclean/1.log
[[ $respo = *Autoclean* ]] && sudo apt-get -y autoclean >> /home/$user/.systemclean/1.log
[[ $respo = *Clean* ]] && sudo apt-get -y clean >> /home/$user/.systemclean/1.log
[[ $respo = */tmp* ]] && find /tmp/* -type d ! -perm -g+r,u+r,o+r -prune -o -print -exec rm {} \; >> /home/$user/.systemclean/1.log
[[ $respo = *Очистка_ненужных_файлов* ]] && aptitude search '~c' -F '%p' | xargs -n 30 sudo aptitude -y purge >> /home/$user/.systemclean/1.log
[[ $respo = *Удалить_хранимые_списки** ]] && sudo find /var/lib/apt/lists/ -type f -delete >> /home/$user/.systemclean/1.log && sudo apt-get update >> /home/$user/.systemclean/1.log
[[ $respo = *System_Logs** ]] && sudo find /var/log/ -maxdepth 1 -type f -delete >> /home/$user/.systemclean/1.log
[[ $respo = *System_Logs** ]] && sudo find /var/log/*/ -maxdepth 1 -type f -delete >> /home/$user/.systemclean/1.log
[[ $respo = *Trash** ]] && sudo rm -r /root/.local/share/Trash/info/ >> /home/$user/.systemclean/1.log
[[ $respo = *Trash** ]] && sudo rm -r /root/.local/share/Trash/files/ >> /home/$user/.systemclean/1.log
[[ $respo = *Кэш_памяти** ]] && sudo sh -c "sync; echo 3 > /proc/sys/vm/drop_caches"
[[ :$respo: = *:$kern1:* ]] && echo "$kern1" >> /home/$user/.systemclean/kernels.txt
[[ :$respo: = *:$kern2:* ]] && echo "$kern2" >> /home/$user/.systemclean/kernels.txt
[[ :$respo: = *:$kern3:* ]] && echo "$kern3" >> /home/$user/.systemclean/kernels.txt
[[ :$respo: = *:$kern4:* ]] && echo "$kern4" >> /home/$user/.systemclean/kernels.txt
[[ :$respo: = *:$kern5:* ]] && echo "$kern5" >> /home/$user/.systemclean/kernels.txt
[[ :$respo: = *:$kern6:* ]] && echo "$kern6" >> /home/$user/.systemclean/kernels.txt
[[ :$respo: = *:$kern7:* ]] && echo "$kern7" >> /home/$user/.systemclean/kernels.txt
[[ :$respo: = *:$kern8:* ]] && echo "$kern8" >> /home/$user/.systemclean/kernels.txt
[[ :$respo: = *:$kern9:* ]] && echo "$kern9" >> /home/$user/.systemclean/kernels.txt
[[ :$respo: = *:$kern10:* ]] && echo "$kern10" >> /home/$user/.systemclean/kernels.txt
[[ :$respo: = *:$kern11:* ]] && echo "$kern11" >> /home/$user/.systemclean/kernels.txt
[[ :$respo: = *:$kern12:* ]] && echo "$kern12" >> /home/$user/.systemclean/kernels.txt
[[ :$respo: = *:$kern13:* ]] && echo "$kern13" >> /home/$user/.systemclean/kernels.txt
[[ :$respo: = *:$kern14:* ]] && echo "$kern14" >> /home/$user/.systemclean/kernels.txt
[[ :$respo: = *:$kern15:* ]] && echo "$kern15" >> /home/$user/.systemclean/kernels.txt
[[ :$respo: = *:$kern16:* ]] && echo "$kern16" >> /home/$user/.systemclean/kernels.txt
[[ :$respo: = *:$kern17:* ]] && echo "$kern17" >> /home/$user/.systemclean/kernels.txt
[[ :$respo: = *:$kern18:* ]] && echo "$kern18" >> /home/$user/.systemclean/kernels.txt
[[ :$respo: = *:$kern19:* ]] && echo "$kern19" >> /home/$user/.systemclean/kernels.txt
[[ :$respo: = *:$kern20:* ]] && echo "$kern20" >> /home/$user/.systemclean/kernels.txt
[[ :$respo: = *:$kern21:* ]] && echo "$kern21" >> /home/$user/.systemclean/kernels.txt
[[ :$respo: = *:$kern22:* ]] && echo "$kern22" >> /home/$user/.systemclean/kernels.txt
[[ :$respo: = *:$kern23:* ]] && echo "$kern23" >> /home/$user/.systemclean/kernels.txt
[[ :$respo: = *:$kern24:* ]] && echo "$kern24" >> /home/$user/.systemclean/kernels.txt
[[ :$respo: = *:$kern25:* ]] && echo "$kern25" >> /home/$user/.systemclean/kernels.txt
[[ :$respo: = *:$kern26:* ]] && echo "$kern26" >> /home/$user/.systemclean/kernels.txt
[[ :$respo: = *:$kern27:* ]] && echo "$kern27" >> /home/$user/.systemclean/kernels.txt
[[ :$respo: = *:$kern28:* ]] && echo "$kern28" >> /home/$user/.systemclean/kernels.txt
[[ :$respo: = *:$kern29:* ]] && echo "$kern29" >> /home/$user/.systemclean/kernels.txt
[[ :$respo: = *:$kern30:* ]] && echo "$kern30" >> /home/$user/.systemclean/kernels.txt
[[ :$respo: = *:$kern31:* ]] && echo "$kern31" >> /home/$user/.systemclean/kernels.txt
[[ :$respo: = *:$kern32:* ]] && echo "$kern32" >> /home/$user/.systemclean/kernels.txt
[[ :$respo: = *:$kern33:* ]] && echo "$kern33" >> /home/$user/.systemclean/kernels.txt
[[ :$respo: = *:$kern34:* ]] && echo "$kern34" >> /home/$user/.systemclean/kernels.txt
[[ :$respo: = *:$kern35:* ]] && echo "$kern35" >> /home/$user/.systemclean/kernels.txt
[[ :$respo: = *:$kern36:* ]] && echo "$kern36" >> /home/$user/.systemclean/kernels.txt
[[ :$respo: = *:$kern37:* ]] && echo "$kern37" >> /home/$user/.systemclean/kernels.txt
[[ :$respo: = *:$kern38:* ]] && echo "$kern38" >> /home/$user/.systemclean/kernels.txt
[[ :$respo: = *:$kern39:* ]] && echo "$kern39" >> /home/$user/.systemclean/kernels.txt
[[ :$respo: = *:$kern40:* ]] && echo "$kern40" >> /home/$user/.systemclean/kernels.txt
[[ :$respo: = *:$kern41:* ]] && echo "$kern41" >> /home/$user/.systemclean/kernels.txt
[[ :$respo: = *:$kern42:* ]] && echo "$kern42" >> /home/$user/.systemclean/kernels.txt
[[ :$respo: = *:$kern43:* ]] && echo "$kern43" >> /home/$user/.systemclean/kernels.txt
[[ :$respo: = *:$kern44:* ]] && echo "$kern44" >> /home/$user/.systemclean/kernels.txt
[[ :$respo: = *:$kern45:* ]] && echo "$kern45" >> /home/$user/.systemclean/kernels.txt
[[ :$respo: = *:$kern46:* ]] && echo "$kern46" >> /home/$user/.systemclean/kernels.txt
[[ :$respo: = *:$kern47:* ]] && echo "$kern47" >> /home/$user/.systemclean/kernels.txt
[[ :$respo: = *:$kern48:* ]] && echo "$kern48" >> /home/$user/.systemclean/kernels.txt
[[ :$respo: = *:$kern49:* ]] && echo "$kern49" >> /home/$user/.systemclean/kernels.txt
[[ :$respo: = *:$kern50:* ]] && echo "$kern50" >> /home/$user/.systemclean/kernels.txt
sleep 1
if ! grep -q "linux" /home/$user/.systemclean/kernels.txt; then
sleep 1
echo "0 kernels to remove"
else
sleep 1
sort -u -o /home/$user/.systemclean/kernels.txt /home/$user/.systemclean/kernels.txt
sleep 1
echo "$(cat /home/$user/.systemclean/kernels.txt | xargs)" > /home/$user/.systemclean/kernels.txt
sleep 1
sudo apt-get -y purge $(cat /home/$user/.systemclean/kernels.txt) >> /home/$user/.systemclean/1.log
sudo update-grub >> /home/$user/.systemclean/1.log
fi

) |
zenity --progress \
--width=400 \
--window-icon="/home/$user/.systemclean/systemclean.png" \
--title="Очистить Вашу компьютер!" \
--percentage=0 \
--pulsate \
--auto-close

if [ "$?" = 1 ] ; then
        zenity --error \
          --text="Очистка отменена."
exit 1
fi

if [ "$?" = -1 ] ; then
        zenity --error \
          --text="Прочтите записи в папке .systemclean\nи увидите ошибки."
exit 1
fi

response=$(zenity  --list  --width="450"  --height="600" --window-icon="/home/$user/.systemclean/systemclean.png" --text "Выберете программу для очистки кеша\n\nЕсли не хотите очищать кеш, нажмите <b>OK</b>!" --checklist  --column "Выберете" --column "Программа" FALSE "AceStream" FALSE "Chrome" FALSE "Chromium" FALSE "Clementine" FALSE "Compiz" FALSE "Epiphany" FALSE "Evolution" FALSE "Firefox" FASLE "Flash_Player" FALSE "Icedtea" FALSE "Google_Earth - Temporary files" FALSE "Guayadeque" FALSE "Java" FALSE "LuckyBackup" FALSE "Miro" FALSE "Mozilla-Nightly" FALSE "Opera" FALSE "Pigdin" FALSE "Recently-used" FALSE "Seamonkey" FALSE "Swiftweasel" FALSE "SystemClean - история" FALSE "thumbnails - более 7 дней пользования" FALSE "Thumbs.db" FALSE "Thunderbird" FALSE "TorChat" FALSE "Transmission" FALSE "Vidalia_tor" FALSE "Vlc" FALSE "Wallpapers" FALSE "Trash - $user"  --separator=":")

if [ $? -eq 1 ] ; then
        zenity --error \
          --text="Очистка отменена."
exit 1
fi

if [ "$response" = "" ] ; then
echo "
--------------------------------------
</font><b>
<font color=#FF0000>О</font><font color=#FF3200>ч</font><font color=#FF6400>и</font><font color=#FF9600>с</font><font color=#FFC800>т</font><font color=#FFFA00>к</font><font color=#FFff00>а</font><font color=#CDff00> </font><font color=#9Bff00>у</font><font color=#69ff00>с</font><font color=#37ff00>п</font><font color=#05ff00>е</font><font color=#00ff00>ш</font><font color=#00ff32>н</font><font color=#00ff64>о</font><font color=#00ff96> </font><font color=#00ffC8>з</font><font color=#00ffFA>а</font><font color=#00ffff>в</font><font color=#00FAff>е</font><font color=#00C8ff>р</font><font color=#0096ff>ш</font><font color=#0064ff>е</font><font color=#0032ff>н</font><font color=#0000ff>а</font><font color=#0500ff>!</font><font color=#3700ff>!</font><font color=#6900ff>!</font><font color=#9B00ff> </font><font color=#CD00ff>:</font><font color=#FF00ff>)</font></b>" >> /home/$user/.systemclean/2.log

zenity --info --text "Очистка успешно завершена!!!" --window-icon="/home/$user/.systemclean/systemclean.png" --timeout=1

echo "</font>


После очистки:
--------------------------------------<font color=lightgrey>" >> /home/$user/.systemclean/results.html
df -Th | grep -v "fs" | sort >> /home/$user/.systemclean/results.html
echo "
$installpack пакетов" >> /home/$user/.systemclean/results.html

echo "</font>

********************************************************************
<font color=lightgrey>
Детальные результаты работы
в файле /home/$user/.systemclean
</font>
------------------
--- System Log ---
------------------<font color=#347C2C>" >> /home/$user/.systemclean/results.html
cat /home/$user/.systemclean/1.log >> /home/$user/.systemclean/results.html
echo "</font>
----------------
--- Home Log ---
----------------<font color=lightgrey>
Удаленные `cat /home/$user/.systemclean/2.log | grep -c "home"` файлов</font><font color=#347C2C>" >> /home/$user/.systemclean/results.html
cat /home/$user/.systemclean/2.log >> /home/$user/.systemclean/results.html
echo "<center><img src=http://i.imgur.com/wq6SwtO.png height=192 width=192 /></center>
</font></pre></code></body></html>" >> /home/$user/.systemclean/results.html

zenity --text-info --title="-- Результат --" --width="600" --height="600" --window-icon="/home/$user/.systemclean/systemclean.png" --html --filename="/home/$user/.systemclean/results.html"
[[ $response = *SystemClean** ]] && echo "" > /home/$user/.systemclean/1.log
[[ $response = *SystemClean** ]] && echo "" > /home/$user/.systemclean/2.log
[[ $response = *SystemClean** ]] && echo "" > /home/$user/.systemclean/kernels.txt
[[ $response = *SystemClean** ]] && $sys_clean > /home/$user/.systemclean/date.txt
[[ $response = *SystemClean** ]] && cat /home/$user/.systemclean/results.html | head -n 40 > ~/.systemclean/results_tmp.html && mv /home/$user/.systemclean/results_tmp.html /home/$user/.systemclean/results.html
[[ $response = *SystemClean** ]] && cat /home/$user/.systemclean/results_old.html | head -n 40 > ~/.systemclean/results_old_tmp.html && mv /home/$user/.systemclean/results_old_tmp.html /home/$user/.systemclean/results_old.html
wget --no-cache http://pastebin.com/raw.php?i=vVJLnJqh -O /home/$user/.systemclean/update_version
sleep 1
if [ "$(cat /home/$user/.systemclean/update_version)" = "newer version is available" ]; then
zenity --question --text="Новая версия программы доступна.\nЗагрузить?" --cancel-label="Напомнить позже" --window-icon="/home/$user/.systemclean/systemclean.png" --ok-label="Загрузить сейчас"
if [ $? -eq 0 ] ; then
x-www-browser http://gnome-look.org/content/show.php/SystemClean?content=132913
exit 0
fi fi
exit 0
fi

(
echo ; sleep 1
[[ $response = *Firefox* ]] && ls -d /home/$user/.cache/mozilla/firefox/*.*/cache*/* >> /home/$user/.systemclean/2.log && rm -rf /home/$user/.cache/mozilla/firefox/*.*/cache*/*
[[ $response = *Firefox* ]] && ls -d /home/$user/.cache/mozilla/firefox/*.*/thumbnails/* >> /home/$user/.systemclean/2.log && rm -rf /home/$user/.cache/mozilla/firefox/*.*/thumbnails/*
[[ $response = *Firefox* ]] && ls -d /home/$user/.cache/mozilla/firefox/*.*/OfflineCache/* >> /home/$user/.systemclean/2.log && rm -rf /home/$user/.cache/mozilla/firefox/*.*/OfflineCache/*
[[ $response = *Firefox* ]] && ls -d /home/$user/.cache/mozilla/firefox/*.*/startupCache/* >> /home/$user/.systemclean/2.log && rm -rf /home/$user/.cache/mozilla/firefox/*.*/startupCache/*
[[ $response = *Mozilla-Nightly* ]] && ls -d /home/$user/.cache/mozilla/firefox-trunk/*.*/cache*/* >> /home/$user/.systemclean/2.log && rm -rf /home/$user/.cache/mozilla/firefox-trunk/*.*/cache*/*
[[ $response = *Mozilla-Nightly* ]] && ls -d /home/$user/.cache/mozilla/firefox-trunk/*.*/thumbnails/* >> /home/$user/.systemclean/2.log && rm -rf /home/$user/.cache/mozilla/firefox-trunk/*.*/thumbnails/*
[[ $response = *Mozilla-Nightly* ]] && ls -d /home/$user/.cache/mozilla/firefox-trunk/*.*/OfflineCache/* >> /home/$user/.systemclean/2.log && rm -rf /home/$user/.cache/mozilla/firefox-trunk/*.*/OfflineCache/*
[[ $response = *Mozilla-Nightly* ]] && ls -d /home/$user/.cache/mozilla/firefox-trunk/*.*/startupCache/* >> /home/$user/.systemclean/2.log && rm -rf /home/$user/.cache/mozilla/firefox-trunk/*.*/startupCache/*
[[ $response = *Transmission* ]] && ls -d /home/$user/.cache/transmission/favicons/* >> /home/$user/.systemclean/2.log && rm -rf /home/$user/.cache/transmission/favicons/*
[[ $response = *Vlc* ]] && ls -d /home/$user/.cache/vlc/art/artistalbum/* >> /home/$user/.systemclean/2.log && rm -rf /home/$user/.cache/vlc/art/artistalbum/*
[[ $response = *Vlc* ]] && ls -d /home/$user/.cache/vlc/art/arturl/* >> /home/$user/.systemclean/2.log && rm -rf /home/$user/.cache/vlc/art/arturl/*
[[ $response = *Icedtea* ]] && ls -d /home/$user/.icedtea/cache/* >> /home/$user/.systemclean/2.log && rm -rf /home/$user/.icedtea/cache/*
[[ $response = *Recently-used* ]] && ls -d /home/$user/.local/share/recently-used.* >> /home/$user/.systemclean/2.log && rm -rf /home/$user/.local/share/recently-used.*
[[ $response = *Flash_Player* ]] && ls -d /home/$user/.macromedia/Flash_Player/macromedia.com/support/flashplayer/sys/#* >> /home/$user/.systemclean/2.log && rm -rf /home/$user/.macromedia/Flash_Player/macromedia.com/support/flashplayer/sys/#*
[[ $response = *Flash_Player* ]] && ls -d /home/$user/.macromedia/Flash_Player/#SharedObjects/*/* >> /home/$user/.systemclean/2.log && rm -rf /home/$user/.macromedia/Flash_Player/#SharedObjects/*/*
[[ $response = *Vidalia_tor* ]] && ls -d /home/$user/.tor/cached-* >> /home/$user/.systemclean/2.log && rm -rf /home/$user/.tor/cached-*
[[ $response = *TorChat* ]] && ls -d /home/$user/.torchat/Tor/tor_data/cached* >> /home/$user/.systemclean/2.log && rm -rf /home/$user/.torchat/Tor/tor_data/cached*
[[ $response = *Guayadeque* ]] && ls -d /home/$user/.guayadeque/cache.db >> /home/$user/.systemclean/2.log && rm -rf /home/$user/.guayadeque/cache.db
[[ $response = *Chrome* ]] && ls -d /home/$user/.cache/google-chrome/Default/Cache/* >> /home/$user/.systemclean/2.log && rm -rf /home/$user/.cache/google-chrome/Default/Cache/*
[[ $response = *Epiphany* ]] && ls -d /home/$user/.gnome2/epiphany/favicon_cache/* >> /home/$user/.systemclean/2.log && rm -rf /home/$user/.gnome2/epiphany/favicon_cache/*
[[ $response = *Seamonkey* ]] && ls -d /home/$user/.mozilla/seamonkey/*/Cache/* >> /home/$user/.systemclean/2.log && rm -rf /home/$user/.mozilla/seamonkey/*/Cache/*
[[ $response = *Swiftweasel* ]] && ls -d /home/$user/.sw35/swiftweasel/*/Cache/* >> /home/$user/.systemclean/2.log && rm -rf /home/$user/.sw35/swiftweasel/*/Cache/*
[[ $response = *Opera* ]] && ls -d /home/$user/.opera/cache/* >> /home/$user/.systemclean/2.log && rm -rf /home/$user/.opera/cache/*
[[ $response = *Chromium* ]] && ls -d /home/$user/.cache/chromium/Default/*/* >> /home/$user/.systemclean/2.log && rm -rf /home/$user/.cache/chromium/Default/*/*
[[ $response = *Evolution* ]] && ls -d /home/$user/.evolution/cache/tmp/* >> /home/$user/.systemclean/2.log && rm -rf /home/$user/.evolution/cache/tmp/*
[[ $response = *Java* ]] && ls -d /home/$user/.java/.userPrefs/* >> /home/$user/.systemclean/2.log && rm -rf /home/$user/.java/.userPrefs/*
[[ $response = *Compiz* ]] && ls -d /home/$user/.cache/compizconfig/* >> /home/$user/.systemclean/2.log && rm -rf /home/$user/.cache/compizconfig/*
[[ $response = *Compiz* ]] && ls -d /home/$user/.config/compiz/* >> /home/$user/.systemclean/2.log && rm -rf /home/$user/.config/compiz/*
[[ $response = *Compiz* ]] && ls -d /home/$user/.compiz/session/* >> /home/$user/.systemclean/2.log && rm -rf /home/$user/.compiz/session/*
[[ $response = *Clementine* ]] && ls -d /home/$user/.config/Clementine/networkcache/http/* >> /home/$user/.systemclean/2.log && rm -rf /home/$user/.config/Clementine/networkcache/http/*
[[ $response = *Wallpapers* ]] && ls -d /home/$user/.cache/wallpaper/* >> /home/$user/.systemclean/2.log && rm -rf /home/$user/.cache/wallpaper/*
[[ $response = *Google_Earth** ]] && ls -d /home/$user/.googleearth/Temp/* >> /home/$user/.systemclean/2.log && rm -rf /home/$user/.googleearth/Temp/*
[[ $response = *Google_Earth** ]] && ls -d /home/$user/.googleearth/Cache/icons/* >> /home/$user/.systemclean/2.log && rm -rf /home/$user/.googleearth/Cache/icons/*
[[ $response = *Google_Earth** ]] && ls -d /home/$user/.googleearth/Cache/qwebdata/offline_access/*/** >> /home/$user/.systemclean/2.log && rm -rf /home/$user/.googleearth/Cache/qwebdata/offline_access/*/**
[[ $response = *Google_Earth** ]] && ls -d /home/$user/.googleearth/Cache/unified_cache_leveldb_*/* >> /home/$user/.systemclean/2.log && rm -rf /home/$user/.googleearth/Cache/unified_cache_leveldb_*/*
[[ $response = *Google_Earth** ]] && ls -d /home/$user/.googleearth/Cache/webdata/* >> /home/$user/.systemclean/2.log && rm -rf /home/$user/.googleearth/Cache/webdata/*
[[ $response = *Google_Earth** ]] && ls -d /home/$user/.googleearth/Cache/dbCache.dat.index >> /home/$user/.systemclean/2.log && rm -rf /home/$user/.googleearth/Cache/dbCache.dat.index
[[ $response = *Google_Earth** ]] && ls -d /home/$user/.googleearth/Cache/dbroot_cache >> /home/$user/.systemclean/2.log && rm -rf /home/$user/.googleearth/Cache/dbroot_cache
[[ $response = *Google_Earth** ]] && ls -d /home/$user/.googleearth/Cache/dbCache.dat >> /home/$user/.systemclean/2.log && rm -rf /home/$user/.googleearth/Cache/dbCache.dat
[[ $response = *AceStream* ]] && ls -d /home/$user/.ACEStream/collected_torrent_files/* >> /home/$user/.systemclean/2.log && rm -rf /home/$user/.ACEStream/collected_torrent_files/*
[[ $response = *Thunderbird* ]] && ls -d /home/$user/.cache/thunderbird/*.default/Cache/* >> /home/$user/.systemclean/2.log && rm -rf /home/$user/.cache/thunderbird/*.default/Cache/*
[[ $response = *Thunderbird* ]] && ls -d /home/$user/.cache/thunderbird/*.default/startupCache/* >> /home/$user/.systemclean/2.log && rm -rf /home/$user/.cache/thunderbird/*.default/startupCache/*
[[ $response = *Thunderbird* ]] && ls -d /home/$user/.cache/thunderbird/*.default/OfflineCache/* >> /home/$user/.systemclean/2.log && rm -rf /home/$user/.cache/thunderbird/*.default/OfflineCache/*
[[ $response = *Pigdin* ]] && ls -d /home/$user/.purple/icons/* >> /home/$user/.systemclean/2.log && rm -rf /home/$user/.purple/icons/*
[[ $response = *Miro* ]] && ls -d /home/$user/.miro/icon-cache/* >> /home/$user/.systemclean/2.log && rm -rf /home/$user/.miro/icon-cache/*
[[ $response = *Miro* ]] && ls -d /home/$user/.miro/*.log* >> /home/$user/.systemclean/2.log && rm -rf /home/$user/.miro/*.log*
[[ $response = *LuckyBackup* ]] && ls -d /home/$user/.luckyBackup/logs/* >> /home/$user/.systemclean/2.log && rm -rf /home/$user/.luckyBackup/logs/*
[[ $response = *LuckyBackup* ]] && ls -d /home/$user/.luckyBackup/snaps/* >> /home/$user/.systemclean/2.log && rm -rf /home/$user/.luckyBackup/snaps/*
[[ $response = *thumbnails** ]] && find /home/$user/.thumbnails -type f -atime +7 >> /home/$user/.systemclean/2.log ; find /home/$user/.thumbnails -type f -atime +7 -exec rm {} \;
[[ $response = *thumbnails** ]] && find /home/$user/.cache/thumbnails -type f -atime +7 >> /home/$user/.systemclean/2.log ; find /home/$user/.cache/thumbnails -type f -atime +7 -exec rm {} \;
[[ $response = *Thumbs.db* ]] && find /home/$user/ -name Thumbs.db -type f -atime +7 >> /home/$user/.systemclean/2.log ; find /home/$user/ -name Thumbs.db -exec rm {} \;
[[ $response = *Trash** ]] && ls -d /home/$user/.local/share/Trash/*/** >> /home/$user/.systemclean/2.log && rm -rf /home/*/.local/share/Trash/*/**
) |
zenity --progress \
--width=400 \
--window-icon="/home/$user/.systemclean/systemclean.png" \
--title="Очистить кэш программ!" \
--percentage=0 \
--pulsate \
--auto-close

echo "
--------------------------------------
</font><b>
<font color=#FF0000>О</font><font color=#FF3200>ч</font><font color=#FF6400>и</font><font color=#FF9600>с</font><font color=#FFC800>т</font><font color=#FFFA00>к</font><font color=#FFff00>а</font><font color=#CDff00> </font><font color=#9Bff00>у</font><font color=#69ff00>с</font><font color=#37ff00>п</font><font color=#05ff00>е</font><font color=#00ff00>ш</font><font color=#00ff32>н</font><font color=#00ff64>о</font><font color=#00ff96> </font><font color=#00ffC8>з</font><font color=#00ffFA>а</font><font color=#00ffff>в</font><font color=#00FAff>е</font><font color=#00C8ff>р</font><font color=#0096ff>ш</font><font color=#0064ff>е</font><font color=#0032ff>н</font><font color=#0000ff>а</font><font color=#0500ff>!</font><font color=#3700ff>!</font><font color=#6900ff>!</font><font color=#9B00ff> </font><font color=#CD00ff>:</font><font color=#FF00ff>)</font></b>" >> /home/$user/.systemclean/2.log

zenity --info --text "Очистка успешно завершена!!!" --window-icon="/home/$user/.systemclean/systemclean.png" --timeout=1

echo "</font>


После очистки:
--------------------------------------<font color=lightgrey>" >> /home/$user/.systemclean/results.html
df -Th | grep -v "fs" | sort >> /home/$user/.systemclean/results.html
echo "
$installpack пакетов" >> /home/$user/.systemclean/results.html

echo "</font>

********************************************************************
<font color=lightgrey>
Детальные результаты работы
в файле /home/$user/.systemclean
</font>
------------------
--- System Log ---
------------------<font color=#347C2C>" >> /home/$user/.systemclean/results.html
cat /home/$user/.systemclean/1.log >> /home/$user/.systemclean/results.html
echo "</font>
----------------
--- Home Log ---
----------------<font color=lightgrey>
Удаленные `cat /home/$user/.systemclean/2.log | grep -c "home"` файлов</font><font color=#347C2C>" >> /home/$user/.systemclean/results.html
cat /home/$user/.systemclean/2.log >> /home/$user/.systemclean/results.html
echo "<center><img src=http://i.imgur.com/wq6SwtO.png height=192 width=192 /></center>
</font></pre></code></body></html>" >> /home/$user/.systemclean/results.html

zenity --text-info --title="-- Результат --" --width="600" --height="600" --window-icon="/home/$user/.systemclean/systemclean.png" --html --filename="/home/$user/.systemclean/results.html"
[[ $response = *SystemClean** ]] && echo "" > /home/$user/.systemclean/1.log
[[ $response = *SystemClean** ]] && echo "" > /home/$user/.systemclean/2.log
[[ $response = *SystemClean** ]] && echo "" > /home/$user/.systemclean/kernels.txt
[[ $response = *SystemClean** ]] && $sys_clean > /home/$user/.systemclean/date.txt
[[ $response = *SystemClean** ]] && cat /home/$user/.systemclean/results.html | head -n 40 > ~/.systemclean/results_tmp.html && mv /home/$user/.systemclean/results_tmp.html /home/$user/.systemclean/results.html
[[ $response = *SystemClean** ]] && cat /home/$user/.systemclean/results_old.html | head -n 40 > ~/.systemclean/results_old_tmp.html && mv /home/$user/.systemclean/results_old_tmp.html /home/$user/.systemclean/results_old.html
wget --no-cache http://pastebin.com/raw.php?i=vVJLnJqh -O /home/$user/.systemclean/update_version
sleep 1
if [ "$(cat /home/$user/.systemclean/update_version)" = "newer version is available" ]; then
zenity --question --text="Новая версия программы доступна.\nЗагрузить?" --cancel-label="Напомнить позже" --window-icon="/home/$user/.systemclean/systemclean.png" --ok-label="Загрузить сейчас"
if [ $? -eq 0 ] ; then
x-www-browser http://gnome-look.org/content/show.php/SystemClean?content=132913
exit 0
fi fi
exit 0
fi
