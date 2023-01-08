source ./exit_with.sh
module_install() {
if [[ "${#}" == '0' ]]; then
    local -ri argument_missing='1'
    exit_with "" 'CONFIGURATION not specified' '' 'Missing argument' "${argument_missing}"
elif [[ "${1}" == ''  ]]; then
    local -ri argument_empty='1'
    exit_with "" 'CONFIGURATION not specified' '' 'Empty argument' "${argument_empty}" 
else
    source <(cat "${1}") 
    for module in "${INIT_MODULES[@]}"; do
        mkdir -pv ${MODULES_DIR}/${module}
    done
fi
}

