    #!/bin/bash
    #-----------------------------------------------\\
    version="0x01"
    script_name="Information Gathering LHN [Live Hosting Network] " #Defina aqui que o nome do script para ser usado no console
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
    Information Gathering LHN [Live Hosting Network] Version:'$version'
    Autor: Kembolle Amilkar A.K.A. O.liverkall
    language:Portuguese     |      Data: 06 / 10 / 2011
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
    #/ Fping - Ping other computers on your network with this multifunctional tool.
    #/ Nping is an open source tool for network packet generation.
    #/ DNSenum is a pentesting cool created to enumerate DNS info about domains.
    #/ Dnswalk você pode obter informações sobre servidores dns de sites.
    -------------------------------------------------------------------------------\\\
    [0x01] -  Fping | pings multiple hosts at once.
    [0x02] -  Ping | Simple Ping Command.
    [0x03] -  Nping | network packet generation.
    [0x04] -  Traceroute | Rastreio de Rota Pacotes.
    [0x05] -  Tcptraceroute | Passar os filtros mais comuns de roteadotes.
    [0x06] -  curl | A tool to transfer data from or to a server.
    [0x07] -  Tracepath | tracepath performs a very simlar function to traceroute.
    [0x08] -  DNS Enumeração | Enumeração de DNS.
    [0x09] -  DNS Walk | DNS Enumeração.
     
    [+]===================================================================[+]
            Usage: Adicione IP alvo Desejado! | Ex: 192.168.1.5 "
    [+]===================================================================[+]'
    echo -n "Root@Blackbox:~# " ; read dominio
    clear
    #---------// Final de Cabeçalho.
     
     
    echo Loading Information .....  
    sleep 3
    echo "[+]========================================[+]"
    echo " #  [0x01] Fping - pings multiple hosts at once. "
    fping -Asu $dominio >> /root/Desktop/RelatorioPentest.txt
    echo "[+]========================================[+]" >> /root/Desktop/RelatorioPentest.txt
    sleep 3
     
    #---------//  
    echo "[+]========================================[+]"
    echo " # [0x02] Ping | Simple Ping Command.
    Pressione Control+C , apos 10 Segundos. "
    ping  $dominio >> /root/Desktop/RelatorioPentest.txt
    echo "[+]========================================[+]" >> /root/Desktop/RelatorioPentest.txt
    sleep 3
     
    #---------//  
    echo "[+]========================================[+]"
    echo " #  [0x03]Nping | network packet generation. "
    nping --tcp-connect $dominio >> /root/Desktop/RelatorioPentest.txt
    echo "[+]========================================[+]" >> /root/Desktop/RelatorioPentest.txt
    sleep 3
     
    #---------//  
    echo "[+]========================================[+]"
    echo " # [0x04] Traceroute | rastreio de rota. "
    traceroute -I -n  $dominio >> /root/Desktop/RelatorioPentest.txt
    echo "[+]========================================[+]" >> /root/Desktop/RelatorioPentest.txt
    sleep 3
     
    #---------//  
    echo "[+]========================================[+]"
    echo " #  [0x05]Tcptraceroute  | Ultrapassando roteadores. "
    tcptraceroute -w2 -q1 -f 5  $dominio >> /root/Desktop/RelatorioPentest.txt
    echo "[+]========================================[+]" >> /root/Desktop/RelatorioPentest.txt
    sleep 3
     
    #---------//  
    echo "[+]========================================[+]"
    echo " #  [0x05]Tcptraceroute  | Ultrapassando firewalls . "
    tcptraceroute -f 5  $dominio >> /root/Desktop/RelatorioPentest.txt
    echo "[+]========================================[+]" >> /root/Desktop/RelatorioPentest.txt
    sleep 3
     
     
    #---------//  
    echo "[+]========================================[+]"
    echo " # [0x06]curl  | rastreio de rota. "
    curl -I $dominio  | head -n 50 >> /root/Desktop/RelatorioPentest.txt
    echo "[+]========================================[+]" >> /root/Desktop/RelatorioPentest.txt
    sleep 3
     
    #---------//  
    echo "[+]========================================[+]"
    echo " # [0x07]tracepath  | Tracerout Simple domain . "
    tracepath $dominio >> /root/Desktop/RelatorioPentest.txt
    echo "[+]========================================[+]" >> /root/Desktop/RelatorioPentest.txt
    sleep 3
     
     
    #---------//  
    sleep 3
    echo "[+]========================================[+]"
    echo " # [0x08]- DNS Enumeração  "
    cd /pentest/enumeration/dns/dnsenum
    sudo perl dnsenum.pl $dominio >> /root/Desktop/RelatorioPentest.txt
    echo "[+]========================================[+]" >> /root/Desktop/RelatorioPentest.txt
    sleep 3
     
    #---------//
    sleep 3
    echo "[+]========================================[+]"
    echo " # [0x09]- DNS Enumeração  " $dominio
    cd /pentest/enumeration/dns/dnswalk
    sudo perl ./dnswalk $dominio. >> /root/Desktop/RelatorioPentest.txt
    echo "[+]========================================[+]" >> /root/Desktop/RelatorioPentest.txt
    sleep 3
