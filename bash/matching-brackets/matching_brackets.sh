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

declare -A OPENING_BRACKET=([')']='(' [']']='[' ['}']='{')

main() {
    declare -a open_brackets
    for ((i = 0; i < "${#1}"; i++)); do
        letter=${1:$i:1}
        if [[ "$letter" =~ [\([{] ]]; then
            open_brackets+=("$letter")
        elif [[ "$letter" =~ []\)}] ]]; then
            if [[ "${#open_brackets[@]}" -gt 0 ]] && [[ "${OPENING_BRACKET[$letter]}" == "${open_brackets[-1]}" ]]; then
                unset 'open_brackets[-1]'
            else
                echo "false"
                return 0
            fi
        fi
    done
    [[ "${#open_brackets[@]}" -eq 0 ]] && echo "true" || echo "false"
}

# call main with all of the positional arguments
main "$@"
