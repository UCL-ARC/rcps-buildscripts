#!/usr/bin/env bash
set -e

# This script installs Freetype 2.14.1
# Nicole Labra Avila January 2026

dirname=$(dirname $0 2>/dev/null || pwd)
INCLUDES_DIR=${INCLUDES_DIR:-${dirname}/includes}
source ${INCLUDES_DIR}/module_maker_inc.sh
source ${INCLUDES_DIR}/require_inc.sh
source ${INCLUDES_DIR}/source_includes.sh

_env_setup() {
    echo "Begin env_setup"
    module  purge
    require gcc-libs/10.2.0
    require compilers/gnu/10.2.0
    require cmake/3.21.1
 
    package_name="freetype"
    package_version="2.14.1"
    unpack_dir="freetype-2.14.1"
   
    package_archive="$/shared/ucl/apps$package_name}/installers/"
    #package_archive="${HOME}/${unpack_dir}"
    mkdir -p ${package_archive}
    
    #make_build_env --tmp-root=${HOME}
    make_build_env --tmp-root=/dev/shm
   
    #mkdir -p ${package_archive} 
    cd ${package_archive} 
    wget https://download.savannah.gnu.org/releases/freetype/freetype-2.14.1.tar.gz 
 
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
    cd "$install_prefix"
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
    make_module_v2 \
        -o "${module_dir}" \
        -p "$install_prefix" \
        -r gcc-libs/10.2.0 \
        -r compilers/gnu/10.2.0 \
        -r cmake/3.21.1 \
        -c freetype
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
    # Test Freetype 2.14.1
    ${install_prefix}/freetype
    cat freetype.log
    echo "End test"
}

_env_setup
#_file_setup
##_pre_build
#_build
#_post_build
#_clean_up
##_test
