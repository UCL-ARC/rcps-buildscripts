#!/usr/bin/env bash

###############################################
# Updating license for  FoldX 5.0 as a reserved application.
# Based on the script of Brian Alston March 2022
# by Nicole Labra Avila, June 2026

# Install archive downloaded from:
# https://foldxsuite.crg.eu/ license portal and copied to:
#
#     /shared/ucl/apps/pkg-store/foldx_20270131
#
# on Myriad only.

NAME=${NAME:-FoldX}
VERSION=${VERSION:-v5.0}
INSTALL_PREFIX=${INSTALL_PREFIX:-/shared/ucl/apps/$NAME/$VERSION}
SRC_ARCHIVE=${SRC_ARCHIVE:-/shared/ucl/apps/pkg-store/foldx_20270131}
LICENSE_FILE=${LICENSE_FILE:-foldx_20270131}
APP_GROUP=${APP_GROUP:-ag-archpc-foldx}

set -e

if [ ! -e $SRC_ARCHIVE]
then
    echo ""
    echo "*** ERROR: Cannot find FoldX installer archive"
    echo ""
    echo "You need to download the FoldX installer archive from:"
    echo "https://foldxsuite.crg.eu/ license portal -"
    echo "Place it somewhere in your file-system and set the SRC_ARCHIVE" 
    echo "variable appropriately."
    echo ""
    exit 1
fi

# Binary install
 
cd $INSTALL_PREFIX
cp $SRC_ARCHIVE .
#unzip -x $SRC_ARCHIVE .

# The binary incudes the license expiry date in the name. Set up a link to keep the same name as
# before.

rm foldx
ln -s $LICENSE_FILE foldx

# Convert to reserved app.

cd ..
chgrp -R $APP_GROUP `basename $INSTALL_PREFIX`
chmod -R o-rwx `basename $INSTALL_PREFIX`
cd $INSTALL_PREFIX
chmod ug+rx $binary
ls -l
