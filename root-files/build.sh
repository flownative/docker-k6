#!/bin/bash
# shellcheck disable=SC1090
# shellcheck disable=SC2086
# shellcheck disable=SC2046

# Load helper libraries

. "${FLOWNATIVE_LIB_PATH}/banner.sh"
. "${FLOWNATIVE_LIB_PATH}/log.sh"
. "${FLOWNATIVE_LIB_PATH}/packages.sh"

set -o errexit
set -o nounset
set -o pipefail

# ---------------------------------------------------------------------------------------
# build_create_user() - Create the "k6" user and group
#
# @global APPLICATION_PATH
# @return void
#
build_create_user() {
    info "🛠 Creating user and group 'k6' (1000)"
    groupadd --gid 1000 k6
    useradd --home-dir "${K6_BASE_PATH}" --shell /bin/bash --gid k6 --uid 1000 k6 1>$(debug_device)
}

# ---------------------------------------------------------------------------------------
# build_create_directories() - Create directories and set access rights accordingly
#
# @global BEACH_APPLICATION_PATH
# @return void
#
build_create_directories() {
mkdir -p \
    "${K6_BASE_PATH}/bin" \
    "${K6_BASE_PATH}/var"

    chown -R k6:k6 "${K6_BASE_PATH}"
    chmod -R g+rwX "${K6_BASE_PATH}"
    chmod -R g+rwX "${K6_BASE_PATH}"
}

# ---------------------------------------------------------------------------------------
# build_install_packages() - Install additional packages
#
# @return void
#
build_install_packages() {
    packages_install curl micro
    packages_remove_docs_and_caches
}

# ---------------------------------------------------------------------------------------
# Main routine

banner_flownative 'K6'
build_create_user
build_create_directories
build_install_packages
