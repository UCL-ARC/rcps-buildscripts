#!/bin/bash -l

# central r-libs install location (exists now)
mkdir -p /apps/r-libs/4.5.2/library

# used in the R_packages_ install files
export R_LIBS_SITE="/apps/r-libs/4.5.2/library"
export REPROS="https://cloud.r-project.org/"
export RLIB_MAIN="$R_HOME/library" # may not need to do this - not used in install files anymore

temp_dir="/home/ccspapp/Scratch/R/r-4.5.2_tmp"
mkdir -p $temp_dir
cd $temp_dir
export TMP=$temp_dir

# We're explicitly pointing to the spack installed gmp vs the system by pulling in a special ~/.R/Makevars
# which has the LD and CFLAGS point to the Spack gmp installation
git clone https://github.com/UCL-ARC/rcps-buildscripts.git
mv ~/.R/Makevars ~/.R/Makevars.bak
cp rcps-buildscripts/rhel9/R_packages/R-Makevars ~/.R/Makevars

# Use these environments to make the modules available
module use /apps/spack/0.23/deploy/2025-09/modules/linux-rhel9-cascadelake
module use /apps/spack/0.23/deploy/2025-09/modules/lustre/apps/spack/0.23/deploy/2025-09/spack/var/spack/environments/moreapps/linux-rhel9-cascadelake
module use /apps/spack/0.23/deploy/2025-09/modules/lustre/apps/spack/0.23/deploy/2025-09/spack/var/spack/environments/r452/linux-rhel9-cascadelake

module purge
module load -v cmdstan
module load -v compilers/gcc/12.3.0/gcc-12.3.0
module load -v gdal
module load -v geos
module load -v ghostscript
module load -v gmt
module load -v graphicsmagick
module load -v gsl
module load -v imagemagick
module load -v libwebp
module load -v jags
module load -v jq
#module load -v mpi/openmpi/4.1.6/gcc-12.3.0
module load -v mysql
module load -v plink
module load -v plink2
module load -v proj
module load -v r/4.5.2/gcc-12.3.0
module load -v texlive
module load -v udunits
module load -v protobuf

# completed
R --no-save < R-4.5.2_packages_01_most.R 2>&1 | tee R-4.5.2_packages_01_most.R.log

# in progress
R --no-save < R-4.5.2_packages_02_tricky.R 2>&1 | tee R-4.5.2_packages_02_tricky.R.log

# not written or tried yet
#R --no-save < R-4.5.2_packages_03_bioconductor.R 2>&1 | tee R-4.5.2_packages_03_bioconductor.R.log

# cleaning up the buildscripts and Makevars
mv ~/.R/Makevars.bak ~/.R/Makevars
rm -rf rcps-buildscripts
