#=====================================================================
#  Bioconductor_UCL_1
#
# Install Bioconductor for UCL R installations.
#
# June 2016
# Updated May 2017
# Updated April 2019 for Bioconductor 3.8 which uses a new installation
# tool - BiocManager also addeded IlluminaHumanMethylationEPICanno.ilm10b4.hg19
# Updated April 2020 to remove ROOT for R 3.6.3
# Updated November 2020 to fix install of INLA for RedHhat 7
# Updated August 2021 to add karyoploteR
# Updated September 2021 for R 4.1.1
# Updated February 2023 for R 4.2.2
# Updated March 2024 to add additional packages required by INLA.
# Updated January 2026 to install them with R 4.5.1

mainLib <- Sys.getenv ("R_LIBS_SITE");
repros <- Sys.getenv ("REPROS");
dbLib <- Sys.getenv ("RLIB_DB");
mainLib;
repros;
dbLib;


# Download the Bioconductor installer and install the base package (ignore the first error)

BiocManager::install ("GenomicRanges", type="source", lib=mainLib);
BiocManager::install ("Rsamtools", type="source", lib=mainLib);
BiocManager::install ("BSgenome", type="source", lib=mainLib);
BiocManager::install ("BSgenome.Hsapiens.UCSC.hg19", type="source", lib=mainLib);
BiocManager::install ("BiocParallel", type="source", lib=mainLib);
BiocManager::install ("GenomicAlignments", type="source", lib=mainLib);
BiocManager::install ("rtracklayer", type="source", lib=mainLib);
BiocManager::install ("made4", type="source", lib=mainLib);
BiocManager::install ("graph", type="source", lib=mainLib);
BiocManager::install ("GSEABase", type="source", lib=mainLib);
BiocManager::install ("hugene10stprobeset.db", type="source", lib=dbLib);
BiocManager::install ("hugene10sttranscriptcluster.db", type="source", lib=dbLib);

# For Somdutta Dhir (somdutta.dhir@ucl.ac.uk) - added February 2013

BiocManager::install ("GenomicFeatures", type="source", lib=mainLib);

BiocManager::install ("VariantAnnotation", type="source", lib=mainLib);
BiocManager::install ("biovizBase", type="source", lib=mainLib);
options(repos = c(CRAN = "https://cloud.r-project.org"))
install.packages("interp", type="source", lib=mainLib);
BiocManager::install ("Gviz", type="source", lib=mainLib); # Depend on interp
BiocManager::install ("annmap", type="source", lib=mainLib);

# For Adam Levine (a.levine@ucl.ac.uk) - added August 2013

BiocManager::install ("impute", type="source", lib=mainLib);
install.packages ("WGCNA", lib=mainLib, repos=repros);

# For Dr Gioia Altobelli g.altobelli@ucl.ac.uk - added Oct 2013 updated Mar 2014

BiocManager::install ("edgeR", type="source", lib=mainLib);
BiocManager::install ("BeadDataPackR", type="source", lib=mainLib);
BiocManager::install ("illuminaio", type="source", lib=mainLib);
BiocManager::install ("AnnotationForge", type="source", lib=dbLib);
BiocManager::install ("illuminaHumanv4.db", type="source", lib=dbLib);

# For Antonia Ford (a.ford.11@u
BiocManager::install ("IlluminaHumanMethylation450kmanifest", type="source", lib=dbLib);
BiocManager::install ("methylumi", type="source", lib=mainLib);
BiocManager::install ("nleqslv", type="source", lib=mainLib);
BiocManager::install ("lumi", type="source", lib=mainLib);
BiocManager::install ("IlluminaHumanMethylation450k.db", type="source", lib=dbLib);
BiocManager::install ("FDb.InfiniumMethylation.hg19", type="source", lib=mainLib);
BiocManager::install ("IlluminaHumanMethylationEPICanno.ilm10b4.hg19", lib=mainLib); # Added April 2019
BiocManager::install ("ROC", type="source", lib=mainLib);
BiocManager::install ("wateRmelon", type="source", lib=mainLib);
install.packages ("ruv", lib=mainLib, repos=repros);
BiocManager::install ("ChAMP", type="source", lib=mainLib); # Dependency Gviz

# For Ana Paula Leite (ana.leite@ucl.ac.uk) - added June

options(repos = c(CRAN = "https://cloud.r-project.org"))
install.packages("brio")
BiocManager::install ("EBSeq", type="source", lib=mainLib);

# For Athina Dritsoula (athina.dritsoula.09@ucl.ac.uk) - added Feb and March 2017

BiocManager::install ("goseq", type="source", lib=mainLib);
BiocManager::install ("missMethyl", type="source", lib=dbLib);

# For Evgeny Galimov (e.galimov@ucl.ac.uk) - added Aug 2017

BiocManager::install ("DEXSeq", type="source", lib=mainLib);

# For Dean Cornish (dean.cornish.19@ucl.ac.uk) - added Aug 2021

BiocManager::install ("karyoploteR", type="source", lib=mainLib);

# Additional CRAN packages
install.packages ("PSCBS", lib=mainLib, repos=repros);

# INLA - updated with extra packages and to fix binary install of INLA itself with a version that will run on RedHat 7.
# Updated March 2024 as additional R packasges needed from CRAN

udunits2Conf <- '--with-udunits2-include=/shared/ucl/apps/udunits/2.2.28/include --with-udunits2-lib=/shared/ucl/apps/udunits/2.2.28/lib';
install.packages ("fmesher", lib=mainLib, repos=repros, configure.args=udunits2Conf);
install.packages ("Ecdat", lib=mainLib, repos=repros);
install.packages ("mlogit", lib=mainLib, repos=repros);
install.packages ("splancs", lib=mainLib, repos=repros);
install.packages ("tidyterra", lib=mainLib, repos=repros,  configure.args=udunits2Conf);
install.packages ("INLAspacetime", lib=mainLib, repos=repros);
install.packages ("INLA", lib=mainLib, repos=c(getOption("repros"), INLA="https://inla.r-inla-download.org/R/stable"), dep=TRUE);

# Replace binary INLA that doesn't work on redHat 7 with one that does. NOTE: interactive will prompt
# you to choose the correct binary. - Updated Feb 2023

library (INLA);
inla.binary.install();

# For Elizabeth Boyse (ucbtea5@ucl.ac.uk) - added on 10/02/2026

BiocManager::install ("dada2", type="source", lib=mainLib);

# End of Bioconductor_UCL_1

# BiocManager::install ("XXX", type="source", lib=mainLib);

