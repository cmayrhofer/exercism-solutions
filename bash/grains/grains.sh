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

    if [[ "$1" == 'total' ]]; then
        grains="0"
        for ((i = 0; i < 64; i++)); do
            grains=$(bc <<<"(( $grains + (2^$i) ))")
        done
        echo "${grains}"
    elif [[ "$1" -le 0 ]] || [[ "$1" -gt 64 ]]; then
        echo "Error: invalid input"
        return 1
    else
        bc <<<"2^(( $1 - 1 ))"
    fi
}

# call main with all of the positional arguments
main "$@"
