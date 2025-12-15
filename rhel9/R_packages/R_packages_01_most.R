# Contains the bulk of the non-Bioconductor R packages. These usually haven't had issues.

mainLib <- Sys.getenv ("R_LIBS_SITE");
repros <- Sys.getenv ("REPROS");
mainLib;
repros;

######## was 1.R

install.packages ("mvtnorm", lib=mainLib, repos=repros);
install.packages ("scatterplot3d", lib=mainLib, repos=repros);
install.packages ("mnormt", lib=mainLib, repos=repros);
install.packages ("numDeriv", lib=mainLib, repos=repros);
install.packages ("sn", lib=mainLib, repos=repros);
install.packages ("pspline", lib=mainLib, repos=repros);
install.packages ("gsl", lib=mainLib, repos=repros);
install.packages ("ADGofTest", lib=mainLib, repos=repros);
install.packages ("stabledist", lib=mainLib, repos=repros);
install.packages ("copula", lib=mainLib, repos=repros);
install.packages ("combinat", lib=mainLib, repos=repros);
install.packages ("Formula", lib=mainLib, repos=repros);
install.packages ("RColorBrewer", lib=mainLib, repos=repros);
#install.packages ("latticeExtra", lib=mainLib, repos=repros);
install.packages ("shiny", lib=mainLib, repos=repros);
install.packages ("Hmisc", lib=mainLib, repos=repros);

######## was 2_3.6.3.R

install.packages ("modeltools", lib=mainLib, repos=repros);
install.packages ("survival", lib=mainLib, repos=repros);
install.packages ("TH.data", lib=mainLib, repos=repros);
install.packages ("zoo", lib=mainLib, repos=repros);
install.packages ("sandwich", lib=mainLib, repos=repros);
install.packages ("multcomp", lib=mainLib, repos=repros);
install.packages ("flexmix", lib=mainLib, repos=repros);
install.packages ("gamlss.mx", lib=mainLib, repos=repros);
#install.packages ("gamlss.nl", lib=mainLib, repos=repros);
install.packages ("gtools", lib=mainLib, repos=repros);
install.packages ("gdata", lib=mainLib, repos=repros);
install.packages ("genetics", lib=mainLib, repos=repros);
install.packages ("haplo.stats", lib=mainLib, repos=repros);
#install.packages ("GenABEL.data", lib=mainLib, repos=repros);
#install.packages ("GenABEL", lib=mainLib, repos=repros);
install.packages ("XML", lib=mainLib, repos=repros);
install.packages ("bitops", lib=mainLib, repos=repros);
install.packages ("RCurl", lib=mainLib, repos=repros);
install.packages ("expm", lib=mainLib, repos=repros);
install.packages ("msm", lib=mainLib, repos=repros);
install.packages ("DBI", lib=mainLib, repos=repros);
install.packages ("RSQLite", lib=mainLib, repos=repros);
install.packages ("R2HTML", lib=mainLib, repos=repros);
#install.packages ("tkrplot", lib=mainLib, repos=repros);

install.packages ("quadprog", lib=mainLib, repos=repros);
install.packages ("tseries", lib=mainLib, repos=repros);
install.packages ("SparseM", lib=mainLib, repos=repros);
install.packages ("quantreg", lib=mainLib, repos=repros);
install.packages ("akima", lib=mainLib, repos=repros);
install.packages ("locfit", lib=mainLib, repos=repros);
install.packages ("abc", lib=mainLib, repos=repros);

install.packages ("iterators", lib=mainLib, repos=repros);
install.packages ("codetools", lib=mainLib, repos=repros);
install.packages ("foreach", lib=mainLib, repos=repros);

install.packages ("doMC", lib=mainLib, repos=repros);
install.packages ("permute", lib=mainLib, repos=repros);
install.packages ("vegan", lib=mainLib, repos=repros);
install.packages ("metafor", lib=mainLib, repos=repros);
install.packages ("xtable", lib=mainLib, repos=repros);

# to help test Bioconductor using examples from R in a Nutshell
install.packages ("lpSolve", lib=mainLib, repos=repros);
install.packages ("sampling", lib=mainLib, repos=repros);
#install.packages ("nutshell.bbdb", lib=mainLib, repos=repros);
#install.packages ("nutshell.audioscrobbler", lib=mainLib, repos=repros);
#install.packages ("nutshell", lib=mainLib, repos=repros);

install.packages ("tgp", lib=mainLib, repos=repros);
install.packages ("spam", lib=mainLib, repos=repros);
install.packages ("maps", lib=mainLib, repos=repros);
install.packages ("fields", lib=mainLib, repos=repros);
install.packages ("pixmap", lib=mainLib, repos=repros);
install.packages ("sp", lib=mainLib, repos=repros);

