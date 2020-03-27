#!/usr/bin/env bash
################################################################################
# Name        : OTRS5 Installer from RPM Package or Source Code.
# Create date : 2014/02/21
# Update date : 2016/07/21
# Auther      : Toshihiro Takehara aka nouphet
################################################################################

# Setting Env
PATH=/sbin:/bin:/usr/sbin:/usr/bin:/usr/local/sbin:/usr/local/bin

# Setting OTRS Env
VERSION="5.0.17"
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

start_message() {
    echo "Notice: Before OTRS Installation, please install EPEL Repo, Web Server and DB Server."
    echo ""
    echo "Have you already installed ? [yes/no] :"
    while read confirmation; do
        case $confirmation in
            'yes' ) echo "Going to OTRS Install !!"
                break ;;
            'no' ) echo "Stop installation"
                exit 0 ;;
            *) echo "unknown option. try aggain."
                echo ""
                echo "Notice: Before OTRS Installation, please install EPEL Repo, Web Server and DB Server."
                echo "Have you already installed ? [yes/no] :" ;;
        esac
    done
}

#
# Prepare function
# Install Packages from YUM
#
install_required_packages() {
    yum install -y \
    gd \
    gd-devel \
    httpd \
    mod_perl \
    mariadb-server \
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

start_message
install_required_packages

if [ $1 = "rpm" ]
    then

    echo "########################################"
    echo "Install from RPM"
    echo "########################################"
    
    cd /usr/local/src/
    if [ ! -e otrs-$VERSION-01.noarch.rpm -a ! -e otrs-$VERSION-02.noarch.rpm ];
    then
        wget http://ftp.otrs.org/pub/otrs/RPMS/rhel/7/otrs-$VERSION-02.noarch.rpm
        if [ $? -ne 0 ]; then
            wget http://ftp.otrs.org/pub/otrs/RPMS/rhel/7/otrs-$VERSION-01.noarch.rpm
            yum -y localinstall otrs-$VERSION-01.noarch.rpm
        else
            yum -y localinstall otrs-$VERSION-02.noarch.rpm
        fi
    fi
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

mod_conf
start_services

}

mod_conf() {
    cd /usr/local/src/
    wget https://raw.githubusercontent.com/nouphet/otrs-installer/master/my.cnf
    cp my.cnf /etc/my.cnf
}

start_services() {
    # Start Server
    systemctl enable httpd.service
    systemctl start  httpd.service
    
    systemctl enable mariadb.service
    systemctl start  mariadb.service
    
    # Set On OTRS Scheduler
    su -c "/opt/otrs/bin/otrs.Daemon.pl start" -s /bin/bash otrs
    su - otrs -c "/opt/otrs/bin/Cron.sh start"
}

main $@

