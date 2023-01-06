#!/usr/bin/env bash
declare -r _ORIG_OPTIONS_=${-}
set -e
[[ -z "${1}" ]] && echo -e "Missing Parameter: PROJECT_DIR" >&2
set -u
declare -r _PROJECT_DIR_="${1}"
declare -r _PROJECT_FILE_NAME_='project.sh'
declare -r _PROJECT_CONFIGURATION_="${_PROJECT_DIR_}/${_PROJECT_FILE_NAME_}"
declare -r _CORE_MODULE_='CORE'
declare -r _MODULES_DIR_NAME_='MODULES'
declare -r _MODULES_DIR_="${_PROJECT_DIR_}/${_MODULES_DIR_NAME_}"

if [[ -d ${_PROJECT_DIR_} ]]; then
    declare -r _IS_A_DIRECTORY_='21'
    echo "Is a directory: ${_IS_A_DIRECTORY_}:'${_PROJECT_DIR_}'" >&2
    exit ${_IS_A_DIRECTORY_}
else
    mkdir -p ${_PROJECT_DIR_}
fi

(
cat << PROJECT_CONFIGURATION 
#!/usr/bin/env bash
PROJECT_DIR="${_PROJECT_DIR_}"
PROJECT_FILE_NAME="${_PROJECT_FILE_NAME_}"
PROJECT_CONFIGURATION="${_PROJECT_CONFIGURATION_}"
MODULES_DIR_NAME="${_MODULES_DIR_NAME_}"
MODULES_DIR="${_MODULES_DIR_}"
CORE_MODULE="${_CORE_MODULE_}"
INIT_MODULES="${_CORE_MODULE_}"

PROJECT_CONFIGURATION
) >  ${_PROJECT_CONFIGURATION_}


set ${_ORIG_OPTIONS_}
