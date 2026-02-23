mainLib <- Sys.getenv ("R_LIBS_SITE");
repros <- Sys.getenv ("REPROS");
mainLib;
repros;

options(Ncpus = 4);

install.packages ("sf", lib=mainLib, repos=repros, configure.args="--with-gdal-config=/lustre/apps/spack/0.23/deploy/2025-09/spack/opt/spack/linux-rhel9-cascadelake/gcc-12.3.0/gdal-3.10.0-u2cmfnji53b6svdaabgucoczq7ishrkx/bin/gdal-config");

