#!/usr/bin/env bash

# The following comments should help you get started:
# - Bash is flexible. You may use functions or write a "raw" script.
#
# - Complex code can be made easier to read by breaking it up
#   into functions, however this is sometimes overkill in bash.
#
# - You can find links about good style and other resources
#   for Bash in './README.md'. It came with this exercise.
#
#   Example:
#   # other functions here
#   # ...
#   # ...

main() {
    if [[ "${#}" -ne 1 ]] || [[ ! "${1}" =~ ^[-]*[0-9]+$ ]]; then
        echo 'Usage: leap.sh <year>'
        return 1
    fi

    if [[ $(($1 % 4)) -eq 0 ]] && [[ $(($1 % 100)) -ne 0 || $(($1 % 400)) -eq 0 ]]; then
        echo true
    else
        echo false
    fi
}

# call main with all of the positional arguments
main "$@"
