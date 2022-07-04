#!/bin/bash
# shellcheck disable=SC1090

# =======================================================================================
# LIBRARY: K6
# =======================================================================================

# Load helper lib

. "${FLOWNATIVE_LIB_PATH}/log.sh"
. "${FLOWNATIVE_LIB_PATH}/files.sh"
. "${FLOWNATIVE_LIB_PATH}/validation.sh"
. "${FLOWNATIVE_LIB_PATH}/process.sh"

# ---------------------------------------------------------------------------------------
# k6_env() - Load global environment variables for configuring K6
#
# @global K6_* The K6_ environment variables
# @return "export" statements which can be passed to eval()
#
k6_env() {
    cat <<"EOF"
export K6_BASE_PATH="${K6_BASE_PATH}"

export PATH="${PATH}:${K6_BASE_PATH}/bin"
EOF
}

# ---------------------------------------------------------------------------------------
# k6_initialize() - Initialize K6 configuration
#
# @global K6_* The K6_* environment variables
# @return void
#
k6_initialize() {
    info "K6: Initialized"
}
