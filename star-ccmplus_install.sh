#!/usr/bin/env bash

# Install script for star-ccm+ 13.06.012

set -e

package_name="STAR-CCM+"
package_version="13.06.012"

dirname=$(dirname $0 2>/dev/null || pwd)
INCLUDES_DIR=${INCLUDES_DIR:-${dirname}/includes}
source ${INCLUDES_DIR}/module_maker_inc.sh
source ${INCLUDES_DIR}/require_inc.sh
source ${INCLUDES_DIR}/source_includes.sh

_env_setup() {
    module purge
    make_build_env --tmp-root=/dev/shm

    #For home install only
    install_prefix="/apps/${package_name}"
    module_dir="${install_prefix}/{package_version}/${install_prefix}{package_version}/star/"
    echo "Install prefix: $install_prefix"
    echo "Module dir: $module_dir"
    mkdir -p ${install_prefix}

    package_src="/apps/pkg-store"
    package_file="${package_name}${package_version}_01_linux-x86_64.tar.gz"
    echo "$package_src"
    echo "package_file"
}

_file_setup() {
    cd "${package_src}"
    tar -xf "${package_file}"
}
_pre_build() {
    # Nothing here.
    cd "~"
}

_build() {
    cd "${package_src}/"
    echo "Building..."

    ./starccm+_${package_version}/${package_name}${package_version}_01_linux-x86_64-2.12_gnu7.1.sh
}
# In the console install it in /apps/STAR-CCM+ directory

_post_build() {
    echo "Post-building..."
    make_module \
        -o "${module_dir}/.uclrc_modules " \
        -p "${module_dir}" \
        -c star-ccm+
    cd ..
}

_clean_up() {
    rm -Rf "${package_src}/starccm+_${package_version}"
}

_env_setup
_file_setup
#_pre_build
_build
_post_build
_clean_up
