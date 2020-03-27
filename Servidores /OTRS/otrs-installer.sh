#!/usr/bin/env bash
################################################################################
# Name        : OTRS Installer from RPM Package or Source Code.
# Create date : 2014/02/21
# Update date : 2014/11/18
# Auther      : Toshihiro Takehara aka nouphet
################################################################################

# Setting Env
PATH=/sbin:/bin:/usr/sbin:/usr/bin:/usr/local/sbin:/usr/local/bin

# Setting OTRS Env
VERSION="4.0.16"
DATABASE_PASS="otrsdbpass"

SCRIPT_NAME=$0

#
# Show help and usages
#
help(){
    echo "Install OTRS from RPM or Source"
    echo ""
    echo "Usage:"
    echo "  \$ $SCRIPT_NAME rpm"
    echo "    or"
    echo "  \$ $SCRIPT_NAME src"
}

#
# Prepare function
# Install Packages from YUM
#
install_required_packages() {
    yum install -y --enablerepo=epel \
    gd \
    gd-devel \
    httpd \
    mod_perl \
    mysql-server \
    perl \
    perl-core \
    perl-Crypt-Eksblowfish \
    perl-Crypt-SSLeay \
    perl-Encode-HanExtra \
    perl-GD \
    perl-GDGraph \
    perl-GDTextUtil \
    perl-JSON-XS \
    perl-LDAP \
    perl-Mail-IMAPClient \
    perl-DBD-MySQL \
    perl-IO-Socket-SSL \
    perl-LDAP \
    perl-libwww-perl \
    perl-Net-DNS \
    perl-PDF-API2 \
    perl-Text-CSV_XS \
    perl-TimeDate \
    perl-XML-Parser \
    perl-YAML-LibYAML \
    procmail
}

#
# Main function
#
main() {

    if [ $# -lt 1 ]
    then
        help
        return 1
    fi

install_required_packages

if [ $1 = "rpm" ]
    then
        echo "########################################"
        echo "Install from RPM"
        echo "########################################"
        
        cd /usr/local/src/
        wget http://ftp.otrs.org/pub/otrs/RPMS/rhel/6/otrs-$VERSION-02.noarch.rpm
        if [ $? -ne 0 ]; then
            wget http://ftp.otrs.org/pub/otrs/RPMS/rhel/6/otrs-$VERSION-01.noarch.rpm
            yum -y localinstall otrs-$VERSION-01.noarch.rpm
        fi
        yum -y localinstall otrs-$VERSION-02.noarch.rpm
fi

if [ $1 = "src" ]
    then
        echo "########################################"
        echo "Install from Source"
        echo "########################################"

        # Preparing the installation from source
        cd /usr/local/src/
        wget http://ftp.otrs.org/pub/otrs/otrs-$VERSION.tar.gz
        tar zxf /usr/local/src/otrs-$VERSION.tar.gz
        mv /usr/local/src/otrs-$VERSION /opt/otrs
        #mv /usr/local/src/otrs-$VERSION/.* /opt/otrs/
        
        # Create User and Group
        useradd -r -d /opt/otrs/ -c 'OTRS user' otrs
        usermod -G apache otrs
        
        cd /opt/otrs/Kernel/
        cp Config.pm.dist Config.pm
        cd Config
        cp GenericAgent.pm.dist GenericAgent.pm
        
        cd /opt/otrs/bin/
        ./otrs.SetPermissions.pl /opt/otrs --otrs-user=otrs --web-user=apache --otrs-group=apache --web-group=apache
        
        # Installation Check of Perl modules
        cd /opt/otrs/bin/
        ./otrs.CheckModules.pl
        
        cd /opt/otrs
        perl -cw bin/cgi-bin/index.pl
        perl -cw bin/cgi-bin/customer.pl
        perl -cw bin/otrs.PostMaster.pl
        
        # Set Apache cnfig of otrs
        cp /opt/otrs/scripts/apache2-httpd.include.conf /etc/httpd/conf.d/otrs.conf

        cd /opt/otrs/scripts/database/
        echo "create database otrs character set utf8;" | mysql -u root
        echo "grant all privileges on otrs.* to otrs@localhost identified by '$DATABASE_PASS';" | mysql -u root
        echo "flush privileges;" | mysql -u root -p$DATABASE_PASS
        
        #mysql -u otrs -p$DATABASE_PASS otrs < otrs-schema.mysql.sql
        #mysql -u otrs -p$DATABASE_PASS otrs < otrs-initial_insert.mysql.sql
        #mysql -u otrs -p$DATABASE_PASS otrs < otrs-schema-post.mysql.sql
        
        perl -p -i.bak -e 's/some-pass/$DATABASE_PASS/g' /opt/otrs/Kernel/Config.pm
        
        # Setting up the cron jobs for OTRS
        cd /opt/otrs/bin/
        su - otrs /opt/otrs/bin/Cron.sh start

        # Set init Script
        cp /opt/otrs/scripts/otrs-scheduler-linux /etc/init.d/otrs
        chkconfig otrs --add

fi

# Start Server
chkconfig httpd on
chkconfig httpd --list
/etc/init.d/httpd restart

chkconfig mysqld on
chkconfig mysqld --list
/etc/init.d/mysqld restart


# Set init Script
chkconfig otrs on
chkconfig otrs --list
}

main $@

