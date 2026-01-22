#!/usr/bin/env bash
set -e

# This script installs Fontconfig 2.14.1
# Nicole Labra Avila January 2026

dirname=$(dirname $0 2>/dev/null || pwd)
INCLUDES_DIR=${INCLUDES_DIR:-${dirname}/includes}
source ${INCLUDES_DIR}/module_maker_inc.sh
source ${INCLUDES_DIR}/require_inc.sh
source ${INCLUDES_DIR}/source_includes.sh

_env_setup() {
    echo "Begin env_setup"
    module purge
    require gcc-libs/10.2.0
    require compilers/gnu/10.2.0
    require cmake/3.21.1
    require gperf/3.0.4/gnu-4.9.2
    require freetype/2.14.1

    package_name="fontconfig"
    package_version="2.14.1"
    unpack_dir="fontconfig-2.14.1"
   
    package_archive="/shared/ucl/apps/${package_name}/installers/"
    #package_archive="${HOME}/${unpack_dir}"

    mkdir -p ${package_archive}
    #make_build_env --tmp-root=${HOME}/
    make_build_env --tmp-root=/dev/shm
   
    #mkdir -p ${package_archive} 
    cd ${package_archive}
    wget https://www.freedesktop.org/software/fontconfig/release/fontconfig-2.14.1.tar.gz 
 
    #install_prefix="/shared/ucl/apps/${package_name}/${package_version}"
    #install_prefix="${HOME}/${unpack_dir}"
    #module_dir="$install_prefix/module/$package_name/$package_version/.uclrc_modules"

    mkdir -p ${install_prefix}

    echo "$install_prefix"
    echo "$module_dir"
    echo "End env_setup"
}

_file_setup() {
    echo "Begin file_setup"
    cd $install_prefix
    tar -xvzf "${package_archive}/${unpack_dir}.tar.gz"
    echo "End file_setup"
}

_pre_build() {
    # Nothing here.
    cd ..
}
_build() {      
    echo "Building..."
    cd "$install_prefix/$unpack_dir"
    ./configure --prefix=$install_prefix
    make -j4
    make install
    echo "End building"
}

_post_build() {
    cd "$install_prefix"
    echo "Post-building..."
    make_module_v2
    cd ..
    echo "End post-building"
}

_clean_up() {
    echo "Cleaning"
    rm -Rf ${temp_dir:-ERROR_TEMP_DIR_NOT_SET}
    :
}

_test_(){    
    echo "Testing"
    # Test Fontconfig 2.14.1
    ${install_prefix}/fontconfig
    cat fontconfig.log
    echo "End test"
}

_env_setup
_file_setup
#_pre_build
_build
_post_build
_clean_up
#_test
