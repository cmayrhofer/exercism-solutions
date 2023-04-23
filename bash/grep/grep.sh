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

_add_line_number=false
_list_file_only=false
_case_insensitive=false
_invert_match=false
_fullmatch_only=false

main() {

    while getopts nlivx flag; do
        case $flag in
        n) _add_line_number=true ;;
        l) _list_file_only=true ;;
        i) _case_insensitive=true ;;
        v) _invert_match=true ;;
        x) _fullmatch_only=true ;;
        ?)
            echo "Usage: grep.sh [-n] [-l] [-v] [-x]"
            exit 1
            ;;
        esac
    done
    shift $((OPTIND - 1)) # remove parsed args from the arglist

    pattern="$1"
    shift

    [[ $# -gt 1 ]] && _multiple_files=true || _multiple_files=false

    if $_fullmatch_only; then
        pattern="^$pattern$"
    fi

    local original_state_of_nocasematch
    original_state_of_nocasematch=$(shopt -p nocasematch)
    if $_case_insensitive; then
        shopt -s nocasematch
    fi
    for file in "$@"; do
        line_number=1
        while read -r line; do
            [[ "$line" =~ $pattern ]] && _is_match=true || _is_match=false
            if ($_is_match || $_invert_match) && (! $_is_match || ! $_invert_match); then
                if $_list_file_only; then
                    echo "$file"
                    break
                fi
                if $_add_line_number; then
                    line="$line_number:$line"
                fi
                if $_multiple_files; then
                    line="$file:$line"
                fi
                echo "$line"
            fi
            ((line_number++))
        done <"$file"
    done
    $original_state_of_nocasematch

}

# call main with all of the positional arguments
main "$@"
