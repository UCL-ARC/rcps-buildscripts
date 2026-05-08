#!/usr/bin/env bash

###############################################
# Installing STAR-CD for Brunel 
#
# Updated for version 4.36.004 (2021.1) of Brunel in Young 2026

dirname=$(dirname $0 2>/dev/null || pwd)
INCLUDES_DIR=${INCLUDES_DIR:-${dirname}/includes}
source ${INCLUDES_DIR}/module_maker_inc.sh
source ${INCLUDES_DIR}/require_inc.sh
source ${INCLUDES_DIR}/source_includes.sh

NAME=${NAME:-STAR-CD}
VERSION=${VERSION:-4.36.004}
INSTALL_PREFIX=${INSTALL_PREFIX:-/apps/${NAME}/${VERSION}}
SRC_ARCHIVE=${SRC_ARCHIVE:-/apps/pkg-store/${NAME}_2021.1-436004_202104290129-Linux_x86_64.tar}
GROUP=${GROUP:-ag-archpc-starcd}

set -e

#mkdir -p /dev/shm/star-cd
#temp_dir=`mktemp -d -p /dev/shm/star-cd`

archive=$(basename "${SRC_ARCHIVE}")

#cd $temp_dir
#tar -xvf $SRC_ARCHIVE


# remove offending ancient libm
#rm -f "${temp_dir}"/tools/software/P7ZIP/9.20/linux64*/lib/libm.so.6

# pick components and answer questions interactively - choose A for all.
#sh setup

# set permissions to restricted group only
cd $INSTALL_PREFIX
#chgrp -R $GROUP $INSTALL_PREFIX
#chmod o-rx $INSTALL_PREFIX

# Add HPC_SCRATCH and change STARFLAGS in etc/software.ini
sed -i.bak '/default                     STARFLAGS=/a default                     HPC_SCRATCH=$TMPDIR' $INSTALL_PREFIX/etc/software.ini
sed -i -e "s|STARFLAGS=|STARFLAGS=-nodefile \$TMPDIR/machines -scratch=\$TMPDIR|" $INSTALL_PREFIX/etc/software.ini
 
package_name="STAR-CD"
package_version="4.36.004"

install_prefix=$INSTALL_PREFIX
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
