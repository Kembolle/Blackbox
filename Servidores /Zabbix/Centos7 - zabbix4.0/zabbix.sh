#!/bin/bash

  #add zabbix repo
	sudo rpm -ivh https://repo.zabbix.com/zabbix/4.0/rhel/7/x86_64/zabbix-release-4.0-2.el7.noarch.rpm
		
	#install zabbix agent 
	sudo yum install -y zabbix-agent
	
	#enable zabbix agent 
	sudo systemctl enable zabbix-agent

	#firewall rule
	firewall-cmd --permanent --add-port=10050/tcp
	sudo firewall-cmd --reload
	
	#update the distro
	sudo yum update -y
	
	#generate key
	sudo openssl rand -hex 64 > /etc/zabbix/database.psk	
	
	#append to the zabbix config
	printf "#GENERAL PARAMETERS\nPidFile=/var/run/zabbix/zabbix_agentd.pid\n\n#Option: LogFile\nLogFile=/var/log/zabbix/zabbix_agentd.log\n\n#Option: LogFileSize\nLogFileSize=0\n\n#Passive checks related\nServer=ZABBIXSERVER.COM\n\n#Active checks related\nServerActive=ZABBIXSERVER.COM\n\nHostnameItem=system.hostname\n\n#Option: Include\nInclude=/etc/zabbix/zabbix_agentd.d/*.conf\n\n# TLS-RELATED PARAMETERS\nTLSConnect=psk\n\n#Option: TLSAccept\nTLSAccept=psk\n\n#Option: TLSPSKFile\nTLSPSKFile=/etc/zabbix/database.psk\n\n# Option: TLSPSKIdentity\n" > /etc/zabbix/zabbix_agentd.conf
	
	#take the hostname of the machine and use it as the identity
	echo "TLSPSKIdentity="$HOSTNAME >> /etc/zabbix/zabbix_agentd.conf
			
	#show firewall status
	firewall-cmd --zone=public --list-ports
	
	#restart zabbix agent 
	sudo systemctl restart zabbix-agent
	
	#print to screen when completed
	echo "Zabbix install completed" && cat /etc/zabbix/database.psk
