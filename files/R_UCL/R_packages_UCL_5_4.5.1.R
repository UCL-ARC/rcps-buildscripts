#=====================================================================
#  R_packages_UCL_5
#
# Install 5th batch of add on R packages for UCL R instllations.
#
# June 2016
# Update April 2020 - to remove problem packages that
# need re-building for GNU 9.2.0
# Update August 2021 - to add additional packages needed for IHI teaching apps
# Update September 2021 - for R 4.1.1
# Updated January 2023 - to add nlmixr2 for R 4.2.0
# Updated April 2023 - to fix build of rjags
# Updated October 2023 - to add arrow and VIM packages.
# Updated march 2024 to add quanteda.textstats and quanteda.textmodels
# Updated June 2024 to try and resolve the V8 problem
# R 4.4.2 attempting to fix V8 by reverting to an older version

mainLib <- Sys.getenv ("RLIB_MAIN");
dbLib <- Sys.getenv ("RLIB_DB");
repros <- Sys.getenv ("REPROS");
mainLib;
dbLib;
repros;

#
# For Antonia Ford (a.ford.11@ucl.ac.uk) - added Jan 2014

#install.packages ("rgl", lib=mainLib, repos=repros);
#install.packages ("fastmatch", lib=mainLib, repos=repros);
#install.packages ("phangorn", lib=mainLib, repos=repros);

# For JAGS - added March 2014 fixed April 2023

#install.packages ("coda", lib=mainLib, repos=repros);
#install.packages ("rjags", configure.args="--enable-rpath", lib=mainLib, repos=repros);
#install.packages ("abind", lib=mainLib, repos=repros);
#install.packages ("R2WinBUGS", lib=mainLib, repos=repros);

# For Stuart Peters (stuart.peters.13@ucl.ac.uk) June 2014

#install.packages ("httpuv", lib=mainLib, repos=repros);
#install.packages ("RJSONIO", lib=mainLib, repos=repros);
#install.packages ("digest", lib=mainLib, repos=repros);
#install.packages ("htmltools", lib=mainLib, repos=repros);
#install.packages ("caTools", lib=mainLib, repos=repros);
#install.packages ("ade4", lib=mainLib, repos=repros);
#install.packages ("ape", lib=mainLib, repos=repros);
#install.packages ("plyr", lib=mainLib, repos=repros);
#install.packages ("labeling", lib=mainLib, repos=repros);
#install.packages ("dichromat", lib=mainLib, repos=repros);
#install.packages ("colorspace", lib=mainLib, repos=repros);
#install.packages ("munsell", lib=mainLib, repos=repros);
#install.packages ("scales", lib=mainLib, repos=repros);
#install.packages ("gtable", lib=mainLib, repos=repros);
#install.packages ("stringr", lib=mainLib, repos=repros);
#install.packages ("reshape2", lib=mainLib, repos=repros);
#install.packages ("proto", lib=mainLib, repos=repros);
#install.packages ("ggplot2", lib=mainLib, repos=repros);
#install.packages ("devtools", lib=mainLib, repos=repros);
#install.packages ("sf", lib=mainLib, repos=repros);
#install.packages ("adegenet", lib=mainLib, repos=repros);
#install.packages ("pegas", lib=mainLib, repos=repros);
#install.packages ("stringdist", lib=mainLib, repos=repros);

# For Rodrigo Targino (r.targino.12@ucl.ac.uk) July 2014

#install.packages ("HAC", lib=mainLib, repos=repros);

# For Mattia Cinelli (rebmmci@ucl.ac.uk) Nov 2014

#install.packages ("e1071", lib=mainLib, repos=repros);

# Extra R packages needed for various Bioconductor packages.

#install.packages ("gplots", lib=mainLib, repos=repros);
#install.packages ("checkmate", lib=mainLib, repos=repros);
#install.packages ("BBmisc", lib=mainLib, repos=repros);
#install.packages ("base64enc", lib=mainLib, repos=repros);
#install.packages ("sendmailR", lib=mainLib, repos=repros);
#install.packages ("brew", lib=mainLib, repos=repros);
#install.packages ("fail", lib=mainLib, repos=repros);
#install.packages ("BatchJobs", lib=mainLib, repos=repros);
#install.packages ("RMySQL", lib=mainLib, repos=repros);
#install.packages ("R.methodsS3", lib=mainLib, repos=repros);
#install.packages ("matrixStats", lib=mainLib, repos=repros);

