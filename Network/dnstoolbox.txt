    #!/bin/bash
    #-----------------------------------------------\\
    version="0x01"
    script_name="DNS ToolboX Discover  "
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
    Information Gathering [DNS ToolboX ] Version:'$version'
    Autor: Kembolle Amilkar A.K.A. O.liverkall | kembolle.com.br
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
    #/ Fierce - http://ha.ckers.org/fierce/ .
    #/ DNSTracer - http://www.mavetju.org/unix/dnstracer.php .
    -------------------------------------------------------------------------------\\\
    [0x01] - Whois  | Retorna informações sobre o domínio do site em questão.
    [0x02] - Lookup | Realizar traduções directas ou inversas.
    [0x03] - Dig?   | permite fazer resoluções directas e indireta de endereços
    [0x04] - Firce  | Netdiscover SubDomains .
    [0x05] - Dns Tracer | Realiza Tracer DNS em Questão '"
     
    [+]===================================================================[+]
            Usage: Adicione IP/Dominio alvo Desejado! | Ex: exemplo.com.br  
    [+]===================================================================[+] "''
    echo -n "Root@Blackbox:~# " ; read dominio
                   
     
    #---------//  
     sleep 3
     echo "[+]========================================[+]"
     echo " # [0x01]- Whois Location "
     whois $dominio >> /home/desktop/RelatorioPentest.txt
    echo "[+]========================================[+]" >> /home/desktop/RelatorioPentest.txt
    sleep 3
     
     
    #---------//  
     sleep 3
     echo "[+]========================================[+]"
     echo " # [0x02]- Nslookup Location "
    nslookup $dominio >> /home/desktop/RelatorioPentest.txt
    echo "[+]========================================[+]" >> /home/desktop/RelatorioPentest.txt
     sleep 3
     
    #---------//  
     sleep 3
     echo "[+]========================================[+]"
     echo " # [0x03]- Dig? " $dominio "any"
     dig $dominio >> /home/desktop/RelatorioPentest.txt
    echo "[+]========================================[+]" >> /home/desktop/RelatorioPentest.txt
    sleep 3
     
    #---------//  
    sleep 3
    echo "[+]========================================[+]"
    echo " # [0x03]- Dig? " $dominio "any"
    dig $dominio A >> /home/desktop/RelatorioPentest.txt
    echo "[+]========================================[+]" >> /home/desktop/RelatorioPentest.txt
    sleep 3
     
    #---------//  
    sleep 3
    echo "[+]========================================[+]"
    echo " # [0x03]- Dig? " $dominio "any"
    dig $dominio MX >> /home/desktop/RelatorioPentest.txt
    echo "[+]========================================[+]" >> /home/desktop/RelatorioPentest.txt
    sleep 3
     
     
     
    #---------//  
    sleep 3
    echo "[+]========================================[+]"
    echo " # [0x04]- Subdomain Hosting Fierce  "
    cd /pentest/enumeration/dns/fierce
    perl fierce.pl -dns $dominio >> /home/desktop/RelatorioPentest.txt
    echo "[+]========================================[+]" >> /home/desktop/RelatorioPentest.txt
    sleep 3
     
     
    #---------//
    sleep 3
    echo "[+]========================================[+]"
    echo " # [0x05]- DNS Location "
    dnstracer -vo  $dominio >> /home/desktop/RelatorioPentest.txt
    echo "[+]========================================[+]" >> /home/desktop/RelatorioPentest.txt
    sleep 3
