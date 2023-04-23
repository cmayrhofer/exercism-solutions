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
    input_string=$(sed -E 's/\s//g' <<<"$1")
    if [[ ! ${input_string} =~ ^[0-9]{2,}$ ]]; then
        echo 'false'
        return
    fi

    declare -i total_score=0
    for ((i = ${#input_string} - 2; i >= 0; i -= 2)); do
        score=$((2 * ${input_string:$i:1}))
        if [[ $score -gt 9 ]]; then
            ((score -= 9))
        fi
        ((total_score += score))
    done
    for ((i = ${#input_string} - 1; i >= 0; i -= 2)); do
        ((total_score += ${input_string:$i:1}))
    done

    if [[ $((total_score % 10)) -eq 0 ]]; then
        echo 'true'
    else
        echo 'false'
    fi
}

# call main with all of the positional arguments
main "$@"
