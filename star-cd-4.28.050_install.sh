#!/usr/bin/env bash

###############################################
# Installing STAR-CD
#
# Updated for version 4.28.050 March 2026

dirname=$(dirname $0 2>/dev/null || pwd)
INCLUDES_DIR=${INCLUDES_DIR:-${dirname}/includes}
source ${INCLUDES_DIR}/module_maker_inc.sh
source ${INCLUDES_DIR}/require_inc.sh
source ${INCLUDES_DIR}/source_includes.sh

NAME=${NAME:-STAR-CD}
VERSION=${VERSION:-4.28.050}
INSTALL_PREFIX=${INSTALL_PREFIX:-/apps/${NAME}/${VERSION}}
BUILD=${BUILD:-201801291142}
SRC_ARCHIVE=${SRC_ARCHIVE:-/apps/pkg-store/${NAME}_${VERSION}_${BUILD}-Linux_x86_64.tar}
LICSERV=${LICSERV:-1999@ntsrv1.meng.ucl.ac.uk}
GROUP=${GROUP:-ag-archpc-starcd}
ICE_VER=${ICE_VER:-4.28.053}
ICE_ARCH=${ICE_ARCH:-linux64_2.6-x86-glibc_2.5.0-gcc_4.4.3-ifort_11.0}

set -e

mkdir -p /dev/shm/star-cd
temp_dir=`mktemp -d -p /dev/shm/star-cd`

archive=$(basename "${SRC_ARCHIVE}")

cd $temp_dir
tar -xvf $SRC_ARCHIVE

# remove offending ancient libm
rm -f "${temp_dir}"/tools/software/P7ZIP/9.20/linux64*/lib/libm.so.6

# pick components and answer questions interactively - choose A for all.
sh setup

# ICE fix
cd $INSTALL_PREFIX/ICE/$ICE_VER
chmod -R a+rwx $ICE_ARCH

# set permissions to restricted group only
cd $INSTALL_PREFIX
chgrp -R $GROUP $INSTALL_PREFIX
chmod o-rx $INSTALL_PREFIX

# Add HPC_SCRATCH and change STARFLAGS in etc/software.ini
sed -i.bak '/default                     STARFLAGS=/a default                     HPC_SCRATCH=$TMPDIR' $INSTALL_PREFIX/etc/software.ini
sed -i -e "s|STARFLAGS=|STARFLAGS=-nodefile \$TMPDIR/machines -scratch=\$TMPDIR|" $INSTALL_PREFIX/etc/software.ini
 
package_name="STAR-CD"
package_version="4.28.050"

install_prefix=$INSTALL_PREFIX/ICE/$ICE_VER
module_dir="${install_prefix}/.uclrc_modules"
cd "$install_prefix"
echo "Post-building..."
echo "$install_prefix"
echo "$module_dir"

make_module \
    -o "${module_dir}/${package_name}/${package_version}" \
    -p "$install_prefix" \
    -c star-cd
cd ..
echo "End post-building"
