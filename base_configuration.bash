source ./exit_with.sh
base_configuration() {
if [[ "${#}" == '0' ]]; then
    local -ri argument_missing='1'
    exit_with "" 'PROJECT_DIR not specified' '' 'Missing argument' "${argument_missing}"
elif [[ "${1}" == ''  ]]; then
    local -ri argument_empty='1'
    exit_with "" 'PROJECT_DIR not specified' '' 'Empty argument' "${argument_empty}" 
else 
    local -r PROJECT_DIR="${1}"
    local -r CONFIGURATION_FILE_NAME='configuration.bash'
    local -r CONFIGURATION="${PROJECT_DIR}/${CONFIGURATION_FILE_NAME}"
(
cat << BASE_CONFIGURATION
PROJECT_DIR="${PROJECT_DIR}"
CONFIGURATION_FILE_NAME="${CONFIGURATION_FILE_NAME}"
CONFIGURATION="${CONFIGURATION}"
MODULES_CONFIGURATION_FILE_NAME="${MODULES_CONFIGURATION_FILE_NAME}"
BASE_CONFIGURATION
) 
fi
}
