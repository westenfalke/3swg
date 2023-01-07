source ./exit_with.sh
module_configuration() {
if [[ "${#}" == '0' ]]; then
    local -ri argument_missing='1'
    exit_with "" 'PROJECT_DIR not specified' '' 'Missing argument' "${argument_missing}"
elif [[ "${1}" == ''  ]]; then
    local -ri argument_empty='1'
    exit_with "" 'PROJECT_DIR not specified' '' 'Empty argument' "${argument_empty}" 
else 
    local -r CORE_MODULE='CORE'
    local -r MODULES_DIR_NAME='MODULES'
    local -r MODULES_DIR="${PROJECT_DIR}/${MODULES_DIR_NAME}"
    local -r INIT_MODULES="CORE"
(
cat << MODULE_CONFIGURATION
MODULES_DIR_NAME="${MODULES_DIR_NAME}"
MODULES_DIR="${MODULES_DIR}"
CORE_MODULE="${CORE_MODULE}"
INIT_MODULES="${INIT_MODULES}"
MODULE_CONFIGURATION
) 
fi
}

