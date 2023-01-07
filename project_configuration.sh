source ./exit_with.sh
project_configuration() {
if [[ "${#}" == '0' ]]; then
    local -ri argument_missing='1'
    exit_with "" 'PROJECT_DIR not specified' '' 'Missing argument' "${argument_missing}"
elif [[ "${1}" == ''  ]]; then
    local -ri argument_empty='1'
    exit_with "" 'PROJECT_DIR not specified' '' 'Empty argument' "${argument_empty}" 
else 
    local -r PROJECT_DIR="${1}"
    local -r PROJECT_FILE_NAME='project.sh'
    local -r PROJECT_CONFIGURATION="${PROJECT_DIR}/${PROJECT_FILE_NAME}"
    local -r CORE_MODULE='CORE'
    local -r MODULES_DIR_NAME='MODULES'
    local -r MODULES_DIR="${PROJECT_DIR}/${MODULES_DIR_NAME}"
(
cat << PROJECT_CONFIGURATION
PROJECT_DIR="${PROJECT_DIR}"
PROJECT_FILE_NAME="${PROJECT_FILE_NAME}"
PROJECT_CONFIGURATION="${PROJECT_CONFIGURATION}"
PROJECT_CONFIGURATION
) 
fi
}

