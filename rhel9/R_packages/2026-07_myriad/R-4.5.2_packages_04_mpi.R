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

install.packages ("Rmpi", lib=mainLib, repos=repros, configure.args="--with-Rmpi-include=/myriadfs/apps/spack/0.23/deploy/2026-07/spack/opt/spack/linux-rhel9-x86_64_v4/gcc-12.3.0/openmpi-4.1.6-sw3p4bxbfgozf6ivx6wmhuvfa4qjv7nm/include --with-Rmpi-libpath=/myriadfs/apps/spack/0.23/deploy/2026-07/spack/opt/spack/linux-rhel9-x86_64_v4/gcc-12.3.0/openmpi-4.1.6-sw3p4bxbfgozf6ivx6wmhuvfa4qjv7nm/lib --with-Rmpi-type=OPENMPI --with-mpi=/myriadfs/apps/spack/0.23/deploy/2026-07/spack/opt/spack/linux-rhel9-x86_64_v4/gcc-12.3.0/openmpi-4.1.6-sw3p4bxbfgozf6ivx6wmhuvfa4qjv7nm");
install.packages ("doMPI", lib=mainLib, repos=repros);
install.packages ("snow", lib=mainLib, repos=repros);
