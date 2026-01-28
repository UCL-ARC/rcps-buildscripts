#!/usr/bin/env bash

###############################################
# Installing base R plus recommended packages using GCC + OpenBLAS
#
# R 4.5.1 release
#
# by Nicole Labra, November 2025 following the instructions of Brian Alston for R 4.4.2, June 2020
#
# May 2017 updated for R 3.4.0
# October 2017 updated for R 3.4.2
# May 2018 updated for R 3.5.0 and using fftw 3.3.6 and ROOT built
#          using fftw 3.3.6
# Sept 2018 updated for R 3.5.1 and udunits 2.2.26
# April 2019 updated for R 3.5.3
# June 2019 updated for R 3.6.0
# April 2020 updated for R 3.6.3 - now needs GNU 9.2.0 for some
# additional packages (eg Rfast)
# June 2020 updated for R 4.0.2
# September 2021 updated for R 4.1.1 and switched to GNU 10.2.0
# May 2022 updated for R 4.2.0
# January 2023 updated for R 4.2.2
# April 2023 updated for R 4.2.3
# March 2024 updated for R 4.3.3
# June 2024 updated for R 4.4.0
# October 2024 updated for R 4.4.1 and using Java 21 and then updated for
# R 4.4.2 beta releases
# November 2024 updated for R 4.4.2 release (31-10-2024)
#
# Using Ian's require function to load modules
#
# Will need modules: see list of modules below.
# May need to update required modules for the latest R. Modules
# updated:

VERSION=${VERSION:-4.5.1}
INSTALL_PREFIX=${INSTALL_PREFIX:-/shared/ucl/apps/R/R-${VERSION}-OpenBLAS}
#INSTALL_PREFIX=${INSTALL_PREFIX:-/home/skgtnl1/R/R-${VERSION}-OpenBLAS}
SRC_ARCHIVE=${SRC_ARCHIVE:- https://cran.r-project.org/src/base/R-4/R-${VERSION}.tar.gz}

export PATH=$INSTALL_PREFIX/bin:$PATH

dirname=$(dirname $0 2>/dev/null || pwd)
INCLUDES_DIR=${INCLUDES_DIR:-${dirname}/includes}
source ${INCLUDES_DIR}/module_maker_inc.sh
source ${INCLUDES_DIR}/require_inc.sh
source ${INCLUDES_DIR}/source_includes.sh

module purge 
require gcc-libs/10.2.0
require compilers/gnu/10.2.0

# Use serial OpenBLAS again?
require openblas/0.3.13-serial/gnu-10.2.0
require java/21.0.4
require fftw/3.3.9/gnu-10.2.0
require ghostscript/9.19/gnu-4.9.2
require texinfo/6.6/gnu-4.9.2
require texlive/2019
require gsl/2.7/gnu-10.2.0
require hdf/5-1.10.6/gnu-10.2.0
require udunits/2.2.28/gnu-10.2.0
require netcdf/4.9.2/gnu-10.2.0
require pcre2/10.37/gnu-10.2.0
require flex/2.5.39

# And for doing the MPI support:
#require mpi/openmpi/4.0.5/gnu-10.2.0

#temp_dir=`mktemp -d -p /home/skgtnl1`
#temp_dir=`mktemp -d -p /dev/shm`

#echo "Building in $temp_dir ..."
#cd $temp_dir
#module list
#read -p "Press [Enter] key to start ..."

#cd $temp_dir
#wget $SRC_ARCHIVE

#tar xvzf R-${VERSION}.tar.gz
#cd R-${VERSION}

#read -p "Press [Enter] key to start configure ..."
#./configure -C --prefix=${INSTALL_PREFIX} \
#  --with-2025blas \
#  --enable-R-shlib \
#  --with-recommended-packages \
#  --with-x \
#  --with-readline=yes \
#  --with-blas="-L /shared/ucl/apps/openblas/0.3.13-serial/gnu-10.2.0/lib -lopenblas" \
#  --enable-BLAS-shlib 2>&1 | tee configure-command-OpenBLAS_log

#read -p "Press [Enter] key to start make..."
#make 2>&1 | tee make-OpenBLAS_log
#read -p "Press [Enter] key to start make check..."
#make check 2>&1 | tee make-check-OpenBLAS_log
#read -p "Press [Enter] key to start make pdf.."
#make pdf  2>&1 | tee make-pdf_log
#read -p "Press [Enter] key to start make install..."
#make install 2>&1 | tee make-install_log
#read -p "Press [Enter] key to start make install pdf ..."
#make install-pdf 2>&1 | tee make-install-pdf_log
#read -p "Press [Enter] key to start make install tests ..."
#make install-tests

# Build standalone libRmath library
#read -p "Press [Enter] key to start build libRmath ..."
#cd src/nmath/standalone
#make 2>&1 | tee make-libRmath_log
#make install 2>&1 | tee make-libRmath-install_log
#export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$INSTALL_PREFIX/lib64
#make test 2>&1 | tee make-test_log
#./test 2>&1 | tee -a make-test_log

package_name="R"
package_version="4.5.1"

install_prefix=$INSTALL_PREFIX
module_dir="${install_prefix}/module/${package_name}/${package_version}/.uclrc_modules"
cd "$INSTALL_PREFIX"
echo "Post-building..."

make_module \
    -o "${module_dir}/r/${package_version}-openblas/gnu-10.2.0" \
    -p "$install_prefix" \
    -r gcc-libs/10.2.0 \
    -r compilers/gnu/10.2.0 \
    -r openblas/0.3.13-serial/gnu-10.2.0 \
    -r java/21.0.4 \
    -r fftw/3.3.9/gnu-10.2.0 \
    -r ghostscript/9.19/gnu-4.9.\
    -r texinfo/6.6/gnu-4.9.2 \
    -r texlive/2019 \
    -r gsl/2.7/gnu-10.2.0 \
    -r hdf/5-1.10.6/gnu-10.2.0 \
    -r udunits/2.2.28/gnu-10.2.0 \
    -r netcdf/4.9.2/gnu-10.2.0 \
    -r pcre2/10.37/gnu-10.2.0 \
    -r flex/2.5.39 \
    -c r
cd ..
echo "End post-building"



