# R_packages_02_tricky - run after 01
# These packages require additional options or are just more likely to need deps tweaking

mainLib <- Sys.getenv ("R_LIBS_SITE");
repros <- Sys.getenv ("REPROS");
mainLib;
repros;

# devtools - ragg depends on libwebp and other graphics libraries
install.packages ("ragg", lib=mainLib, repos=repros);
install.packages ("devtools", lib=mainLib, repos=repros);

# Gets a static build of V8 as part of install. RHEL9 works by default. Otherwise may need
# Sys.setenv(DOWNLOAD_STATIC_LIBV8 = 1); and possibly force a source install.
# install V8's dependencies first, otherwise v8conf variables get lost in the interim
install.packages("Rcpp", lib=mainLib, repos=repros);
install.packages("jsonlite", lib=mainLib, repos=repros);
install.packages("curl", lib=mainLib, repos=repros);
install.packages ("V8", lib=mainLib, repos=repros);

# needs to know where udunits is 
udunits2Conf <- '--with-udunits2-include=/apps/spack/0.23/deploy/2025-09/spack/opt/spack/linux-rhel9-cascadelake/gcc-12.3.0/udunits-2.2.28-7k5tsjgycgmhrhdarctbt7exdxsjcxbu/include --with-udunits2-lib=/apps/spack/0.23/deploy/2025-09/spack/opt/spack/linux-rhel9-cascadelake/gcc-12.3.0/udunits-2.2.28-7k5tsjgycgmhrhdarctbt7exdxsjcxbu/lib';
install.packages ("udunits2", lib=mainLib, repos=repros, configure.args=udunits2Conf);

# rest of tmap after V8 and udunits2
install.packages ("lwgeom", lib=mainLib, repos=repros);
install.packages ("classInt", lib=mainLib, repos=repros);
install.packages ("tmap", lib=mainLib, repos=repros);

# needs units, udunits2
install.packages ("spdep", lib=mainLib, repos=repros);
install.packages ("sf", lib=mainLib, repos=repros);

# lot of dependencies inc graphics libraries
install.packages ("tidyverse", lib=mainLib, repos=repros);

# depends gmp
install.packages("gmp", lib=mainLib, repos=repros);
install.packages("Rmpfr", lib=mainLib, repos=repros);
install.packages ("GJRM", lib=mainLib, repos=repros);
install.packages ("MendelianRandomization", lib=mainLib, repos=repros);

# udunits, sf, jqr, protolite
install.packages ("geojsonio", lib=mainLib, repos=repros);

# for CHLD0085 - January 2023. jpeg
install.packages ("nlmixr2", lib=mainLib, repos=repros);

# sometimes issues with Rcpp?
install.packages ("arrow", lib=mainLib, repos=repros);

# quanteda and friends
install.packages ("quanteda", lib=mainLib, repos=repros);
install.packages ("topicmodels", lib=mainLib, repos=repros);
install.packages ("devtools", lib=mainLib, repos=repros);
remotes::install_github ("quanteda/quanteda.corpora");
install.packages ("quanteda.textstats", lib=mainLib, repos=repros);
install.packages ("quanteda.textmodels", lib=mainLib, repos=repros);

# not on CRAN details here https://mc-stan.org/cmdstanr/
install.packages ("cmdstanr", repos = "https://stan-dev.r-universe.dev");

# mysql/mariadb
install.packages ("RMySQL", lib=mainLib, repos=repros);

