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
    sound=""

    if [[ $(($1 % 3)) -eq 0 ]]; then
        sound=$sound"Pling"
    fi

    if [[ $(($1 % 5)) -eq 0 ]]; then
        sound=$sound"Plang"
    fi

    if [[ $(($1 % 7)) -eq 0 ]]; then
        sound=$sound"Plong"
    fi

    if [[ -z $sound ]]; then
        echo "$1"
        exit
    fi

    echo $sound
}

# call main with all of the positional arguments
main "$@"
