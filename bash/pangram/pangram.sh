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
    sorted_characters=$(
        tr -c -d "[:alpha:]" <<<"$@" |
            sed -E "s/(.)/\L\1\n/g" |
            sort |
            tr -d "\n" |
            tr -s "[:alpha:]"
    )
    if [[ "${#sorted_characters}" -eq 26 ]]; then
        echo true
    else
        echo false
    fi
}

# call main with all of the positional arguments
main "$@"
