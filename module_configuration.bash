source ./exit_with.sh
module_configuration() {
if [[ "${#}" == '0' ]]; then
    local -ri argument_missing='1'
    exit_with "" 'PROJECT_DIR not specified' '' 'Missing argument' "${argument_missing}"
elif [[ "${1}" == ''  ]]; then
    local -ri argument_empty='1'
    exit_with "" 'PROJECT_DIR not specified' '' 'Empty argument' "${argument_empty}" 
else 
    local -r CORE_MODULE='core'
    local -r MODULES_DIR_NAME='modules'
    local -r MODULES_DIR="${PROJECT_DIR}/${MODULES_DIR_NAME}"
    local -r MODULES_CONFIGURATION_FILE_NAME='module_configuration.bash'
    local -r MODULES_CONFIGURATION="${MODULES_DIR}/${MODULES_CONFIGURATION_FILE_NAME}"  
(
cat << MODULE_CONFIGURATION
CORE_MODULE="${CORE_MODULE}"
INIT_MODULES=(${CORE_MODULE})
MODULES_DIR_NAME="${MODULES_DIR_NAME}"
MODULES_DIR="${MODULES_DIR}"
MODULES_CONFIGURATION="${MODULES_CONFIGURATION}"
MODULE_CONFIGURATION
) 
fi
}

