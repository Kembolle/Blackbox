#!/usr/bin/env bash
################################################################################
# Name        : OTRS ITSM Module get script.
# Create date : 2015/01/13
# Update date : 2015/01/13
# Auther      : Toshihiro Takehara aka nouphet
################################################################################

# Setting Env
PATH=/sbin:/bin:/usr/sbin:/usr/bin:/usr/local/sbin:/usr/local/bin

# Setting OTRS Env
VERSION="3.3.11"

SCRIPT_NAME=$0

main() {

  wget http://ftp.otrs.org/pub/otrs/itsm/bundle33/ITSM-$VERSION.opm
  wget http://ftp.otrs.org/pub/otrs/itsm/packages33/GeneralCatalog-$VERSION.opm
  wget http://ftp.otrs.org/pub/otrs/itsm/packages33/ITSMChangeManagement-$VERSION.opm
  wget http://ftp.otrs.org/pub/otrs/itsm/packages33/ITSMConfigurationManagement-$VERSION.opm
  wget http://ftp.otrs.org/pub/otrs/itsm/packages33/ITSMCore-$VERSION.opm
  wget http://ftp.otrs.org/pub/otrs/itsm/packages33/ITSMIncidentProblemManagement-$VERSION.opm
  wget http://ftp.otrs.org/pub/otrs/itsm/packages33/ITSMServiceLevelManagement-$VERSION.opm
  wget http://ftp.otrs.org/pub/otrs/itsm/packages33/ImportExport-$VERSION.opm

}

main $@

