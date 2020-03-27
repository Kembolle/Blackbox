GLPI 9.3.2 en Centos 7

Una forma sencilla de instalar GLPI en CentOS 7.

# Antes de instalar la versión MariaDB 10.0 es importante remover la versión 5.5 del MariaDB.

yum remove mariadb-server mariadb-libs

# Creación de repositorio de MariaDB en el CentOS

vi /etc/yum/yum.repos.d/mariadb.repo

#MariaDB 10.0 CentOS repository list – created 2014-09-29 14:57 UTC
#http://mariadb.org/mariadb/repositories/

[mariadb]
name = MariaDB
baseurl = http://yum.mariadb.org/10.0/centos7-amd64
gpgkey=https://yum.mariadb.org/RPM-GPG-KEY-MariaDB
gpgcheck=1

------------------------------------------------------------------------------------------------------------------------------
Coisas para mudar no script.

Ao criar o usuário para o banco de dados, é altamente recomendável alterar a senha padrão. Substitua a senha por sua própria senha forte.

Na parte do host virtual, você precisa alterar o valor glpi.domain.local para o domínio desejado.


-----------------------------------------------------------------------------------------------------------------------------
Autor: https://github.com/rodolfomartin77/GLPI-9.3.2


