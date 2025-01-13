#!/usr/bin/env bash
set -e

# This script installs Stata 18.5v (two cores) 
# Serial number: 501809305305 
# Code: ses2 djmp nmka 0sh2 p6pz $sbw 4eop qi8z n6r9 twe 
# Authorization: Lgb5 
# Expires 09 September 2025.

# Nicole Labra Avila January 2025

_env_setup() {
    echo "Begin env_setup"
    cd /shared/ucl/apps/build_scripts/
    source includes/source_includes.sh
    cd 
    module purge
    require beta-modules
    require gcc-libs/4.9.2
    
    package_archive="${HOME}/StataNow18Linux64.tar.gz"
   # package_archive="$/shared/ucl/apps/StataMP/installers/StataNow18Linux64.tar.gz"
    package_name="stata"
    package_version="18.5"
    unpack_dir="stata18.5"
    mkdir ${HOME}/StataMP 

    make_build_env --tmp-root=${HOME}/StataMP
    #make_build_env --tmp-root=/dev/shm

    #install_prefix="/shared/ucl/apps/StataMP"
    install_prefix="${HOME}/StataMP/$unpack_dir"
    module_dir="$install_prefix/module/$package_name/$package_version/.uclrc_modules"
    echo "$install_prefix"
    echo "$module_dir"
    echo "End env_setup"
}

_file_setup() {
    echo "Begin file_setup"
    mkdir $install_prefix
    cd "$install_prefix"
    tar -xvzf "$package_archive"
    echo "End file_setup"
}

_pre_build() {
    # Nothing here.
    cd ..
}
_build() {      
    mkdir -p $install_prefix
    cd "$install_prefix"
    echo "Building..."
    ./install
    ./stinit
    echo "End building"
}

_post_build() {
    cd "$install_prefix"
   # mkdir $module_dir
    echo "Post-building..."
    make_module \
        -o "${module_dir}" \
        -p "$install_prefix" \
        -r beta-modules \
        -r gcc-libs/4.9.2 \
        -c stata
    cd ..
    echo "End post-building"
}

_clean_up() {
    echo "Cleaning"
    #rm -Rf ${temp_dir:-ERROR_TEMP_DIR_NOT_SET}
    :
}

_test_(){    
    echo "Testing"
    # Test Stata 18.5v
    ${install_prefix}/stata -q -b "display 2+2+2"
    cat stata.log
    echo "End test"
}

_env_setup
_file_setup
_pre_build
_build
_post_build
_clean_up
#_test_

