#!/usr/bin/env bash
################################################################################
# Name        : OTRS ITSM Module get script.
# Create date : 2016/09/12
# Update date : 2016/09/12
# Auther      : Toshihiro Takehara aka nouphet
################################################################################

# Setting Env
PATH=/sbin:/bin:/usr/sbin:/usr/bin:/usr/local/sbin:/usr/local/bin

# Setting OTRS Env
VERSION="5.0.17"

SCRIPT_NAME=$0

main() {

  wget http://ftp.otrs.org/pub/otrs/itsm/bundle5/ITSM-$VERSION.opm
  wget http://ftp.otrs.org/pub/otrs/itsm/packages5/GeneralCatalog-$VERSION.opm
  wget http://ftp.otrs.org/pub/otrs/itsm/packages5/ITSMChangeManagement-$VERSION.opm
  wget http://ftp.otrs.org/pub/otrs/itsm/packages5/ITSMConfigurationManagement-$VERSION.opm
  wget http://ftp.otrs.org/pub/otrs/itsm/packages5/ITSMCore-$VERSION.opm
  wget http://ftp.otrs.org/pub/otrs/itsm/packages5/ITSMIncidentProblemManagement-$VERSION.opm
  wget http://ftp.otrs.org/pub/otrs/itsm/packages5/ITSMServiceLevelManagement-$VERSION.opm
  wget http://ftp.otrs.org/pub/otrs/itsm/packages5/ImportExport-$VERSION.opm

}

main $@
