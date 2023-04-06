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

letter_score() {
    case "${1^^}" in
    A | E | I | O | U | L | N | R | S | T)
        echo 1
        ;;
    D | G)
        echo 2
        ;;
    B | C | M | P)
        echo 3
        ;;
    F | H | V | W | Y)
        echo 4
        ;;
    K)
        echo 5
        ;;
    J | X)
        echo 8
        ;;
    Q | Z)
        echo 10
        ;;
    esac
}

main() {
    declare -i score=0
    for ((i = 0; i < ${#1}; i++)); do
        score+=$(letter_score "${1:$i:1}")
    done
    echo "$score"
}

# call main with all of the positional arguments
main "$@"
