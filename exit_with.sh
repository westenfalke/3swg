#!/usr/bin/env bash
exit_with(){
    local -r command_failed="${1}"
    local -r with_description="${2}"
    local -r using_attribute="${3}"
    local -r caused_by_assumption="${4}"
    local -r status_code="${5}"
    printf -v status_message\
              "%s: %s '%s': %s"\
              "${command_failed} $(basename ${0})->${FUNCNAME[1]:-${FUNCNAME}}" "${with_description}" "${using_attribute}" "${caused_by_assumption}"
    echo "${status_message}" >&2
    exit "${status_code}"
}
