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
VERSION="4.0.8"

SCRIPT_NAME=$0

main() {

  wget http://ftp.otrs.org/pub/otrs/itsm/bundle4/ITSM-$VERSION.opm
  wget http://ftp.otrs.org/pub/otrs/itsm/packages4/GeneralCatalog-$VERSION.opm
  wget http://ftp.otrs.org/pub/otrs/itsm/packages4/ITSMChangeManagement-$VERSION.opm
  wget http://ftp.otrs.org/pub/otrs/itsm/packages4/ITSMConfigurationManagement-$VERSION.opm
  wget http://ftp.otrs.org/pub/otrs/itsm/packages4/ITSMCore-$VERSION.opm
  wget http://ftp.otrs.org/pub/otrs/itsm/packages4/ITSMIncidentProblemManagement-$VERSION.opm
  wget http://ftp.otrs.org/pub/otrs/itsm/packages4/ITSMServiceLevelManagement-$VERSION.opm
  wget http://ftp.otrs.org/pub/otrs/itsm/packages4/ImportExport-$VERSION.opm

}

main $@

