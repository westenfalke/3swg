#!/usr/bin/env bats
setup() {
    load 'test_helper/common-setup'
    _common_setup    

    EMPTY=''
    ZERO_ELEMENTS='0'
    MODULE_TEST_DIR="${BATS_BUILD_DIR}/website.init.bats"
    ABSOLUT_PROJECT_DIR="${MODULE_TEST_DIR}/project_folder"
    
    FIRST_RUN_FILE="${BATS_BUILD_DIR}/website_init.bats_first_run"
    if [[ ! -e "${FIRST_RUN_FILE}" ]]; then
        run website_init.sh "${ABSOLUT_PROJECT_DIR}"
        touch ${FIRST_RUN_FILE}
    fi
    source ${ABSOLUT_PROJECT_DIR}/project.sh
}

teardown() {
    : Not Yet
}


@test 'The amount of elements in \${INIT_MODULES} is > 0' {
    tap_print_key_value INIT_MODULES
    assert [ "${#INIT_MODULES[@]}" -gt "${ZERO_ELEMENTS}" ]
}

@test 'The first module within \${INIT_MODULES} is the \${CORE_MODULE}' {
    tap_print_key_value CORE_MODULE
    assert [  "T" ]
    assert [ "${INIT_MODULES[0]}" == "${CORE_MODULE}" ]
}

@test 'All module within \${INIT_MODULES} are installed' {
    assert [  "T" ]
    run echo $( 
    for m in "${INIT_MODULES[@]}"; do
        echo -n "${m} "
    done
    )
    assert_output --partial 'CORE'
}


@test '\${PROJECT_DIR} is defined' {
    tap_print_key_value PROJECT_DIR
    assert [ ! -z "${PROJECT_DIR}" ]
}

@test '\${PROJECT_DIR} is not empty' {
    refute [ "${EMPTY}" == "${PROJECT_DIR}" ]
}

@test '\${PROJECT_DIR} does exist' {
    assert_dir_exists "${PROJECT_DIR}"   
}

@test 'website init fails if \${PROJECT_DIR} exists' {
    refute website_init.sh "${ABSOLUT_PROJECT_DIR}"
    run website_init.sh "${ABSOLUT_PROJECT_DIR}"
    assert_output --partial ': cannot create directory'
}

@test 'website init fails wihout given \${PROJECT_DIR}' {
    refute website_init.sh
    run    website_init.sh
    assert_output --partial 'PROJECT_DIR not specified'
}

