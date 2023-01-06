#!/usr/bin/env bats
setup() {
    load 'test_helper/common-setup'
    _common_setup    

    EMPTY=''
    MODULE_TEST_DIR='/tmp/bats/website.init.bats'
    ABSOLUT_PROJECT_DIR="${MODULE_TEST_DIR}/project_folder"

    FIRST_RUN_FILE="/tmp/website_init.bats_first_run"
    if [[ ! -e "${FIRST_RUN_FILE}" ]]; then
        run 3swg website init "${ABSOLUT_PROJECT_DIR}"
        touch ${FIRST_RUN_FILE}
    fi
    : remove ${FIRST_RUN_FILE} if setup has failed
    source ${ABSOLUT_PROJECT_DIR}/project.sh
}

teardown() {
    : Not Yet
}

@test '\${PROJECT_DIR} is defined' {
    assert [ ! -z "${PROJECT_DIR}" ]
}

@test '\${PROJECT_DIR} is not empty' {
    refute [ "${EMPTY}" == "${PROJECT_DIR}" ]
}

@test '\${PROJECT_DIR} does exist' {
    assert_dir_exists "${PROJECT_DIR}"   
}

@test 'website init fails if \${PROJECT_DIR} exists' {
    refute 3swg website init "${ABSOLUT_PROJECT_DIR}"
    run 3swg website init "${ABSOLUT_PROJECT_DIR}"
    assert_output --partial ' 21:'
}

@test 'website init fails wihout given \${PROJECT_DIR}' {
    refute 3swg website init
    run    3swg website init
    assert_output --partial ' 1:'
}

@test 'clean up' {
    rm -rfv ${FIRST_RUN_FILE}
    rm -vrf ${ABSOLUT_PROJECT_DIR}
}
