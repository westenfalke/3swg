#!/usr/bin/env bash
source ./exit_with.sh
source ./base_configuration.sh
source ./module_configuration.sh
source ./module_core.sh

if [[ "${#}" == '0' ]]; then
    declare -ri argument_missing='1'
    exit_with "" 'PROJECT_DIR not specified' '' 'Missing argument' "${argument_missing}"
fi

source <(base_configuration "${1}")

if [[ "${PROJECT_DIR}" == ''  ]]; then
    declare -ri argument_empty='1'
    exit_with "" 'PROJECT_DIR not specified' '' 'Empty argument' "${argument_empty}"
    exit ${argument_empty}
elif [[ -d "${PROJECT_DIR}" ]]; then
    declare -ri file_exists='1'
    exit_with "" 'cannot create directory' "${PROJECT_DIR}" 'File exists' "${file_exists}"
else
    mkdir -p "${PROJECT_DIR}"
    base_configuration "${PROJECT_DIR}" >> "${CONFIGURATION}"
    module_configuration "${PROJECT_DIR}" >> "${CONFIGURATION}"
    module_core "${CONFIGURATION}"
fi

if [[ "${MODULES_DIR}" == ''  ]]; then
    declare -ri argument_empty='1'
    exit_with "" 'PROJECT_DIR not specified' '' 'Empty argument' "${argument_empty}"
    exit ${argument_empty}
elif [[ -d "${PROJECT_DIR}" ]]; then
    declare -ri file_exists='1'
    exit_with "" 'cannot create directory' "${PROJECT_DIR}" 'File exists' "${file_exists}"
else
    mkdir -p "${PROJECT_DIR}"
    base_configuration "${PROJECT_DIR}" > "${CONFIGURATION}"
fi