#install.packages ("openssl", lib=mainLib, repos=repros);
#install.packages ("base64", lib=mainLib, repos=repros);

#install.packages ("R.cache", lib=mainLib, repos=repros);
#install.packages ("R.filesets", lib=mainLib, repos=repros);
#install.packages ("R.devices", lib=mainLib, repos=repros);
#install.packages ("R.rsp", lib=mainLib, repos=repros);

# Moving into Bioconductor packages as aroma.core now depnds on some Bioconductor packages.

#install.packages ("R.huge", lib=mainLib, repos=repros);
#install.packages ("truncnorm", lib=mainLib, repos=repros);
#install.packages ("Rsolnp", lib=mainLib, repos=repros);
#install.packages ("intervals", lib=mainLib, repos=repros);
#install.packages ("colorRamps", lib=mainLib, repos=repros);
#install.packages ("schoolmath", lib=mainLib, repos=repros);
#install.packages ("LSD", lib=mainLib, repos=repros);
#install.packages ("RcppArmadillo", lib=mainLib, repos=repros);

# For Matthew Jones (m.jones.12@ucl.ac.uk) June 2016 new in R 3.3.0

#install.packages ("rstanarm", lib=mainLib, repos=repros);

# Required for the cancerit suite (https://github.com/cancerit)

#install.packages ("gam", lib=mainLib, repos=repros);
#install.packages ("VGAM", lib=mainLib, repos=repros);
#install.packages ("poweRlaw", lib=mainLib, repos=repros);

# For Zahra Sabetsarvestani (ucakzsa@ucl.ac.uk) Aug 2016

#install.packages ("mlr", lib=mainLib, repos=repros);
#install.packages ("pracma", lib=mainLib, repos=repros);
#install.packages ("softImpute", lib=mainLib, repos=repros);
#install.packages ("caret", lib=mainLib, repos=repros);
#install.packages ("quantreg", lib=mainLib, repos=repros);
#install.packages ("randomForest", lib=mainLib, repos=repros);

# For Slava Mikhaylov from political science Sep 2016

#install.packages ("relaimpo", lib=mainLib, repos=repros);
#install.packages ("GGally", lib=mainLib, repos=repros);
#install.packages ("effects", lib=mainLib, repos=repros);
#install.packages ("psych", lib=mainLib, repos=repros);

# For use with snow examples

#install.packages ("rlecuyer", lib=mainLib, repos=repros);
#install.packages ("roxygen2", lib=mainLib, repos=repros);

# More requsts from Political Science

#install.packages ("erer", lib=mainLib, repos=repros);
#install.packages ("arm", lib=mainLib, repos=repros);
#install.packages ("systemfit", lib=mainLib, repos=repros);

# tmap requested by James Cheshire, Geography
#install.packages("Rcpp", lib=mainLib, repos=repros);
#install.packages("jsonlite", lib=mainLib, repos=repros);
#install.packages("curl", lib=mainLib, repos=repros);

# for R 4.4.2 this might work:
#packageurl <- "https://cran.r-project.org/src/contrib/Archive/V8/V8_5.0.1.tar.gz"
#install.packages(packageurl, repos=NULL, type="source")
#udunits2Conf <- '--with-udunits2-include=/shared/ucl/apps/udunits/2.2.28/gnu-10.2.0/include --with-udunits2-lib=/shared/ucl/apps/udunits/2.2.28/gnu-10.2.0/lib';
#install.packages ("udunits2", lib=mainLib, repos=repros, configure.args=udunits2Conf);
#install.packages ("lwgeom", lib=mainLib, repos=repros);
#install.packages ("classInt", lib=mainLib, repos=repros);
#install.packages ("tmap", lib=mainLib, repos=repros);

# For Lucia Conde (l.conde@ucl.ac.uk) May 2017
#install.packages ("rmarkdown", lib=mainLib, repos=repros);

# For RStudio server Oct 2017

#install.packages ("cpp11", lib=mainLib, repos=repros);
#install.packages ("httr", lib=mainLib, repos=repros);
#install.packages ("gargle", lib=mainLib, repos=repros);
#install.packages ("ids", lib=mainLib, repos=repros);


#install.packages ("googledrive", lib=mainLib, repos=repros);
#install.packages ("googlesheets4", lib=mainLib, repos=repros);
install.packages ("ragg", lib=mainLib, repos=repros);
remotes::install_github("r-lib/systemfonts")
install.packages ("textshaping", lib=mainLib, repos=repros);
#install.packages ("rvest", lib=mainLib, repos=repros);
install.packages ("tidyverse", lib=mainLib, repos=repros);

