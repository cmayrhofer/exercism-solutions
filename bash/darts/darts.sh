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
    if [[ ${#} -ne 2 ]] || [[ ! "$1" =~ [0-9]+ ]] || [[ ! "$2" =~ [0-9]+ ]]; then
        echo "expected usage: darts.sh <x-coordinate> <z-coordinate>"
        return 1
    fi

    radius_squared=$(bc -l <<<"($1)^2 + ($2)^2")
    [[ $(bc <<<"$radius_squared <= 1") -eq 1 ]] && echo '10' && return 0
    [[ $(bc <<<"$radius_squared <= 5^2") -eq 1 ]] && echo '5' && return 0
    [[ $(bc <<<"$radius_squared <= 10^2") -eq 1 ]] && echo '1' && return 0
    echo '0'
}

# call main with all of the positional arguments
main "$@"
