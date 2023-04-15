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

generate_character_score() {
    declare -i sum=0 min=6
    for i in {1..4}; do
        count=$((($RANDOM % 6) + 1))
        ((sum = sum + count))
        ((count < min)) && min=$count
    done
    echo $((sum - min))
}

calculate_modifier() {
    declare -i modifier=0
    ((modifier = $1 - 10))
    ((modifier >= 0)) && echo $((modifier / 2)) && return 0
    ((modifier % 2)) && echo $((modifier / 2 - 1)) || echo $((modifier / 2))

}

main() {
    case $1 in
    modifier)
        calculate_modifier $2
        ;;
    generate)
        for type in 'strength' 'dexterity' 'constitution' 'intelligence' 'wisdom' 'charisma'; do
            char_score=$(generate_character_score)
            [[ "$type" == 'constitution' ]] && constitution=$char_score
            echo "$type $char_score"
        done
        modifier=$(calculate_modifier $constitution)
        echo "hitpoints $((10 + modifier))"
        ;;
    esac
}

# call main with all of the positional arguments
main "$@"
