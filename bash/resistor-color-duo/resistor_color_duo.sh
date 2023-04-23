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

init_color_code() {
    declare -A -g COLOR_CODE
    declare -i i=0
    for color in 'Black' 'Brown' 'Red' 'Orange' 'Yellow' 'Green' 'Blue' 'Violet' 'Grey' 'White'; do
        COLOR_CODE["${color,,}"]="$i"
        ((i++))
    done
    declare -r COLOR_CODE
}

init_color_code

main() {
    code=''
    while [[ ${#code} -lt 2 ]]; do
        digit=${COLOR_CODE["$1"]}
        if [[ ! "$digit" =~ [0-9] ]]; then
            echo "Error: invalid color"
            return 1
        fi
        code="${code}${digit}"
        shift
    done

    sed -E 's/^0+//' <<<"$code"
}

# call main with all of the positional arguments
main "$@"