# For Cheng Zhang (cheng.zhang@ucl.ac.uk) March 2018
#install.packages ("bio3d", lib=mainLib, repos=repros);

# For Cheng Zhang  (cheng.zhang@ucl.ac.uk) May 2018
#install.packages ("png", lib=mainLib, repos=repros);

# For Laura Zieger (l.zieger@ucl.ac.uk) Dec 2018
#install.packages ("TAM", lib=mainLib, repos=repros);

# For Kasia Kozdon (k.kozdon.11@ucl.ac.uk) April 2019
#install.packages ("kohonen", lib=mainLib, repos=repros);

# From RITS drop in session 25th June 2019
#install.packages ("GJRM", lib=mainLib, repos=repros);
#install.packages ("rlist", lib=mainLib, repos=repros);

# For Benjamin Lauderdale (b.lauderdale@ucl.ac.uk) 24th September 2019

#install.packages ("ltm", lib=mainLib, repos=repros);
#install.packages ("poLCA", lib=mainLib, repos=repros);
#install.packages ("quanteda", lib=mainLib, repos=repros);
#install.packages ("topicmodels", lib=mainLib, repos=repros);

# Extra packages for devtools. Ellipsis is already installed. 
#install.packages ("lifecycle", repos="https://cran.ma.imperial.ac.uk/src/contrib/lifecycle_1.0.4.tar.gz");
#install.packages ("memoise", repos="https://cran.ma.imperial.ac.uk/src/contrib/memoise_2.0.1.tar.gz");
#install.packages ("remotes", repos="https://cran.ma.imperial.ac.uk/src/contrib/remotes_2.5.0.tar.gz");
#install.packages ("purrr", repos="https://www.stats.bris.ac.uk/R/src/contrib/purrr_1.2.0.tar.gz");
#install.packages ("gitcreds", repos="https://www.stats.bris.ac.uk/R/src/contrib/gitcreds_0.1.2.tar.gz");
#install.packages ("desc", repos="https://www.stats.bris.ac.uk/R/src/contrib/desc_1.4.3.tar.gz");
#install.packages ("callr", repos="https://www.stats.bris.ac.uk/R/src/contrib/callr_3.7.6.tar.gz");
#devtools::install_github ("quanteda/quanteda.corpora", force=TRUE);

# For Covid-19 - April 2020

#install.packages ("spdep", lib=mainLib, repos=repros);
#install.packages ("Rfast", lib=mainLib, repos=repros);

# For Ricardo Silva (ricardo.silva@ucl.ac.uk) - September 2020

#install.packages ("learnr", lib=mainLib, repos=repros);

# For benchmarking - October 2020

#install.packages ("benchmarkme", lib=mainLib, repos=repros);

# Added November 2020

#install.packages ("spatstat", lib=mainLib, repos=repros);
#install.packages ("tictoc", lib=mainLib, repos=repros);

# For Ben lauderdale (b.lauderdale@ucl.ac.uk) - December 2020

#install.packages ("BradleyTerry2", lib=mainLib, repos=repros);

# For Adam Dennett (a.dennett@ucl.ac.uk) - December 2020.

#install.packages ("geojsonio", lib=mainLib, repos=repros);

# For IHI teaching apps (j.thygesen@ucl.ac.uk) - August 2021.

#install.packages ("plinkQC", lib=mainLib, repos=repros);
#install.packages ("dplyr", lib=mainLib, repos=repros);
#install.packages ("docopt", lib=mainLib, repos=repros);
#install.packages ("MendelianRandomization", lib=mainLib, repos=repros);

# Some historic datasets - useful for examples - September 2021
#install.packages ("HistData", lib=mainLib, repos=repros);

# for Dongxian Guo (dongxian.guo.19@ucl.ac.uk) - October 2023
#install.packages ("arrow", lib=mainLib, repos=repros);

# for POLS0010 - October 2023
#install.packages ("VIM", lib=mainLib, repos=repros);

# for POLS0010 - March 2024
#install.packages ("quanteda.textstats", lib=mainLib, repos=repros);
#install.packages ("quanteda.textmodels", lib=mainLib, repos=repros);

# for jose.arciniegas@ucl.ac.uk - June 2024
#install.packages ("cmdstanr", repos = "https://stan-dev.r-universe.dev");

# End of R_packages_UCL_5
