#!/usr/bin/env bats
setup() {
    load 'test_helper/common-setup'
    _common_setup    
}

@test 'remove \${BATS_BUILD_DIR}' {
    tap_print_key_value BATS_BUILD_DIR
    rm -vfr ${BATS_BUILD_DIR}
}
