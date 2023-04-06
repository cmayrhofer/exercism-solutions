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

    input_string=$(sed -E 's/\s+$//' <<<"$1")

    if [[ "$input_string" == '' ]]; then
        echo 'Fine. Be that way!'
        return
    elif [[ "${input_string^^}" == "${input_string}" ]] && [[ "${input_string,,}" != "${input_string}" ]]; then
        all_caps='is_all_caps'
    else
        all_caps='not_all_caps'
    fi

    [[ "${input_string:(-1)}" == '?' ]] && question='is_question' || question='no_question'

    case "$all_caps and $question" in
    "is_all_caps and is_question")
        echo 'Calm down, I know what I'\''m doing!'
        ;;
    "is_all_caps and no_question")
        echo 'Whoa, chill out!'
        ;;
    "not_all_caps and is_question")
        echo 'Sure.'
        ;;
    *)
        echo "Whatever."
        ;;
    esac
}

# call main with all of the positional arguments
main "$@"
