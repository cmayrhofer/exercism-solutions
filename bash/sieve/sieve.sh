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

init_marked() {
    declare -A -g MARKED
    declare -i i=0
    for ((i = 2; i <= $1; i++)); do
        MARKED[$i]=true
    done
}

mark() {
    for ((i = 2; i <= (${#MARKED[@]} + 1) / $1; i++)); do
        MARKED[$((i * $1))]=false
    done
}

main() {
    init_marked "$1"
    declare -a primes
    for ((j = 2; j <= $1; j++)); do
        if ${MARKED[$j]}; then
            primes+=("$j")
            mark $j
        fi
    done

    echo "${primes[@]}"
}

# call main with all of the positional arguments
main "$@"
