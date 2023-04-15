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
    binary=$(bc <<<"obase=2;$1")
    binary=$(printf "%05d" $binary)

    declare -a shakes
    [[ "${binary: -1:1}" == '1' ]] && shakes+=('wink')
    [[ "${binary: -2:1}" == '1' ]] && shakes+=('double blink')
    [[ "${binary: -3:1}" == '1' ]] && shakes+=('close your eyes')
    [[ "${binary: -4:1}" == '1' ]] && shakes+=('jump')
    if [[ "${binary:0:1}" == '1' ]]; then
        declare -a _shakes
        for ((i = ${#shakes[@]} - 1; i >= 0; i--)); do
            _shakes+=("${shakes[i]}")
        done
        shakes=("${_shakes[@]}")
    fi

    final_shake="${shakes[0]}"
    for shake in "${shakes[@]:1:${#shakes[@]}}"; do
        final_shake="${final_shake},${shake}"
    done

    echo "${final_shake}"
}

# call main with all of the positional arguments
main "$@"
