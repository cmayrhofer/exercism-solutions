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
    reversed_string=''
    for ((i = ${#1} - 1; i >= 0; i--)); do
        reversed_string="${reversed_string}${1:$i:1}"
    done
    echo "${reversed_string}"
}

# call main with all of the positional arguments
main "$@"
