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

ZEROS='000000000'

init_color_code() {
    declare -A -g COLOR_CODE
    declare -i i=0
    for color in 'Black' 'Brown' 'Red' 'Orange' 'Yellow' 'Green' 'Blue' 'Violet' 'Grey' 'White'; do
        COLOR_CODE["${color,,}"]="$i"
        ((i++))
    done
    declare -r COLOR_CODE
}

main() {
    code=''
    while [[ ${#code} -lt 3 ]]; do
        digit=${COLOR_CODE["$1"]}
        if [[ ! "$digit" =~ [0-9] ]]; then
            echo "Error: invalid color"
            return 1
        fi
        code="${code}${digit}"
        shift
    done
    code="${code:0:2}"

    for ((i = 0; i < "${digit}"; i++)); do
        code="${code}0"
    done

    case "$code" in
    *[1-9] | *[1-9]0 | *[1-9]00)
        zeros_to_strip=0
        prefix=''
        ;;
    *[1-9]000 | *[1-9]0000 | *[1-9]00000)
        zeros_to_strip=3
        prefix='kilo'
        ;;
    *[1-9]000000 | *[1-9]0000000 | *[1-9]00000000)
        zeros_to_strip=6
        prefix='mega'
        ;;
    *[1-9]000000000)
        zeros_to_strip=9
        prefix='giga'
        ;;
    *)
        echo '0 ohms'
        return 0
        ;;
    esac

    sed -E 's/^0+//' <<<"${code:0:$((${#code} - zeros_to_strip))} ${prefix}ohms"
}

init_color_code
# call main with all of the positional arguments
main "$@"
