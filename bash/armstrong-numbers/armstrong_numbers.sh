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
    num_of_digits=${#1}
    armstrong_number=0

    for ((i = 0; i < num_of_digits; i++)); do
        armstrong_number=$((armstrong_number + ${1:i:1} ** num_of_digits))
    done

    if [[ "$armstrong_number" == "${1}" ]]; then
        echo "true"
        return
    fi

    echo "false"
}

# call main with all of the positional arguments
main "$@"
