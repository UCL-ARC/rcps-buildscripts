#!/bin/bash -l

# Use these environments to make the modules available
module use /apps/spack/0.23/deploy/2025-09/modules/linux-rhel9-cascadelake
module use /apps/spack/0.23/deploy/2025-09/modules/lustre/apps/spack/0.23/deploy/2025-09/spack/var/spack/environments/moreapps/linux-rhel9-cascadelake
module use /apps/spack/0.23/deploy/2025-09/modules/lustre/apps/spack/0.23/deploy/2025-09/spack/var/spack/environments/r452/linux-rhel9-cascadelake

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
cp rcps-buildscripts/rhel9/R_packages/R-gmp-Makevars ~/.R/Makevars

# sf install is handled in its own script due to module conflicts
module purge
module load gdal
module load compilers/gcc/12.3.0/gcc-12.3.0
module load --force r/4.5.2/gcc-12.3.0
module load udunits

R --no-save < R-4.5.2_sf_package.R 2>&1 | tee R-4.5.2_sf_package.R.log

# installation of the remainder of the packages
module purge
module load compilers/gcc/12.3.0/gcc-12.3.0
module load r/4.5.2/gcc-12.3.0
module load cmdstan gdal geos ghostscript gmt graphicsmagick imagemagick jags jq plink plink2 proj texlive udunits gsl
module load protobuf
module load mysql libwebp
module load mpi/openmpi/4.1.6/gcc-12.3.0
module list -t --all 2>&1 | tee loaded_modules.log

# completed
R --no-save < R-4.5.2_packages_01_most.R 2>&1 | tee R-4.5.2_packages_01_most.R.log

# in progress
R --no-save < R-4.5.2_packages_02_tricky.R 2>&1 | tee R-4.5.2_packages_02_tricky.R.log

# not written or tried yet
#R --no-save < R-4.5.2_packages_03_bioconductor.R 2>&1 | tee R-4.5.2_packages_03_bioconductor.R.log

# cleaning up the buildscripts and Makevars
mv ~/.R/Makevars.bak ~/.R/Makevars
rm -rf rcps-buildscripts
