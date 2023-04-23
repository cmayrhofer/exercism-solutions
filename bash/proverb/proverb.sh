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

    (($# == 0)) && return 0

    declare -a words=("$@")
    for ((i = 0; i < $# - 1; i++)); do
        echo "For want of a ${words[$i]} the ${words[$((i + 1))]} was lost."
    done
    echo "And all for the want of a ${words[0]}."
}

# call main with all of the positional arguments
main "$@"
