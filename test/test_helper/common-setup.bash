#!/usr/bin/env bash

 tap_print_key_value() {
    echo "# \${${1}}='${!1}'" >&3
 }

_common_setup() {
    LC_ALL=POSIX
    load 'test_helper/bats-support/load'
    load 'test_helper/bats-assert/load'
    load 'test_helper/bats-file/load'
    # get the containing directory of this file
    # use $BATS_TEST_FILENAME instead of ${BASH_SOURCE[0]} or $0,
    # as those will point to the bats executable's location or the preprocessed file respectively
    PROJECT_ROOT="$( cd "$( dirname "$BATS_TEST_FILENAME" )/.." >/dev/null 2>&1 && pwd )"
    # make executables in src/ visible to PATH
    #PATH="$PROJECT_ROOT/src:$PATH"
    PATH="/workspaces/3swg:$PATH"
    BATS_BUILD_DIR='/tmp/bats'
    mkdir -p "${BATS_BUILD_DIR}"
}
