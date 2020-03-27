#!/bin/bash
	
	# **********************
	# **** GLPI - DGTIC ****
	# **********************
	# by @dsi_dgtic_mspbs

# Instalación de paquetes básicos
sudo yum -y install epel-release
sudo yum -y install firewalld httpd php php-mysql php-pdo php-gd php-mbstring php-imap php-ldap php-pecl-apcu-bc php-pecl-zendopcache php-xmlrpc php-odbc php-pear php-xml php-xmlrpc php-soap php-pdo php-mysqlnd php-pear-cas curl curl-devel mariadb-server mariadb expect policycoreutils-python
sudo yum -y install http://rpms.remirepo.net/enterprise/remi-release-7.rpm
sudo yum-config-manager --enable remi-php72
sudo yum -y update php

# SELinux
sudo setsebool -P httpd_can_network_connect on
sudo setsebool -P httpd_can_network_connect_db on
sudo setsebool -P httpd_can_sendmail on
	
# Inicializando servicios
sudo systemctl start firewalld httpd mariadb
sudo systemctl enable firewalld httpd mariadb

# Agregando reglas de FIREWALL
sudo firewall-cmd --permanent --add-service=http
sudo firewall-cmd –reload

# Configurando la base de datos
# Iniciando instalación
	SECURE_MYSQL=$(expect -c "
	set timeout 10
	spawn mysql_secure_installation
	expect \"Enter current password for root (enter for none):\"
	send \"$MYSQL\r\"
	expect \"Change the root password?\"
	send \"n\r\"
	expect \"Remove anonymous users?\"
	send \"y\r\"
	expect \"Disallow root login remotely?\"
	send \"y\r\"
	expect \"Remove test database and access to it?\"
	send \"y\r\"
	expect \"Reload privilege tables now?\"
	send \"y\r\"
	expect eof
	")
	echo "$SECURE_MYSQL"

# Creando usuario y base de datos
mysql -u root <<'EOF'
create database glpi;
create user glpi@localhost identified by 'Dgtic.123';
grant all privileges on glpi.* to glpi@localhost identified by 'Dgtic.123';
flush privileges;
EOF

# Descargando los archivos, chequeando la última versión:
# https://github.com/glpi-project/glpi/releases

curl -L https://github.com/glpi-project/glpi/releases/download/9.3.2/glpi-9.3.2.tgz -o glpi.tgz
sudo tar -xzvf glpi.tgz -C /var/www/
rm -rf glpi.tgz

# Corrigiendo permisos.
sudo semanage fcontext -a -t httpd_sys_rw_content_t "/var/www/glpi(/.*)?"
sudo restorecon -Rv /var/www/
sudo chown root:root /var/www/glpi
sudo chown -R apache:apache /var/www/glpi/*
sudo find /var/www/glpi/* -type d -exec chmod 755 {} \;
sudo find /var/www/glpi/* -type f -exec chmod 644 {} \;

# Agregando al virtual host
	cat << 'EOF' | sudo tee /etc/httpd/conf.d/glpi.conf > /dev/null
	<VirtualHost *:80>
	  DocumentRoot /var/www/glpi
	  ServerName glpi.localdomain.com
	
	  Alias /glpi /var/www/glpi
	
	  <Directory /var/www/glpi>
	    Options None
	    AllowOverride Limit Options FileInfo
	
	    <IfModule mod_authz_core.c>
	      Require all granted
	    </IfModule>
	    <IfModule !mod_authz_core.c>
	      Order deny,allow
	      Allow from all
	    </IfModule>
	  </Directory>
	
	  <Directory /var/www/glpi/install>
	
# La instalación solo se permite a través del acceso local (desde el servidor GLPI).
# Agregue su dirección IP si la necesita para la instalación remota,
# pero recuerda eliminarlo después de la instalación por seguridad.
	
	    <IfModule mod_authz_core.c>
	      # Apache 2.4
	      # Require local
	      # Require ip 192.168.1.38
	      Require all granted
	    </IfModule>
	    <IfModule !mod_authz_core.c>
	      # Apache 2.2
	      Order Deny,Allow
	      # Deny from All
	      # Allow from 127.0.0.1
	      # Allow from ::1
	      # Allow from x.x.x.x
	      Allow from All
	    </IfModule>
	
	    ErrorDocument 403 "<p><b>Restricted area.</b><br />Only local access allowed.<br />Check your configuration or contact your administrator.</p>"
	
	    <IfModule mod_php5.c>
	      # Migration could be very long
	      php_value max_execution_time 0
	      php_value memory_limit -1
	    </IfModule>
	  </Directory>
	
	  <Directory /var/www/glpi/config>
	    Order Allow,Deny
	    Deny from all
	  </Directory>
	
	  <Directory /var/www/glpi/locales>
	    Order Allow,Deny
	    Deny from all
	  </Directory>
	
	  <Directory /var/www/glpi/install/mysql>
	    Order Allow,Deny
	    Deny from all
	  </Directory>
	
	  <Directory /var/www/glpi/scripts>
	    Order Allow,Deny
	    Deny from all
	  </Directory>
	</VirtualHost>
	EOF

	# Reiniciando web server
	sudo systemctl restart httpd

	# Recordar
	echo "After installation, remember to delete the installation file: /var/www/glpi/install/install.php"