######## was 3.R

install.packages ("Rcpp", lib=mainLib, repos=repros);
install.packages ("minqa", lib=mainLib, repos=repros);
install.packages ("nloptr", lib=mainLib, repos=repros);
install.packages ("RcppEigen", lib=mainLib, repos=repros);
install.packages ("lme4", lib=mainLib, repos=repros);

install.packages ("saemix", lib=mainLib, repos=repros);

install.packages ("RNetCDF", lib=mainLib, repos=repros);

install.packages ("mclust", lib=mainLib, repos=repros);
install.packages ("fpc", lib=mainLib, repos=repros);

install.packages ("BaSTA", lib=mainLib, repos=repros);

install.packages ("corpcor", lib=mainLib, repos=repros);

install.packages ("dynamicTreeCut", lib=mainLib, repos=repros);
install.packages ("flashClust", lib=mainLib, repos=repros);
install.packages ("reshape", lib=mainLib, repos=repros);
install.packages ("doParallel", lib=mainLib, repos=repros);

install.packages ("igraph", lib=mainLib, repos=repros);

install.packages ("inline", lib=mainLib, repos=repros);

######## was 4.R

install.packages ("hwriter", lib=mainLib, repos=repros);
install.packages ("statmod", lib=mainLib, repos=repros);

install.packages ("glmnet", lib=mainLib, repos=repros);
install.packages ("ppls", lib=mainLib, repos=repros);
install.packages ("mstate", lib=mainLib, repos=repros);
install.packages ("etm", lib=mainLib, repos=repros);
install.packages ("Epi", lib=mainLib, repos=repros);
install.packages ("longitudinal", lib=mainLib, repos=repros);
install.packages ("fdrtool", lib=mainLib, repos=repros);
install.packages ("GeneNet", lib=mainLib, repos=repros);
#install.packages ("parcor", lib=mainLib, repos=repros);

#install.packages ("HI", lib=mainLib, repos=repros);
install.packages ("car", lib=mainLib, repos=repros);
install.packages ("ellipse", lib=mainLib, repos=repros);
install.packages ("leaps", lib=mainLib, repos=repros);
install.packages ("FactoMineR", lib=mainLib, repos=repros);
install.packages ("R.methodsS3", lib=mainLib, repos=repros);
install.packages ("R.oo", lib=mainLib, repos=repros);
install.packages ("R.utils", lib=mainLib, repos=repros);
install.packages ("mcmc", lib=mainLib, repos=repros);

########## was 5_4.1.1.R

install.packages ("rgl", lib=mainLib, repos=repros);
install.packages ("fastmatch", lib=mainLib, repos=repros);
install.packages ("phangorn", lib=mainLib, repos=repros);

# for JAGS
install.packages ("coda", lib=mainLib, repos=repros);
install.packages ("rjags", configure.args="--enable-rpath", lib=mainLib, repos=repros);
install.packages ("abind", lib=mainLib, repos=repros);
install.packages ("R2WinBUGS", lib=mainLib, repos=repros);

install.packages ("httpuv", lib=mainLib, repos=repros);
install.packages ("RJSONIO", lib=mainLib, repos=repros);
install.packages ("digest", lib=mainLib, repos=repros);
install.packages ("htmltools", lib=mainLib, repos=repros);
install.packages ("caTools", lib=mainLib, repos=repros);
install.packages ("shiny", lib=mainLib, repos=repros);
install.packages ("ade4", lib=mainLib, repos=repros);
install.packages ("ape", lib=mainLib, repos=repros);
install.packages ("plyr", lib=mainLib, repos=repros);
install.packages ("labeling", lib=mainLib, repos=repros);
install.packages ("dichromat", lib=mainLib, repos=repros);
install.packages ("colorspace", lib=mainLib, repos=repros);
install.packages ("munsell", lib=mainLib, repos=repros);
install.packages ("scales", lib=mainLib, repos=repros);
install.packages ("gtable", lib=mainLib, repos=repros);
install.packages ("stringr", lib=mainLib, repos=repros);
install.packages ("reshape2", lib=mainLib, repos=repros);
install.packages ("proto", lib=mainLib, repos=repros);
install.packages ("ggplot2", lib=mainLib, repos=repros);

install.packages ("adegenet", lib=mainLib, repos=repros);
install.packages ("pegas", lib=mainLib, repos=repros);
install.packages ("stringdist", lib=mainLib, repos=repros);

install.packages ("HAC", lib=mainLib, repos=repros);

