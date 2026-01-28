##!/usr/bin/env bash

###############################################
# Installing UCL needed additional R and Bioconductor
# packages.
# For R 4.5.1
#
# by Nicole Labra Avila, November 2025
# Updated Sep 2016 to updated JAGS version
# Updated Nov 2016 for R 3.3.2 and extra modules for rgdal and rgeos packages.
# Updated Dec 2016 to use https://cloud.r-project.org/ as defult repro.
# Updated May 2017 for R 3.4.0 and to add udunits/2.2.20/gnu-4.9.2 module.
# Updated October 2017 for R 3.4.2
# Updated May 2018 for R 3.5.0
# Updated June 2018 to fix MPI support - now using mpi/openmpi/3.0.0/gnu-4.9.2
# Updated September 2018 for R 3.5.1 and ROOT 5.34.36
# Also updated for udunits 2.2.26
# Updated October 2018 to create ~/.R/Makevars to allow installaion of rstan
# Updated April 2019 for R 3.5.3 and PROJ.4 6.0.0
# Updated June 2019 for R 3.6.0, Texinfo 6.6 and TeX Live 2019
# Further updates to get a working set of Geographic packages (PROJ, GDAL etc) July 2019
# Updated April 2020 for R 3.6.3 and GNU 9.2.0 - some packages not currently installed
# - see below
# Updated June 2020 for R 4.0.2
# Updated September 2020 to set currect value for R_LIBS_SITE - WILL NEED TO CHANGE FOR EACH
# NEW R VERSION!
# Updated December 2020 to add Protobuf (new GNU 9.2.0 version) and JQ.
# Updated August 2021 to add plink module (for building plinkQC package)
# Updated September 2021 for R 4.1.1
# Updated May 2022 for R 4.2.0
# Updated February 2023 for R 4.2.2
# Updated April 2023 for R 4.2.3
# Updated march 2024 for R 4.3.3
# Updated June 2024 for R 4.4.0
# module cmdstan/2.35.0/gnu-10.2.0 added to allow CmdStanR package to be installed June 2024
# Updated November 2024 for R 4.4.2 and Bioconductor 3.20
# Updated November 2025 for R 4.5.2 
#
# Using Ian's require function to load modules
#
# Will need modules: see big list of modules below.

set -e

VERSION=${VERSION:-4.5.1}   
INSTALL_PREFIX=${INSTALL_PREFIX:-/shared/ucl/apps/R/R-${VERSION}-OpenBLAS}
#INSTALL_PREFIX=${INSTALL_PREFIX:-/home/skgtnl1/R/R-${VERSION}-OpenBLAS}
export RLIB_MAIN=${RLIB_MAIN:-${INSTALL_PREFIX}/lib64/R/library}
export RLIB_DB=${RLIB_DB:-${INSTALL_PREFIX}/lib64/R/library}
export REPROS=${REPROS:-https://cloud.r-project.org/}
LOCALDIR=${LOCALDIR:-/shared/ucl/apps/build_scripts/files/R_UCL}
export PATH=$INSTALL_PREFIX/bin:$PATH

dirname=$(dirname $0 2>/dev/null || pwd)
INCLUDES_DIR=${INCLUDES_DIR:-${dirname}/includes}
source ${INCLUDES_DIR}/module_maker_inc.sh
source ${INCLUDES_DIR}/require_inc.sh
source ${INCLUDES_DIR}/source_includes.sh

WHEREAMI=${WHEREAMI:-$(/shared/ucl/apps/cluster-bin/whereami)}
cluster=$WHEREAMI

require gcc-libs/10.2.0
require compilers/gnu/10.2.0
require openblas/0.3.13-serial/gnu-10.2.0
require cmake/3.21.1
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
require curl/7.86.0/gnu-4.9.2
require numactl/2.0.12
require binutils/2.36.1/gnu-10.2.0
require ucx/1.9.0/gnu-10.2.0
require mpi/openmpi/4.0.5/gnu-10.2.0
require jags/4.3.1/gnu-10.2.0-openblas
require perl/5.22.0
require freetype/2.14.1/gnu-10.2.0
require libtool/2.4.6
require graphicsmagick/1.3.21
require python3/3.9-gnu-10.2.0
require sqlite/3.36.0/gnu-10.2.0
require proj.4/9.2.0/gnu-10.2.0
require gdal/3.3.3/gnu-10.2.0
require geos/3.9.1/gnu-10.2.0
require gmt/6.5.0/gnu-10.2.0
require protobuf/3.17.3/gnu-10.2.0
require jq/1.5/gnu-4.9.2
require plink/1.90b3.40
require cmdstan/2.35.0/gnu-10.2.0
require openssl/1.1.1t
require pkg-config/0.29.2
require gperf/3.0.4/gnu-4.9.2 
require fontconfig/2.14.1/gnu-10.2.0
require libwebp/1.4.0/gnu-10.2.0
require zlib/1.3.1/gnu-10.2.0

# Creating this as R 4.4.2 libraries have a lot of incompatibilities with R 4.5.1. 
# It is better to build the packages again with R 4.5.1 of posterior.

export R_LIBS_SITE=/shared/ucl/apps/R/R-4.5.1-OpenBLAS/lib64/R/library:
#export R_LIBS_SITE=/home/skgtnl1/R/R-4.5.1-OpenBLAS/lib64/R/library:
export PATH=/shared/ucl/apps/curl/7.86.0/gnu-4.9.2/bin/:$PATH
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH\:/shared/ucl/apps/curl/7.86.0/gnu-4.9.2/lib:/usr/lib64 
export PKG_LIBS="-L/shared/ucl/apps/curl/7.86.0/gnu-4.9.2/lib"
export DOWNLOAD_STATIC_LIBV8=1

# Set up ~/.R/Makevars for rstan which needs C++ 2014 stuff
mkdir -p ~/.R
cd ~/.R
cat > Makevars <<EOF
CXX14 = g++ -std=c++1y
CXX14FLAGS = -Wno-unused-variable -Wno-unused-function -fPIC
OBJCXX = clang++ -std=c++11
CPPFLAGS += -I/shared/ucl/apps/freetype/2.14.1/gnu-10.2.0/include/freetype2
LDFLAGS  += -L/shared/ucl/apps/freetype/2.14.1/gnu-10.2.0/lib
EOF

temp_dir=`mktemp -d -p /dev/shm`
#temp_dir=`mkdir -p /home/skgtnl1/R-packages-temp`
echo "Building in $temp_dir ..."
cd $temp_dir
module list
read -p "Press [Enter] key to start ..."

cd $temp_dir
mkdir -p $RLIB_DB

###################### Installing packages ####################
R_input=${LOCALDIR}/R_packages_UCL_1_4.5.1.R
R --no-save < $R_input

R_input=${LOCALDIR}/R_packages_UCL_2_4.5.1.R
R --no-save < $R_input

R_input=${LOCALDIR}/R_packages_UCL_3_4.5.1.R
R --no-save < $R_input

R_input=${LOCALDIR}/R_packages_UCL_4_4.5.1.R
R --no-save < $R_input

export PKG_CONFIG_PATH=$PKG_CONFIG_PATH\:/usr/lib64/pkgconfig/
R_input=${LOCALDIR}/R_packages_UCL_5_4.5.1.R
R --no-save < $R_input

# Now to install Bioconductor.
R_input=${LOCALDIR}/Bioconductor_UCL_1_4.5.1.R
R --no-save < $R_input
  
