#!/bin/bash -l

# Batch script to build R 4.5.1 additional packages on Myriad

# This is a long build so being done in a job.

# 1. Force bash as the executing shell.
#$ -S /bin/bash

# 2. Request 6 hours of wallclock time (format hours:minutes:seconds).
#$ -l h_rt=6:0:0

# 3. Request 4 gigabyte of RAM per process.
#$ -l mem=4G

#$ -j y

# 5. Set the name of the job.
#$ -N R-4.5.1-packages-build

# 6. Select the MPI parallel environment with 2 processes (to make sure MPI is setup)
#$ -pe mpi 2

# 7. Set the working directory to somewhere in your scratch space.  This is
# a necessary step with the upgraded software stack as compute nodes cannot
# write to $HOME.
# Replace "<your_UCL_id>" with your UCL user ID :)
##$ -wd /home/ccspapp/Scratch/R
#$ -wd /home/skgtnl1/Scratch/R

module use --append ~skgtnl1/lib/modulefiles/applications
module unload compilers mpi gcc-libs

#workdir=/home/ccspapp/Scratch/R/work
workdir=/home/skgtnl1/Scratch/R/work
mkdir -p $workdir
export TMPDIR=$workdir

cd /shared/ucl/apps/build_scripts
./R-4.4.2_packages_install 
echo "Finished build."
