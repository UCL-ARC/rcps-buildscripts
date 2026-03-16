#===========================================================
#
# Install additional R packages used used for MPI support.
#
# June 2016
#
# Uodated May 2017 for OpenMPI 1.10.1
# Updated June 2018 to fix MPI support in R 3.5.0 - now using
#         mpi/openmpi/3.0.0/gnu-4.9.2
# Updated April 2020 for R 3.6.3  and GNU 9.2.0
# Updated September 2021 for R 4.1.1 and GNU 10.2.0 - now using
#         mpi/openmpi/4.0.5/gnu-10.2.0
#         Also doMPI has been added - more up to date than snow
# Updated for RHEL9 install on New Kathleen
#
#=====================================================================
#  R_packages_MPI_1
#
# Install first batch of add on R packages for UCL R instllations.
#

mainLib <- Sys.getenv ("R_LIBS_SITE");
repros <- Sys.getenv ("REPROS");
dbLib <- Sys.getenv ("RLIB_DB");
mainLib;
repros;
dbLib;

install.packages ("Rmpi", lib=mainLib, repos=repros, configure.args="--with-Rmpi-include=/lustre/apps/spack/0.23/deploy/2025-09/spack/opt/spack/linux-rhel9-cascadelake/gcc-12.3.0/openmpi-4.1.6-5g4rbgbo7qy47m4tzvcywljsoafcze2g/include --with-Rmpi-libpath=/lustre/apps/spack/0.23/deploy/2025-09/spack/opt/spack/linux-rhel9-cascadelake/gcc-12.3.0/openmpi-4.1.6-5g4rbgbo7qy47m4tzvcywljsoafcze2g/lib --with-Rmpi-type=OPENMPI --with-mpi=/lustre/apps/spack/0.23/deploy/2025-09/spack/opt/spack/linux-rhel9-cascadelake/gcc-12.3.0/openmpi-4.1.6-5g4rbgbo7qy47m4tzvcywljsoafcze2g");
install.packages ("doMPI", lib=mainLib, repos=repros);
install.packages ("snow", lib=mainLib, repos=repros);

