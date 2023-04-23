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
    sentence="${1//\'/}"
    sentence=$(tr -s ' ' <<<"${sentence//[[:punct:]]/ }")

    abbreviation=""
    while read -r -d ' ' word; do
        abbreviation="${abbreviation}${word:0:1}"
    done <<<"${sentence} "

    echo "${abbreviation^^}"
}

# call main with all of the positional arguments
main "$@"