install.packages ("e1071", lib=mainLib, repos=repros);

# Extra R packages needed for various Bioconductor packages.
install.packages ("gplots", lib=mainLib, repos=repros);
install.packages ("checkmate", lib=mainLib, repos=repros);
install.packages ("BBmisc", lib=mainLib, repos=repros);
install.packages ("base64enc", lib=mainLib, repos=repros);
install.packages ("sendmailR", lib=mainLib, repos=repros);
install.packages ("brew", lib=mainLib, repos=repros);
install.packages ("fail", lib=mainLib, repos=repros);
install.packages ("BatchJobs", lib=mainLib, repos=repros);
install.packages ("R.methodsS3", lib=mainLib, repos=repros);
install.packages ("matrixStats", lib=mainLib, repos=repros);
install.packages ("base64", lib=mainLib, repos=repros);
install.packages ("R.cache", lib=mainLib, repos=repros);
install.packages ("R.filesets", lib=mainLib, repos=repros);
install.packages ("R.devices", lib=mainLib, repos=repros);
install.packages ("R.rsp", lib=mainLib, repos=repros);

install.packages ("R.huge", lib=mainLib, repos=repros);
install.packages ("truncnorm", lib=mainLib, repos=repros);
install.packages ("Rsolnp", lib=mainLib, repos=repros);
install.packages ("intervals", lib=mainLib, repos=repros);
install.packages ("colorRamps", lib=mainLib, repos=repros);
install.packages ("schoolmath", lib=mainLib, repos=repros);
install.packages ("LSD", lib=mainLib, repos=repros);
install.packages ("RcppArmadillo", lib=mainLib, repos=repros);

install.packages ("rstanarm", lib=mainLib, repos=repros);

# Required for the cancerit suite (https://github.com/cancerit)
install.packages ("gam", lib=mainLib, repos=repros);
install.packages ("VGAM", lib=mainLib, repos=repros);
install.packages ("poweRlaw", lib=mainLib, repos=repros);

install.packages ("mlr", lib=mainLib, repos=repros);
install.packages ("pracma", lib=mainLib, repos=repros);
install.packages ("softImpute", lib=mainLib, repos=repros);
install.packages ("caret", lib=mainLib, repos=repros);
install.packages ("quantreg", lib=mainLib, repos=repros);
install.packages ("randomForest", lib=mainLib, repos=repros);

# political science
install.packages ("relaimpo", lib=mainLib, repos=repros);
install.packages ("GGally", lib=mainLib, repos=repros);
install.packages ("effects", lib=mainLib, repos=repros);
install.packages ("psych", lib=mainLib, repos=repros);

# For use with snow examples
install.packages ("rlecuyer", lib=mainLib, repos=repros);

install.packages ("roxygen2", lib=mainLib, repos=repros);

# More requsts from Political Science
#install.packages ("rgdal", lib=mainLib, repos=repros); REPLACED sf/stars/terra
#install.packages ("rgeos", lib=mainLib, repos=repros); REPLACED sf/stars/terra
install.packages ("erer", lib=mainLib, repos=repros);
install.packages ("arm", lib=mainLib, repos=repros);
install.packages ("systemfit", lib=mainLib, repos=repros);

install.packages ("rmarkdown", lib=mainLib, repos=repros);

install.packages ("bio3d", lib=mainLib, repos=repros);
install.packages ("png", lib=mainLib, repos=repros);

install.packages ("TAM", lib=mainLib, repos=repros);

install.packages ("kohonen", lib=mainLib, repos=repros);

install.packages ("rlist", lib=mainLib, repos=repros);

install.packages ("ltm", lib=mainLib, repos=repros);
install.packages ("poLCA", lib=mainLib, repos=repros);

install.packages ("Rfast", lib=mainLib, repos=repros);

install.packages ("learnr", lib=mainLib, repos=repros);

# For benchmarking - October 2020
install.packages ("benchmarkme", lib=mainLib, repos=repros);

install.packages ("spatstat", lib=mainLib, repos=repros);
install.packages ("tictoc", lib=mainLib, repos=repros);

install.packages ("BradleyTerry2", lib=mainLib, repos=repros);

# For IHI teaching apps
install.packages ("plinkQC", lib=mainLib, repos=repros);
install.packages ("dplyr", lib=mainLib, repos=repros);
install.packages ("docopt", lib=mainLib, repos=repros);

# Some historic datasets - useful for examples - September 2021
install.packages ("HistData", lib=mainLib, repos=repros);

# for POLS0010 - October 2023
install.packages ("VIM", lib=mainLib, repos=repros);

