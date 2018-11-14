#!/bin/bash
    #-----------------------------------------------\\
    version="0x01"
    script_name="Discover Ip's Blocos   "
    userid=$(id -u)
    clear
     
    #-----------------------------------------------\\
    echo "Testando Permissão..... "
    # Permissão de Usuario [Root]
    a=`whoami`
    b="root"
    if [ "$a" = "$b" ]
    then
    echo "uid=0(root) gid=0(root) groups=0(root) - Happy Hacking ;D"
    else
    echo "--Ops!!Script em MODO USUARIO, Execute como "root" cabeção! ;)"
    exit 1
    fi
    sleep 2
    #-----------------------------------------------\\
    

    #---------// Cabeçalho.
    echo '
    [+]===================================================================[+]
    Information Gathering [Blocos de IPs ] Version:'$version'
    Autor: Kembolle Amilkar A.K.A. O.liverkall | kembolle.com.br
    language:Portuguese     |      Data: 25 / 11 / 2016
           __________________
          /\  ______________ \
         /::\ \ZZZZZZZZZZZZ/\ \  
        /:/\.\ \        /:/\:\ \  
       /:/Z/\:\ \      /:/Z/\:\ \
      /:/Z/__\:\ \____/:/Z/  \:\ \
     /:/Z/____\:\ \___\/Z/    \:\ \  
     \:\ \ZZZZZ\:\ \ZZ/\ \     \:\ \  
      \:\ \     \:\ \ \:\ \     \:\ \
       \:\ \     \:\ \_\;\_\_____\;\ \
        \:\ \     \:\_________________\
         \:\ \    /:/ZZZZZZZZZZZZZZZZZ/
          \:\ \  /:/Z/    \:\ \  /:/Z/
           \:\ \/:/Z/      \:\ \/:/Z/
            \:\/:/Z/________\;\/:/Z/
             \::/Z/________x86_\/Z/
              \/ZZZZZZZZZZZZZZZZZ/
                                     

    Dependências:
    #/ Whois  - https://packages.debian.org/pt-br/sid/whois
    -------------------------------------------------------------------------------\\\
    [0x01] - Whois  | Retorna informações sobre o bloco de IPs de acordo com AS.   
    [+]===================================================================[+]
            Usage: Adicione o nome do AS para encontrar blocos de IPs | Ex: AS32934 
    [+]===================================================================[+]' 
    echo -n "Root@Blackbox:~# " ; read dominio


    #---------//  
     sleep 3
     echo "[+]===================================================================[+]"
     echo " # [0x01]- Whois  | Retorna informações sobre o bloco de IPs de acordo com AS. "
     whois -h whois.radb.net -- -i origin $dominio | grep ^route  >> /home/oliverkall/desktop/bloco-ips.txt
     echo  "[+]===================================================================[+]" >> /home/oliverkall/desktop/bloco-ips.txt
     sleep 3
      
