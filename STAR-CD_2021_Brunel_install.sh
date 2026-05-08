#%Module -*- tcl -*-
## module_made (v2)
proc ModulesHelp { } {
  puts stderr {Adds STAR-CD 4.36.004 (2021) using Intel 2019 compiler suite to your environment. STAR-CD is a code for performing CFD simulations. It is designed for modelling fluid flow, heat transfer, mass transfer and chemical reactions.}
}
module-whatis {Adds STAR-CD 4.36.004 (2021) using Intel 2019 compiler suite to your environment. STAR-CD is a code for performing CFD simulations. It is designed for modelling fluid flow, heat transfer, mass transfer and chemical reactions.}

lappend auto_path /apps/modulelibs/UsefulModuleFunctions
package require modulefunctions 1.0

conflict STAR-CD
prereq gcc-libs

set version 4.36.004
set prefix /apps/STAR-CD/$version

modulefunctions::mustBeMemberToLoad "ag-archpc-starcd-brunel"

# Check if TMPDIR exists - if not, try $XDG_RUNTIME_DIR (/run/user/$uid)
# systemd will wipe these files when no active sessions remain.
# If there's no TMPDIR *and* no XDG_RUNTIME_DIR, fall back to /tmp
if {[modulefunctions::isTMPDIR] && [modulefunctions::isModuleLoad]} {
    # Check TMPDIR has a reasonable amount of free space (1GB): if not, point to Scratch instead
    if {[modulefunctions::getTmpdirFreeSpace] >= (1024*1024)} {
        setenv HPC_SCRATCH $::env(TMPDIR)/star.[randomLabel]
    } else {
        setenv HPC_SCRATCH $::env(HOME)/Scratch/STAR_ScrDirs/[randomLabel]
    }
} else {
    if {[info exists ::env(XDG_RUNTIME_DIR)]} {
        setenv HPC_SCRATCH $::env(XDG_RUNTIME_DIR)/star.[randomLabel]
    } else {
        setenv HPC_SCRATCH /tmp/star.[randomLabel]
    }
    setenv TMPDIR $::env(HPC_SCRATCH)
}

if {[modulefunctions::isModuleLoad]} {
    puts stderr "Creating STAR-CD Scratch directory:"
    puts stderr "  HPC_SCRATCH=$::env(HPC_SCRATCH)"
    if { [modulefunctions::createDir "$::env(HPC_SCRATCH)"] } {
        puts stderr ""
    } else {
        puts stderr "STAR-CD Scratch directory creation failed."
        break
    }
}


setenv CDLMD_LICENSE_FILE 1999@cruddup.brunel.ac.uk

prepend-path CMAKE_PREFIX_PATH $prefix
prepend-path PATH $prefix/bin
prepend-path PATH $prefix/sbin

setenv FLEXLMTOP $prefix/FLEXLM/11.14.0.2
setenv FLEXLM $prefix/FLEXLM/11.14.0.2/linux64_2.6-x86

#setenv HPC_SCRATCH "\$TMPDIR"

setenv IBMMPITOP $prefix/IBMMPI/9.01.04.03
setenv IBMMPI $prefix/IBMMPI/9.01.04.03/linux64_2.6-x86-glibc_2.3.4

setenv ICETOP $prefix/ICE/4.36.001
setenv ICE $prefix/ICE/4.36.001/linux64_2.6-x86-glibc_2.5.0-gcc_4.4.3-ifort_11.0

setenv INTELMPITOP $prefix/INTELMPI/4.1.1.036
setenv INTELMPI $prefix/INTELMPI/4.1.1.036/linux64_2.6-x86_glibc_2.3.4
# Setting INTEL to 2019 because STAR appears to use it. Other libs use an old ifort 11 based on the dir names and impi 4.1 is also quite old.Not sure if this will be available in new Young
setenv INTEL /apps/intel/2019.Update5/

setenv PROSTARTOP $prefix/PROSTAR/4.36.003
setenv PROSTAR $prefix/PROSTAR/4.36.003/linux64_2.6-x86-glibc_2.3.4-gcc_4.4.3-ifort_11.0

setenv STARTOP $prefix/STAR/4.36.004
setenv STAR $prefix/STAR/4.36.004/linux64_2.6-ifort_19.0-glibc_2.12
setenv STARDIR $prefix

setenv STARCDMAN $prefix/STARCDMAN/4.36.001/generic
setenv STARDATA $prefix/STARDATA/3.03.002/generic
setenv STARINI default
setenv STARNET $prefix/STARNET/3.01.001/generic

setenv STARPLUGIN_DARSCFD $prefix/DARSCFD/2.10.000
#setenv STARPLUGIN_DARSTABLE $prefix/DARSTABLE/4.26.002
setenv STARPLUGIN_DARSTIF $prefix/DARSTIF/2.12.000
setenv STARPLUGIN_ICE $prefix/STARICE/4.36.001
setenv STARPLUGIN_SOOTNOX $prefix/SOOTNOX/1.08.000
setenv STARPLUGIN_WAVE $prefix/WAVE/2.16.000

setenv STARFLAGS "-nodefile=$::env(TMPDIR)/machines -scratch=$::env(HPC_SCRATCH)"

setenv REMOTETASK "/usr/bin/ssh -o StrictHostKeyChecking=no"
setenv REMOTECOPY "/usr/bin/scp -o StrictHostKeyChecking=no"

# Configure MPI fabric for Intel MPI as STAR-CD is not using gerun
setenv I_MPI_FABRICS    shm:ofa
setenv I_MPI_FALLBACK   1
