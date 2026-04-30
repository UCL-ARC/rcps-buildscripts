#!/usr/bin/env bash

# Install TotalView debugger on Myriad for Economics
#
# Version: 2026.1.3
# April 2026

APPNAME=${APPNAME:-TotalView}
VERSION=${VERSION:-2026.1.3}
PLATFORM=${PLATFORM:-linux}
ARCH=${ARCH:-x86-64}
INSTALL_PREFIX=${INSTALL_PREFIX:-/myriadfs/shared/ucl/apps/$APPNAME/$VERSION}
SRC_ARCHIVE=${SRC_ARCHIVE:-/myriadfs/shared/ucl/apps/TotalView/installers/totalview_2026.1.3_linux_x86-64.tar}

dirname=/shared/ucl/apps/build_scripts
INCLUDES_DIR=${INCLUDES_DIR:-${dirname}/includes}
source ${INCLUDES_DIR}/module_maker_inc.sh
source ${INCLUDES_DIR}/require_inc.sh

mkdir -p /dev/shm/$APPNAME
temp_dir=`mktemp -d -p /dev/shm/$APPNAME`
cd $temp_dir

tar -xvf $SRC_ARCHIVE
cd totalview.{VERSION}
tar -xvf totalview_${PLATFORM}_${ARCH}.tar.Z
cd totalview.${VERSION}

# Run install script

mkdir -p $INSTALL_PREFIX
echo ""
echo "Installing using: ./Install -agree -directory $INSTALL_PREFIX -install totalview -platform ${PLATFORM}-${ARCH} -nosymlink"
echo ""
./Install -agree -directory $INSTALL_PREFIX -install totalview -platform ${PLATFORM}-${ARCH} -nosymlink
echo ""
echo "Installing using: ./Install -agree -directory $INSTALL_PREFIX -install license -platform ${PLATFORM}-${ARCH} -nosymlink"
echo ""
./Install -agree -directory $INSTALL_PREFIX -install license -platform ${PLATFORM}-${ARCH} -nosymlink

echo "Done. Now need to install the license file by hand."
